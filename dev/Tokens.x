{ 
module Tokens where 
}

%wrapper "posn" 
$digit = 0-9     
-- digits 
$alphaS = [a-z]
$alphaC = [A-Z]
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
$white+       ; 
  "--".*        ; 
  $digit+       { tok (\p s -> TokenIntValue p (read s)) } 
  \=            { tok (\p s -> TokenEq p) }
  \+            { tok (\p s -> TokenPlus p) }
  \-            { tok (\p s -> TokenMinus p) }
  \*            { tok (\p s -> TokenTimes p) }
  \%            { tok (\p s -> TokenMod p) }
  \/            { tok (\p s -> TokenDiv p) }
  \(            { tok (\p s -> TokenLParen p) }
  \)            { tok (\p s -> TokenRParen p) }
  

  \:            { tok (\p s -> TokenColon p) }
  \[            { tok (\p s -> TokenLBracket p) }
  \]            { tok (\p s -> TokenRBracket p) }
  \{            { tok (\p s -> TokenLCurlyBracket p) }
  \}            { tok (\p s -> TokenRCurlyBracket p) }
  \,            { tok (\p s -> TokenComma p) }
  ">>"          { tok (\p s -> TokenPipe p) }
  Int           { tok (\p s -> TokenTypeInt p) }  
  EOF           { tok (\p s -> TokenEOF p) }
  Bool          { tok (\p s -> TokenTypeBool p) }
  \;            { tok (\p s -> TokenSemiColon p) }
  if            { tok (\p s -> TokenIf p) }
  else          { tok (\p s -> TokenElse p) }
  Main          { tok (\p s -> TokenMain p) }
  true          { tok (\p s -> TokenTrueValue p) }
  false         { tok (\p s -> TokenFalseValue p) }
  "=="          { tok (\p s -> TokenCompare p) }
  ">="          { tok (\p s -> TokenGreaterOrEqual p) }
  "<="          { tok (\p s -> TokenSmallerOrEqual p) }
  "&&"          { tok (\p s -> TokenAnd p) }
  "||"          { tok (\p s -> TokenOr p) }
  \!            { tok (\p s -> TokenNot p) }
  \<            { tok (\p s -> TokenSmallerThan p) }
  \>            { tok (\p s -> TokenGreaterThan p) }
  stdin         { tok (\p s -> TokenStdin p) }
  stdout        { tok (\p s -> TokenStdout p) }

  $alphaS [$alpha $digit \_ \’]*   { tok (\p s -> TokenVar p s) }
  $alphaC [$alpha $digit \_ \’]*   { tok (\p s -> TokenFuncName p s) }
{ 
-- Each action has type :: AlexPosn -> String -> Token 

-- Helper function
tok f p s = f p s

-- The token type: 
data Token = 
  TokenVar AlexPosn String | 
  TokenEq  AlexPosn        |
  TokenPlus AlexPosn       |
  TokenMinus AlexPosn      |
  TokenTimes AlexPosn      |
  TokenMod AlexPosn        |
  TokenDiv AlexPosn        |
  TokenLParen AlexPosn     |
  TokenRParen AlexPosn     |
  TokenIntValue AlexPosn Int    |

  TokenFuncName AlexPosn String |
  TokenColon  AlexPosn          |
  TokenLBracket  AlexPosn       |
  TokenRBracket AlexPosn        |
  TokenLCurlyBracket AlexPosn   |
  TokenRCurlyBracket AlexPosn   |
  TokenComma AlexPosn           |
  TokenPipe AlexPosn            |
  TokenTypeInt AlexPosn         |
  TokenTypeBool AlexPosn        |
  TokenEOF AlexPosn             |
  TokenIf AlexPosn              |
  TokenElse  AlexPosn           |
  TokenMain AlexPosn            |
  TokenSemiColon AlexPosn       |
  TokenTrueValue AlexPosn       |
  TokenCompare AlexPosn         |
  TokenSmallerOrEqual AlexPosn  |
  TokenGreaterOrEqual AlexPosn  |
  TokenAnd AlexPosn             |
  TokenOr AlexPosn              |
  TokenNot AlexPosn             |
  TokenFalseValue AlexPosn      |
  TokenSmallerThan AlexPosn     |
  TokenGreaterThan AlexPosn     |
  TokenStdout AlexPosn          |
  TokenStdin AlexPosn     
  deriving (Eq,Show) 

tokenPosn :: Token -> String
tokenPosn (TokenIntValue  (AlexPn a l c) n) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenVar  (AlexPn a l c) x) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFuncName  (AlexPn a l c) x) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEq  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPlus (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMinus (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTimes (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMod (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDiv (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

tokenPosn (TokenColon  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLBracket  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRBracket  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLCurlyBracket  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRCurlyBracket (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenComma (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPipe (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeInt (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeBool (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEOF (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIf  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenElse  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMain (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSemiColon (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTrueValue (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFalseValue (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenCompare (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSmallerOrEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreaterOrEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAnd (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenOr (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenNot (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSmallerThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreaterThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenStdin (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenStdout (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
}