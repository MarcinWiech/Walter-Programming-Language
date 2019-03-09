import Tokens
import Grammar
import Remap
import TypeChecker

import System.Environment
import Control.Exception
import System.IO
import System.IO.Unsafe (unsafePerformIO)
import System.IO (isEOF)


-- will read file lazyly, save as states


main :: IO ()
main = parseThisFile    


parseThisFile :: IO ()
parseThisFile = parseThis getProgram
parseThis s = eval1_findMain $ remapOutputToSegue $ parseCalc $ alexScanTokens s

getProgram :: String
getProgram = unsafePerformIO $ inner
            where inner = do s <- readFile "test2"
                             return s

data M = MInt String Int | MBool String Bool deriving (Show, Eq)
type E = [(String,[M])]

getFunctionEnvironment :: String -> E -> [M]
getFunctionEnvironment fName [] = []
getFunctionEnvironment fName ((fName', vars):xs) | fName' == fName = vars
                                                 | otherwise = getFunctionEnvironment fName xs


-- envInit :: FuncBodyInitArea_ -> String -> E
-- envInit initArea fName = [(fName,(envInitNoFunctionName initArea))]

envInit :: [FuncDeclaration_] -> E
envInit [] = []
envInit ((NormalFuncDeclaration funcName initArea _):xs) = (funcName, (envInitNoFunctionName initArea)) : envInit xs

replaceFuncEnv :: String -> E -> [M] -> E
replaceFuncEnv fName ((fName', old):xs) new | fName == fName' = (fName, new) : xs
                                            | otherwise = (fName', old):(replaceFuncEnv fName xs new)

--helper for envInit
envInitNoFunctionName :: FuncBodyInitArea_ -> [M]
envInitNoFunctionName EmptyInitArea = []
envInitNoFunctionName (SingleInitArea (VarIntInit_ (Var_ name _) value)) = [(MInt name value)]
envInitNoFunctionName (SingleInitArea (VarBoolInit_ (Var_ name _) value)) = [(MBool name value)]
envInitNoFunctionName (MultipleInitArea (VarIntInit_ (Var_ name _) value) next) = (MInt name value) : envInitNoFunctionName next 
envInitNoFunctionName (MultipleInitArea (VarBoolInit_ (Var_ name _) value) next) = (MBool name value) : envInitNoFunctionName next

envContains :: String -> E -> String -> Bool
envContains fName [] name = False 
envContains fName env name = envContainsInner (getFunctionEnvironment fName env) name

envContainsInner :: [M] -> String -> Bool
envContainsInner [] _ = False
envContainsInner ((MInt name _) : xs) name' | name == name' = True
                                            | otherwise = envContainsInner xs name'
envContainsInner ((MBool name _) : xs) name' | name == name' = True
                                             | otherwise = envContainsInner xs name'

envGetVar :: String -> E -> String -> M
envGetVar fName env name = envGetVarInner (getFunctionEnvironment fName env) name


envGetVarInner :: [M] -> String -> M
envGetVarInner ((MInt name v) : xs) name' | name == name' = (MInt name v)
                                          | otherwise = envGetVarInner xs name'
envGetVarInner ((MBool name v) : xs) name' | name == name' = (MBool name v)
                                           | otherwise = envGetVarInner xs name'

extractIntFromEnv :: String -> E -> String -> Int
extractIntFromEnv fName env varName = extractIntFromEnvInner (getFunctionEnvironment fName env) varName                                           

extractIntFromEnvInner :: [M] -> String -> Int
extractIntFromEnvInner env varName = getValue $! envGetVarInner env varName
                                    where getValue (MInt _ v) = v

extractBoolFromEnv :: String -> E -> String -> Bool
extractBoolFromEnv fName env varName = extractBoolFromEnvInner (getFunctionEnvironment fName env) varName      

extractBoolFromEnvInner :: [M] -> String -> Bool
extractBoolFromEnvInner env varName = getValue $! envGetVarInner env varName
            where getValue (MBool _ v) = v

envUpdateOrAppend :: String -> E -> M -> E
envUpdateOrAppend fName env var = replaceFuncEnv fName env newMs
                                where newMs = envUpdateOrAppendInner (getFunctionEnvironment fName env) var


envUpdateOrAppendInner :: [M] -> M -> [M]
envUpdateOrAppendInner [] (MInt name' value') = [(MInt name' value')]
envUpdateOrAppendInner ((MInt name value):xs) (MInt name' value') | name == name' = (MInt name value') : xs
                                                             | otherwise = (MInt name value) : (envUpdateOrAppendInner xs (MInt name' value'))

envUpdateOrAppendInner [] (MBool name' value') = [(MBool name' value')]
envUpdateOrAppendInner ((MBool name value):xs) (MBool name' value') | name == name' = (MBool name value') : xs
                                                               | otherwise = (MBool name value) : (envUpdateOrAppendInner xs (MBool name' value'))

envUpdateOrAppendInner (x:xs) m = x : envUpdateOrAppendInner xs m

eval1_findMain :: [FuncDeclaration_] -> IO () -- FuncDeclaration_
eval1_findMain (MainFuncDeclaration (SingleSegue funcname):ss) = evalFunction funcname (envInit ss) ss match
                                                                 where (NormalFuncDeclaration fname initArea match) = findFunctionByName funcname ss
eval1_findMain ((MainFuncDeclaration (MultipleSegue funcname next)):ss) = evalFunction funcname (envInit ss) ss match -- TODO!
                                                                          where (NormalFuncDeclaration fname initArea match) = findFunctionByName funcname ss

findFunctionByName :: String -> [FuncDeclaration_] -> FuncDeclaration_
findFunctionByName funcName ((NormalFuncDeclaration funcName' a b):ff) | funcName == funcName' = (NormalFuncDeclaration funcName' a b)
                                                                       | otherwise = findFunctionByName funcName ff

evalFunction :: String -> E -> [FuncDeclaration_] -> Match_ -> IO ()
evalFunction fName env funcs (EmptyMatch exp) = do end <- isEOF
                                                   if end then do putStr ""
                                                   else do _ <- matchIntFromStdio
                                                           newEnv' <- evalExp fName env funcs exp
                                                           evalFunction fName newEnv' funcs (EmptyMatch exp)
evalFunction fName env funcs (SingleMatch var exp) = do end <- isEOF
                                                        if end then do putStr ""
                                                        else do nums <- matchIntFromStdio
                                                                let vars = matchVarsToVarnameList (SingleMatch var exp)
                                                                let newEnv = matchUpdateEnv fName env vars nums
                                                                newEnv' <- evalExp fName newEnv funcs exp
                                                                evalFunction fName newEnv' funcs (SingleMatch var exp)

evalFunction fName env funcs (MultipleMatch var next) = do end <- isEOF
                                                           if end then do putStr ""
                                                           else do nums <- matchIntFromStdio
                                                                   let vars = matchVarsToVarnameList (MultipleMatch var next)
                                                                   let newEnv = matchUpdateEnv fName env vars nums
                                                                   newEnv' <- evalExp fName newEnv funcs (getExpFromMultipleMatch next)
                                                                   evalFunction fName newEnv' funcs (MultipleMatch var next)

getExpFromMultipleMatch :: Match_ -> Exp_
getExpFromMultipleMatch (SingleMatch _ exp) = exp
getExpFromMultipleMatch (MultipleMatch _ next) = getExpFromMultipleMatch next

evalEquals :: String -> E -> Equals_ -> E
evalEquals fName env (Equals_ varName (ComparableExpSingle (ComparablesMaths (MathsInt v)))) = envUpdateOrAppend fName env (MInt varName v)
evalEquals fName env (Equals_ varName (ComparableExpSingle (ComparablesMaths (MathsVar n)))) = envUpdateOrAppend fName env (MInt varName (extraxt $ envGetVar fName env n))
                                                                                         where extraxt (MInt _ i) = i

evalEquals fName env (Equals_ varName (ComparableExpSingle (ComparablesMaths maths))) = evalEquals fName env (Equals_ varName (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths))))                                                                                 

evalEquals fName env (Equals_ varName comparable) = envUpdateOrAppend fName env (MBool varName (evalComparableExp fName env comparable))

evalExp :: String -> E -> [FuncDeclaration_] -> Exp_ -> IO E
evalExp fName env funcs (OutPatternExp p) = do outPatternPrint fName env p
                                               return env
evalExp fName env funcs (EqualsExp exp) = return $! evalEquals fName env exp
evalExp fName env funcs (SequenceExp exp1 exp2) = do e <- evalExp fName env funcs exp1
                                                     evalExp fName e funcs exp2
evalExp fName env funcs (CondExp (Cond_ comp e e')) | (evalComparableExp fName env comp) = (evalExp fName env funcs e)
                                                    | otherwise = evalExp fName env funcs e'
evalExp fName env funcs (SegueToFunction nextFName nextVars nextMaths) = do let newEnv = matchUpdateEnv nextFName env nextVars (evalListMathsToListInts fName env nextMaths)
                                                                            evalExp nextFName newEnv funcs (getFunctionBody (findFunctionByName nextFName funcs))

matchUpdateEnv :: String -> E -> [String] -> [Int] -> E
matchUpdateEnv fName env [] _ = env
matchUpdateEnv fName env nn [] = env
matchUpdateEnv fName env (n:nn) (i:ii) = matchUpdateEnv fName (envUpdateOrAppend fName env (MInt n i)) nn ii

matchIntFromStdio :: IO [Int]
matchIntFromStdio =  do line <- getLine
                        return $ (map read $ words line :: [Int])

evalListMathsToListInts :: String -> E -> [Maths_] -> [Int]
evalListMathsToListInts fName env [] = []
evalListMathsToListInts fName env (x:xs) = (convert $ evalMaths fName env x):(evalListMathsToListInts fName env xs)
            where convert (MathsInt v) = v

evalMaths :: String -> E -> Maths_ -> Maths_
evalMaths fName env (MathsInt int) = (MathsInt int)
evalMaths fName env (MathsNegative (MathsInt int)) = (MathsInt (-int))
evalMaths fName env (MathsNegative maths) = evalMaths fName env (MathsNegative (evalMaths fName env maths))
evalMaths fName env (MathsVar name) = convert (envGetVar fName env name)
                         where convert (MInt _ v) = MathsInt v

evalMaths fName env (MathsPlus (MathsInt x) (MathsInt y)) = MathsInt (x+y) 
evalMaths fName env (MathsMinus (MathsInt x) (MathsInt y)) = MathsInt (x-y)
evalMaths fName env (MathsTimes (MathsInt x) (MathsInt y)) = MathsInt (x*y)
evalMaths fName env (MathsDevide (MathsInt x) (MathsInt y)) = MathsInt (x `div` y)
evalMaths fName env (MathsMod (MathsInt x) (MathsInt y)) = MathsInt (x `mod` y) 

evalMaths fName env (MathsPlus x y) = evalMaths fName env (MathsPlus (evalMaths fName env x) (evalMaths fName env y))  
evalMaths fName env (MathsMinus x y) = evalMaths fName env (MathsMinus (evalMaths fName env x) (evalMaths fName env y)) 
evalMaths fName env (MathsTimes x y) = evalMaths fName env (MathsTimes (evalMaths fName env x) (evalMaths fName env y))  
evalMaths fName env (MathsDevide x y) = evalMaths fName env (MathsDevide (evalMaths fName env x) (evalMaths fName env y))
evalMaths fName env (MathsMod x y) = evalMaths fName env (MathsMod (evalMaths fName env x) (evalMaths fName env y))  

outPatternPrint :: String -> E -> OutPattern_ -> IO ()
outPatternPrint fName env EmptyOutPatter = putStr $! ""

outPatternPrint fName env (SingleOutPattern (MathsInt i)) = do putStr $! show i
                                                               putStrLn $! ""
outPatternPrint fName env (SingleOutPattern (MathsVar name)) = do putStr $! printMvalue $! envGetVar fName env name
                                                                  putStrLn $! ""

outPatternPrint fName env (MultipleOutPattern (MathsInt i) (SingleOutPattern next)) = do putStr $! show i
                                                                                         putStr $! " "
                                                                                         outPatternPrint fName env (SingleOutPattern next)

outPatternPrint fName env (MultipleOutPattern (MathsVar name) (SingleOutPattern next)) = do putStr $! printMvalue $! envGetVar fName env name
                                                                                            putStr $! " "
                                                                                            outPatternPrint fName env (SingleOutPattern next)

outPatternPrint fName env (MultipleOutPattern (MathsInt i) next) = do putStr $! show i
                                                                      putStr $! " "
                                                                      outPatternPrint fName env next

outPatternPrint fName env (MultipleOutPattern (MathsVar name) next) = do putStr $! printMvalue $! envGetVar fName env name
                                                                         putStr $! " "
                                                                         outPatternPrint fName env next

outPatternPrint fName env (SingleOutPattern maths) = outPatternPrint fName env (SingleOutPattern (evalMaths fName env maths))
outPatternPrint fName env (MultipleOutPattern maths next) = outPatternPrint fName env (MultipleOutPattern (evalMaths fName env maths) next)


printMvalue :: M -> String
printMvalue (MInt _ v) = show v
printMvalue (MBool _ v) = show v

evalComparableExp :: String -> E -> ComparableExp_ -> Bool
evalComparableExp fName env (ComparableExpSingle (ComparablesBool bool)) = bool
evalComparableExp fName env (Not exp) = not (evalComparableExp fName env exp)

evalComparableExp fName env (ComparableExpSingle (ComparablesMaths (MathsVar s))) = extractBoolFromEnv fName env s

evalComparableExp fName env (EqualsTo  (ComparableExpSingle (ComparablesMaths (MathsInt a))) (ComparableExpSingle (ComparablesMaths (MathsInt b))) ) = a == b
evalComparableExp fName env (EqualsTo (ComparableExpSingle (ComparablesMaths (MathsVar a))) (ComparableExpSingle (ComparablesMaths (MathsVar b))) ) = (extractIntFromEnv fName env a) == (extractIntFromEnv fName env b)
evalComparableExp fName env (EqualsTo  (ComparableExpSingle (ComparablesBool  a)) (ComparableExpSingle (ComparablesBool b)) ) = a == b

evalComparableExp fName env (Or  (ComparableExpSingle (ComparablesBool  a)) (ComparableExpSingle (ComparablesBool b)) ) = a || b
evalComparableExp fName env (Or (ComparableExpSingle (ComparablesMaths (MathsVar a))) (ComparableExpSingle (ComparablesMaths (MathsVar b))) ) = (extractBoolFromEnv fName env a) || (extractBoolFromEnv fName env b)

evalComparableExp fName env (And  (ComparableExpSingle (ComparablesBool  a)) (ComparableExpSingle (ComparablesBool b)) ) = a && b
evalComparableExp fName env (And (ComparableExpSingle (ComparablesMaths (MathsVar a))) (ComparableExpSingle (ComparablesMaths (MathsVar b))) ) = (extractBoolFromEnv fName env a) && (extractBoolFromEnv fName env b)

evalComparableExp fName env (GreaterThan  (ComparableExpSingle (ComparablesMaths (MathsInt a))) (ComparableExpSingle (ComparablesMaths (MathsInt b))) ) = a > b
evalComparableExp fName env (GreaterThan (ComparableExpSingle (ComparablesMaths (MathsVar a))) (ComparableExpSingle (ComparablesMaths (MathsVar b))) ) = (extractIntFromEnv fName env a) > (extractIntFromEnv fName env b)

evalComparableExp fName env (GreaterOrEqual  (ComparableExpSingle (ComparablesMaths (MathsInt a))) (ComparableExpSingle (ComparablesMaths (MathsInt b))) ) = a >= b
evalComparableExp fName env (GreaterOrEqual (ComparableExpSingle (ComparablesMaths (MathsVar a))) (ComparableExpSingle (ComparablesMaths (MathsVar b))) ) = (extractIntFromEnv fName env a) >= (extractIntFromEnv fName env b)

evalComparableExp fName env (SmallerOrEqual  (ComparableExpSingle (ComparablesMaths (MathsInt a))) (ComparableExpSingle (ComparablesMaths (MathsInt b))) ) = a <= b
evalComparableExp fName env (SmallerOrEqual (ComparableExpSingle (ComparablesMaths (MathsVar a))) (ComparableExpSingle (ComparablesMaths (MathsVar b))) ) = (extractIntFromEnv fName env a) <= (extractIntFromEnv fName env b)

evalComparableExp fName env (SmallerThan  (ComparableExpSingle (ComparablesMaths (MathsInt a))) (ComparableExpSingle (ComparablesMaths (MathsInt b))) ) = a < b
evalComparableExp fName env (SmallerThan (ComparableExpSingle (ComparablesMaths (MathsVar a))) (ComparableExpSingle (ComparablesMaths (MathsVar b))) ) = (extractIntFromEnv fName env a) < (extractIntFromEnv fName env b)

evalComparableExp fName env (EqualsTo (ComparableExpSingle (ComparablesMaths maths1)) (ComparableExpSingle (ComparablesMaths maths2))) = evalComparableExp fName env (EqualsTo (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths1))) (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths2))))
evalComparableExp fName env (GreaterThan (ComparableExpSingle (ComparablesMaths maths1)) (ComparableExpSingle (ComparablesMaths maths2))) = evalComparableExp fName env (GreaterThan (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths1))) (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths2))))
evalComparableExp fName env (SmallerThan (ComparableExpSingle (ComparablesMaths maths1)) (ComparableExpSingle (ComparablesMaths maths2))) = evalComparableExp fName env (SmallerThan (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths1))) (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths2))))
evalComparableExp fName env (GreaterOrEqual (ComparableExpSingle (ComparablesMaths maths1)) (ComparableExpSingle (ComparablesMaths maths2))) = evalComparableExp fName env (GreaterOrEqual (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths1))) (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths2))))
evalComparableExp fName env (SmallerOrEqual (ComparableExpSingle (ComparablesMaths maths1)) (ComparableExpSingle (ComparablesMaths maths2))) = evalComparableExp fName env (SmallerOrEqual (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths1))) (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths2))))

evalComparableExp fName env (Or (ComparableExpSingle (ComparablesMaths maths1)) (ComparableExpSingle (ComparablesMaths maths2))) = evalComparableExp fName env (Or (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths1))) (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths2))))
evalComparableExp fName env (Or compExp1 compExp2 ) = evalComparableExp fName env (Or (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp1))) (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp2))))

evalComparableExp fName env (And (ComparableExpSingle (ComparablesMaths maths1)) (ComparableExpSingle (ComparablesMaths maths2))) = evalComparableExp fName env (And (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths1))) (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths2))))
evalComparableExp fName env (And compExp1 compExp2 ) = evalComparableExp fName env (And (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp1))) (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp2))))