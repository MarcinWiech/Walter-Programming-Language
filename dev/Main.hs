import Tokens
import Grammar
import System.Environment
import Control.Exception
import System.IO
import System.IO.Unsafe (unsafePerformIO)


main :: IO ()
main = catch main' noParse

main' = do sourceText <- readFile "SampleCode.txt"
           putStrLn ("Parsing : " ++ sourceText)
           let parsedProg = parseCalc (alexScanTokens sourceText)
           putStrLn ("Parsed as " ++ (show parsedProg))

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()

parseThis s = eval1_findMain $ parseCalc $ alexScanTokens s
parseThisFile = do sourceText <- readFile "SampleCode.txt"
                   let x = parseThis sourceText
                   putStrLn $ show x
                   return ()

data M = MInt String Int | MBool String Bool deriving (Show, Eq)
type E = [M]

envInit :: FuncBodyInitArea_ -> E
envInit EmptyInitArea = []
envInit (SingleInitArea (VarIntInit_ (Var_ name _) value)) = [(MInt name value)]
envInit (SingleInitArea (VarBoolInit_ (Var_ name _) value)) = [(MBool name value)]
envInit (MultipleInitArea (VarIntInit_ (Var_ name _) value) next) = (MInt name value) : envInit next
envInit (MultipleInitArea (VarBoolInit_ (Var_ name _) value) next) = (MBool name value) : envInit next

envContains :: E -> String -> Bool
encContains [] _ = False
envContains ((MInt name _) : xs) name' | name == name' = True
                                       | otherwise = envContains xs name'
envContains ((MBool name _) : xs) name' | name == name' = True
                                        | otherwise = envContains xs name'

envGetVar :: E -> String -> M
envGetVar ((MInt name v) : xs) name' | name == name' = (MInt name v)
                                     | otherwise = envGetVar xs name'
envGetVar ((MBool name v) : xs) name' | name == name' = (MBool name v)
                                      | otherwise = envGetVar xs name'

envUpdateOrAppend :: E -> M -> E
envUpdateOrAppend [] (MInt name' value') = [(MInt name' value')]
envUpdateOrAppend ((MInt name value):xs) (MInt name' value') | name == name' = (MInt name value') : xs
                                                             | otherwise = (MInt name value) : (envUpdateOrAppend xs (MInt name' value'))

eval1_findMain :: [FuncDeclaration_] -> String -- FuncDeclaration_
eval1_findMain (MainFuncDeclaration (SingleSegue funcname):ss) = evalFunction (envInit initArea) exp
                                                                 where (NormalFuncDeclaration fname initArea exp) = findFunctionByName funcname ss
eval1_findMain ((MainFuncDeclaration (MultipleSegue funcname next)):ss) = evalFunction (envInit initArea) exp -- TODO!
                                                                          where (NormalFuncDeclaration fname initArea exp) = findFunctionByName funcname ss

findFunctionByName :: String -> [FuncDeclaration_] -> FuncDeclaration_
findFunctionByName funcName ((NormalFuncDeclaration funcName' a b):ff) | funcName == funcName' = (NormalFuncDeclaration funcName' a b)
                                                                       | otherwise = findFunctionByName funcName ff

evalFunction :: E -> Exp_ -> String
evalFunction env (EqualsExp (EqualsInOut match out)) = evalFunction newEnv (OutPatternExp out)
                                                       where newEnv = matchUpdateEnv env (matchVarsToVarnameList match) matchIntFromStdio
evalFunction env (OutPatternExp p) = outPatternPrint env p

matchUpdateEnv :: E -> [String] -> [Int] -> E
matchUpdateEnv env [] _ = env
matchUpdateEnv env (n:nn) (i:ii) = matchUpdateEnv (envUpdateOrAppend env (MInt n i)) nn ii
matchUpdateEnv env _ _ = env -- error state

matchVarsToVarnameList :: Match_ -> [String]
matchVarsToVarnameList EmptyMatch = []
matchVarsToVarnameList EOFMatch = [] -- ?????????
matchVarsToVarnameList (SingleMatch (Var_ name _)) = [name]
matchVarsToVarnameList (MultipleMatch (Var_ name _) next) = name : matchVarsToVarnameList next

matchIntFromStdio :: [Int]
matchIntFromStdio = unsafePerformIO matchIntFromStdio_inner
                    where matchIntFromStdio_inner = do line <- getLine
                                                       return $ (map read $ words line :: [Int])

outPatternPrint :: E -> OutPattern_ -> String
outPatternPrint env EmptyOutPatter = ""
outPatternPrint env (SingleOutPattern (MathsInt i)) = show i
outPatternPrint env (SingleOutPattern (MathsVar name)) = printMvalue $ envGetVar env name
                                                        where printMvalue :: M -> String
                                                              printMvalue (MInt _ v) = show v
                                                              printMvalue (MBool _ v) = show v
