{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17
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
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,186) ([0,4614,64,0,0,64,0,0,0,0,512,0,0,0,32,0,480,0,0,0,0,0,16,0,0,0,0,0,16,0,0,0,0,0,2064,0,0,4614,64,0,8196,8,0,8192,1,0,2048,0,0,0,0,0,8192,0,0,1024,32,0,480,0,0,518,1536,0,0,20,0,4614,0,0,6,1536,0,518,0,0,518,0,0,518,0,0,518,0,0,4614,64,0,518,1536,0,480,0,0,0,0,0,0,2048,0,1024,0,0,0,0,0,0,0,0,518,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,384,0,0,384,0,0,0,0,0,0,0,0,0,0,0,480,0,0,0,0,0,8710,0,0,0,0,0,0,0,0,0,0,0,480,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,8192,1,0,0,0,0,8672,1,0,0,0,0,1504,0,0,2048,0,0,518,1536,0,0,0,0,4614,64,0,0,0,0,518,0,0,0,0,0,4,0,0,0,0,0,8672,1,0,0,0,0,0,160,0,2048,0,0,0,0,0,518,0,0,0,0,0,4614,64,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Exp","Maths","Equals","T","B","Var","VarInit","Match","MatchRec","OutPattern","OutPatternRec","Comparables","ComparableExp","Cond","intValue","var","funcName","'='","'+'","'-'","'*'","'/'","'('","')'","':'","'['","']'","'{'","'}'","','","'>>'","intType","eof","boolType","';'","if","else","main","trueValue","falseValue","'=='","'!'","'<'","'>'","%eof"]
        bit_start = st * 48
        bit_end = (st + 1) * 48
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..47]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (18) = happyShift action_10
action_0 (19) = happyShift action_11
action_0 (26) = happyShift action_12
action_0 (29) = happyShift action_13
action_0 (39) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_5
action_0 (6) = happyGoto action_6
action_0 (9) = happyGoto action_7
action_0 (10) = happyGoto action_8
action_0 (11) = happyGoto action_9
action_0 (17) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (39) = happyShift action_3
action_1 (17) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (26) = happyShift action_29
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (38) = happyShift action_28
action_4 (48) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (22) = happyShift action_24
action_5 (23) = happyShift action_25
action_5 (24) = happyShift action_26
action_5 (25) = happyShift action_27
action_5 _ = happyReduce_3

action_6 _ = happyReduce_2

action_7 (21) = happyShift action_23
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_5

action_9 (21) = happyShift action_22
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_12

action_11 (21) = happyShift action_20
action_11 (28) = happyShift action_21
action_11 _ = happyReduce_13

action_12 (18) = happyShift action_10
action_12 (19) = happyShift action_11
action_12 (26) = happyShift action_12
action_12 (29) = happyShift action_13
action_12 (39) = happyShift action_3
action_12 (4) = happyGoto action_18
action_12 (5) = happyGoto action_19
action_12 (6) = happyGoto action_6
action_12 (9) = happyGoto action_7
action_12 (10) = happyGoto action_8
action_12 (11) = happyGoto action_9
action_12 (17) = happyGoto action_2
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (19) = happyShift action_15
action_13 (30) = happyShift action_16
action_13 (36) = happyShift action_17
action_13 (9) = happyGoto action_14
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (30) = happyShift action_60
action_14 (33) = happyShift action_61
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (28) = happyShift action_21
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_27

action_17 (30) = happyShift action_59
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (27) = happyShift action_58
action_18 (38) = happyShift action_28
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (22) = happyShift action_24
action_19 (23) = happyShift action_25
action_19 (24) = happyShift action_26
action_19 (25) = happyShift action_27
action_19 (27) = happyShift action_57
action_19 _ = happyReduce_3

action_20 (18) = happyShift action_10
action_20 (19) = happyShift action_56
action_20 (26) = happyShift action_36
action_20 (42) = happyShift action_37
action_20 (43) = happyShift action_38
action_20 (5) = happyGoto action_54
action_20 (8) = happyGoto action_55
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (35) = happyShift action_52
action_21 (37) = happyShift action_53
action_21 (7) = happyGoto action_51
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (18) = happyShift action_10
action_22 (19) = happyShift action_41
action_22 (26) = happyShift action_36
action_22 (29) = happyShift action_50
action_22 (5) = happyGoto action_48
action_22 (13) = happyGoto action_49
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (18) = happyShift action_46
action_23 (19) = happyShift action_47
action_23 (42) = happyShift action_37
action_23 (43) = happyShift action_38
action_23 (8) = happyGoto action_45
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (18) = happyShift action_10
action_24 (19) = happyShift action_41
action_24 (26) = happyShift action_36
action_24 (5) = happyGoto action_44
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (18) = happyShift action_10
action_25 (19) = happyShift action_41
action_25 (26) = happyShift action_36
action_25 (5) = happyGoto action_43
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (18) = happyShift action_10
action_26 (19) = happyShift action_41
action_26 (26) = happyShift action_36
action_26 (5) = happyGoto action_42
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (18) = happyShift action_10
action_27 (19) = happyShift action_41
action_27 (26) = happyShift action_36
action_27 (5) = happyGoto action_40
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (18) = happyShift action_10
action_28 (19) = happyShift action_11
action_28 (26) = happyShift action_12
action_28 (29) = happyShift action_13
action_28 (39) = happyShift action_3
action_28 (4) = happyGoto action_39
action_28 (5) = happyGoto action_5
action_28 (6) = happyGoto action_6
action_28 (9) = happyGoto action_7
action_28 (10) = happyGoto action_8
action_28 (11) = happyGoto action_9
action_28 (17) = happyGoto action_2
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (18) = happyShift action_34
action_29 (19) = happyShift action_35
action_29 (26) = happyShift action_36
action_29 (42) = happyShift action_37
action_29 (43) = happyShift action_38
action_29 (5) = happyGoto action_30
action_29 (8) = happyGoto action_31
action_29 (15) = happyGoto action_32
action_29 (16) = happyGoto action_33
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (22) = happyShift action_24
action_30 (23) = happyShift action_25
action_30 (24) = happyShift action_26
action_30 (25) = happyShift action_27
action_30 _ = happyReduce_39

action_31 _ = happyReduce_41

action_32 (44) = happyShift action_68
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (27) = happyShift action_67
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (27) = happyReduce_40
action_34 (44) = happyReduce_40
action_34 _ = happyReduce_12

action_35 (27) = happyReduce_38
action_35 (44) = happyReduce_38
action_35 _ = happyReduce_13

action_36 (18) = happyShift action_10
action_36 (19) = happyShift action_41
action_36 (26) = happyShift action_36
action_36 (5) = happyGoto action_66
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_21

action_38 _ = happyReduce_22

action_39 (38) = happyShift action_28
action_39 _ = happyReduce_6

action_40 _ = happyReduce_10

action_41 _ = happyReduce_13

action_42 _ = happyReduce_9

action_43 (24) = happyShift action_26
action_43 (25) = happyShift action_27
action_43 _ = happyReduce_8

action_44 (24) = happyShift action_26
action_44 (25) = happyShift action_27
action_44 _ = happyReduce_7

action_45 _ = happyReduce_25

action_46 _ = happyReduce_24

action_47 _ = happyReduce_26

action_48 (22) = happyShift action_24
action_48 (23) = happyShift action_25
action_48 (24) = happyShift action_26
action_48 (25) = happyShift action_27
action_48 _ = happyReduce_15

action_49 _ = happyReduce_14

action_50 (18) = happyShift action_10
action_50 (19) = happyShift action_41
action_50 (26) = happyShift action_36
action_50 (30) = happyShift action_65
action_50 (5) = happyGoto action_64
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_23

action_52 _ = happyReduce_20

action_53 _ = happyReduce_19

action_54 (22) = happyShift action_24
action_54 (23) = happyShift action_25
action_54 (24) = happyShift action_26
action_54 (25) = happyShift action_27
action_54 _ = happyReduce_16

action_55 _ = happyReduce_17

action_56 (27) = happyReduce_18
action_56 (38) = happyReduce_18
action_56 (40) = happyReduce_18
action_56 (48) = happyReduce_18
action_56 _ = happyReduce_13

action_57 _ = happyReduce_11

action_58 _ = happyReduce_4

action_59 _ = happyReduce_28

action_60 _ = happyReduce_29

action_61 (19) = happyShift action_15
action_61 (9) = happyGoto action_62
action_61 (12) = happyGoto action_63
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (30) = happyShift action_73
action_62 (33) = happyShift action_74
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_30

action_64 (22) = happyShift action_24
action_64 (23) = happyShift action_25
action_64 (24) = happyShift action_26
action_64 (25) = happyShift action_27
action_64 (30) = happyShift action_71
action_64 (33) = happyShift action_72
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_33

action_66 (22) = happyShift action_24
action_66 (23) = happyShift action_25
action_66 (24) = happyShift action_26
action_66 (25) = happyShift action_27
action_66 (27) = happyShift action_57
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (28) = happyShift action_70
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (18) = happyShift action_34
action_68 (19) = happyShift action_35
action_68 (26) = happyShift action_36
action_68 (42) = happyShift action_37
action_68 (43) = happyShift action_38
action_68 (5) = happyGoto action_30
action_68 (8) = happyGoto action_31
action_68 (15) = happyGoto action_69
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_42

action_70 (18) = happyShift action_10
action_70 (19) = happyShift action_11
action_70 (26) = happyShift action_12
action_70 (29) = happyShift action_13
action_70 (39) = happyShift action_3
action_70 (4) = happyGoto action_78
action_70 (5) = happyGoto action_5
action_70 (6) = happyGoto action_6
action_70 (9) = happyGoto action_7
action_70 (10) = happyGoto action_8
action_70 (11) = happyGoto action_9
action_70 (17) = happyGoto action_2
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_34

action_72 (18) = happyShift action_10
action_72 (19) = happyShift action_41
action_72 (26) = happyShift action_36
action_72 (5) = happyGoto action_76
action_72 (14) = happyGoto action_77
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_31

action_74 (19) = happyShift action_15
action_74 (9) = happyGoto action_62
action_74 (12) = happyGoto action_75
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_32

action_76 (22) = happyShift action_24
action_76 (23) = happyShift action_25
action_76 (24) = happyShift action_26
action_76 (25) = happyShift action_27
action_76 (30) = happyShift action_80
action_76 (33) = happyShift action_81
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_35

action_78 (38) = happyShift action_28
action_78 (40) = happyShift action_79
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (28) = happyShift action_83
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_36

action_81 (18) = happyShift action_10
action_81 (19) = happyShift action_41
action_81 (26) = happyShift action_36
action_81 (5) = happyGoto action_76
action_81 (14) = happyGoto action_82
action_81 _ = happyFail (happyExpListPerState 81)

action_82 _ = happyReduce_37

action_83 (18) = happyShift action_10
action_83 (19) = happyShift action_11
action_83 (26) = happyShift action_12
action_83 (29) = happyShift action_13
action_83 (39) = happyShift action_3
action_83 (4) = happyGoto action_84
action_83 (5) = happyGoto action_5
action_83 (6) = happyGoto action_6
action_83 (9) = happyGoto action_7
action_83 (10) = happyGoto action_8
action_83 (11) = happyGoto action_9
action_83 (17) = happyGoto action_2
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (38) = happyShift action_28
action_84 _ = happyReduce_43

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn4
		 (CondExp happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (EqualsExp happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (MathsExp happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  4 happyReduction_4
happyReduction_4 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  4 happyReduction_5
happyReduction_5 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn4
		 (VarInitExp happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (SequenceExp happy_var_1 happy_var_3
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

happyReduce_14 = happySpecReduce_3  6 happyReduction_14
happyReduction_14 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (EqualsInOut happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  6 happyReduction_15
happyReduction_15 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (EqualsInMaths happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 (HappyAbsSyn5  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (EqualsVarMaths happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  6 happyReduction_17
happyReduction_17 (HappyAbsSyn8  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (EqualsVarBool happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  6 happyReduction_18
happyReduction_18 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (EqualsVarVar happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  7 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn7
		 (TBool
	)

happyReduce_20 = happySpecReduce_1  7 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn7
		 (TInt
	)

happyReduce_21 = happySpecReduce_1  8 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn8
		 (True
	)

happyReduce_22 = happySpecReduce_1  8 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn8
		 (False
	)

happyReduce_23 = happySpecReduce_3  9 happyReduction_23
happyReduction_23 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn9
		 (Var_ happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  10 happyReduction_24
happyReduction_24 (HappyTerminal (TokenIntValue _ happy_var_3))
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (VarIntInit_ happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  10 happyReduction_25
happyReduction_25 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (VarBoolInit_ happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  10 happyReduction_26
happyReduction_26 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (VarStrInit_ happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  11 happyReduction_27
happyReduction_27 _
	_
	 =  HappyAbsSyn11
		 (EmptyMatch
	)

happyReduce_28 = happySpecReduce_3  11 happyReduction_28
happyReduction_28 _
	_
	_
	 =  HappyAbsSyn11
		 (EOFMatch
	)

happyReduce_29 = happySpecReduce_3  11 happyReduction_29
happyReduction_29 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (SingleMatch happy_var_2
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happyReduce 4 11 happyReduction_30
happyReduction_30 ((HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (MultipleMatch happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_2  12 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn12
		 (SingleMatch happy_var_1
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  12 happyReduction_32
happyReduction_32 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn12
		 (MultipleMatch happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_2  13 happyReduction_33
happyReduction_33 _
	_
	 =  HappyAbsSyn13
		 (EmptyOutPatter
	)

happyReduce_34 = happySpecReduce_3  13 happyReduction_34
happyReduction_34 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (SingleOutPattern happy_var_2
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happyReduce 4 13 happyReduction_35
happyReduction_35 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (MultipleOutPattern happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_36 = happySpecReduce_2  14 happyReduction_36
happyReduction_36 _
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn14
		 (SingleOutPattern happy_var_1
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  14 happyReduction_37
happyReduction_37 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn14
		 (MultipleOutPattern happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  15 happyReduction_38
happyReduction_38 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn15
		 (ComparablesVar happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  15 happyReduction_39
happyReduction_39 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn15
		 (ComparablesMaths happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  15 happyReduction_40
happyReduction_40 (HappyTerminal (TokenIntValue _ happy_var_1))
	 =  HappyAbsSyn15
		 (ComparablesInt happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  15 happyReduction_41
happyReduction_41 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn15
		 (ComparablesBool happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  16 happyReduction_42
happyReduction_42 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 (EqualsTo_ happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happyReduce 9 17 happyReduction_43
happyReduction_43 ((HappyAbsSyn4  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (Cond_ happy_var_3 happy_var_6 happy_var_9
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 48 48 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenIntValue _ happy_dollar_dollar -> cont 18;
	TokenVar _ happy_dollar_dollar -> cont 19;
	TokenFuncName _ happy_dollar_dollar -> cont 20;
	TokenEq _ -> cont 21;
	TokenPlus _ -> cont 22;
	TokenMinus _ -> cont 23;
	TokenTimes _ -> cont 24;
	TokenDiv _ -> cont 25;
	TokenLParen _ -> cont 26;
	TokenRParen _ -> cont 27;
	TokenColon _ -> cont 28;
	TokenLBracket _ -> cont 29;
	TokenRBracket _ -> cont 30;
	TokenLCurlyBracket _ -> cont 31;
	TokenRCurlyBracket _ -> cont 32;
	TokenComma _ -> cont 33;
	TokenPipe _ -> cont 34;
	TokenTypeInt _ -> cont 35;
	TokenEOF _ -> cont 36;
	TokenTypeBool _ -> cont 37;
	TokenSemiColon _ -> cont 38;
	TokenIf _ -> cont 39;
	TokenElse _ -> cont 40;
	TokenMain _ -> cont 41;
	TokenTrueValue _ -> cont 42;
	TokenFalseValue _ -> cont 43;
	TokenCompare _ -> cont 44;
	TokenNot _ -> cont 45;
	TokenSmallerThan _ -> cont 46;
	TokenGreaterThan _ -> cont 47;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 48 tk tks = happyError' (tks, explist)
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

data Exp_ = SequenceExp Exp_ Exp_
          | MathsExp Maths_
          | EqualsExp Equals_
          | VarInitExp VarInit_ -- see comment
          | CondExp Cond_
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

-- new conds...

data Comparables_ = ComparablesVar String
                  | ComparablesMaths Maths_
                  | ComparablesInt Int
                  | ComparablesBool Bool --Functions to be added!
                  deriving Show

data ComparableExp_ = EqualsTo_ Comparables_ Comparables_ 
                    deriving Show

data Cond_ = Cond_ ComparableExp_ Exp_ Exp_ deriving Show
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

