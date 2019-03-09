module Remap where  

import Tokens
import Grammar

remapOutputToSegue :: [FuncDeclaration_] -> [FuncDeclaration_]
remapOutputToSegue ((MainFuncDeclaration (SingleSegue fName)):xs) = ((MainFuncDeclaration (SingleSegue fName)):xs)
remapOutputToSegue ((MainFuncDeclaration (MultipleSegue fName next):xs)) = (m) : (remapOutputToSegueRec (getFunctionNames (MultipleSegue fName next)) xs)-- queue main or not for evaluation?
                                                                                    where m = (MainFuncDeclaration (MultipleSegue fName next))
remapOutputToSegueRec :: [String] -> [FuncDeclaration_] -> [FuncDeclaration_]
remapOutputToSegueRec [] _ = [] 
remapOutputToSegueRec _ [] = []
remapOutputToSegueRec [x] funcs = [remapMatchToEmptyMatch (findFunctionByNameRemap x funcs)]
remapOutputToSegueRec (x:xx:xs) funcs = (replaceFunctionBody left_func left_newBody) : (remapOutputToSegueRec (xx:xs) newFuncs)
                                        where left_func = findFunctionByNameRemap x funcs
                                              (NormalFuncDeclaration rightFuncName rightInitArea match) = findFunctionByNameRemap xx funcs
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
replaceFunctionBody (NormalFuncDeclaration fName fInitArea match) newExp = (NormalFuncDeclaration fName fInitArea (replaceFunctionBodyInner match newExp))

replaceFunctionBodyInner :: Match_ -> Exp_ -> Match_
replaceFunctionBodyInner (SingleMatch var _) newExp = SingleMatch var newExp
replaceFunctionBodyInner (EmptyMatch _) newExp = EmptyMatch newExp
replaceFunctionBodyInner (MultipleMatch var next) newExp = MultipleMatch var (replaceFunctionBodyInner next newExp)

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

findFunctionByNameRemap :: String -> [FuncDeclaration_] -> FuncDeclaration_
findFunctionByNameRemap funcName ((NormalFuncDeclaration funcName' a b):ff) | funcName == funcName' = (NormalFuncDeclaration funcName' a b)
                                                                       | otherwise = findFunctionByNameRemap funcName ff
matchVarsToVarnameList :: Match_ -> [String]
matchVarsToVarnameList (EmptyMatch _) = []
matchVarsToVarnameList (EOFMatch _) = [] -- ?????????
matchVarsToVarnameList (SingleMatch (Var_ name _) _) = [name]
matchVarsToVarnameList (MultipleMatch (Var_ name _) next) = name : matchVarsToVarnameList next

