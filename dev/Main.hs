import Tokens
import Grammar
import System.Environment
import Control.Exception
import System.IO


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

data M = MInt String Int | MBool String Bool deriving (Show, Eq)
type E = [M]

envInit :: FuncDeclaration_ -> E
envInit (NormalFuncDeclaration _ vars _) = envInitInner vars
                                         where envInitInner :: FuncBodyInitArea_ -> E
                                               envInitInner EmptyInitArea = []
                                               envInitInner (SingleInitArea (VarIntInit_ (Var_ name _) value)) = [(MInt name value)]
                                               envInitInner (SingleInitArea (VarBoolInit_ (Var_ name _) value)) = [(MBool name value)]
                                               envInitInner (MultipleInitArea (VarIntInit_ (Var_ name _) value) next) = (MInt name value) : envInitInner next
                                               envInitInner (MultipleInitArea (VarBoolInit_ (Var_ name _) value) next) = (MBool name value) : envInitInner next


eval1_findMain :: [FuncDeclaration_] -> E -- FuncDeclaration_
eval1_findMain (MainFuncDeclaration (SingleSegue funcname):ss) = evalFunction (envInit func) func
                                                                 where func = findFunctionByName funcname ss

findFunctionByName :: String -> [FuncDeclaration_] -> FuncDeclaration_
findFunctionByName funcName ((NormalFuncDeclaration funcName' a b):ff) | funcName == funcName' = (NormalFuncDeclaration funcName' a b)
                                                                       | otherwise = findFunctionByName funcName ff

evalFunction :: E -> FuncDeclaration_ -> E
evalFunction x y = x
