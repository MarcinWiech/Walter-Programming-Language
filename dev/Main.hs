import Tokens
import Grammar
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
parseThis s = eval1_findMain $ parseCalc $ alexScanTokens s

getProgram :: String
getProgram = unsafePerformIO $ inner
            where inner = do s <- readFile "test2"
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

extractIntFromEnv :: E -> String -> Int
extractIntFromEnv env varName = getValue $! envGetVar env varName
            where getValue (MInt _ v) = v

extractBoolFromEnv :: E -> String -> Bool
extractBoolFromEnv env varName = getValue $! envGetVar env varName
            where getValue (MBool _ v) = v

envUpdateOrAppend :: E -> M -> E
envUpdateOrAppend [] (MInt name' value') = [(MInt name' value')]
envUpdateOrAppend ((MInt name value):xs) (MInt name' value') | name == name' = (MInt name value') : xs
                                                             | otherwise = (MInt name value) : (envUpdateOrAppend xs (MInt name' value'))

envUpdateOrAppend [] (MBool name' value') = [(MBool name' value')]
envUpdateOrAppend ((MBool name value):xs) (MBool name' value') | name == name' = (MBool name value') : xs
                                                               | otherwise = (MBool name value) : (envUpdateOrAppend xs (MBool name' value'))

envUpdateOrAppend (x:xs) m = x : envUpdateOrAppend xs m

eval1_findMain :: [FuncDeclaration_] -> IO () -- FuncDeclaration_
eval1_findMain (MainFuncDeclaration (SingleSegue funcname):ss) = evalFunction (envInit initArea) match
                                                                 where (NormalFuncDeclaration fname initArea match) = findFunctionByName funcname ss
eval1_findMain ((MainFuncDeclaration (MultipleSegue funcname next)):ss) = evalFunction (envInit initArea) match -- TODO!
                                                                          where (NormalFuncDeclaration fname initArea match) = findFunctionByName funcname ss

