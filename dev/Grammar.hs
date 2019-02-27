{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21
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
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,215) ([0,128,0,0,2048,0,0,0,0,0,0,2048,0,0,128,0,0,0,0,0,0,1024,0,0,4612,64,0,64,8,0,4096,0,0,0,2048,2,0,2048,0,0,0,0,0,0,8192,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,1,0,0,4612,64,0,8288,130,0,0,2,0,24576,32,352,0,8672,1,0,0,18,0,0,0,0,0,128,0,0,518,0,0,0,0,0,0,32,0,0,64,2,0,518,1536,0,8288,1,0,1024,16402,0,0,16384,1,0,0,0,0,64,0,0,1536,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,57344,1,0,0,0,0,0,0,0,0,256,0,0,57344,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,94,0,0,0,0,0,64,0,0,1536,2,0,24576,32,0,0,518,0,0,8288,0,0,0,0,0,24576,32,0,0,480,0,0,0,0,0,0,0,0,0,64,1664,0,518,5632,0,8288,24576,1,0,0,0,0,30,0,0,1024,26624,0,32768,0,0,1536,2,22,24576,32,352,0,518,5632,0,7680,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4608,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,518,0,0,0,0,0,0,0,0,0,0,0,0,4612,64,0,0,0,0,0,40960,0,0,0,0,0,0,0,0,32768,0,0,1024,16402,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","prods","FuncDeclaration","Exp","Maths","Equals","T","B","Var","VarInit","Match","MatchRec","OutPattern","OutPatternRec","Comparables","ComparableExp","Cond","FuncBodyInitArea","FuncBodyInitAreaRec","intValue","var","funcName","'='","'+'","'-'","'*'","'/'","'('","')'","':'","'['","']'","'{'","'}'","','","'>>'","intType","eof","boolType","';'","if","else","main","trueValue","falseValue","'=='","'!'","'<'","'>'","%eof"]
        bit_start = st * 52
        bit_end = (st + 1) * 52
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..51]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (24) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (24) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (32) = happyShift action_6
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (24) = happyShift action_3
action_4 (52) = happyAccept
action_4 (5) = happyGoto action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_2

action_6 (35) = happyShift action_8
action_6 (20) = happyGoto action_7
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (23) = happyShift action_18
action_7 (30) = happyShift action_19
action_7 (33) = happyShift action_20
action_7 (43) = happyShift action_21
action_7 (6) = happyGoto action_13
action_7 (8) = happyGoto action_14
action_7 (13) = happyGoto action_15
action_7 (15) = happyGoto action_16
action_7 (19) = happyGoto action_17
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (23) = happyShift action_11
action_8 (36) = happyShift action_12
action_8 (11) = happyGoto action_9
action_8 (12) = happyGoto action_10
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (25) = happyShift action_37
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (36) = happyShift action_35
action_10 (42) = happyShift action_36
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (32) = happyShift action_34
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_49

action_13 (42) = happyShift action_33
action_13 _ = happyReduce_3

action_14 _ = happyReduce_5

action_15 (25) = happyShift action_32
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_6

action_17 _ = happyReduce_4

action_18 (25) = happyShift action_31
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (23) = happyShift action_18
action_19 (30) = happyShift action_19
action_19 (33) = happyShift action_20
action_19 (43) = happyShift action_21
action_19 (6) = happyGoto action_30
action_19 (8) = happyGoto action_14
action_19 (13) = happyGoto action_15
action_19 (15) = happyGoto action_16
action_19 (19) = happyGoto action_17
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (22) = happyShift action_25
action_20 (23) = happyShift action_26
action_20 (30) = happyShift action_27
action_20 (34) = happyShift action_28
action_20 (40) = happyShift action_29
action_20 (7) = happyGoto action_23
action_20 (11) = happyGoto action_24
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (30) = happyShift action_22
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (22) = happyShift action_25
action_22 (23) = happyShift action_55
action_22 (30) = happyShift action_71
action_22 (46) = happyShift action_41
action_22 (47) = happyShift action_42
action_22 (49) = happyShift action_72
action_22 (7) = happyGoto action_67
action_22 (10) = happyGoto action_68
action_22 (17) = happyGoto action_69
action_22 (18) = happyGoto action_70
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (26) = happyShift action_61
action_23 (27) = happyShift action_62
action_23 (28) = happyShift action_63
action_23 (29) = happyShift action_64
action_23 (34) = happyShift action_65
action_23 (37) = happyShift action_66
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (34) = happyShift action_59
action_24 (37) = happyShift action_60
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_14

action_26 (32) = happyShift action_34
action_26 _ = happyReduce_15

action_27 (22) = happyShift action_25
action_27 (23) = happyShift action_55
action_27 (30) = happyShift action_27
action_27 (7) = happyGoto action_58
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (25) = happyReduce_29
action_28 _ = happyReduce_35

action_29 (34) = happyShift action_57
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (31) = happyShift action_56
action_30 (42) = happyShift action_33
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (22) = happyShift action_25
action_31 (23) = happyShift action_55
action_31 (30) = happyShift action_27
action_31 (46) = happyShift action_41
action_31 (47) = happyShift action_42
action_31 (7) = happyGoto action_53
action_31 (10) = happyGoto action_54
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (22) = happyShift action_25
action_32 (23) = happyShift action_52
action_32 (30) = happyShift action_27
action_32 (33) = happyShift action_20
action_32 (7) = happyGoto action_49
action_32 (8) = happyGoto action_50
action_32 (13) = happyGoto action_15
action_32 (15) = happyGoto action_51
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (23) = happyShift action_18
action_33 (30) = happyShift action_19
action_33 (33) = happyShift action_20
action_33 (43) = happyShift action_21
action_33 (6) = happyGoto action_48
action_33 (8) = happyGoto action_14
action_33 (13) = happyGoto action_15
action_33 (15) = happyGoto action_16
action_33 (19) = happyGoto action_17
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (39) = happyShift action_46
action_34 (41) = happyShift action_47
action_34 (9) = happyGoto action_45
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_50

action_36 (23) = happyShift action_11
action_36 (11) = happyGoto action_9
action_36 (12) = happyGoto action_43
action_36 (21) = happyGoto action_44
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (22) = happyShift action_39
action_37 (23) = happyShift action_40
action_37 (46) = happyShift action_41
action_37 (47) = happyShift action_42
action_37 (10) = happyGoto action_38
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_27

action_39 _ = happyReduce_26

action_40 _ = happyReduce_28

action_41 _ = happyReduce_23

action_42 _ = happyReduce_24

action_43 (36) = happyShift action_89
action_43 (42) = happyShift action_90
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_51

action_45 _ = happyReduce_25

action_46 _ = happyReduce_22

action_47 _ = happyReduce_21

action_48 (42) = happyShift action_33
action_48 _ = happyReduce_8

action_49 (26) = happyShift action_61
action_49 (27) = happyShift action_62
action_49 (28) = happyShift action_63
action_49 (29) = happyShift action_64
action_49 _ = happyReduce_17

action_50 _ = happyReduce_18

action_51 _ = happyReduce_16

action_52 (25) = happyShift action_31
action_52 _ = happyReduce_15

action_53 (26) = happyShift action_61
action_53 (27) = happyShift action_62
action_53 (28) = happyShift action_63
action_53 (29) = happyShift action_64
action_53 _ = happyReduce_19

action_54 _ = happyReduce_20

action_55 _ = happyReduce_15

action_56 _ = happyReduce_7

action_57 _ = happyReduce_30

action_58 (26) = happyShift action_61
action_58 (27) = happyShift action_62
action_58 (28) = happyShift action_63
action_58 (29) = happyShift action_64
action_58 (31) = happyShift action_88
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_31

action_60 (23) = happyShift action_11
action_60 (11) = happyGoto action_86
action_60 (14) = happyGoto action_87
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (22) = happyShift action_25
action_61 (23) = happyShift action_55
action_61 (30) = happyShift action_27
action_61 (7) = happyGoto action_85
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (22) = happyShift action_25
action_62 (23) = happyShift action_55
action_62 (30) = happyShift action_27
action_62 (7) = happyGoto action_84
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (22) = happyShift action_25
action_63 (23) = happyShift action_55
action_63 (30) = happyShift action_27
action_63 (7) = happyGoto action_83
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (22) = happyShift action_25
action_64 (23) = happyShift action_55
action_64 (30) = happyShift action_27
action_64 (7) = happyGoto action_82
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_37

action_66 (22) = happyShift action_25
action_66 (23) = happyShift action_55
action_66 (30) = happyShift action_27
action_66 (7) = happyGoto action_80
action_66 (16) = happyGoto action_81
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (26) = happyShift action_61
action_67 (27) = happyShift action_62
action_67 (28) = happyShift action_63
action_67 (29) = happyShift action_64
action_67 _ = happyReduce_40

action_68 _ = happyReduce_41

action_69 _ = happyReduce_47

action_70 (31) = happyShift action_76
action_70 (48) = happyShift action_77
action_70 (50) = happyShift action_78
action_70 (51) = happyShift action_79
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (22) = happyShift action_25
action_71 (23) = happyShift action_55
action_71 (30) = happyShift action_71
action_71 (46) = happyShift action_41
action_71 (47) = happyShift action_42
action_71 (49) = happyShift action_72
action_71 (7) = happyGoto action_74
action_71 (10) = happyGoto action_68
action_71 (17) = happyGoto action_69
action_71 (18) = happyGoto action_75
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (22) = happyShift action_25
action_72 (23) = happyShift action_55
action_72 (30) = happyShift action_71
action_72 (46) = happyShift action_41
action_72 (47) = happyShift action_42
action_72 (49) = happyShift action_72
action_72 (7) = happyGoto action_67
action_72 (10) = happyGoto action_68
action_72 (17) = happyGoto action_69
action_72 (18) = happyGoto action_73
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_45

action_74 (26) = happyShift action_61
action_74 (27) = happyShift action_62
action_74 (28) = happyShift action_63
action_74 (29) = happyShift action_64
action_74 (31) = happyShift action_88
action_74 _ = happyReduce_40

action_75 (31) = happyShift action_100
action_75 (48) = happyShift action_77
action_75 (50) = happyShift action_78
action_75 (51) = happyShift action_79
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (32) = happyShift action_99
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (22) = happyShift action_25
action_77 (23) = happyShift action_55
action_77 (30) = happyShift action_71
action_77 (46) = happyShift action_41
action_77 (47) = happyShift action_42
action_77 (49) = happyShift action_72
action_77 (7) = happyGoto action_67
action_77 (10) = happyGoto action_68
action_77 (17) = happyGoto action_69
action_77 (18) = happyGoto action_98
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (22) = happyShift action_25
action_78 (23) = happyShift action_55
action_78 (30) = happyShift action_71
action_78 (46) = happyShift action_41
action_78 (47) = happyShift action_42
action_78 (49) = happyShift action_72
action_78 (7) = happyGoto action_67
action_78 (10) = happyGoto action_68
action_78 (17) = happyGoto action_69
action_78 (18) = happyGoto action_97
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (22) = happyShift action_25
action_79 (23) = happyShift action_55
action_79 (30) = happyShift action_71
action_79 (46) = happyShift action_41
action_79 (47) = happyShift action_42
action_79 (49) = happyShift action_72
action_79 (7) = happyGoto action_67
action_79 (10) = happyGoto action_68
action_79 (17) = happyGoto action_69
action_79 (18) = happyGoto action_96
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (26) = happyShift action_61
action_80 (27) = happyShift action_62
action_80 (28) = happyShift action_63
action_80 (29) = happyShift action_64
action_80 (34) = happyShift action_94
action_80 (37) = happyShift action_95
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_36

action_82 _ = happyReduce_12

action_83 _ = happyReduce_11

action_84 _ = happyReduce_10

action_85 _ = happyReduce_9

action_86 (34) = happyShift action_92
action_86 (37) = happyShift action_93
action_86 _ = happyFail (happyExpListPerState 86)

action_87 _ = happyReduce_32

action_88 _ = happyReduce_13

action_89 _ = happyReduce_52

action_90 (23) = happyShift action_11
action_90 (11) = happyGoto action_9
action_90 (12) = happyGoto action_43
action_90 (21) = happyGoto action_91
action_90 _ = happyFail (happyExpListPerState 90)

action_91 _ = happyReduce_53

action_92 _ = happyReduce_33

action_93 (23) = happyShift action_11
action_93 (11) = happyGoto action_86
action_93 (14) = happyGoto action_103
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_38

action_95 (22) = happyShift action_25
action_95 (23) = happyShift action_55
action_95 (30) = happyShift action_27
action_95 (7) = happyGoto action_80
action_95 (16) = happyGoto action_102
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_44

action_97 _ = happyReduce_43

action_98 _ = happyReduce_42

action_99 (23) = happyShift action_18
action_99 (30) = happyShift action_19
action_99 (33) = happyShift action_20
action_99 (43) = happyShift action_21
action_99 (6) = happyGoto action_101
action_99 (8) = happyGoto action_14
action_99 (13) = happyGoto action_15
action_99 (15) = happyGoto action_16
action_99 (19) = happyGoto action_17
action_99 _ = happyFail (happyExpListPerState 99)

action_100 _ = happyReduce_46

action_101 (42) = happyShift action_33
action_101 (44) = happyShift action_104
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_39

action_103 _ = happyReduce_34

action_104 (32) = happyShift action_105
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (23) = happyShift action_18
action_105 (30) = happyShift action_19
action_105 (33) = happyShift action_20
action_105 (43) = happyShift action_21
action_105 (6) = happyGoto action_106
action_105 (8) = happyGoto action_14
action_105 (13) = happyGoto action_15
action_105 (15) = happyGoto action_16
action_105 (19) = happyGoto action_17
action_105 _ = happyFail (happyExpListPerState 105)

action_106 _ = happyReduce_48

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 ([happy_var_1]
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_2 : happy_var_1
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	(HappyAbsSyn20  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenFuncName _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (FuncDeclaration_ happy_var_1 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_1  6 happyReduction_4
happyReduction_4 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn6
		 (CondExp happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (EqualsExp happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn6
		 (OutPatternExp happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (SequenceExp happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  7 happyReduction_9
happyReduction_9 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (MathsPlus happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  7 happyReduction_10
happyReduction_10 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (MathsMinus happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  7 happyReduction_11
happyReduction_11 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (MathsTimes happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  7 happyReduction_12
happyReduction_12 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (MathsDevide happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  7 happyReduction_13
happyReduction_13 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  7 happyReduction_14
happyReduction_14 (HappyTerminal (TokenIntValue _ happy_var_1))
	 =  HappyAbsSyn7
		 (MathsInt happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  7 happyReduction_15
happyReduction_15 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn7
		 (MathsVar happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  8 happyReduction_16
happyReduction_16 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn8
		 (EqualsInOut happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  8 happyReduction_17
happyReduction_17 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn8
		 (EqualsInMaths happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  8 happyReduction_18
happyReduction_18 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn8
		 (EqualsInEquals happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  8 happyReduction_19
happyReduction_19 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (EqualsVarMaths happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  8 happyReduction_20
happyReduction_20 (HappyAbsSyn10  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (EqualsVarBool happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  9 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn9
		 (TBool
	)

happyReduce_22 = happySpecReduce_1  9 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn9
		 (TInt
	)

happyReduce_23 = happySpecReduce_1  10 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn10
		 (True
	)

happyReduce_24 = happySpecReduce_1  10 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn10
		 (False
	)

happyReduce_25 = happySpecReduce_3  11 happyReduction_25
happyReduction_25 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn11
		 (Var_ happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  12 happyReduction_26
happyReduction_26 (HappyTerminal (TokenIntValue _ happy_var_3))
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 (VarIntInit_ happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  12 happyReduction_27
happyReduction_27 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 (VarBoolInit_ happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  12 happyReduction_28
happyReduction_28 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 (VarStrInit_ happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  13 happyReduction_29
happyReduction_29 _
	_
	 =  HappyAbsSyn13
		 (EmptyMatch
	)

happyReduce_30 = happySpecReduce_3  13 happyReduction_30
happyReduction_30 _
	_
	_
	 =  HappyAbsSyn13
		 (EOFMatch
	)

happyReduce_31 = happySpecReduce_3  13 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (SingleMatch happy_var_2
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happyReduce 4 13 happyReduction_32
happyReduction_32 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (MultipleMatch happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_33 = happySpecReduce_2  14 happyReduction_33
happyReduction_33 _
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn14
		 (SingleMatch happy_var_1
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  14 happyReduction_34
happyReduction_34 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn14
		 (MultipleMatch happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_2  15 happyReduction_35
happyReduction_35 _
	_
	 =  HappyAbsSyn15
		 (EmptyOutPatter
	)

happyReduce_36 = happyReduce 4 15 happyReduction_36
happyReduction_36 ((HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (MultipleOutPattern happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_3  15 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (SingleOutPattern happy_var_2
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  16 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn16
		 (SingleOutPattern happy_var_1
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  16 happyReduction_39
happyReduction_39 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn16
		 (MultipleOutPattern happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  17 happyReduction_40
happyReduction_40 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn17
		 (ComparablesMaths happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  17 happyReduction_41
happyReduction_41 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn17
		 (ComparablesBool happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  18 happyReduction_42
happyReduction_42 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (EqualsTo happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  18 happyReduction_43
happyReduction_43 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (SmallerThan happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  18 happyReduction_44
happyReduction_44 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (GreaterThan happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_2  18 happyReduction_45
happyReduction_45 (HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (Not happy_var_2
	)
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  18 happyReduction_46
happyReduction_46 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  18 happyReduction_47
happyReduction_47 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn18
		 (ComparableExpSingle happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happyReduce 9 19 happyReduction_48
happyReduction_48 ((HappyAbsSyn6  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (Cond_ happy_var_3 happy_var_6 happy_var_9
	) `HappyStk` happyRest

happyReduce_49 = happySpecReduce_2  20 happyReduction_49
happyReduction_49 _
	_
	 =  HappyAbsSyn20
		 (EmptyInitArea
	)

happyReduce_50 = happySpecReduce_3  20 happyReduction_50
happyReduction_50 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (SingleInitArea happy_var_2
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happyReduce 4 20 happyReduction_51
happyReduction_51 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (MultipleInitArea happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_52 = happySpecReduce_2  21 happyReduction_52
happyReduction_52 _
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn21
		 (SingleInitArea happy_var_1
	)
happyReduction_52 _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  21 happyReduction_53
happyReduction_53 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn21
		 (MultipleInitArea happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 52 52 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenIntValue _ happy_dollar_dollar -> cont 22;
	TokenVar _ happy_dollar_dollar -> cont 23;
	TokenFuncName _ happy_dollar_dollar -> cont 24;
	TokenEq _ -> cont 25;
	TokenPlus _ -> cont 26;
	TokenMinus _ -> cont 27;
	TokenTimes _ -> cont 28;
	TokenDiv _ -> cont 29;
	TokenLParen _ -> cont 30;
	TokenRParen _ -> cont 31;
	TokenColon _ -> cont 32;
	TokenLBracket _ -> cont 33;
	TokenRBracket _ -> cont 34;
	TokenLCurlyBracket _ -> cont 35;
	TokenRCurlyBracket _ -> cont 36;
	TokenComma _ -> cont 37;
	TokenPipe _ -> cont 38;
	TokenTypeInt _ -> cont 39;
	TokenEOF _ -> cont 40;
	TokenTypeBool _ -> cont 41;
	TokenSemiColon _ -> cont 42;
	TokenIf _ -> cont 43;
	TokenElse _ -> cont 44;
	TokenMain _ -> cont 45;
	TokenTrueValue _ -> cont 46;
	TokenFalseValue _ -> cont 47;
	TokenCompare _ -> cont 48;
	TokenNot _ -> cont 49;
	TokenSmallerThan _ -> cont 50;
	TokenGreaterThan _ -> cont 51;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 52 tk tks = happyError' (tks, explist)
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
             | EqualsInEquals Match_ Equals_
             | EqualsVarMaths String Maths_
             | EqualsVarBool String Bool
             | EqualsVarVar String String -- add comparable for bool assignments
             deriving Show

data Comparables_ = ComparablesVar String
                  | ComparablesMaths Maths_
                  | ComparablesInt Int
                  | ComparablesBool Bool --Functions to be added!
                  deriving Show

data ComparableExp_ = EqualsTo ComparableExp_ ComparableExp_

                    | SmallerThan ComparableExp_ ComparableExp_

                    | GreaterThan ComparableExp_ ComparableExp_

                    | Not ComparableExp_

                    | ComparableExpSingle Comparables_
                    deriving Show

data Cond_ = Cond_ ComparableExp_ Exp_ Exp_ deriving Show

data FuncBodyInitArea_ = EmptyInitArea
                       | SingleInitArea VarInit_
                       | MultipleInitArea VarInit_ FuncBodyInitArea_
                       deriving Show

data FuncDeclaration_ = FuncDeclaration_ String FuncBodyInitArea_ Exp_ deriving Show
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

