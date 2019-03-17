import Tokens
import Grammar
import Remap
import TypeChecker
import System.Environment
import System.IO (isEOF)

main :: IO ()
main = parseThisFile


parseThisFile :: IO ()
parseThisFile = do p <- getProgram
                   let tree = parseCalc $ alexScanTokens p
                   tree' <- checkAllFuncsBeforeRemap $! tree
                   let t = remapOutputToSegue $! tree
                   _ <- executeTypeCheck $! t
                   eval1_findMain $! t

getProgram :: IO String
getProgram = do (fileName: _ ) <- getArgs
                readFile fileName

data M = MInt String Int | MBool String Bool deriving (Show, Eq)
type E = [(String,[M])]

getFunctionEnvironment :: String -> E -> [M]
getFunctionEnvironment _ [] = []
getFunctionEnvironment fName ((fName', vars):xs) | fName' == fName = vars
                                                 | otherwise = getFunctionEnvironment fName xs

envInit :: [FuncDeclaration_] -> E
envInit [] = []
envInit (NormalFuncDeclaration funcName initArea _:xs) = (funcName, (envInitNoFunctionName initArea)) : envInit xs

replaceFuncEnv :: String -> E -> [M] -> E
replaceFuncEnv fName ((fName', old):xs) new | fName == fName' = (fName, new) : xs
                                            | otherwise = (fName', old):(replaceFuncEnv fName xs new)

getMValueInt :: M -> Int
getMValueInt (MInt _ v) = v                                            

getMValueBool :: M -> Bool
getMValueBool (MBool _ v) = v   

--helper for envInit
envInitNoFunctionName :: FuncBodyInitArea_ -> [M]
envInitNoFunctionName EmptyInitArea = []
envInitNoFunctionName (SingleInitArea (VarIntInit_ (Var_ name _) value)) = [(MInt name value)]
envInitNoFunctionName (SingleInitArea (VarBoolInit_ (Var_ name _) value)) = [(MBool name value)]
envInitNoFunctionName (MultipleInitArea (VarIntInit_ (Var_ name _) value) next) = (MInt name value) : envInitNoFunctionName next 
envInitNoFunctionName (MultipleInitArea (VarBoolInit_ (Var_ name _) value) next) = (MBool name value) : envInitNoFunctionName next

envContains :: String -> E -> String -> Bool
envContains _ [] _ = False 
envContains fName env name = envContainsInner (getFunctionEnvironment fName env) name

envContainsInner :: [M] -> String -> Bool
envContainsInner [] _ = False
envContainsInner (MInt name _ : xs) name' | name == name' = True
                                          | otherwise = envContainsInner xs name'
envContainsInner (MBool name _ : xs) name' | name == name' = True
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
                                                                 where (NormalFuncDeclaration _ _ match) = findFunctionByName funcname ss
eval1_findMain ((MainFuncDeclaration (MultipleSegue funcname next)):ss) = evalFunction funcname (envInit ss) ss match -- TODO!
                                                                          where (NormalFuncDeclaration _ initArea match) = findFunctionByName funcname ss

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
evalExp fName env _ (OutPatternExp p) = do outPatternPrint fName env p
                                           return env
evalExp fName env _ (EqualsExp exp) = return $! evalEquals fName env exp
evalExp fName env funcs (SequenceExp exp1 exp2) = do e <- evalExp fName env funcs exp1
                                                     evalExp fName e funcs exp2
evalExp fName env funcs (CondExp (IfElseStmt comp e e')) | (evalComparableExp fName env comp) = (evalExp fName env funcs e)
                                                         | otherwise = evalExp fName env funcs e'
evalExp fName env funcs (CondExp (IfStmt comp e)) | (evalComparableExp fName env comp) = (evalExp fName env funcs e)
                                                  | otherwise = return env
evalExp fName env funcs (SegueToFunction nextFName nextVars comps) = do let newEnv = matchUpdateEnv nextFName env nextVars (evalComparablesToListInts fName env comps)
                                                                        evalExp nextFName newEnv funcs (getFunctionBody (findFunctionByName nextFName funcs))

matchUpdateEnv :: String -> E -> [Var_] -> [Int] -> E
matchUpdateEnv fName env [] _ = env
matchUpdateEnv fName env nn [] = env
matchUpdateEnv fName env ((Var_ n TInt):vv) (i:ii) = matchUpdateEnv fName (envUpdateOrAppend fName env (MInt n i)) vv ii
matchUpdateEnv fName env ((Var_ n TBool):vv) (i:ii) | i == 0 = matchUpdateEnv fName (envUpdateOrAppend fName env (MBool n False)) vv ii
                                                    | otherwise = matchUpdateEnv fName (envUpdateOrAppend fName env (MBool n True)) vv ii

matchIntFromStdio :: IO [Int]
matchIntFromStdio =  do line <- getLine
                        return $ (map read $ words line :: [Int])

evalComparablesToListInts :: String -> E -> [ComparableExp_] -> [Int]
evalComparablesToListInts fName env [] = []
evalComparablesToListInts fName env (x:xs) = (evalOutputExpressions fName env x):(evalComparablesToListInts fName env xs)


evalOutputExpressions :: String -> E -> ComparableExp_ -> Int
evalOutputExpressions fName env (ComparableExpSingle(ComparablesMaths m)) = v
                                                where (MathsInt v) = evalMaths fName env m
evalOutputExpressions fName env (ComparableExpSingle (ComparablesBool True)) = 1
evalOutputExpressions fName env (ComparableExpSingle (ComparablesBool False)) = 0
evalOutputExpressions fName env exp = evalOutputExpressions fName env (ComparableExpSingle (ComparablesBool (evalComparableExp fName env exp)))

evalMaths :: String -> E -> Maths_ -> Maths_
evalMaths fName env (MathsInt int) = (MathsInt int)
evalMaths fName env (MathsNegative (MathsInt int)) = (MathsInt (-int))
evalMaths fName env (MathsNegative maths) = evalMaths fName env (MathsNegative (evalMaths fName env maths))
evalMaths fName env (MathsVar name) = convert (envGetVar fName env name)
                         where convert (MInt _ v) = MathsInt v
                               convert (MBool _ True) = MathsInt 1
                               convert (MBool _ False) = MathsInt 0             
evalMaths fName env (MathsPlus (MathsInt x) (MathsInt y)) = MathsInt (x+y) 
evalMaths fName env (MathsMinus (MathsInt x) (MathsInt y)) = MathsInt (x-y)
evalMaths fName env (MathsTimes (MathsInt x) (MathsInt y)) = MathsInt (x*y)
evalMaths fName env (MathsDevide (MathsInt x) (MathsInt y)) = MathsInt (x `div` y)
evalMaths fName env (MathsMod (MathsInt x) (MathsInt y)) = MathsInt (x `mod` y)
evalMaths fName env (MathsPower (MathsInt x) (MathsInt y)) = MathsInt (x^y)  

evalMaths fName env (MathsPlus x y) = evalMaths fName env (MathsPlus (evalMaths fName env x) (evalMaths fName env y))  
evalMaths fName env (MathsMinus x y) = evalMaths fName env (MathsMinus (evalMaths fName env x) (evalMaths fName env y)) 
evalMaths fName env (MathsTimes x y) = evalMaths fName env (MathsTimes (evalMaths fName env x) (evalMaths fName env y))  
evalMaths fName env (MathsDevide x y) = evalMaths fName env (MathsDevide (evalMaths fName env x) (evalMaths fName env y))
evalMaths fName env (MathsMod x y) = evalMaths fName env (MathsMod (evalMaths fName env x) (evalMaths fName env y))  
evalMaths fName env (MathsPower x y) = evalMaths fName env (MathsPower (evalMaths fName env x) (evalMaths fName env y))

outPatternPrint :: String -> E -> OutPattern_ -> IO ()
outPatternPrint fName env EmptyOutPatter = putStr $! ""

outPatternPrint fName env (SingleOutPattern (ComparableExpSingle (ComparablesBool b))) = if b then putStrLn $! "1" else putStrLn $! "0" 

outPatternPrint fName env (SingleOutPattern (ComparableExpSingle (ComparablesMaths (MathsInt i)))) = do putStr $! show i
                                                                                                        putStrLn $! ""
outPatternPrint fName env (SingleOutPattern (ComparableExpSingle (ComparablesMaths (MathsVar name)))) = do let varValue = envGetVar fName env name
                                                                                                           putStr $! printMvalue $! varValue
                                                                                                           putStrLn $! ""

outPatternPrint fName env (MultipleOutPattern (ComparableExpSingle (ComparablesMaths (MathsInt i))) (SingleOutPattern next)) = do putStr $! show i
                                                                                                                                  putStr $! " "
                                                                                                                                  outPatternPrint fName env (SingleOutPattern next)

outPatternPrint fName env (MultipleOutPattern  (ComparableExpSingle (ComparablesMaths (MathsVar name))) (SingleOutPattern next)) = do putStr $! printMvalue $! envGetVar fName env name
                                                                                                                                      putStr $! " "
                                                                                                                                      outPatternPrint fName env (SingleOutPattern next)

outPatternPrint fName env (MultipleOutPattern (ComparableExpSingle (ComparablesMaths (MathsInt i))) next) = do putStr $! show i
                                                                                                               putStr $! " "
                                                                                                               outPatternPrint fName env next

outPatternPrint fName env (MultipleOutPattern  (ComparableExpSingle (ComparablesMaths (MathsVar name))) next) = do putStr $! printMvalue $! envGetVar fName env name
                                                                                                                   putStr $! " "
                                                                                                                   outPatternPrint fName env next

outPatternPrint fName env (SingleOutPattern (ComparableExpSingle (ComparablesMaths maths))) = outPatternPrint fName env (SingleOutPattern (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths))))
outPatternPrint fName env (MultipleOutPattern (ComparableExpSingle (ComparablesMaths maths)) next) = outPatternPrint fName env (MultipleOutPattern (ComparableExpSingle (ComparablesMaths (evalMaths fName env maths))) next)

outPatternPrint fName env (SingleOutPattern compExp) = outPatternPrint fName env (SingleOutPattern (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp))))
outPatternPrint fName env (MultipleOutPattern compExp next) = outPatternPrint fName env (MultipleOutPattern (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp))) next)

printMvalue :: M -> String
printMvalue (MInt _ v) = show v
printMvalue (MBool _ v) | v = "1"
                        | otherwise = "0"

getVarT_ :: M -> T_
getVarT_ (MInt _ _) = TInt
getVarT_ (MBool _ _) = TBool

evalComparableExp :: String -> E -> ComparableExp_ -> Bool
evalComparableExp fName env (ComparableExpSingle (ComparablesBool bool)) = bool
evalComparableExp fName env (Not exp) = not (evalComparableExp fName env exp)

evalComparableExp fName env (ComparableExpSingle (ComparablesMaths (MathsVar s))) = extractBoolFromEnv fName env s

evalComparableExp fName env (EqualsTo  (ComparableExpSingle (ComparablesMaths (MathsInt a))) (ComparableExpSingle (ComparablesMaths (MathsInt b))) ) = a == b
evalComparableExp fName env (EqualsTo (ComparableExpSingle (ComparablesMaths (MathsVar a))) (ComparableExpSingle (ComparablesMaths (MathsVar b))) ) | isIntTop = (extractIntFromEnv fName env a) == (extractIntFromEnv fName env b)
                                                                                                                                                    | otherwise = (extractBoolFromEnv fName env a) == (extractBoolFromEnv fName env b)
                                                                                                                                                    where aType = getVarT_ (envGetVar fName env a)
                                                                                                                                                          bType = getVarT_ (envGetVar fName env b)
                                                                                                                                                          isIntTop = aType == bType  && aType == TInt
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

evalComparableExp fName env (EqualsTo compExp1 compExp2 ) = evalComparableExp fName env (EqualsTo (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp1))) (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp2))))
evalComparableExp fName env (GreaterThan compExp1 compExp2 ) = evalComparableExp fName env (GreaterThan (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp1))) (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp2))))
evalComparableExp fName env (SmallerThan compExp1 compExp2 ) = evalComparableExp fName env (SmallerThan (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp1))) (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp2))))
evalComparableExp fName env (GreaterOrEqual compExp1 compExp2 ) = evalComparableExp fName env (GreaterOrEqual (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp1))) (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp2))))
evalComparableExp fName env (SmallerOrEqual compExp1 compExp2 ) = evalComparableExp fName env (SmallerOrEqual (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp1))) (ComparableExpSingle (ComparablesBool (evalComparableExp fName env compExp2))))