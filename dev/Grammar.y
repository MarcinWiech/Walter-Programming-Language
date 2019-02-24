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

%left '+' '-' 
%left '*' '/'
%% 
Exp : Maths                  { MathsExp $1 }
    | '(' Exp ')'            { $2 }
    | Match                  { LOL $1 }

Maths : Maths '+' Maths      { MathsPlus $1 $3 }
      | Maths '-' Maths      { MathsMinus $1 $3 }
      | Maths '*' Maths      { MathsTimes $1 $3 }
      | Maths '/' Maths      { MathsDevide $1 $3 }
      | '(' Maths ')'        { $2 }
      | intValue             { MathsInt $1 }
      | var                  { MathsVar $1 }

T :  boolType { TBool }
  |  intType  { TInt }

B : trueValue { True }
  | falseValue { False }

Var : var ':' T { Var_ $1 $3 }

VarInit : Var '=' intValue { VarIntInit_ $1 $3}
        | Var '=' B { VarBoolInit_ $1 $3}
        | Var '=' var { VarStrInit_ $1 $3}

Match : '['']'         { EmptyMatch }
      | '[' eof ']'    { EOFMatch }
      | '[' Var ']'    { SingleMatch $2 }
      | '[' Var ',' MatchRec   { MultipleMatch $2 $4 }

MatchRec : Var ']'    { SingleMatch $1 }
         | Var ',' MatchRec     {MultipleMatch $1 $3 }
{ 
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data T_ = TInt | TBool | TFunc T_ T_ deriving Show

data Var_ = Var_ String T_ deriving Show

data VarInit_ = VarIntInit_ Var_ Int 
              | VarStrInit_ Var_ String 
              | VarBoolInit_ Var_ Bool 
              deriving Show

data Match_ = EmptyMatch
            | EOFMatch
            | MultipleMatch Var_ Match_ 
            | SingleMatch Var_
            deriving Show

data Exp_ = MathsExp Maths_
          | LOL Match_
           deriving Show

data Maths_ = MathsPlus Maths_ Maths_
            | MathsMinus Maths_ Maths_
            | MathsTimes Maths_ Maths_
            | MathsDevide Maths_ Maths_
            | MathsInt Int
            | MathsVar String
            deriving Show
} 