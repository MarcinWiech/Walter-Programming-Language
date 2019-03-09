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
queueCheckInFuncEnv [] _ _ = error "TODO"
queueCheckInFuncEnv ((fName, fEnv):xs) fName' (var, t) | fName == fName' =  (fName, (queueInFuncEnv  fEnv (var, t))) : xs
                                                       | otherwise = (fName, fEnv) : queueCheckInFuncEnv xs fName' (var, t)


queueInFuncEnv :: [(String, T_)] -> (String, T_) -> [(String, T_)]
queueInFuncEnv [] (newVarName, newVarType) = [(newVarName, newVarType)]
queueInFuncEnv ((varName, varType):xs) (newVarName, newVarType) | varName == newVarName = error "TODO"
                                                                    | otherwise = (varName, varType) : queueInFuncEnv xs (newVarName, newVarType)

varInitToM :: VarInit_ -> (String, T_)
varInitToM (VarIntInit_ (Var_ varName varType) _) = (varName, varType)
varInitToM (VarBoolInit_ (Var_ varName varType) _) = (varName, varType)


-----------------------------------------------------------------------------------------------------------


typeOf :: TE -> [FuncDeclaration_] -> FuncDeclaration_ -> T_
typeOf _ _ (MainFuncDeclaration _ ) = error "TODO"
typeOf env fs (NormalFuncDeclaration fName fInitArea fMatch) | not $ containsFunc fName env = let newEnv = typeOfInit env fs fName fInitArea
                                                                                              in typeOfMatch newEnv fs fName fMatch
                                                          | otherwise = error "TODO"
    
typeOfInit :: TE -> [FuncDeclaration_] -> String -> FuncBodyInitArea_ -> TE
typeOfInit env fs fName EmptyInitArea = (fName, []) : env
typeOfInit env fs fName (SingleInitArea varInit) = queueCheckInFuncEnv env fName (varInitToM varInit)
typeOfInit env fs fName (MultipleInitArea varInit next) = typeOfInit newEnv fs fName next
                                                      where newEnv = queueCheckInFuncEnv env fName (varInitToM varInit)

typeOfMatch :: TE -> [FuncDeclaration_] -> String -> Match_ -> T_
typeOfMatch _ _ _ _ = TInt