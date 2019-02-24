{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14
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
	| HappyAbsSyn14 t14

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,144) ([49152,576,0,1024,16,0,0,0,0,4,0,8192,0,0,64,130,0,0,16,32768,7,0,512,0,0,0,0,0,0,0,1024,2,0,9228,0,0,64,2,61440,0,0,2072,6144,0,32768,2,1536,0,6,4144,0,32768,129,0,3072,4,0,8288,0,0,2307,0,0,1152,0,0,1,0,0,0,0,256,0,33152,4,0,960,0,0,0,0,0,0,0,2072,0,49152,1088,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,6,0,12288,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,57344,1,0,0,0,0,0,0,0,0,0,0,0,0,36864,0,0,0,0,15360,36,0,0,0,0,47,0,0,0,0,1036,0,0,0,0,512,0,0,0,0,0,9276,0,0,0,0,0,0,32768,129,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Exp","Maths","Equals","T","B","Var","VarInit","Match","MatchRec","OutPattern","OutPatternRec","intValue","var","funcName","'='","'+'","'-'","'*'","'/'","'('","')'","':'","'['","']'","'{'","'}'","','","'>>'","intType","eof","boolType","';'","if","else","main","trueValue","falseValue","'=='","'!'","%eof"]
        bit_start = st * 43
        bit_end = (st + 1) * 43
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..42]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (15) = happyShift action_10
action_0 (16) = happyShift action_11
action_0 (23) = happyShift action_12
action_0 (26) = happyShift action_5
action_0 (4) = happyGoto action_6
action_0 (5) = happyGoto action_7
action_0 (6) = happyGoto action_2
action_0 (9) = happyGoto action_8
action_0 (10) = happyGoto action_9
action_0 (11) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (16) = happyShift action_4
action_1 (26) = happyShift action_5
action_1 (6) = happyGoto action_2
action_1 (11) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (18) = happyShift action_27
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (18) = happyShift action_15
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (16) = happyShift action_24
action_5 (27) = happyShift action_25
action_5 (33) = happyShift action_26
action_5 (9) = happyGoto action_23
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (35) = happyShift action_22
action_6 (43) = happyAccept
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (19) = happyShift action_18
action_7 (20) = happyShift action_19
action_7 (21) = happyShift action_20
action_7 (22) = happyShift action_21
action_7 _ = happyReduce_2

action_8 (18) = happyShift action_17
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_4

action_10 _ = happyReduce_11

action_11 (18) = happyShift action_15
action_11 (25) = happyShift action_16
action_11 _ = happyReduce_12

action_12 (15) = happyShift action_10
action_12 (16) = happyShift action_11
action_12 (23) = happyShift action_12
action_12 (26) = happyShift action_5
action_12 (4) = happyGoto action_13
action_12 (5) = happyGoto action_14
action_12 (6) = happyGoto action_2
action_12 (9) = happyGoto action_8
action_12 (10) = happyGoto action_9
action_12 (11) = happyGoto action_3
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (24) = happyShift action_53
action_13 (35) = happyShift action_22
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (19) = happyShift action_18
action_14 (20) = happyShift action_19
action_14 (21) = happyShift action_20
action_14 (22) = happyShift action_21
action_14 (24) = happyShift action_52
action_14 _ = happyReduce_2

action_15 (15) = happyShift action_10
action_15 (16) = happyShift action_51
action_15 (23) = happyShift action_31
action_15 (39) = happyShift action_44
action_15 (40) = happyShift action_45
action_15 (5) = happyGoto action_49
action_15 (8) = happyGoto action_50
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (32) = happyShift action_47
action_16 (34) = happyShift action_48
action_16 (7) = happyGoto action_46
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (15) = happyShift action_42
action_17 (16) = happyShift action_43
action_17 (39) = happyShift action_44
action_17 (40) = happyShift action_45
action_17 (8) = happyGoto action_41
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (15) = happyShift action_10
action_18 (16) = happyShift action_30
action_18 (23) = happyShift action_31
action_18 (5) = happyGoto action_40
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (15) = happyShift action_10
action_19 (16) = happyShift action_30
action_19 (23) = happyShift action_31
action_19 (5) = happyGoto action_39
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (15) = happyShift action_10
action_20 (16) = happyShift action_30
action_20 (23) = happyShift action_31
action_20 (5) = happyGoto action_38
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (15) = happyShift action_10
action_21 (16) = happyShift action_30
action_21 (23) = happyShift action_31
action_21 (5) = happyGoto action_37
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (15) = happyShift action_10
action_22 (16) = happyShift action_11
action_22 (23) = happyShift action_12
action_22 (26) = happyShift action_5
action_22 (4) = happyGoto action_36
action_22 (5) = happyGoto action_7
action_22 (6) = happyGoto action_2
action_22 (9) = happyGoto action_8
action_22 (10) = happyGoto action_9
action_22 (11) = happyGoto action_3
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (27) = happyShift action_34
action_23 (30) = happyShift action_35
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (25) = happyShift action_16
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_26

action_26 (27) = happyShift action_33
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (15) = happyShift action_10
action_27 (16) = happyShift action_30
action_27 (23) = happyShift action_31
action_27 (26) = happyShift action_32
action_27 (5) = happyGoto action_28
action_27 (13) = happyGoto action_29
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (19) = happyShift action_18
action_28 (20) = happyShift action_19
action_28 (21) = happyShift action_20
action_28 (22) = happyShift action_21
action_28 _ = happyReduce_14

action_29 _ = happyReduce_13

action_30 _ = happyReduce_12

action_31 (15) = happyShift action_10
action_31 (16) = happyShift action_30
action_31 (23) = happyShift action_31
action_31 (5) = happyGoto action_58
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (15) = happyShift action_10
action_32 (16) = happyShift action_30
action_32 (23) = happyShift action_31
action_32 (27) = happyShift action_57
action_32 (5) = happyGoto action_56
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_27

action_34 _ = happyReduce_28

action_35 (16) = happyShift action_24
action_35 (9) = happyGoto action_54
action_35 (12) = happyGoto action_55
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (35) = happyShift action_22
action_36 _ = happyReduce_5

action_37 _ = happyReduce_9

action_38 _ = happyReduce_8

action_39 (21) = happyShift action_20
action_39 (22) = happyShift action_21
action_39 _ = happyReduce_7

action_40 (21) = happyShift action_20
action_40 (22) = happyShift action_21
action_40 _ = happyReduce_6

action_41 _ = happyReduce_24

action_42 _ = happyReduce_23

action_43 _ = happyReduce_25

action_44 _ = happyReduce_20

action_45 _ = happyReduce_21

action_46 _ = happyReduce_22

action_47 _ = happyReduce_19

action_48 _ = happyReduce_18

action_49 (19) = happyShift action_18
action_49 (20) = happyShift action_19
action_49 (21) = happyShift action_20
action_49 (22) = happyShift action_21
action_49 _ = happyReduce_15

action_50 _ = happyReduce_16

action_51 (24) = happyReduce_17
action_51 (35) = happyReduce_17
action_51 (43) = happyReduce_17
action_51 _ = happyReduce_12

action_52 _ = happyReduce_10

action_53 _ = happyReduce_3

action_54 (27) = happyShift action_61
action_54 (30) = happyShift action_62
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_29

action_56 (19) = happyShift action_18
action_56 (20) = happyShift action_19
action_56 (21) = happyShift action_20
action_56 (22) = happyShift action_21
action_56 (27) = happyShift action_59
action_56 (30) = happyShift action_60
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_32

action_58 (19) = happyShift action_18
action_58 (20) = happyShift action_19
action_58 (21) = happyShift action_20
action_58 (22) = happyShift action_21
action_58 (24) = happyShift action_52
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_33

action_60 (15) = happyShift action_10
action_60 (16) = happyShift action_30
action_60 (23) = happyShift action_31
action_60 (5) = happyGoto action_64
action_60 (14) = happyGoto action_65
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_30

action_62 (16) = happyShift action_24
action_62 (9) = happyGoto action_54
action_62 (12) = happyGoto action_63
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_31

action_64 (19) = happyShift action_18
action_64 (20) = happyShift action_19
action_64 (21) = happyShift action_20
action_64 (22) = happyShift action_21
action_64 (27) = happyShift action_66
action_64 (30) = happyShift action_67
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_34

action_66 _ = happyReduce_35

action_67 (15) = happyShift action_10
action_67 (16) = happyShift action_30
action_67 (23) = happyShift action_31
action_67 (5) = happyGoto action_64
action_67 (14) = happyGoto action_68
action_67 _ = happyFail (happyExpListPerState 67)

action_68 _ = happyReduce_36

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (EqualsExp happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (MathsExp happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  4 happyReduction_3
happyReduction_3 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  4 happyReduction_4
happyReduction_4 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn4
		 (VarInitExp happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (SequenceExpr happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  5 happyReduction_6
happyReduction_6 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MathsPlus happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  5 happyReduction_7
happyReduction_7 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MathsMinus happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  5 happyReduction_8
happyReduction_8 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MathsTimes happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MathsDevide happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  5 happyReduction_10
happyReduction_10 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  5 happyReduction_11
happyReduction_11 (HappyTerminal (TokenIntValue _ happy_var_1))
	 =  HappyAbsSyn5
		 (MathsInt happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  5 happyReduction_12
happyReduction_12 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn5
		 (MathsVar happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  6 happyReduction_13
happyReduction_13 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (EqualsInOut happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  6 happyReduction_14
happyReduction_14 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (EqualsInMaths happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  6 happyReduction_15
happyReduction_15 (HappyAbsSyn5  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (EqualsVarMaths happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 (HappyAbsSyn8  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (EqualsVarBool happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  6 happyReduction_17
happyReduction_17 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (EqualsVarVar happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  7 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn7
		 (TBool
	)

happyReduce_19 = happySpecReduce_1  7 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn7
		 (TInt
	)

happyReduce_20 = happySpecReduce_1  8 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn8
		 (True
	)

happyReduce_21 = happySpecReduce_1  8 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn8
		 (False
	)

happyReduce_22 = happySpecReduce_3  9 happyReduction_22
happyReduction_22 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn9
		 (Var_ happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  10 happyReduction_23
happyReduction_23 (HappyTerminal (TokenIntValue _ happy_var_3))
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (VarIntInit_ happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  10 happyReduction_24
happyReduction_24 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (VarBoolInit_ happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  10 happyReduction_25
happyReduction_25 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (VarStrInit_ happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  11 happyReduction_26
happyReduction_26 _
	_
	 =  HappyAbsSyn11
		 (EmptyMatch
	)

happyReduce_27 = happySpecReduce_3  11 happyReduction_27
happyReduction_27 _
	_
	_
	 =  HappyAbsSyn11
		 (EOFMatch
	)

happyReduce_28 = happySpecReduce_3  11 happyReduction_28
happyReduction_28 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (SingleMatch happy_var_2
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happyReduce 4 11 happyReduction_29
happyReduction_29 ((HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (MultipleMatch happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_2  12 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn12
		 (SingleMatch happy_var_1
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  12 happyReduction_31
happyReduction_31 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn12
		 (MultipleMatch happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_2  13 happyReduction_32
happyReduction_32 _
	_
	 =  HappyAbsSyn13
		 (EmptyOutPatter
	)

happyReduce_33 = happySpecReduce_3  13 happyReduction_33
happyReduction_33 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (SingleOutPattern happy_var_2
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happyReduce 4 13 happyReduction_34
happyReduction_34 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (MultipleOutPattern happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_2  14 happyReduction_35
happyReduction_35 _
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn14
		 (SingleOutPattern happy_var_1
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  14 happyReduction_36
happyReduction_36 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn14
		 (MultipleOutPattern happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 43 43 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenIntValue _ happy_dollar_dollar -> cont 15;
	TokenVar _ happy_dollar_dollar -> cont 16;
	TokenFuncName _ happy_dollar_dollar -> cont 17;
	TokenEq _ -> cont 18;
	TokenPlus _ -> cont 19;
	TokenMinus _ -> cont 20;
	TokenTimes _ -> cont 21;
	TokenDiv _ -> cont 22;
	TokenLParen _ -> cont 23;
	TokenRParen _ -> cont 24;
	TokenColon _ -> cont 25;
	TokenLBracket _ -> cont 26;
	TokenRBracket _ -> cont 27;
	TokenLCurlyBracket _ -> cont 28;
	TokenRCurlyBracket _ -> cont 29;
	TokenComma _ -> cont 30;
	TokenPipe _ -> cont 31;
	TokenTypeInt _ -> cont 32;
	TokenEOF _ -> cont 33;
	TokenTypeBool _ -> cont 34;
	TokenSemiColon _ -> cont 35;
	TokenIf _ -> cont 36;
	TokenElse _ -> cont 37;
	TokenMain _ -> cont 38;
	TokenTrueValue _ -> cont 39;
	TokenFalseValue _ -> cont 40;
	TokenCompare _ -> cont 41;
	TokenNot _ -> cont 42;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 43 tk tks = happyError' (tks, explist)
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
          | EqualsExp Equals_
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

data Equals_ = EqualsInOut Match_ OutPattern_
             | EqualsInMaths Match_ Maths_
             | EqualsVarMaths String Maths_
             | EqualsVarBool String Bool
             | EqualsVarVar String String
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

