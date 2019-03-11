module TypeChecker where
import Tokens
import Grammar
import Remap

type TM = (String, [(String, T_)])
type TE = [TM]

containsFunc :: String -> TE -> Bool
containsFunc fName [] = False
containsFunc fName ((fName', _):xs) | fName == fName' = True
                                    | otherwise = containsFunc fName xs

queueCheckInFuncEnv :: TE -> String -> (String, T_) -> TE
queueCheckInFuncEnv [] fName (var, t) = [(fName, [(var, t)])]
queueCheckInFuncEnv ((fName, fEnv):xs) fName' (var, t) | fName == fName' =  (fName, (queueInFuncEnv  fEnv (var, t))) : xs
                                                       | otherwise = (fName, fEnv) : queueCheckInFuncEnv xs fName' (var, t)

queueInFuncEnv :: [(String, T_)] -> (String, T_) -> [(String, T_)]
queueInFuncEnv [] (newVarName, newVarType) = [(newVarName, newVarType)]
queueInFuncEnv ((varName, varType):xs) (newVarName, newVarType) | varName == newVarName = error "TODO"
                                                                | otherwise = (varName, varType) : queueInFuncEnv xs (newVarName, newVarType)

varInitToM :: VarInit_ -> (String, T_)
varInitToM (VarIntInit_ (Var_ varName varType) _) = (varName, varType)
varInitToM (VarBoolInit_ (Var_ varName varType) _) = (varName, varType)

varToM :: Var_ -> (String, T_)
varToM (Var_ varName varType) = (varName, varType)

getVarType :: TM -> String -> T_
getVarType (_, []) _ = error "TODO"
getVarType ((_, ((varName, varType):xs))) varName' | varName == varName' = varType

getFuncEnv :: TE -> String -> TM
getFuncEnv [] _ = error "TODO"
getFuncEnv ((fName, fEnv):xs) fName' | fName == fName' = (fName, fEnv)
                                     | otherwise = getFuncEnv xs fName'

-----------------------------------------------------------------------------------------------------------

executeTypeCheck :: [FuncDeclaration_] -> IO ()
executeTypeCheck ((MainFuncDeclaration (SingleSegue fName)):xs) = do let x = typeOf [] xs (findFunctionByNameRemap fName xs)
                                                                     putStrLn $ show x
executeTypeCheck ((MainFuncDeclaration (MultipleSegue fName next)):xs) = do let x = typeOf [] xs (findFunctionByNameRemap fName xs)
                                                                            putStrLn $ show x
executeTypeCheck _ = error "TODO NO VALID STRUCTURE?"

typeOf :: TE -> [FuncDeclaration_] -> FuncDeclaration_ -> TE
typeOf _ _ (MainFuncDeclaration _ ) = error "TODO"
typeOf env fs (NormalFuncDeclaration fName fInitArea fMatch) = newEnv''
                                                             where newEnv | not $ containsFunc fName env = typeOfInit env fs fName fInitArea
                                                                          | otherwise = env

                                                                   newEnv' = typeOfMatch newEnv fs fName fMatch

                                                                   thisFuncBody = getFunctionBody (NormalFuncDeclaration fName fInitArea fMatch)
                                                                   newEnv'' = typeOfExp newEnv' fs fName thisFuncBody

typeOfInit :: TE -> [FuncDeclaration_] -> String -> FuncBodyInitArea_ -> TE
typeOfInit env fs fName EmptyInitArea = (fName, []) : env
typeOfInit env fs fName (SingleInitArea varInit) = queueCheckInFuncEnv env fName (varInitToM varInit)
typeOfInit env fs fName (MultipleInitArea varInit next) = typeOfInit newEnv fs fName next
                                                      where newEnv = queueCheckInFuncEnv env fName (varInitToM varInit)

typeOfMatch :: TE -> [FuncDeclaration_] -> String -> Match_ -> TE
typeOfMatch env fs fName (EmptyMatch _) = env
typeOfMatch env fs fName (SingleMatch var exp) = queueCheckInFuncEnv env fName (varToM var)
typeOfMatch env fs fName (MultipleMatch var next) = typeOfMatch newEnv fs fName next
                            where newEnv = queueCheckInFuncEnv env fName (varToM var)

typeOfExp :: TE -> [FuncDeclaration_] -> String -> Exp_ -> TE
typeOfExp env fs fName (CondExp (Cond_ compExp exp exp')) | compExpType == TBool && expType == expType' = expType
                                                          | otherwise = error "TODO"
                                                        where compExpType = typeOfComparableExp env fName compExp
                                                              expType = typeOfExp env fs fName exp
                                                              expType' = typeOfExp env fs fName exp'

typeOfExp env fs fName (EqualsExp eqExp) = typeOfEqual env fName eqExp

typeOfExp env fs fName (SequenceExp x y) = (typeOfExp (typeOfExp env fs fName x) fs fName y)

typeOfExp env fs fName (OutPatternExp outPattern) = typeOfOutPattern env fName outPattern

typeOfExp env fs fName (SegueToFunction fName' varNames maths) | length varNames == length maths = newEnv'
                                                               | otherwise = error "TODO 81"
                        where nextFunc = findFunctionByNameRemap fName' fs
                              newEnv = updateCheckEnvSegue env fs fName' varNames maths
                              newEnv' = typeOf newEnv fs nextFunc
--helper for typeOfExp
updateCheckEnvSegue :: TE -> [FuncDeclaration_] -> String -> [String] -> [Maths_] -> TE
updateCheckEnvSegue env _ _ [] [] = env

updateCheckEnvSegue env fs fName (v:vs) (m:ms) | contains && (vT == mT) = updateCheckEnvSegue env fs fName vs ms
                                               | otherwise = queueCheckInFuncEnv env fName (v,TInt)
                        where contains = containsFunc fName env
                              vT = getVarType (getFuncEnv env fName) v 
                              mT = typeOfMaths env fName m

updateCheckEnvSegue _ _ _ _ _ = error "TODO"

typeOfMaths :: TE-> String -> Maths_ -> T_
typeOfMaths _ _ (MathsInt _) = TInt
typeOfMaths env fName (MathsVar varName) = getVarType (getFuncEnv env fName) varName
typeOfMaths env fName (MathsPlus x y) | xType == yType = yType
                                      | otherwise = error "TODO"
                                    where xType = typeOfMaths env fName x
                                          yType = typeOfMaths env fName y
typeOfMaths env fName (MathsMinus x y) = typeOfMaths env fName (MathsPlus x y)
typeOfMaths env fName (MathsTimes x y) = typeOfMaths env fName (MathsPlus x y)
typeOfMaths env fName (MathsDevide x y) = typeOfMaths env fName (MathsPlus x y)
typeOfMaths env fName (MathsMod x y) = typeOfMaths env fName (MathsPlus x y)
typeOfMaths env fName (MathsNegative x) | xType == TInt = TInt
                                        | otherwise = error "TODO"
                                             where xType = typeOfMaths env fName x

typeOfComparables :: TE -> String -> Comparables_ -> T_
typeOfComparables _ _ (ComparablesInt _) = TInt
typeOfComparables _ _ (ComparablesBool _) = TBool
typeOfComparables env fName (ComparablesVar varName) = getVarType (getFuncEnv env fName) varName
typeOfComparables env fName (ComparablesMaths maths) = typeOfMaths env fName maths

typeOfComparableExp :: TE -> String -> ComparableExp_ -> T_ 
typeOfComparableExp env fName (ComparableExpSingle comparables) = typeOfComparables env fName comparables

typeOfComparableExp env fName (Not x) | xType == TBool = TBool
                                      | otherwise = error "TODO"
                                    where xType = typeOfComparableExp env fName x

typeOfComparableExp env fName (Or x y) | xType == yType && xType == TBool = TBool
                                       | otherwise = error "TODO"
                                       where xType = typeOfComparableExp env fName x
                                             yType = typeOfComparableExp env fName y

typeOfComparableExp env fName (And x y) = typeOfComparableExp env fName (Or x y)

typeOfComparableExp env fName (GreaterOrEqual x y) | xType == yType && xType == TInt = TInt
                                                   | otherwise = error "TODO"
                                                   where xType = typeOfComparableExp env fName x
                                                         yType = typeOfComparableExp env fName y

typeOfComparableExp env fName (GreaterThan x y) = typeOfComparableExp env fName (GreaterOrEqual x y)


typeOfComparableExp env fName (SmallerOrEqual x y) = typeOfComparableExp env fName (GreaterOrEqual x y)
typeOfComparableExp env fName (SmallerThan x y) = typeOfComparableExp env fName (SmallerOrEqual x y)

typeOfComparableExp env fName (EqualsTo x y) | xType == yType = yType
                                             | otherwise = error "TODO"
                                             where xType = typeOfComparableExp env fName x
                                                   yType = typeOfComparableExp env fName y


typeOfEqual :: TE -> String -> Equals_ -> TE
typeOfEqual env fName (Equals_ varName compExp) | varType == compExpType = env
                                                | otherwise = error "TODO"
                                            where varType = getVarType (getFuncEnv env fName) varName
                                                  compExpType = typeOfComparableExp env fName compExp

typeOfOutPattern :: TE -> String -> OutPattern_ -> TE
typeOfOutPattern env _ EmptyOutPatter = env
typeOfOutPattern env fName (SingleOutPattern maths) | typeOfMaths env fName maths == TInt = env
                                                    | otherwise = error "TODO"
typeOfOutPattern env fName (MultipleOutPattern maths next) | typeOfMaths env fName maths == TInt = typeOfOutPattern env fName next
                                                           | otherwise = error "TODO"

                                            