{ 
module Grammar where 
import Tokens 
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }
%token 
    
    intValue   { TokenIntValue _ $$ } 
    var        { TokenVar _ $$ }
    funcName   { TokenFuncName _ $$ }
     
    '='        { TokenEq _ } 
    '+'        { TokenPlus _ } 
    '-'        { TokenMinus _ } 
    '*'        { TokenTimes _ } 
    '/'        { TokenDiv _ } 
    '('        { TokenLParen _ } 
    ')'        { TokenRParen _ }

    ':'        { TokenColon _ }
    '['        { TokenLBracket _ }
    ']'        { TokenRBracket _ }
    '{'        { TokenLCurlyBracket _ }
    '}'        { TokenRCurlyBracket _ }
    ','        { TokenComma _ }
    '>>'       { TokenPipe _ }
    intType    { TokenTypeInt _ }
    eof        { TokenEOF _ } -- in reality EOF
    boolType   { TokenTypeBool _ }
    ';'        { TokenSemiColon _ }
    if         { TokenIf _ }
    else       { TokenElse _ }
    main       { TokenMain _ }
    trueValue  { TokenTrueValue _ }
    falseValue { TokenFalseValue _ }
    '=='       { TokenCompare _ }
    '!'        { TokenNot _ }
    '<'        { TokenSmallerThan _ }
    '>'        { TokenGreaterThan _ }

%right ';'
%left '+' '-' '*' '/' '<' '>' '==' '!' '>>'
%nonassoc if else eof intType boolType main trueValue falseValue ':' '(' ')' '[' ']' ',' '{' '}'

