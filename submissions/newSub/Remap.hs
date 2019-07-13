module Remap where  

import Tokens
import Grammar

-- takes a list of FuncDeclaration_ and returns the same list in which 
-- output patterns outputing to another function have been replaced with SegueToFunction definitions
remapOutputToSegue :: [FuncDeclaration_] -> [FuncDeclaration_]
remapOutputToSegue ((MainFuncDeclaration (SingleSegue fName)):xs) = ((MainFuncDeclaration (SingleSegue fName)):xs)
remapOutputToSegue ((MainFuncDeclaration (MultipleSegue fName next):xs)) = (m) : (remapOutputToSegueRec (getFunctionNames (MultipleSegue fName next)) xs)
                                                                                    where m = (MainFuncDeclaration (MultipleSegue fName next))

--helper for remapOutputToSegue function
remapOutputToSegueRec :: [String] -> [FuncDeclaration_] -> [FuncDeclaration_]
remapOutputToSegueRec [] _ = [] 
remapOutputToSegueRec _ [] = []
remapOutputToSegueRec [x] funcs = [remapMatchToEmptyMatch (findFunctionByNameRemap x funcs)]
remapOutputToSegueRec (x:xx:xs) funcs = (replaceFunctionBody left_func left_newBody) : (remapOutputToSegueRec (xx:xs) newFuncs)
                                        where left_func = findFunctionByNameRemap x funcs
                                              (NormalFuncDeclaration rightFuncName rightInitArea match) = findFunctionByNameRemap xx funcs
                                              left_newBody = replaceOutWithSegue (getFunctionBody left_func) xx (matchVarsToVarnameList match)
                                              newFuncs = substituteFunction funcs rightFuncName (remapMatchToEmptyMatch (NormalFuncDeclaration rightFuncName rightInitArea match))

-- changes the body of a function based on the fuction name
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

-- given Main returns the function calls
getFunctionNames :: Main_ -> [String]
getFunctionNames (SingleSegue fName) = [fName]
getFunctionNames (MultipleSegue fName next) = fName : getFunctionNames next

-- given a expression body it replaces all of its outputpattern to segues
-- to the function name specified in the arguments
replaceOutWithSegue :: Exp_ -> String -> [Var_] -> Exp_
replaceOutWithSegue (OutPatternExp p) nextfName vars = SegueToFunction nextfName vars (getComparablesFromOutputPattern p)
replaceOutWithSegue (EqualsExp exp) nextfName vars = (EqualsExp exp)
replaceOutWithSegue (SequenceExp exp1 exp2) nextfName vars = SequenceExp (replaceOutWithSegue exp1 nextfName vars ) (replaceOutWithSegue exp2 nextfName vars )
replaceOutWithSegue (CondExp (IfElseStmt comp e e')) nextfName vars = CondExp (IfElseStmt comp (replaceOutWithSegue e nextfName vars) (replaceOutWithSegue e' nextfName vars))
replaceOutWithSegue (CondExp (IfStmt comp e)) nextfName vars = CondExp (IfStmt comp (replaceOutWithSegue e nextfName vars))

-- unfolds an output pattern to return the list of comparables it includes
getComparablesFromOutputPattern :: OutPattern_ -> [ComparableExp_]
getComparablesFromOutputPattern EmptyOutPatter = []
getComparablesFromOutputPattern (SingleOutPattern m) = [m]
getComparablesFromOutputPattern (MultipleOutPattern m next) = m : getComparablesFromOutputPattern next

-- returns the first function declaration with the same name from the list of function declarations
findFunctionByNameRemap :: String -> [FuncDeclaration_] -> FuncDeclaration_
findFunctionByNameRemap funcName ((NormalFuncDeclaration funcName' a b):ff) | funcName == funcName' = (NormalFuncDeclaration funcName' a b)
                                                                            | otherwise = findFunctionByNameRemap funcName ff

-- unfolds a match declaration to returns the list of Var_ it includes
matchVarsToVarnameList :: Match_ -> [Var_]
matchVarsToVarnameList (EmptyMatch _) = []
matchVarsToVarnameList (SingleMatch var _) = [var]
matchVarsToVarnameList (MultipleMatch var next) = var : matchVarsToVarnameList next
