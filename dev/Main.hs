import Tokens
import Grammar
import System.Environment
import Control.Exception
import System.IO
import System.IO.Unsafe (unsafePerformIO)
import System.IO (isEOF)

-- main' = do sourceText <- readFile "SampleCode.txt"
--            putStrLn ("Parsing : " ++ sourceText)
--            let parsedProg = parseCalc (alexScanTokens sourceText)
--            putStrLn ("Parsed as " ++ (show parsedProg))

main :: IO ()
main = parseThisFile    


parseThisFile :: IO ()
parseThisFile = parseThis getProgram
parseThis s = eval1_findMain $ parseCalc $ alexScanTokens s

getProgram :: String
getProgram = unsafePerformIO $ inner
            where inner = do s <- readFile "test.txt"
                             return s

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

eval1_findMain :: [FuncDeclaration_] -> IO () -- FuncDeclaration_
eval1_findMain (MainFuncDeclaration (SingleSegue funcname):ss) = evalFunction (envInit initArea) exp
                                                                 where (NormalFuncDeclaration fname initArea exp) = findFunctionByName funcname ss
eval1_findMain ((MainFuncDeclaration (MultipleSegue funcname next)):ss) = evalFunction (envInit initArea) exp -- TODO!
                                                                          where (NormalFuncDeclaration fname initArea exp) = findFunctionByName funcname ss

findFunctionByName :: String -> [FuncDeclaration_] -> FuncDeclaration_
findFunctionByName funcName ((NormalFuncDeclaration funcName' a b):ff) | funcName == funcName' = (NormalFuncDeclaration funcName' a b)
                                                                       | otherwise = findFunctionByName funcName ff

evalFunction :: E -> Exp_ -> IO ()
evalFunction env (OutPatternExp p) = outPatternPrint env p

evalFunction env (SequenceExp (e) (OutPatternExp p)) = evalFunction env (OutPatternExp p)

evalFunction env (EqualsExp (EqualsInOut match out)) = inner
                        where inner = do end <- isEOF
                                         if end then do putStr ""
                                         else do nums <- matchIntFromStdio
                                                 let vars = matchVarsToVarnameList match
                                                 let newEnv = matchUpdateEnv env vars nums
                                                 evalFunction newEnv (OutPatternExp out)
                                                 evalFunction newEnv (EqualsExp (EqualsInOut match out))

matchUpdateEnv :: E -> [String] -> [Int] -> E
matchUpdateEnv env [] _ = env
matchUpdateEnv env nn [] = env
matchUpdateEnv env (n:nn) (i:ii) = matchUpdateEnv (envUpdateOrAppend env (MInt n i)) nn ii

matchVarsToVarnameList :: Match_ -> [String]
matchVarsToVarnameList EmptyMatch = []
matchVarsToVarnameList EOFMatch = [] -- ?????????
matchVarsToVarnameList (SingleMatch (Var_ name _)) = [name]
matchVarsToVarnameList (MultipleMatch (Var_ name _) next) = name : matchVarsToVarnameList next

matchIntFromStdio :: IO [Int]
matchIntFromStdio = matchIntFromStdio_inner
                    where matchIntFromStdio_inner = do line <- getLine
                                                       return $ (map read $ words line :: [Int])

evalMaths :: E -> Maths_ -> Maths_
evalMaths env (MathsInt int) = (MathsInt int)
evalMaths env (MathsVar name) = convert (envGetVar env name)
                         where convert (MInt _ v) = MathsInt v
evalMaths env (MathsPlus (MathsInt x) (MathsInt y)) = MathsInt (x+y)  
evalMaths env (MathsMinus (MathsInt x) (MathsInt y)) = MathsInt (x-y) 
evalMaths env (MathsTimes (MathsInt x) (MathsInt y)) = MathsInt (x*y)  
evalMaths env (MathsDevide (MathsInt x) (MathsInt y)) = MathsInt (x `div` y)

evalMaths env (MathsPlus x y) = evalMaths env (MathsPlus (evalMaths env x) (evalMaths env y))  
evalMaths env (MathsMinus x y) = evalMaths env (MathsMinus (evalMaths env x) (evalMaths env y)) 
evalMaths env (MathsTimes x y) = evalMaths env (MathsTimes (evalMaths env x) (evalMaths env y))  
evalMaths env (MathsDevide x y) = evalMaths env (MathsDevide (evalMaths env x) (evalMaths env y))    

outPatternPrint :: E -> OutPattern_ -> IO ()
outPatternPrint env EmptyOutPatter = putStr $! ""

outPatternPrint env (SingleOutPattern (MathsInt i)) = do putStr $! show i
                                                         putStrLn ""
outPatternPrint env (SingleOutPattern (MathsVar name)) = do putStr $! printMvalue $! envGetVar env name
                                                            putStrLn ""

outPatternPrint env (MultipleOutPattern (MathsInt i) (SingleOutPattern next)) = do putStr $! show i
                                                                                   putStr " "
                                                                                   outPatternPrint env (SingleOutPattern next)

outPatternPrint env (MultipleOutPattern (MathsVar name) (SingleOutPattern next)) = do putStr $! printMvalue $! envGetVar env name
                                                                                      putStr " "
                                                                                      outPatternPrint env (SingleOutPattern next)

outPatternPrint env (MultipleOutPattern (MathsInt i) next) = do putStr $! show i
                                                                putStr " "
                                                                outPatternPrint env next

outPatternPrint env (MultipleOutPattern (MathsVar name) next) = do putStr $! printMvalue $! envGetVar env name
                                                                   putStr " "
                                                                   outPatternPrint env next


printMvalue :: M -> String
printMvalue (MInt _ v) = show v
printMvalue (MBool _ v) = show v