%% 
FuncDeclaration : funcName ':' FuncBodyInitArea Exp     { FuncDeclaration_ $1 $3 $4 }
-- FuncDeclaration MUST START WITH A MATCH AFTER EVERY EXPRESSIO :((((((
Exp : Cond                   { CondExp $1 }
    | Equals                 { EqualsExp $1 }
    | OutPattern             { OutPatternExp $1 }
    | '(' Exp ')'            { $2 }
    | Exp ';' Exp            { SequenceExp $1 $3 } -- this will only appear on the left of a match statement -> refactor then

Maths : Maths '+' Maths      { MathsPlus $1 $3 }
      | Maths '-' Maths      { MathsMinus $1 $3 }
      | Maths '*' Maths      { MathsTimes $1 $3 }
      | Maths '/' Maths      { MathsDevide $1 $3 }
      | '(' Maths ')'        { $2 }
      | intValue             { MathsInt $1 }
      | var                  { MathsVar $1 }

Equals : Match '=' OutPattern { EqualsInOut $1 $3 }
       | Match '=' Maths      { EqualsInMaths $1 $3 }
       | var '=' Maths        { EqualsVarMaths $1 $3 }
       | var '=' B            { EqualsVarBool $1 $3 }
       | var '=' var          { EqualsVarVar $1 $3 }

T :  boolType { TBool }
  |  intType  { TInt }

B : trueValue { True }
  | falseValue { False }

Var : var ':' T { Var_ $1 $3 }

VarInit : Var '=' intValue { VarIntInit_ $1 $3}
        | Var '=' B        { VarBoolInit_ $1 $3}
        | Var '=' var      { VarStrInit_ $1 $3}

Match : '['']'                 { EmptyMatch }
      | '[' eof ']'            { EOFMatch }
      | '[' Var ']'            { SingleMatch $2 }
      | '[' Var ',' MatchRec   { MultipleMatch $2 $4 }

MatchRec : Var ']'           { SingleMatch $1 }
         | Var ',' MatchRec  { MultipleMatch $1 $3 }

OutPattern : '['']'                         { EmptyOutPatter }
           | '[' Maths ']'                  { SingleOutPattern $2 }
           | '[' Maths ',' OutPatternRec    { MultipleOutPattern $2 $4 }

OutPatternRec : Maths ']'                   { SingleOutPattern $1 }
              | Maths ',' OutPatternRec     { MultipleOutPattern $1 $3 }

Comparables : var         { ComparablesVar $1 }
            | Maths       { ComparablesMaths $1 }
            | intValue    { ComparablesInt $1 }
            | B           { ComparablesBool $1 }

ComparableExp : ComparableExp '==' ComparableExp { EqualsToLR $1 $3 }
              | ComparableExp '==' Comparables   { EqualsToL $1 $3 }
              | Comparables '==' ComparableExp   { EqualsToR $1 $3 }
              | Comparables '==' Comparables     { EqualsTo $1 $3 }

              | ComparableExp '<' ComparableExp  { SmallerThanLR $1 $3 }
              | ComparableExp '<' Comparables    { SmallerThanL $1 $3 }
              | Comparables '<' ComparableExp    { SmallerThanR $1 $3 }
              | Comparables '<' Comparables      { SmallerThan $1 $3 }

              | ComparableExp '>' ComparableExp  { GreaterThanLR $1 $3 }
              | ComparableExp '>' Comparables    { GreaterThanL $1 $3 }
              | Comparables '>' ComparableExp    { GreaterThanR $1 $3 }
              | Comparables '>' Comparables      { GreaterThan $1 $3 }

              | '!' ComparableExp                { Not $2 }

              | '(' ComparableExp ')'            { $2 }
              | var                              { ComparableExpVar $1 }
              | B                                { ComparableExpBool $1 }

Cond : if '(' ComparableExp ')' ':' Exp else ':' Exp { Cond_ $3 $6 $9 }

FuncBodyInitArea : '{''}'                               { EmptyInitArea }
                 | '{' VarInit '}'                      { SingleInitArea $2 }
                 | '{' VarInit ',' FuncBodyInitAreaRec  { MultipleInitArea $2 $4 }

FuncBodyInitAreaRec : VarInit '}'                       { SingleInitArea $1 }
                    | VarInit ',' FuncBodyInitAreaRec   { MultipleInitArea $1 $3 }

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

data Exp_ = CondExp Cond_
          | EqualsExp Equals_
          | OutPatternExp OutPattern_
          | SequenceExp Exp_ Exp_
          deriving Show

data Maths_ = MathsPlus Maths_ Maths_
            | MathsMinus Maths_ Maths_
            | MathsTimes Maths_ Maths_
            | MathsDevide Maths_ Maths_
            | MathsInt Int
            | MathsVar String
            deriving Show

data OutPattern_ = EmptyOutPatter
                 | MultipleOutPattern Maths_ OutPattern_ 
                 | SingleOutPattern Maths_
                 deriving Show

data Equals_ = EqualsInOut Match_ OutPattern_
             | EqualsInMaths Match_ Maths_
             | EqualsVarMaths String Maths_
             | EqualsVarBool String Bool
             | EqualsVarVar String String -- add comparable for bool assignments
             deriving Show

data Comparables_ = ComparablesVar String
                  | ComparablesMaths Maths_
                  | ComparablesInt Int
                  | ComparablesBool Bool --Functions to be added!
                  deriving Show

data ComparableExp_ = EqualsTo Comparables_ Comparables_
                    | EqualsToR Comparables_ ComparableExp_
                    | EqualsToL ComparableExp_ Comparables_
                    | EqualsToLR ComparableExp_ ComparableExp_

                    | SmallerThan Comparables_ Comparables_
                    | SmallerThanR Comparables_ ComparableExp_
                    | SmallerThanL ComparableExp_ Comparables_
                    | SmallerThanLR ComparableExp_ ComparableExp_

                    | GreaterThan Comparables_ Comparables_
                    | GreaterThanR Comparables_ ComparableExp_
                    | GreaterThanL ComparableExp_ Comparables_
                    | GreaterThanLR ComparableExp_ ComparableExp_

                    | Not ComparableExp_

                    | ComparableExpVar String
                    | ComparableExpBool Bool
                    deriving Show

data Cond_ = Cond_ ComparableExp_ Exp_ Exp_ deriving Show

data FuncBodyInitArea_ = EmptyInitArea
                       | SingleInitArea VarInit_
                       | MultipleInitArea VarInit_ FuncBodyInitArea_
                       deriving Show

data FuncDeclaration_ = FuncDeclaration_ String FuncBodyInitArea_ Exp_ deriving Show

}