findFunctionByName :: String -> [FuncDeclaration_] -> FuncDeclaration_
findFunctionByName funcName ((NormalFuncDeclaration funcName' a b):ff) | funcName == funcName' = (NormalFuncDeclaration funcName' a b)
                                                                       | otherwise = findFunctionByName funcName ff

evalFunction :: E -> Match_ -> IO ()
evalFunction env (EmptyMatch exp) = do end <- isEOF
                                       if end then do putStr ""
                                       else do _ <- matchIntFromStdio
                                               newEnv' <- evalExp env exp
                                               evalFunction newEnv' (EmptyMatch exp)
evalFunction env (SingleMatch var exp) = do end <- isEOF
                                            if end then do putStr ""
                                            else do nums <- matchIntFromStdio
                                                    let vars = matchVarsToVarnameList (SingleMatch var exp)
                                                    let newEnv = matchUpdateEnv env vars nums
                                                    newEnv' <- evalExp newEnv exp
                                                    evalFunction newEnv' (SingleMatch var exp)

evalFunction env (MultipleMatch var next) = do end <- isEOF
                                               if end then do putStr ""
                                               else do nums <- matchIntFromStdio
                                                       let vars = matchVarsToVarnameList (MultipleMatch var next)
                                                       let newEnv = matchUpdateEnv env vars nums
                                                       newEnv' <- evalExp newEnv (getExpFromMultipleMatch next)
                                                       evalFunction newEnv' (MultipleMatch var next)

getExpFromMultipleMatch :: Match_ -> Exp_
getExpFromMultipleMatch (SingleMatch _ exp) = exp
getExpFromMultipleMatch (MultipleMatch _ next) = getExpFromMultipleMatch next

evalEquals :: E -> Equals_ -> E
evalEquals env (Equals_ varName (ComparableExpSingle (ComparablesMaths (MathsInt v)))) = envUpdateOrAppend env (MInt varName v)
evalEquals env (Equals_ varName (ComparableExpSingle (ComparablesMaths (MathsVar n)))) = envUpdateOrAppend env (MInt varName (extraxt $ envGetVar env n))
                                                                                         where extraxt (MInt _ i) = i

evalEquals env (Equals_ varName (ComparableExpSingle (ComparablesMaths maths))) = evalEquals env (Equals_ varName (ComparableExpSingle (ComparablesMaths (evalMaths env maths))))                                                                                 

evalEquals env (Equals_ varName comparable) = envUpdateOrAppend env (MBool varName (evalComparableExp env comparable))

evalExp :: E -> Exp_ -> IO E
evalExp env (OutPatternExp p) = do outPatternPrint env p
                                   return env
evalExp env (EqualsExp exp) = return $! evalEquals env exp
evalExp env (SequenceExp exp1 exp2) = do e <- evalExp env exp1
                                         evalExp e exp2
evalExp env (CondExp (Cond_ comp e e')) | (evalComparableExp env comp) = (evalExp env e)
                                        | otherwise = evalExp env e'


matchUpdateEnv :: E -> [String] -> [Int] -> E
matchUpdateEnv env [] _ = env
matchUpdateEnv env nn [] = env
matchUpdateEnv env (n:nn) (i:ii) = matchUpdateEnv (envUpdateOrAppend env (MInt n i)) nn ii

matchVarsToVarnameList :: Match_ -> [String]
matchVarsToVarnameList (EmptyMatch _) = []
matchVarsToVarnameList (EOFMatch _) = [] -- ?????????
matchVarsToVarnameList (SingleMatch (Var_ name _) _) = [name]
matchVarsToVarnameList (MultipleMatch (Var_ name _) next) = name : matchVarsToVarnameList next

matchIntFromStdio :: IO [Int]
matchIntFromStdio =  do line <- getLine
                        return $ (map read $ words line :: [Int])

evalMaths :: E -> Maths_ -> Maths_
evalMaths env (MathsInt int) = (MathsInt int)
evalMaths env (MathsNegative (MathsInt int)) = (MathsInt (-int))
evalMaths env (MathsNegative maths) = evalMaths env (MathsNegative (evalMaths env maths))
evalMaths env (MathsVar name) = convert (envGetVar env name)
                         where convert (MInt _ v) = MathsInt v

evalMaths env (MathsPlus (MathsInt x) (MathsInt y)) = MathsInt (x+y) 
evalMaths env (MathsMinus (MathsInt x) (MathsInt y)) = MathsInt (x-y)
evalMaths env (MathsTimes (MathsInt x) (MathsInt y)) = MathsInt (x*y)
evalMaths env (MathsDevide (MathsInt x) (MathsInt y)) = MathsInt (x `div` y)
evalMaths env (MathsMod (MathsInt x) (MathsInt y)) = MathsInt (x `mod` y) 

evalMaths env (MathsPlus x y) = evalMaths env (MathsPlus (evalMaths env x) (evalMaths env y))  
evalMaths env (MathsMinus x y) = evalMaths env (MathsMinus (evalMaths env x) (evalMaths env y)) 
evalMaths env (MathsTimes x y) = evalMaths env (MathsTimes (evalMaths env x) (evalMaths env y))  
evalMaths env (MathsDevide x y) = evalMaths env (MathsDevide (evalMaths env x) (evalMaths env y))
evalMaths env (MathsMod x y) = evalMaths env (MathsMod (evalMaths env x) (evalMaths env y))  

outPatternPrint :: E -> OutPattern_ -> IO ()
outPatternPrint env EmptyOutPatter = putStr $! ""

outPatternPrint env (SingleOutPattern (MathsInt i)) = do putStr $! show i
                                                         putStrLn $! ""
outPatternPrint env (SingleOutPattern (MathsVar name)) = do putStr $! printMvalue $! envGetVar env name
                                                            putStrLn $! ""

outPatternPrint env (MultipleOutPattern (MathsInt i) (SingleOutPattern next)) = do putStr $! show i
                                                                                   putStr $! " "
                                                                                   outPatternPrint env (SingleOutPattern next)

outPatternPrint env (MultipleOutPattern (MathsVar name) (SingleOutPattern next)) = do putStr $! printMvalue $! envGetVar env name
                                                                                      putStr $! " "
                                                                                      outPatternPrint env (SingleOutPattern next)

outPatternPrint env (MultipleOutPattern (MathsInt i) next) = do putStr $! show i
                                                                putStr $! " "
                                                                outPatternPrint env next

outPatternPrint env (MultipleOutPattern (MathsVar name) next) = do putStr $! printMvalue $! envGetVar env name
                                                                   putStr $! " "
                                                                   outPatternPrint env next

outPatternPrint env (SingleOutPattern maths) = outPatternPrint env (SingleOutPattern (evalMaths env maths))
outPatternPrint env (MultipleOutPattern maths next) = outPatternPrint env (MultipleOutPattern (evalMaths env maths) next)


printMvalue :: M -> String
printMvalue (MInt _ v) = show v
printMvalue (MBool _ v) = show v

evalComparableExp :: E -> ComparableExp_ -> Bool
evalComparableExp env (ComparableExpSingle (ComparablesBool bool)) = bool
evalComparableExp env (Not exp) = not (evalComparableExp env exp)

evalComparableExp env (ComparableExpSingle (ComparablesMaths (MathsVar s))) = extractBoolFromEnv env s

evalComparableExp env (EqualsTo  (ComparableExpSingle (ComparablesMaths (MathsInt a))) (ComparableExpSingle (ComparablesMaths (MathsInt b))) ) = a == b
evalComparableExp env (EqualsTo (ComparableExpSingle (ComparablesMaths (MathsVar a))) (ComparableExpSingle (ComparablesMaths (MathsVar b))) ) = (extractIntFromEnv env a) == (extractIntFromEnv env b)
evalComparableExp env (EqualsTo  (ComparableExpSingle (ComparablesBool  a)) (ComparableExpSingle (ComparablesBool b)) ) = a == b

evalComparableExp env (Or  (ComparableExpSingle (ComparablesBool  a)) (ComparableExpSingle (ComparablesBool b)) ) = a || b
evalComparableExp env (Or (ComparableExpSingle (ComparablesMaths (MathsVar a))) (ComparableExpSingle (ComparablesMaths (MathsVar b))) ) = (extractBoolFromEnv env a) || (extractBoolFromEnv env b)

evalComparableExp env (And  (ComparableExpSingle (ComparablesBool  a)) (ComparableExpSingle (ComparablesBool b)) ) = a && b
evalComparableExp env (And (ComparableExpSingle (ComparablesMaths (MathsVar a))) (ComparableExpSingle (ComparablesMaths (MathsVar b))) ) = (extractBoolFromEnv env a) && (extractBoolFromEnv env b)

evalComparableExp env (GreaterThan  (ComparableExpSingle (ComparablesMaths (MathsInt a))) (ComparableExpSingle (ComparablesMaths (MathsInt b))) ) = a > b
evalComparableExp env (GreaterThan (ComparableExpSingle (ComparablesMaths (MathsVar a))) (ComparableExpSingle (ComparablesMaths (MathsVar b))) ) = (extractIntFromEnv env a) > (extractIntFromEnv env b)

evalComparableExp env (GreaterOrEqual  (ComparableExpSingle (ComparablesMaths (MathsInt a))) (ComparableExpSingle (ComparablesMaths (MathsInt b))) ) = a >= b
evalComparableExp env (GreaterOrEqual (ComparableExpSingle (ComparablesMaths (MathsVar a))) (ComparableExpSingle (ComparablesMaths (MathsVar b))) ) = (extractIntFromEnv env a) >= (extractIntFromEnv env b)

evalComparableExp env (SmallerOrEqual  (ComparableExpSingle (ComparablesMaths (MathsInt a))) (ComparableExpSingle (ComparablesMaths (MathsInt b))) ) = a <= b
evalComparableExp env (SmallerOrEqual (ComparableExpSingle (ComparablesMaths (MathsVar a))) (ComparableExpSingle (ComparablesMaths (MathsVar b))) ) = (extractIntFromEnv env a) <= (extractIntFromEnv env b)

evalComparableExp env (SmallerThan  (ComparableExpSingle (ComparablesMaths (MathsInt a))) (ComparableExpSingle (ComparablesMaths (MathsInt b))) ) = a < b
evalComparableExp env (SmallerThan (ComparableExpSingle (ComparablesMaths (MathsVar a))) (ComparableExpSingle (ComparablesMaths (MathsVar b))) ) = (extractIntFromEnv env a) < (extractIntFromEnv env b)

evalComparableExp env (EqualsTo (ComparableExpSingle (ComparablesMaths maths1)) (ComparableExpSingle (ComparablesMaths maths2))) = evalComparableExp env (EqualsTo (ComparableExpSingle (ComparablesMaths (evalMaths env maths1))) (ComparableExpSingle (ComparablesMaths (evalMaths env maths2))))
evalComparableExp env (GreaterThan (ComparableExpSingle (ComparablesMaths maths1)) (ComparableExpSingle (ComparablesMaths maths2))) = evalComparableExp env (GreaterThan (ComparableExpSingle (ComparablesMaths (evalMaths env maths1))) (ComparableExpSingle (ComparablesMaths (evalMaths env maths2))))
evalComparableExp env (SmallerThan (ComparableExpSingle (ComparablesMaths maths1)) (ComparableExpSingle (ComparablesMaths maths2))) = evalComparableExp env (SmallerThan (ComparableExpSingle (ComparablesMaths (evalMaths env maths1))) (ComparableExpSingle (ComparablesMaths (evalMaths env maths2))))
evalComparableExp env (GreaterOrEqual (ComparableExpSingle (ComparablesMaths maths1)) (ComparableExpSingle (ComparablesMaths maths2))) = evalComparableExp env (GreaterOrEqual (ComparableExpSingle (ComparablesMaths (evalMaths env maths1))) (ComparableExpSingle (ComparablesMaths (evalMaths env maths2))))
evalComparableExp env (SmallerOrEqual (ComparableExpSingle (ComparablesMaths maths1)) (ComparableExpSingle (ComparablesMaths maths2))) = evalComparableExp env (SmallerOrEqual (ComparableExpSingle (ComparablesMaths (evalMaths env maths1))) (ComparableExpSingle (ComparablesMaths (evalMaths env maths2))))

evalComparableExp env (Or (ComparableExpSingle (ComparablesMaths maths1)) (ComparableExpSingle (ComparablesMaths maths2))) = evalComparableExp env (Or (ComparableExpSingle (ComparablesMaths (evalMaths env maths1))) (ComparableExpSingle (ComparablesMaths (evalMaths env maths2))))
evalComparableExp env (Or compExp1 compExp2 ) = evalComparableExp env (Or (ComparableExpSingle (ComparablesBool (evalComparableExp env compExp1))) (ComparableExpSingle (ComparablesBool (evalComparableExp env compExp2))))

evalComparableExp env (And (ComparableExpSingle (ComparablesMaths maths1)) (ComparableExpSingle (ComparablesMaths maths2))) = evalComparableExp env (And (ComparableExpSingle (ComparablesMaths (evalMaths env maths1))) (ComparableExpSingle (ComparablesMaths (evalMaths env maths2))))
evalComparableExp env (And compExp1 compExp2 ) = evalComparableExp env (And (ComparableExpSingle (ComparablesBool (evalComparableExp env compExp1))) (ComparableExpSingle (ComparablesBool (evalComparableExp env compExp2))))


-- mapProgramToPureFunction :: [FuncDeclaration] -> FuncDeclaration
-- mapProgramToPureFunction ((MainFuncDeclaration (SingleSegue fName)):xs) = findFunctionByName fName xs
-- mapProgramToPureFunction ((MainFuncDeclaration (MultipleSegue fName next):x:xs)) = segueFuncDeclarationToNext 
                                                                               
-- segueFuncDeclarationToNext :: FuncDeclaration -> FuncDeclaration -> FuncDeclaration
-- segueFuncDeclarationToNext (NormalFuncDeclaration fName init match) (NormalFuncDeclaration nextfName _ constMatch) 
--                 = NormalFuncDeclaration fName init (editWithSegue match nextfName (matchVarsToVarnameList constMatch) (getMathsFromOutPattern match))

-- editWithSegue :: Match_ -> String -> [String] -> [Maths_] -> Match_
-- editWithSegue (EmptyMatch ex) nextfName vars values = EmptyMatch (replaceOutWithSegue ex (SegueToFunction nextfName vars values))
-- editWithSegue (SingleMatch v ex) nextfName vars values = SingleMatch v (replaceOutWithSegue ex (SegueToFunction nextfName vars values))
-- editWithSegue (MultipleMatch (Var_ name _) next) = name : matchVarsToVarnameList next

remapOutputToSegue :: [FuncDeclaration_] -> [FuncDeclaration_]
remapOutputToSegue ((MainFuncDeclaration (SingleSegue fName)):xs) = ((MainFuncDeclaration (SingleSegue fName)):xs)
remapOutputToSegue ((MainFuncDeclaration (MultipleSegue fName next):xs)) = (m) : (remapOutputToSegueRec (getFunctionNames (MultipleSegue fName next)) xs)-- queue main or not for evaluation?
                                                                                    where m = (MainFuncDeclaration (MultipleSegue fName next))
remapOutputToSegueRec :: [String] -> [FuncDeclaration_] -> [FuncDeclaration_]
remapOutputToSegueRec [] _ = [] 
remapOutputToSegueRec _ [] = []
remapOutputToSegueRec [x] funcs = [remapMatchToEmptyMatch (findFunctionByName x funcs)]
remapOutputToSegueRec (x:xx:xs) funcs = (replaceFunctionBody left_func left_newBody) : (remapOutputToSegueRec (xx:xs) newFuncs)
                                        where left_func = findFunctionByName x funcs
                                              (NormalFuncDeclaration rightFuncName rightInitArea match) = findFunctionByName xx funcs
                                              left_newBody = replaceOutWithSegue (getFunctionBody left_func) xx (matchVarsToVarnameList match)
                                              newFuncs = substituteFunction funcs rightFuncName (remapMatchToEmptyMatch (NormalFuncDeclaration rightFuncName rightInitArea match))

substituteFunction :: [FuncDeclaration_] -> String -> FuncDeclaration_ -> [FuncDeclaration_]
substituteFunction [] _ _ = []
substituteFunction ((NormalFuncDeclaration fName init match):xs) fName' fDec | fName == fName' = (fDec:xs)
                                                                             | otherwise = (NormalFuncDeclaration fName init match):(substituteFunction xs fName' fDec)

-- helper for the remapOutputToSegueRec
remapMatchToEmptyMatch :: FuncDeclaration_ -> FuncDeclaration_
remapMatchToEmptyMatch (NormalFuncDeclaration fName fInitArea (SingleMatch _ exps)) = (NormalFuncDeclaration fName fInitArea (EmptyMatch exps))
remapMatchToEmptyMatch (NormalFuncDeclaration fName fInitArea (MultipleMatch _ nextMatch)) = remapMatchToEmptyMatch (NormalFuncDeclaration fName fInitArea nextMatch)
remapMatchToEmptyMatch (NormalFuncDeclaration fName fInitArea (EmptyMatch exps)) = (NormalFuncDeclaration fName fInitArea (EmptyMatch exps))

-- helper for the remapOutputToSegueRec
getFunctionBody :: FuncDeclaration_ -> Exp_
getFunctionBody (NormalFuncDeclaration fName fInitArea (SingleMatch _ exps)) = exps
getFunctionBody (NormalFuncDeclaration fName fInitArea (MultipleMatch _ nextMatch)) = getFunctionBody (NormalFuncDeclaration fName fInitArea nextMatch)
getFunctionBody (NormalFuncDeclaration fName fInitArea (EmptyMatch exps)) = exps

-- helper for the remapOutputToSegueRec
replaceFunctionBody :: FuncDeclaration_ -> Exp_ -> FuncDeclaration_
replaceFunctionBody (NormalFuncDeclaration fName fInitArea (SingleMatch var _)) newExp = (NormalFuncDeclaration fName fInitArea (SingleMatch var newExp))
replaceFunctionBody (NormalFuncDeclaration fName fInitArea (MultipleMatch _ nextMatch)) newExp = replaceFunctionBody (NormalFuncDeclaration fName fInitArea nextMatch) newExp
replaceFunctionBody (NormalFuncDeclaration fName fInitArea (EmptyMatch _)) newExp = (NormalFuncDeclaration fName fInitArea (EmptyMatch newExp))

getFunctionNames :: Main_ -> [String]
getFunctionNames (SingleSegue fName) = [fName]
getFunctionNames (MultipleSegue fName next) = fName : getFunctionNames next

replaceOutWithSegue :: Exp_ -> String -> [String] -> Exp_
replaceOutWithSegue (OutPatternExp p) nextfName vars = SegueToFunction nextfName vars (getMathsFromOutPattern p)
replaceOutWithSegue (EqualsExp exp) nextfName vars = (EqualsExp exp)
replaceOutWithSegue (SequenceExp exp1 exp2) nextfName vars = SequenceExp (replaceOutWithSegue exp1 nextfName vars ) (replaceOutWithSegue exp2 nextfName vars )
replaceOutWithSegue (CondExp (Cond_ comp e e')) nextfName vars = CondExp (Cond_ comp (replaceOutWithSegue e nextfName vars) (replaceOutWithSegue e' nextfName vars))

getMathsFromOutPattern :: OutPattern_ -> [Maths_]
getMathsFromOutPattern EmptyOutPatter = []
getMathsFromOutPattern (SingleOutPattern m) = [m]
getMathsFromOutPattern (MultipleOutPattern m next) = m : getMathsFromOutPattern next

