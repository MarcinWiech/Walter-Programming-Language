{ 
module Grammar where 
import Tokens 
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }
%token 
    
    intValue { TokenIntValue _ $$ } 
    var { TokenVar _ $$ }
    funcName { TokenFuncName _ $$ }
     
    '=' { TokenEq _ } 
    '+' { TokenPlus _ } 
    '-' { TokenMinus _ } 
    '*' { TokenTimes _ } 
    '/' { TokenDiv _ } 
    '(' { TokenLParen _ } 
    ')' { TokenRParen _ }

    ':' { TokenColon _ }
    '[' { TokenLBracket _ }
    ']' { TokenRBracket _ }
    '{' { TokenLCurlyBracket _ }
    '}' { TokenRCurlyBracket _ }
    ',' { TokenComma _ }
    '>>' { TokenPipe _ }
    intType    { TokenTypeInt _ }
    eof        { TokenEOF _ }
    boolType   { TokenTypeBool _ }
    ';'        { TokenSemiColon _ }
    if         { TokenIf _ }
    else       { TokenElse _ }
    main       { TokenMain _ }
    trueValue  { TokenTrueValue _ }
    falseValue { TokenFalseValue _ }
    '=='       { TokenCompare _ }
    '!'         { TokenNot _ }


%right in 
%left '+' '-' 
%left '*' '/'
%% 
Exp : Exp '+' Exp            { Plus $1 $3 } 
    | Exp '-' Exp            { Minus $1 $3 } 
    | Exp '*' Exp            { Times $1 $3 } 
    | Exp '/' Exp            { Div $1 $3 }
    | '(' Exp ')'            { $2 }
    | intValue               {}

Type :  boolType { TBool }
     |  intType  { TInt }


    
{ 
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))
data Type = TInt
         | TBool
data BasicValue = Int | Bool
data Var = Var String Type
--data VarInit = VarInit Var BasicValue | VarInit Var String -- see if var1 : Bool = 3

data Exp = Let String Exp Exp 
         | Plus Exp Exp 
         | Minus Exp Exp 
         | Times Exp Exp 
         | Div Exp Exp 
         deriving Show 
} 