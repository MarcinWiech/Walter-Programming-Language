{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,123) ([24576,288,0,33152,0,0,480,0,0,0,0,0,0,32768,129,0,0,8192,0,64,0,0,0,0,0,0,0,0,0,0,32,0,8288,1,32768,2177,2,57344,289,0,32768,4,0,0,0,0,8,0,1024,32,32768,7,0,0,320,32768,1,384,1536,18,0,6016,0,24576,32,0,33152,0,0,518,0,6144,8,0,0,0,0,0,0,32768,1,0,1536,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,2072,0,0,4638,0,0,0,0,8192,1,0,0,0,32768,0,0,0,0,1024,0,0,0,0,24576,32,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Exp","Maths","T","B","Var","VarInit","Match","MatchRec","OutPattern","OutPatternRec","intValue","var","funcName","'='","'+'","'-'","'*'","'/'","'('","')'","':'","'['","']'","'{'","'}'","','","'>>'","intType","eof","boolType","';'","if","else","main","trueValue","falseValue","'=='","'!'","%eof"]
        bit_start = st * 42
        bit_end = (st + 1) * 42
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..41]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (14) = happyShift action_3
action_0 (15) = happyShift action_11
action_0 (22) = happyShift action_12
action_0 (25) = happyShift action_13
action_0 (4) = happyGoto action_6
action_0 (5) = happyGoto action_2
action_0 (8) = happyGoto action_7
action_0 (9) = happyGoto action_8
action_0 (10) = happyGoto action_9
action_0 (12) = happyGoto action_10
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (14) = happyShift action_3
action_1 (15) = happyShift action_4
action_1 (22) = happyShift action_5
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (18) = happyShift action_24
action_2 (19) = happyShift action_25
action_2 (20) = happyShift action_26
action_2 (21) = happyShift action_27
action_2 _ = happyReduce_1

action_3 _ = happyReduce_12

action_4 _ = happyReduce_13

action_5 (14) = happyShift action_3
action_5 (15) = happyShift action_4
action_5 (22) = happyShift action_5
action_5 (5) = happyGoto action_23
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (34) = happyShift action_22
action_6 (42) = happyAccept
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (17) = happyShift action_21
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_3

action_9 _ = happyReduce_4

action_10 _ = happyReduce_5

action_11 (24) = happyShift action_20
action_11 _ = happyReduce_13

action_12 (14) = happyShift action_3
action_12 (15) = happyShift action_11
action_12 (22) = happyShift action_12
action_12 (25) = happyShift action_13
action_12 (4) = happyGoto action_18
action_12 (5) = happyGoto action_19
action_12 (8) = happyGoto action_7
action_12 (9) = happyGoto action_8
action_12 (10) = happyGoto action_9
action_12 (12) = happyGoto action_10
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (14) = happyShift action_3
action_13 (15) = happyShift action_11
action_13 (22) = happyShift action_5
action_13 (26) = happyShift action_16
action_13 (32) = happyShift action_17
action_13 (5) = happyGoto action_14
action_13 (8) = happyGoto action_15
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (18) = happyShift action_24
action_14 (19) = happyShift action_25
action_14 (20) = happyShift action_26
action_14 (21) = happyShift action_27
action_14 (26) = happyShift action_46
action_14 (29) = happyShift action_47
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (26) = happyShift action_44
action_15 (29) = happyShift action_45
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (23) = happyReduce_28
action_16 (34) = happyReduce_28
action_16 (42) = happyReduce_28
action_16 _ = happyReduce_28

action_17 (26) = happyShift action_43
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (23) = happyShift action_42
action_18 (34) = happyShift action_22
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (18) = happyShift action_24
action_19 (19) = happyShift action_25
action_19 (20) = happyShift action_26
action_19 (21) = happyShift action_27
action_19 (23) = happyShift action_32
action_19 _ = happyReduce_1

action_20 (31) = happyShift action_40
action_20 (33) = happyShift action_41
action_20 (6) = happyGoto action_39
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (14) = happyShift action_35
action_21 (15) = happyShift action_36
action_21 (38) = happyShift action_37
action_21 (39) = happyShift action_38
action_21 (7) = happyGoto action_34
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (14) = happyShift action_3
action_22 (15) = happyShift action_11
action_22 (22) = happyShift action_12
action_22 (25) = happyShift action_13
action_22 (4) = happyGoto action_33
action_22 (5) = happyGoto action_2
action_22 (8) = happyGoto action_7
action_22 (9) = happyGoto action_8
action_22 (10) = happyGoto action_9
action_22 (12) = happyGoto action_10
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (18) = happyShift action_24
action_23 (19) = happyShift action_25
action_23 (20) = happyShift action_26
action_23 (21) = happyShift action_27
action_23 (23) = happyShift action_32
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (14) = happyShift action_3
action_24 (15) = happyShift action_4
action_24 (22) = happyShift action_5
action_24 (5) = happyGoto action_31
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (14) = happyShift action_3
action_25 (15) = happyShift action_4
action_25 (22) = happyShift action_5
action_25 (5) = happyGoto action_30
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (14) = happyShift action_3
action_26 (15) = happyShift action_4
action_26 (22) = happyShift action_5
action_26 (5) = happyGoto action_29
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (14) = happyShift action_3
action_27 (15) = happyShift action_4
action_27 (22) = happyShift action_5
action_27 (5) = happyGoto action_28
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_10

action_29 _ = happyReduce_9

action_30 (20) = happyShift action_26
action_30 (21) = happyShift action_27
action_30 _ = happyReduce_8

action_31 (20) = happyShift action_26
action_31 (21) = happyShift action_27
action_31 _ = happyReduce_7

action_32 _ = happyReduce_11

action_33 (34) = happyShift action_22
action_33 _ = happyReduce_6

action_34 _ = happyReduce_20

action_35 _ = happyReduce_19

action_36 _ = happyReduce_21

action_37 _ = happyReduce_16

action_38 _ = happyReduce_17

action_39 _ = happyReduce_18

action_40 _ = happyReduce_15

action_41 _ = happyReduce_14

action_42 _ = happyReduce_2

action_43 _ = happyReduce_23

action_44 _ = happyReduce_24

action_45 (15) = happyShift action_52
action_45 (8) = happyGoto action_50
action_45 (11) = happyGoto action_51
action_45 _ = happyFail (happyExpListPerState 45)

action_46 _ = happyReduce_29

action_47 (14) = happyShift action_3
action_47 (15) = happyShift action_4
action_47 (22) = happyShift action_5
action_47 (5) = happyGoto action_48
action_47 (13) = happyGoto action_49
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (18) = happyShift action_24
action_48 (19) = happyShift action_25
action_48 (20) = happyShift action_26
action_48 (21) = happyShift action_27
action_48 (26) = happyShift action_55
action_48 (29) = happyShift action_56
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_30

action_50 (26) = happyShift action_53
action_50 (29) = happyShift action_54
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_25

action_52 (24) = happyShift action_20
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_26

action_54 (15) = happyShift action_52
action_54 (8) = happyGoto action_50
action_54 (11) = happyGoto action_58
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_31

action_56 (14) = happyShift action_3
action_56 (15) = happyShift action_4
action_56 (22) = happyShift action_5
action_56 (5) = happyGoto action_48
action_56 (13) = happyGoto action_57
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_32

action_58 _ = happyReduce_27

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (MathsExp happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_3  4 happyReduction_2
happyReduction_2 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn4
		 (VarInitExp happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  4 happyReduction_4
happyReduction_4 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn4
		 (LOL happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  4 happyReduction_5
happyReduction_5 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn4
		 (LOL1 happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (SequenceExpr happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  5 happyReduction_7
happyReduction_7 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MathsPlus happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  5 happyReduction_8
happyReduction_8 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MathsMinus happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MathsTimes happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  5 happyReduction_10
happyReduction_10 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MathsDevide happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  5 happyReduction_11
happyReduction_11 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  5 happyReduction_12
happyReduction_12 (HappyTerminal (TokenIntValue _ happy_var_1))
	 =  HappyAbsSyn5
		 (MathsInt happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  5 happyReduction_13
happyReduction_13 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn5
		 (MathsVar happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  6 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn6
		 (TBool
	)

happyReduce_15 = happySpecReduce_1  6 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn6
		 (TInt
	)

happyReduce_16 = happySpecReduce_1  7 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn7
		 (True
	)

happyReduce_17 = happySpecReduce_1  7 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn7
		 (False
	)

happyReduce_18 = happySpecReduce_3  8 happyReduction_18
happyReduction_18 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (Var_ happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  9 happyReduction_19
happyReduction_19 (HappyTerminal (TokenIntValue _ happy_var_3))
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn9
		 (VarIntInit_ happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  9 happyReduction_20
happyReduction_20 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn9
		 (VarBoolInit_ happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  9 happyReduction_21
happyReduction_21 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn9
		 (VarStrInit_ happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_2  10 happyReduction_22
happyReduction_22 _
	_
	 =  HappyAbsSyn10
		 (EmptyMatch
	)

happyReduce_23 = happySpecReduce_3  10 happyReduction_23
happyReduction_23 _
	_
	_
	 =  HappyAbsSyn10
		 (EOFMatch
	)

happyReduce_24 = happySpecReduce_3  10 happyReduction_24
happyReduction_24 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (SingleMatch happy_var_2
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 4 10 happyReduction_25
happyReduction_25 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (MultipleMatch happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_2  11 happyReduction_26
happyReduction_26 _
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn11
		 (SingleMatch happy_var_1
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  11 happyReduction_27
happyReduction_27 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn11
		 (MultipleMatch happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  12 happyReduction_28
happyReduction_28 _
	_
	 =  HappyAbsSyn12
		 (EmptyOutPatter
	)

happyReduce_29 = happySpecReduce_3  12 happyReduction_29
happyReduction_29 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (SingleOutPattern happy_var_2
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happyReduce 4 12 happyReduction_30
happyReduction_30 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (MultipleOutPattern happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_2  13 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn13
		 (SingleOutPattern happy_var_1
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  13 happyReduction_32
happyReduction_32 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn13
		 (MultipleOutPattern happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 42 42 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenIntValue _ happy_dollar_dollar -> cont 14;
	TokenVar _ happy_dollar_dollar -> cont 15;
	TokenFuncName _ happy_dollar_dollar -> cont 16;
	TokenEq _ -> cont 17;
	TokenPlus _ -> cont 18;
	TokenMinus _ -> cont 19;
	TokenTimes _ -> cont 20;
	TokenDiv _ -> cont 21;
	TokenLParen _ -> cont 22;
	TokenRParen _ -> cont 23;
	TokenColon _ -> cont 24;
	TokenLBracket _ -> cont 25;
	TokenRBracket _ -> cont 26;
	TokenLCurlyBracket _ -> cont 27;
	TokenRCurlyBracket _ -> cont 28;
	TokenComma _ -> cont 29;
	TokenPipe _ -> cont 30;
	TokenTypeInt _ -> cont 31;
	TokenEOF _ -> cont 32;
	TokenTypeBool _ -> cont 33;
	TokenSemiColon _ -> cont 34;
	TokenIf _ -> cont 35;
	TokenElse _ -> cont 36;
	TokenMain _ -> cont 37;
	TokenTrueValue _ -> cont 38;
	TokenFalseValue _ -> cont 39;
	TokenCompare _ -> cont 40;
	TokenNot _ -> cont 41;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 42 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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

data Exp_ = SequenceExpr Exp_ Exp_
          | MathsExp Maths_
          | LOL Match_ -- see comment
          | LOL1 OutPattern_
          | VarInitExp VarInit_ -- see comment
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
{-# LINE 1 "templates/GenericTemplate.hs" #-}

















































































































































































































-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 











data Happy_IntList = HappyCons Int Happy_IntList




















infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action




indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.

