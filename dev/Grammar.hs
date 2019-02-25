{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20
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

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,247) ([0,64,0,0,512,0,0,0,16,0,0,0,0,0,8192,0,0,18448,256,0,128,16,0,4096,0,0,0,3072,0,0,512,0,0,0,0,0,0,512,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,128,0,0,33024,4100,0,3072,4164,0,0,32,0,0,259,2816,0,34688,4,0,0,36,0,0,0,0,0,64,0,32768,129,0,0,0,0,0,0,2,0,0,4098,0,6144,8,24,49152,576,0,0,4612,64,0,0,160,0,0,0,0,2048,0,0,24576,0,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,24576,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,480,0,0,0,0,0,0,0,0,3072,68,0,0,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,47,0,0,0,0,0,8,0,0,8288,0,0,768,1,0,6144,8,0,49152,64,0,0,0,0,0,4144,0,0,30720,0,0,0,0,0,0,0,1664,0,512,13312,0,0,0,0,0,0,0,1536,2,22,12288,16,176,0,0,0,0,3008,0,0,16384,32768,6,0,4,0,6144,8,88,49152,64,704,0,518,5632,0,4144,45056,0,33152,32768,5,3072,4,44,0,4638,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,18432,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,24576,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,36896,512,0,0,0,0,0,16384,1,0,0,0,0,0,0,0,8192,0,0,16512,2050,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","FuncDeclaration","Exp","Maths","Equals","T","B","Var","VarInit","Match","MatchRec","OutPattern","OutPatternRec","Comparables","ComparableExp","Cond","FuncBodyInitArea","FuncBodyInitAreaRec","intValue","var","funcName","'='","'+'","'-'","'*'","'/'","'('","')'","':'","'['","']'","'{'","'}'","','","'>>'","intType","eof","boolType","';'","if","else","main","trueValue","falseValue","'=='","'!'","'<'","'>'","%eof"]
        bit_start = st * 51
        bit_end = (st + 1) * 51
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..50]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (23) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (23) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (31) = happyShift action_4
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (51) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (34) = happyShift action_6
action_4 (19) = happyGoto action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (22) = happyShift action_16
action_5 (29) = happyShift action_17
action_5 (32) = happyShift action_18
action_5 (42) = happyShift action_19
action_5 (5) = happyGoto action_11
action_5 (7) = happyGoto action_12
action_5 (12) = happyGoto action_13
action_5 (14) = happyGoto action_14
action_5 (18) = happyGoto action_15
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (22) = happyShift action_9
action_6 (35) = happyShift action_10
action_6 (10) = happyGoto action_7
action_6 (11) = happyGoto action_8
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (24) = happyShift action_35
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (35) = happyShift action_33
action_8 (36) = happyShift action_34
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (31) = happyShift action_32
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_59

action_11 (41) = happyShift action_31
action_11 _ = happyReduce_1

action_12 _ = happyReduce_3

action_13 (24) = happyShift action_30
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_4

action_15 _ = happyReduce_2

action_16 (24) = happyShift action_29
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (22) = happyShift action_16
action_17 (29) = happyShift action_17
action_17 (32) = happyShift action_18
action_17 (42) = happyShift action_19
action_17 (5) = happyGoto action_28
action_17 (7) = happyGoto action_12
action_17 (12) = happyGoto action_13
action_17 (14) = happyGoto action_14
action_17 (18) = happyGoto action_15
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (21) = happyShift action_23
action_18 (22) = happyShift action_24
action_18 (29) = happyShift action_25
action_18 (33) = happyShift action_26
action_18 (39) = happyShift action_27
action_18 (6) = happyGoto action_21
action_18 (10) = happyGoto action_22
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (29) = happyShift action_20
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (21) = happyShift action_69
action_20 (22) = happyShift action_70
action_20 (29) = happyShift action_71
action_20 (45) = happyShift action_39
action_20 (46) = happyShift action_40
action_20 (48) = happyShift action_72
action_20 (6) = happyGoto action_65
action_20 (9) = happyGoto action_66
action_20 (16) = happyGoto action_67
action_20 (17) = happyGoto action_68
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (25) = happyShift action_59
action_21 (26) = happyShift action_60
action_21 (27) = happyShift action_61
action_21 (28) = happyShift action_62
action_21 (33) = happyShift action_63
action_21 (36) = happyShift action_64
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (33) = happyShift action_57
action_22 (36) = happyShift action_58
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_12

action_24 (31) = happyShift action_32
action_24 _ = happyReduce_13

action_25 (21) = happyShift action_23
action_25 (22) = happyShift action_49
action_25 (29) = happyShift action_25
action_25 (6) = happyGoto action_56
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (30) = happyReduce_33
action_26 (41) = happyReduce_33
action_26 (43) = happyReduce_33
action_26 (51) = happyReduce_33
action_26 _ = happyReduce_27

action_27 (33) = happyShift action_55
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (30) = happyShift action_54
action_28 (41) = happyShift action_31
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (21) = happyShift action_23
action_29 (22) = happyShift action_53
action_29 (29) = happyShift action_25
action_29 (45) = happyShift action_39
action_29 (46) = happyShift action_40
action_29 (6) = happyGoto action_51
action_29 (9) = happyGoto action_52
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (21) = happyShift action_23
action_30 (22) = happyShift action_49
action_30 (29) = happyShift action_25
action_30 (32) = happyShift action_50
action_30 (6) = happyGoto action_47
action_30 (14) = happyGoto action_48
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (22) = happyShift action_16
action_31 (29) = happyShift action_17
action_31 (32) = happyShift action_18
action_31 (42) = happyShift action_19
action_31 (5) = happyGoto action_46
action_31 (7) = happyGoto action_12
action_31 (12) = happyGoto action_13
action_31 (14) = happyGoto action_14
action_31 (18) = happyGoto action_15
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (38) = happyShift action_44
action_32 (40) = happyShift action_45
action_32 (8) = happyGoto action_43
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_60

action_34 (22) = happyShift action_9
action_34 (10) = happyGoto action_7
action_34 (11) = happyGoto action_41
action_34 (20) = happyGoto action_42
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (21) = happyShift action_37
action_35 (22) = happyShift action_38
action_35 (45) = happyShift action_39
action_35 (46) = happyShift action_40
action_35 (9) = happyGoto action_36
action_35 _ = happyFail (happyExpListPerState 35)

action_36 _ = happyReduce_25

action_37 _ = happyReduce_24

action_38 _ = happyReduce_26

action_39 _ = happyReduce_21

action_40 _ = happyReduce_22

action_41 (35) = happyShift action_93
action_41 (36) = happyShift action_94
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_61

action_43 _ = happyReduce_23

action_44 _ = happyReduce_20

action_45 _ = happyReduce_19

action_46 (41) = happyShift action_31
action_46 _ = happyReduce_6

action_47 (25) = happyShift action_59
action_47 (26) = happyShift action_60
action_47 (27) = happyShift action_61
action_47 (28) = happyShift action_62
action_47 _ = happyReduce_15

action_48 _ = happyReduce_14

action_49 _ = happyReduce_13

action_50 (21) = happyShift action_23
action_50 (22) = happyShift action_49
action_50 (29) = happyShift action_25
action_50 (33) = happyShift action_92
action_50 (6) = happyGoto action_21
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (25) = happyShift action_59
action_51 (26) = happyShift action_60
action_51 (27) = happyShift action_61
action_51 (28) = happyShift action_62
action_51 _ = happyReduce_16

action_52 _ = happyReduce_17

action_53 (30) = happyReduce_18
action_53 (41) = happyReduce_18
action_53 (43) = happyReduce_18
action_53 (51) = happyReduce_18
action_53 _ = happyReduce_13

action_54 _ = happyReduce_5

action_55 _ = happyReduce_28

action_56 (25) = happyShift action_59
action_56 (26) = happyShift action_60
action_56 (27) = happyShift action_61
action_56 (28) = happyShift action_62
action_56 (30) = happyShift action_91
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_29

action_58 (22) = happyShift action_9
action_58 (10) = happyGoto action_89
action_58 (13) = happyGoto action_90
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (21) = happyShift action_23
action_59 (22) = happyShift action_49
action_59 (29) = happyShift action_25
action_59 (6) = happyGoto action_88
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (21) = happyShift action_23
action_60 (22) = happyShift action_49
action_60 (29) = happyShift action_25
action_60 (6) = happyGoto action_87
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (21) = happyShift action_23
action_61 (22) = happyShift action_49
action_61 (29) = happyShift action_25
action_61 (6) = happyGoto action_86
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (21) = happyShift action_23
action_62 (22) = happyShift action_49
action_62 (29) = happyShift action_25
action_62 (6) = happyGoto action_85
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_34

action_64 (21) = happyShift action_23
action_64 (22) = happyShift action_49
action_64 (29) = happyShift action_25
action_64 (6) = happyGoto action_83
action_64 (15) = happyGoto action_84
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (25) = happyShift action_59
action_65 (26) = happyShift action_60
action_65 (27) = happyShift action_61
action_65 (28) = happyShift action_62
action_65 _ = happyReduce_39

action_66 (30) = happyReduce_57
action_66 (47) = happyReduce_57
action_66 (49) = happyReduce_57
action_66 (50) = happyReduce_57
action_66 _ = happyReduce_57

action_67 (47) = happyShift action_80
action_67 (49) = happyShift action_81
action_67 (50) = happyShift action_82
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (30) = happyShift action_76
action_68 (47) = happyShift action_77
action_68 (49) = happyShift action_78
action_68 (50) = happyShift action_79
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (30) = happyReduce_40
action_69 (47) = happyReduce_40
action_69 (49) = happyReduce_40
action_69 (50) = happyReduce_40
action_69 _ = happyReduce_12

action_70 (30) = happyReduce_56
action_70 (47) = happyReduce_56
action_70 (49) = happyReduce_56
action_70 (50) = happyReduce_56
action_70 _ = happyReduce_13

action_71 (21) = happyShift action_69
action_71 (22) = happyShift action_70
action_71 (29) = happyShift action_71
action_71 (45) = happyShift action_39
action_71 (46) = happyShift action_40
action_71 (48) = happyShift action_72
action_71 (6) = happyGoto action_74
action_71 (9) = happyGoto action_66
action_71 (16) = happyGoto action_67
action_71 (17) = happyGoto action_75
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (21) = happyShift action_69
action_72 (22) = happyShift action_70
action_72 (29) = happyShift action_71
action_72 (45) = happyShift action_39
action_72 (46) = happyShift action_40
action_72 (48) = happyShift action_72
action_72 (6) = happyGoto action_65
action_72 (9) = happyGoto action_66
action_72 (16) = happyGoto action_67
action_72 (17) = happyGoto action_73
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_54

action_74 (25) = happyShift action_59
action_74 (26) = happyShift action_60
action_74 (27) = happyShift action_61
action_74 (28) = happyShift action_62
action_74 (30) = happyShift action_91
action_74 _ = happyReduce_39

action_75 (30) = happyShift action_113
action_75 (47) = happyShift action_77
action_75 (49) = happyShift action_78
action_75 (50) = happyShift action_79
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (31) = happyShift action_112
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (21) = happyShift action_69
action_77 (22) = happyShift action_70
action_77 (29) = happyShift action_71
action_77 (45) = happyShift action_39
action_77 (46) = happyShift action_40
action_77 (48) = happyShift action_72
action_77 (6) = happyGoto action_65
action_77 (9) = happyGoto action_66
action_77 (16) = happyGoto action_110
action_77 (17) = happyGoto action_111
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (21) = happyShift action_69
action_78 (22) = happyShift action_70
action_78 (29) = happyShift action_71
action_78 (45) = happyShift action_39
action_78 (46) = happyShift action_40
action_78 (48) = happyShift action_72
action_78 (6) = happyGoto action_65
action_78 (9) = happyGoto action_66
action_78 (16) = happyGoto action_108
action_78 (17) = happyGoto action_109
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (21) = happyShift action_69
action_79 (22) = happyShift action_70
action_79 (29) = happyShift action_71
action_79 (45) = happyShift action_39
action_79 (46) = happyShift action_40
action_79 (48) = happyShift action_72
action_79 (6) = happyGoto action_65
action_79 (9) = happyGoto action_66
action_79 (16) = happyGoto action_106
action_79 (17) = happyGoto action_107
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (21) = happyShift action_69
action_80 (22) = happyShift action_70
action_80 (29) = happyShift action_71
action_80 (45) = happyShift action_39
action_80 (46) = happyShift action_40
action_80 (48) = happyShift action_72
action_80 (6) = happyGoto action_65
action_80 (9) = happyGoto action_66
action_80 (16) = happyGoto action_104
action_80 (17) = happyGoto action_105
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (21) = happyShift action_69
action_81 (22) = happyShift action_70
action_81 (29) = happyShift action_71
action_81 (45) = happyShift action_39
action_81 (46) = happyShift action_40
action_81 (48) = happyShift action_72
action_81 (6) = happyGoto action_65
action_81 (9) = happyGoto action_66
action_81 (16) = happyGoto action_102
action_81 (17) = happyGoto action_103
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (21) = happyShift action_69
action_82 (22) = happyShift action_70
action_82 (29) = happyShift action_71
action_82 (45) = happyShift action_39
action_82 (46) = happyShift action_40
action_82 (48) = happyShift action_72
action_82 (6) = happyGoto action_65
action_82 (9) = happyGoto action_66
action_82 (16) = happyGoto action_100
action_82 (17) = happyGoto action_101
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (25) = happyShift action_59
action_83 (26) = happyShift action_60
action_83 (27) = happyShift action_61
action_83 (28) = happyShift action_62
action_83 (33) = happyShift action_98
action_83 (36) = happyShift action_99
action_83 _ = happyFail (happyExpListPerState 83)

action_84 _ = happyReduce_35

action_85 _ = happyReduce_10

action_86 _ = happyReduce_9

action_87 _ = happyReduce_8

action_88 _ = happyReduce_7

action_89 (33) = happyShift action_96
action_89 (36) = happyShift action_97
action_89 _ = happyFail (happyExpListPerState 89)

action_90 _ = happyReduce_30

action_91 _ = happyReduce_11

action_92 _ = happyReduce_33

action_93 _ = happyReduce_62

action_94 (22) = happyShift action_9
action_94 (10) = happyGoto action_7
action_94 (11) = happyGoto action_41
action_94 (20) = happyGoto action_95
action_94 _ = happyFail (happyExpListPerState 94)

action_95 _ = happyReduce_63

action_96 _ = happyReduce_31

action_97 (22) = happyShift action_9
action_97 (10) = happyGoto action_89
action_97 (13) = happyGoto action_116
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_36

action_99 (21) = happyShift action_23
action_99 (22) = happyShift action_49
action_99 (29) = happyShift action_25
action_99 (6) = happyGoto action_83
action_99 (15) = happyGoto action_115
action_99 _ = happyFail (happyExpListPerState 99)

action_100 _ = happyReduce_53

action_101 _ = happyReduce_52

action_102 _ = happyReduce_49

action_103 _ = happyReduce_48

action_104 _ = happyReduce_45

action_105 _ = happyReduce_44

action_106 _ = happyReduce_51

action_107 _ = happyReduce_50

action_108 _ = happyReduce_47

action_109 _ = happyReduce_46

action_110 _ = happyReduce_43

action_111 _ = happyReduce_42

action_112 (22) = happyShift action_16
action_112 (29) = happyShift action_17
action_112 (32) = happyShift action_18
action_112 (42) = happyShift action_19
action_112 (5) = happyGoto action_114
action_112 (7) = happyGoto action_12
action_112 (12) = happyGoto action_13
action_112 (14) = happyGoto action_14
action_112 (18) = happyGoto action_15
action_112 _ = happyFail (happyExpListPerState 112)

action_113 _ = happyReduce_55

action_114 (41) = happyShift action_31
action_114 (43) = happyShift action_117
action_114 _ = happyFail (happyExpListPerState 114)

action_115 _ = happyReduce_37

action_116 _ = happyReduce_32

action_117 (31) = happyShift action_118
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (22) = happyShift action_16
action_118 (29) = happyShift action_17
action_118 (32) = happyShift action_18
action_118 (42) = happyShift action_19
action_118 (5) = happyGoto action_119
action_118 (7) = happyGoto action_12
action_118 (12) = happyGoto action_13
action_118 (14) = happyGoto action_14
action_118 (18) = happyGoto action_15
action_118 _ = happyFail (happyExpListPerState 118)

action_119 _ = happyReduce_58

happyReduce_1 = happyReduce 4 4 happyReduction_1
happyReduction_1 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	(HappyAbsSyn19  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenFuncName _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (FuncDeclaration_ happy_var_1 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn5
		 (CondExp happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 (EqualsExp happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn5
		 (OutPatternExp happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  5 happyReduction_5
happyReduction_5 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  5 happyReduction_6
happyReduction_6 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (SequenceExp happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (MathsPlus happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (MathsMinus happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (MathsTimes happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (MathsDevide happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  6 happyReduction_11
happyReduction_11 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  6 happyReduction_12
happyReduction_12 (HappyTerminal (TokenIntValue _ happy_var_1))
	 =  HappyAbsSyn6
		 (MathsInt happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  6 happyReduction_13
happyReduction_13 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (MathsVar happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  7 happyReduction_14
happyReduction_14 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn7
		 (EqualsInOut happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  7 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn7
		 (EqualsInMaths happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  7 happyReduction_16
happyReduction_16 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn7
		 (EqualsVarMaths happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  7 happyReduction_17
happyReduction_17 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn7
		 (EqualsVarBool happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  7 happyReduction_18
happyReduction_18 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn7
		 (EqualsVarVar happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  8 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn8
		 (TBool
	)

happyReduce_20 = happySpecReduce_1  8 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn8
		 (TInt
	)

happyReduce_21 = happySpecReduce_1  9 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn9
		 (True
	)

happyReduce_22 = happySpecReduce_1  9 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn9
		 (False
	)

happyReduce_23 = happySpecReduce_3  10 happyReduction_23
happyReduction_23 (HappyAbsSyn8  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn10
		 (Var_ happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  11 happyReduction_24
happyReduction_24 (HappyTerminal (TokenIntValue _ happy_var_3))
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 (VarIntInit_ happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  11 happyReduction_25
happyReduction_25 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 (VarBoolInit_ happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  11 happyReduction_26
happyReduction_26 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 (VarStrInit_ happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  12 happyReduction_27
happyReduction_27 _
	_
	 =  HappyAbsSyn12
		 (EmptyMatch
	)

happyReduce_28 = happySpecReduce_3  12 happyReduction_28
happyReduction_28 _
	_
	_
	 =  HappyAbsSyn12
		 (EOFMatch
	)

happyReduce_29 = happySpecReduce_3  12 happyReduction_29
happyReduction_29 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (SingleMatch happy_var_2
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happyReduce 4 12 happyReduction_30
happyReduction_30 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (MultipleMatch happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_2  13 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn13
		 (SingleMatch happy_var_1
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  13 happyReduction_32
happyReduction_32 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn13
		 (MultipleMatch happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_2  14 happyReduction_33
happyReduction_33 _
	_
	 =  HappyAbsSyn14
		 (EmptyOutPatter
	)

happyReduce_34 = happySpecReduce_3  14 happyReduction_34
happyReduction_34 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (SingleOutPattern happy_var_2
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happyReduce 4 14 happyReduction_35
happyReduction_35 ((HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (MultipleOutPattern happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_36 = happySpecReduce_2  15 happyReduction_36
happyReduction_36 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn15
		 (SingleOutPattern happy_var_1
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  15 happyReduction_37
happyReduction_37 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn15
		 (MultipleOutPattern happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  16 happyReduction_38
happyReduction_38 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn16
		 (ComparablesVar happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  16 happyReduction_39
happyReduction_39 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn16
		 (ComparablesMaths happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  16 happyReduction_40
happyReduction_40 (HappyTerminal (TokenIntValue _ happy_var_1))
	 =  HappyAbsSyn16
		 (ComparablesInt happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  16 happyReduction_41
happyReduction_41 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn16
		 (ComparablesBool happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  17 happyReduction_42
happyReduction_42 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (EqualsToLR happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  17 happyReduction_43
happyReduction_43 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (EqualsToL happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  17 happyReduction_44
happyReduction_44 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn17
		 (EqualsToR happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  17 happyReduction_45
happyReduction_45 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn17
		 (EqualsTo happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  17 happyReduction_46
happyReduction_46 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (SmallerThanLR happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  17 happyReduction_47
happyReduction_47 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (SmallerThanL happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  17 happyReduction_48
happyReduction_48 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn17
		 (SmallerThanR happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  17 happyReduction_49
happyReduction_49 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn17
		 (SmallerThan happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  17 happyReduction_50
happyReduction_50 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (GreaterThanLR happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  17 happyReduction_51
happyReduction_51 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (GreaterThanL happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  17 happyReduction_52
happyReduction_52 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn17
		 (GreaterThanR happy_var_1 happy_var_3
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  17 happyReduction_53
happyReduction_53 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn17
		 (GreaterThan happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_2  17 happyReduction_54
happyReduction_54 (HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (Not happy_var_2
	)
happyReduction_54 _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  17 happyReduction_55
happyReduction_55 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (happy_var_2
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  17 happyReduction_56
happyReduction_56 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn17
		 (ComparableExpVar happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  17 happyReduction_57
happyReduction_57 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn17
		 (ComparableExpBool happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happyReduce 9 18 happyReduction_58
happyReduction_58 ((HappyAbsSyn5  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (Cond_ happy_var_3 happy_var_6 happy_var_9
	) `HappyStk` happyRest

happyReduce_59 = happySpecReduce_2  19 happyReduction_59
happyReduction_59 _
	_
	 =  HappyAbsSyn19
		 (EmptyInitArea
	)

happyReduce_60 = happySpecReduce_3  19 happyReduction_60
happyReduction_60 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (SingleInitArea happy_var_2
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happyReduce 4 19 happyReduction_61
happyReduction_61 ((HappyAbsSyn20  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (MultipleInitArea happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_62 = happySpecReduce_2  20 happyReduction_62
happyReduction_62 _
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn20
		 (SingleInitArea happy_var_1
	)
happyReduction_62 _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  20 happyReduction_63
happyReduction_63 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn20
		 (MultipleInitArea happy_var_1 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 51 51 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenIntValue _ happy_dollar_dollar -> cont 21;
	TokenVar _ happy_dollar_dollar -> cont 22;
	TokenFuncName _ happy_dollar_dollar -> cont 23;
	TokenEq _ -> cont 24;
	TokenPlus _ -> cont 25;
	TokenMinus _ -> cont 26;
	TokenTimes _ -> cont 27;
	TokenDiv _ -> cont 28;
	TokenLParen _ -> cont 29;
	TokenRParen _ -> cont 30;
	TokenColon _ -> cont 31;
	TokenLBracket _ -> cont 32;
	TokenRBracket _ -> cont 33;
	TokenLCurlyBracket _ -> cont 34;
	TokenRCurlyBracket _ -> cont 35;
	TokenComma _ -> cont 36;
	TokenPipe _ -> cont 37;
	TokenTypeInt _ -> cont 38;
	TokenEOF _ -> cont 39;
	TokenTypeBool _ -> cont 40;
	TokenSemiColon _ -> cont 41;
	TokenIf _ -> cont 42;
	TokenElse _ -> cont 43;
	TokenMain _ -> cont 44;
	TokenTrueValue _ -> cont 45;
	TokenFalseValue _ -> cont 46;
	TokenCompare _ -> cont 47;
	TokenNot _ -> cont 48;
	TokenSmallerThan _ -> cont 49;
	TokenGreaterThan _ -> cont 50;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 51 tk tks = happyError' (tks, explist)
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

