{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.8

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23
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
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,321) ([0,512,0,64,0,128,0,16,0,0,0,0,0,0,0,0,0,0,4,0,0,0,1,0,8192,0,1024,0,0,0,0,0,0,0,2048,0,0,2048,0,0,0,128,0,0,4,256,0,0,0,256,0,32768,0,0,0,0,16,0,0,0,0,32,0,0,1024,0,0,0,0,0,0,0,0,0,0,4,64,0,0,0,4,0,0,4,0,0,0,0,96,0,1024,0,1,0,128,0,384,0,0,16384,0,0,32,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,16384,1026,0,0,0,96,0,0,16384,2,0,0,0,8,0,0,0,0,0,0,0,0,0,4,16420,0,0,256,0,0,16384,16384,1026,0,6144,6208,6145,0,0,1024,0,0,256,16384,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,2,0,16,0,0,0,0,0,0,0,0,1536,1552,1536,0,0,126,0,0,0,0,0,0,0,0,0,0,944,576,24,0,0,0,0,0,0,0,0,6144,4160,0,0,1536,1552,1536,0,384,388,384,0,0,0,0,0,0,32800,0,0,4102,6,6,0,0,0,0,16384,16384,1026,0,0,1,0,0,1024,0,0,0,0,0,0,0,0,256,0,0,16,144,1,0,0,8192,0,0,236,0,6,0,0,0,0,0,2016,0,0,45056,2051,6144,0,49152,0,0,0,0,30,0,0,16408,16,0,0,4102,6,6,32768,33793,32769,1,24576,24832,24576,0,6144,6208,6144,0,1536,1552,1536,0,0,0,0,0,96,97,96,0,16408,24,24,0,4102,6,6,32768,1025,1,0,24576,16640,0,0,6144,4160,0,0,1536,1040,0,0,384,260,0,0,96,65,0,0,3776,32,96,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,256,0,0,0,64,0,0,0,16,0,0,32768,7,0,0,57344,1,0,0,192,0,0,0,48,0,0,0,0,0,0,45056,16387,6146,0,0,0,0,0,0,0,0,0,3072,0,96,0,896,0,24,0,224,0,6,0,40832,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,32768,1,0,0,2304,0,0,0,0,0,32768,33793,32769,1,16384,16384,1026,0,0,0,132,0,0,0,0,0,4096,0,0,0,64,0,0,0,0,0,0,0,4,16420,0,0,0,8192,0,0,0,8,0,0,0,128,0,1024,9216,64,0,0,16384,8,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","prods","FuncDeclaration","Exp","Maths","Equals","T","B","Var","VarInit","Match","MatchRec","OutPattern","OutPatternRec","Comparables","ComparableExp","Cond","FuncBodyInitArea","FuncBodyInitAreaRec","Main","MainRec","intValue","var","funcName","'&&'","'||'","'->'","'=='","'>='","'<='","'='","'+'","'-'","'*'","'/'","'%'","'^'","'!'","'('","')'","':'","'['","']'","'{'","'}'","','","'>>'","intType","boolType","';'","if","else","main","trueValue","falseValue","'<'","'>'","stdin","stdout","%eof"]
        bit_start = st * 62
        bit_end = (st + 1) * 62
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..61]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (26) = happyShift action_4
action_0 (55) = happyShift action_5
action_0 (4) = happyGoto action_6
action_0 (5) = happyGoto action_2
action_0 (22) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (26) = happyShift action_4
action_1 (55) = happyShift action_5
action_1 (5) = happyGoto action_2
action_1 (22) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 _ = happyReduce_4

action_4 (43) = happyShift action_9
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (43) = happyShift action_8
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (26) = happyShift action_4
action_6 (55) = happyShift action_5
action_6 (62) = happyAccept
action_6 (5) = happyGoto action_7
action_6 (22) = happyGoto action_3
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_2

action_8 (60) = happyShift action_12
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (46) = happyShift action_11
action_9 (20) = happyGoto action_10
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (44) = happyShift action_19
action_10 (13) = happyGoto action_18
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (25) = happyShift action_16
action_11 (47) = happyShift action_17
action_11 (11) = happyGoto action_14
action_11 (12) = happyGoto action_15
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (49) = happyShift action_13
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (26) = happyShift action_25
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (33) = happyShift action_24
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (52) = happyShift action_23
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (43) = happyShift action_22
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_54

action_18 _ = happyReduce_3

action_19 (25) = happyShift action_20
action_19 (45) = happyShift action_21
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (43) = happyShift action_38
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (29) = happyShift action_37
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (50) = happyShift action_35
action_22 (51) = happyShift action_36
action_22 (9) = happyGoto action_34
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (25) = happyShift action_16
action_23 (47) = happyShift action_33
action_23 (11) = happyGoto action_14
action_23 (12) = happyGoto action_31
action_23 (21) = happyGoto action_32
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (24) = happyShift action_28
action_24 (56) = happyShift action_29
action_24 (57) = happyShift action_30
action_24 (10) = happyGoto action_27
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (49) = happyShift action_26
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (26) = happyShift action_50
action_26 (61) = happyShift action_51
action_26 (23) = happyGoto action_49
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_29

action_28 _ = happyReduce_28

action_29 _ = happyReduce_25

action_30 _ = happyReduce_26

action_31 (52) = happyShift action_48
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_56

action_33 _ = happyReduce_55

action_34 _ = happyReduce_27

action_35 _ = happyReduce_24

action_36 _ = happyReduce_23

action_37 (25) = happyShift action_44
action_37 (41) = happyShift action_45
action_37 (44) = happyShift action_46
action_37 (53) = happyShift action_47
action_37 (6) = happyGoto action_40
action_37 (8) = happyGoto action_41
action_37 (15) = happyGoto action_42
action_37 (19) = happyGoto action_43
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (50) = happyShift action_35
action_38 (51) = happyShift action_36
action_38 (9) = happyGoto action_39
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (45) = happyShift action_70
action_39 (48) = happyShift action_71
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (52) = happyShift action_69
action_40 _ = happyReduce_30

action_41 _ = happyReduce_6

action_42 _ = happyReduce_7

action_43 (25) = happyShift action_44
action_43 (41) = happyShift action_45
action_43 (44) = happyShift action_46
action_43 (53) = happyShift action_47
action_43 (6) = happyGoto action_68
action_43 (8) = happyGoto action_41
action_43 (15) = happyGoto action_42
action_43 (19) = happyGoto action_43
action_43 _ = happyReduce_5

action_44 (33) = happyShift action_67
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (25) = happyShift action_44
action_45 (41) = happyShift action_45
action_45 (44) = happyShift action_46
action_45 (53) = happyShift action_47
action_45 (6) = happyGoto action_66
action_45 (8) = happyGoto action_41
action_45 (15) = happyGoto action_42
action_45 (19) = happyGoto action_43
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (24) = happyShift action_60
action_46 (25) = happyShift action_61
action_46 (35) = happyShift action_62
action_46 (40) = happyShift action_63
action_46 (41) = happyShift action_64
action_46 (45) = happyShift action_65
action_46 (56) = happyShift action_29
action_46 (57) = happyShift action_30
action_46 (7) = happyGoto action_56
action_46 (10) = happyGoto action_57
action_46 (17) = happyGoto action_58
action_46 (18) = happyGoto action_59
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (41) = happyShift action_55
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (25) = happyShift action_16
action_48 (47) = happyShift action_54
action_48 (11) = happyGoto action_14
action_48 (12) = happyGoto action_31
action_48 (21) = happyGoto action_53
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_59

action_50 (49) = happyShift action_52
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_60

action_52 (26) = happyShift action_50
action_52 (61) = happyShift action_100
action_52 (23) = happyGoto action_99
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_58

action_54 _ = happyReduce_57

action_55 (24) = happyShift action_60
action_55 (25) = happyShift action_61
action_55 (35) = happyShift action_62
action_55 (40) = happyShift action_63
action_55 (41) = happyShift action_64
action_55 (56) = happyShift action_29
action_55 (57) = happyShift action_30
action_55 (7) = happyGoto action_56
action_55 (10) = happyGoto action_57
action_55 (17) = happyGoto action_58
action_55 (18) = happyGoto action_98
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (34) = happyShift action_92
action_56 (35) = happyShift action_93
action_56 (36) = happyShift action_94
action_56 (37) = happyShift action_95
action_56 (38) = happyShift action_96
action_56 (39) = happyShift action_97
action_56 _ = happyReduce_40

action_57 _ = happyReduce_41

action_58 _ = happyReduce_51

action_59 (27) = happyShift action_83
action_59 (28) = happyShift action_84
action_59 (30) = happyShift action_85
action_59 (31) = happyShift action_86
action_59 (32) = happyShift action_87
action_59 (45) = happyShift action_88
action_59 (48) = happyShift action_89
action_59 (58) = happyShift action_90
action_59 (59) = happyShift action_91
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_20

action_61 _ = happyReduce_21

action_62 (24) = happyShift action_60
action_62 (25) = happyShift action_61
action_62 (35) = happyShift action_62
action_62 (41) = happyShift action_82
action_62 (7) = happyGoto action_81
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (24) = happyShift action_60
action_63 (25) = happyShift action_61
action_63 (35) = happyShift action_62
action_63 (40) = happyShift action_63
action_63 (41) = happyShift action_64
action_63 (56) = happyShift action_29
action_63 (57) = happyShift action_30
action_63 (7) = happyGoto action_56
action_63 (10) = happyGoto action_57
action_63 (17) = happyGoto action_58
action_63 (18) = happyGoto action_80
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (24) = happyShift action_60
action_64 (25) = happyShift action_61
action_64 (35) = happyShift action_62
action_64 (40) = happyShift action_63
action_64 (41) = happyShift action_64
action_64 (56) = happyShift action_29
action_64 (57) = happyShift action_30
action_64 (7) = happyGoto action_78
action_64 (10) = happyGoto action_57
action_64 (17) = happyGoto action_58
action_64 (18) = happyGoto action_79
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_35

action_66 (42) = happyShift action_77
action_66 (52) = happyShift action_69
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (24) = happyShift action_60
action_67 (25) = happyShift action_61
action_67 (35) = happyShift action_62
action_67 (40) = happyShift action_63
action_67 (41) = happyShift action_64
action_67 (56) = happyShift action_29
action_67 (57) = happyShift action_30
action_67 (7) = happyGoto action_56
action_67 (10) = happyGoto action_57
action_67 (17) = happyGoto action_58
action_67 (18) = happyGoto action_76
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (52) = happyShift action_69
action_68 _ = happyReduce_10

action_69 (25) = happyShift action_44
action_69 (41) = happyShift action_45
action_69 (44) = happyShift action_46
action_69 (53) = happyShift action_47
action_69 (6) = happyGoto action_75
action_69 (8) = happyGoto action_41
action_69 (15) = happyGoto action_42
action_69 (19) = happyGoto action_43
action_69 _ = happyReduce_11

action_70 (29) = happyShift action_74
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (25) = happyShift action_73
action_71 (14) = happyGoto action_72
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_32

action_73 (43) = happyShift action_121
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (25) = happyShift action_44
action_74 (41) = happyShift action_45
action_74 (44) = happyShift action_46
action_74 (53) = happyShift action_47
action_74 (6) = happyGoto action_120
action_74 (8) = happyGoto action_41
action_74 (15) = happyGoto action_42
action_74 (19) = happyGoto action_43
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (52) = happyShift action_69
action_75 _ = happyReduce_9

action_76 (27) = happyShift action_83
action_76 (28) = happyShift action_84
action_76 (30) = happyShift action_85
action_76 (31) = happyShift action_86
action_76 (32) = happyShift action_87
action_76 (58) = happyShift action_90
action_76 (59) = happyShift action_91
action_76 _ = happyReduce_22

action_77 _ = happyReduce_8

action_78 (34) = happyShift action_92
action_78 (35) = happyShift action_93
action_78 (36) = happyShift action_94
action_78 (37) = happyShift action_95
action_78 (38) = happyShift action_96
action_78 (39) = happyShift action_97
action_78 (42) = happyShift action_119
action_78 _ = happyReduce_40

action_79 (27) = happyShift action_83
action_79 (28) = happyShift action_84
action_79 (30) = happyShift action_85
action_79 (31) = happyShift action_86
action_79 (32) = happyShift action_87
action_79 (42) = happyShift action_118
action_79 (58) = happyShift action_90
action_79 (59) = happyShift action_91
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (31) = happyShift action_86
action_80 (32) = happyShift action_87
action_80 _ = happyReduce_49

action_81 (36) = happyShift action_94
action_81 (37) = happyShift action_95
action_81 (38) = happyShift action_96
action_81 (39) = happyShift action_97
action_81 _ = happyReduce_19

action_82 (24) = happyShift action_60
action_82 (25) = happyShift action_61
action_82 (35) = happyShift action_62
action_82 (41) = happyShift action_82
action_82 (7) = happyGoto action_117
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (24) = happyShift action_60
action_83 (25) = happyShift action_61
action_83 (35) = happyShift action_62
action_83 (40) = happyShift action_63
action_83 (41) = happyShift action_64
action_83 (56) = happyShift action_29
action_83 (57) = happyShift action_30
action_83 (7) = happyGoto action_56
action_83 (10) = happyGoto action_57
action_83 (17) = happyGoto action_58
action_83 (18) = happyGoto action_116
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (24) = happyShift action_60
action_84 (25) = happyShift action_61
action_84 (35) = happyShift action_62
action_84 (40) = happyShift action_63
action_84 (41) = happyShift action_64
action_84 (56) = happyShift action_29
action_84 (57) = happyShift action_30
action_84 (7) = happyGoto action_56
action_84 (10) = happyGoto action_57
action_84 (17) = happyGoto action_58
action_84 (18) = happyGoto action_115
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (24) = happyShift action_60
action_85 (25) = happyShift action_61
action_85 (35) = happyShift action_62
action_85 (40) = happyShift action_63
action_85 (41) = happyShift action_64
action_85 (56) = happyShift action_29
action_85 (57) = happyShift action_30
action_85 (7) = happyGoto action_56
action_85 (10) = happyGoto action_57
action_85 (17) = happyGoto action_58
action_85 (18) = happyGoto action_114
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (24) = happyShift action_60
action_86 (25) = happyShift action_61
action_86 (35) = happyShift action_62
action_86 (40) = happyShift action_63
action_86 (41) = happyShift action_64
action_86 (56) = happyShift action_29
action_86 (57) = happyShift action_30
action_86 (7) = happyGoto action_56
action_86 (10) = happyGoto action_57
action_86 (17) = happyGoto action_58
action_86 (18) = happyGoto action_113
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (24) = happyShift action_60
action_87 (25) = happyShift action_61
action_87 (35) = happyShift action_62
action_87 (40) = happyShift action_63
action_87 (41) = happyShift action_64
action_87 (56) = happyShift action_29
action_87 (57) = happyShift action_30
action_87 (7) = happyGoto action_56
action_87 (10) = happyGoto action_57
action_87 (17) = happyGoto action_58
action_87 (18) = happyGoto action_112
action_87 _ = happyFail (happyExpListPerState 87)

action_88 _ = happyReduce_37

action_89 (24) = happyShift action_60
action_89 (25) = happyShift action_61
action_89 (35) = happyShift action_62
action_89 (40) = happyShift action_63
action_89 (41) = happyShift action_64
action_89 (56) = happyShift action_29
action_89 (57) = happyShift action_30
action_89 (7) = happyGoto action_56
action_89 (10) = happyGoto action_57
action_89 (16) = happyGoto action_110
action_89 (17) = happyGoto action_58
action_89 (18) = happyGoto action_111
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (24) = happyShift action_60
action_90 (25) = happyShift action_61
action_90 (35) = happyShift action_62
action_90 (40) = happyShift action_63
action_90 (41) = happyShift action_64
action_90 (56) = happyShift action_29
action_90 (57) = happyShift action_30
action_90 (7) = happyGoto action_56
action_90 (10) = happyGoto action_57
action_90 (17) = happyGoto action_58
action_90 (18) = happyGoto action_109
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (24) = happyShift action_60
action_91 (25) = happyShift action_61
action_91 (35) = happyShift action_62
action_91 (40) = happyShift action_63
action_91 (41) = happyShift action_64
action_91 (56) = happyShift action_29
action_91 (57) = happyShift action_30
action_91 (7) = happyGoto action_56
action_91 (10) = happyGoto action_57
action_91 (17) = happyGoto action_58
action_91 (18) = happyGoto action_108
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (24) = happyShift action_60
action_92 (25) = happyShift action_61
action_92 (35) = happyShift action_62
action_92 (41) = happyShift action_82
action_92 (7) = happyGoto action_107
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (24) = happyShift action_60
action_93 (25) = happyShift action_61
action_93 (35) = happyShift action_62
action_93 (41) = happyShift action_82
action_93 (7) = happyGoto action_106
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (24) = happyShift action_60
action_94 (25) = happyShift action_61
action_94 (35) = happyShift action_62
action_94 (41) = happyShift action_82
action_94 (7) = happyGoto action_105
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (24) = happyShift action_60
action_95 (25) = happyShift action_61
action_95 (35) = happyShift action_62
action_95 (41) = happyShift action_82
action_95 (7) = happyGoto action_104
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (24) = happyShift action_60
action_96 (25) = happyShift action_61
action_96 (35) = happyShift action_62
action_96 (41) = happyShift action_82
action_96 (7) = happyGoto action_103
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (24) = happyShift action_60
action_97 (25) = happyShift action_61
action_97 (35) = happyShift action_62
action_97 (41) = happyShift action_82
action_97 (7) = happyGoto action_102
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (27) = happyShift action_83
action_98 (28) = happyShift action_84
action_98 (30) = happyShift action_85
action_98 (31) = happyShift action_86
action_98 (32) = happyShift action_87
action_98 (42) = happyShift action_101
action_98 (58) = happyShift action_90
action_98 (59) = happyShift action_91
action_98 _ = happyFail (happyExpListPerState 98)

action_99 _ = happyReduce_62

action_100 _ = happyReduce_61

action_101 (46) = happyShift action_125
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_17

action_103 (39) = happyShift action_97
action_103 _ = happyReduce_16

action_104 (39) = happyShift action_97
action_104 _ = happyReduce_15

action_105 (39) = happyShift action_97
action_105 _ = happyReduce_14

action_106 (36) = happyShift action_94
action_106 (37) = happyShift action_95
action_106 (38) = happyShift action_96
action_106 (39) = happyShift action_97
action_106 _ = happyReduce_13

action_107 (36) = happyShift action_94
action_107 (37) = happyShift action_95
action_107 (38) = happyShift action_96
action_107 (39) = happyShift action_97
action_107 _ = happyReduce_12

action_108 (31) = happyShift action_86
action_108 (32) = happyShift action_87
action_108 _ = happyReduce_44

action_109 (31) = happyShift action_86
action_109 (32) = happyShift action_87
action_109 _ = happyReduce_43

action_110 _ = happyReduce_36

action_111 (27) = happyShift action_83
action_111 (28) = happyShift action_84
action_111 (30) = happyShift action_85
action_111 (31) = happyShift action_86
action_111 (32) = happyShift action_87
action_111 (45) = happyShift action_123
action_111 (48) = happyShift action_124
action_111 (58) = happyShift action_90
action_111 (59) = happyShift action_91
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (31) = happyFail []
action_112 (32) = happyFail []
action_112 _ = happyReduce_46

action_113 (31) = happyFail []
action_113 (32) = happyFail []
action_113 _ = happyReduce_45

action_114 (31) = happyShift action_86
action_114 (32) = happyShift action_87
action_114 (58) = happyShift action_90
action_114 (59) = happyShift action_91
action_114 _ = happyReduce_42

action_115 (30) = happyShift action_85
action_115 (31) = happyShift action_86
action_115 (32) = happyShift action_87
action_115 (58) = happyShift action_90
action_115 (59) = happyShift action_91
action_115 _ = happyReduce_48

action_116 (30) = happyShift action_85
action_116 (31) = happyShift action_86
action_116 (32) = happyShift action_87
action_116 (58) = happyShift action_90
action_116 (59) = happyShift action_91
action_116 _ = happyReduce_47

action_117 (34) = happyShift action_92
action_117 (35) = happyShift action_93
action_117 (36) = happyShift action_94
action_117 (37) = happyShift action_95
action_117 (38) = happyShift action_96
action_117 (39) = happyShift action_97
action_117 (42) = happyShift action_119
action_117 _ = happyFail (happyExpListPerState 117)

action_118 _ = happyReduce_50

action_119 _ = happyReduce_18

action_120 (52) = happyShift action_69
action_120 _ = happyReduce_31

action_121 (50) = happyShift action_35
action_121 (51) = happyShift action_36
action_121 (9) = happyGoto action_122
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (45) = happyShift action_128
action_122 (48) = happyShift action_129
action_122 _ = happyFail (happyExpListPerState 122)

action_123 _ = happyReduce_38

action_124 (24) = happyShift action_60
action_124 (25) = happyShift action_61
action_124 (35) = happyShift action_62
action_124 (40) = happyShift action_63
action_124 (41) = happyShift action_64
action_124 (56) = happyShift action_29
action_124 (57) = happyShift action_30
action_124 (7) = happyGoto action_56
action_124 (10) = happyGoto action_57
action_124 (16) = happyGoto action_127
action_124 (17) = happyGoto action_58
action_124 (18) = happyGoto action_111
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (25) = happyShift action_44
action_125 (41) = happyShift action_45
action_125 (44) = happyShift action_46
action_125 (53) = happyShift action_47
action_125 (6) = happyGoto action_126
action_125 (8) = happyGoto action_41
action_125 (15) = happyGoto action_42
action_125 (19) = happyGoto action_43
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (47) = happyShift action_132
action_126 (52) = happyShift action_69
action_126 _ = happyFail (happyExpListPerState 126)

action_127 _ = happyReduce_39

action_128 (29) = happyShift action_131
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (25) = happyShift action_73
action_129 (14) = happyGoto action_130
action_129 _ = happyFail (happyExpListPerState 129)

action_130 _ = happyReduce_34

action_131 (25) = happyShift action_44
action_131 (41) = happyShift action_45
action_131 (44) = happyShift action_46
action_131 (53) = happyShift action_47
action_131 (6) = happyGoto action_134
action_131 (8) = happyGoto action_41
action_131 (15) = happyGoto action_42
action_131 (19) = happyGoto action_43
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (54) = happyShift action_133
action_132 _ = happyReduce_53

action_133 (46) = happyShift action_135
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (52) = happyShift action_69
action_134 _ = happyReduce_33

action_135 (25) = happyShift action_44
action_135 (41) = happyShift action_45
action_135 (44) = happyShift action_46
action_135 (53) = happyShift action_47
action_135 (6) = happyGoto action_136
action_135 (8) = happyGoto action_41
action_135 (15) = happyGoto action_42
action_135 (19) = happyGoto action_43
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (47) = happyShift action_137
action_136 (52) = happyShift action_69
action_136 _ = happyFail (happyExpListPerState 136)

action_137 _ = happyReduce_52

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
happyReduction_3 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	(HappyAbsSyn20  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenFuncName _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (NormalFuncDeclaration happy_var_1 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn5
		 (MainFuncDeclaration happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn6
		 (CondExp happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (EqualsExp happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn6
		 (OutPatternExp happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (SequenceExp happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  6 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn6
		 (SequenceExp (CondExp happy_var_1) happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  6 happyReduction_11
happyReduction_11 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  7 happyReduction_12
happyReduction_12 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (MathsPlus happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  7 happyReduction_13
happyReduction_13 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (MathsMinus happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  7 happyReduction_14
happyReduction_14 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (MathsTimes happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  7 happyReduction_15
happyReduction_15 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (MathsDevide happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  7 happyReduction_16
happyReduction_16 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (MathsMod happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  7 happyReduction_17
happyReduction_17 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (MathsPower happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  7 happyReduction_18
happyReduction_18 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  7 happyReduction_19
happyReduction_19 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (MathsNegative happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  7 happyReduction_20
happyReduction_20 (HappyTerminal (TokenIntValue _ happy_var_1))
	 =  HappyAbsSyn7
		 (MathsInt happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  7 happyReduction_21
happyReduction_21 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn7
		 (MathsVar happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  8 happyReduction_22
happyReduction_22 (HappyAbsSyn18  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (Equals_ happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  9 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn9
		 (TBool
	)

happyReduce_24 = happySpecReduce_1  9 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn9
		 (TInt
	)

happyReduce_25 = happySpecReduce_1  10 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn10
		 (True
	)

happyReduce_26 = happySpecReduce_1  10 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn10
		 (False
	)

happyReduce_27 = happySpecReduce_3  11 happyReduction_27
happyReduction_27 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn11
		 (Var_ happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  12 happyReduction_28
happyReduction_28 (HappyTerminal (TokenIntValue _ happy_var_3))
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 (VarIntInit_ happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  12 happyReduction_29
happyReduction_29 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 (VarBoolInit_ happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happyReduce 4 13 happyReduction_30
happyReduction_30 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (EmptyMatch happy_var_4
	) `HappyStk` happyRest

happyReduce_31 = happyReduce 7 13 happyReduction_31
happyReduction_31 ((HappyAbsSyn6  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (SingleMatch (Var_ happy_var_2 happy_var_4) happy_var_7
	) `HappyStk` happyRest

happyReduce_32 = happyReduce 6 13 happyReduction_32
happyReduction_32 ((HappyAbsSyn14  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (MultipleMatch (Var_ happy_var_2 happy_var_4) happy_var_6
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 6 14 happyReduction_33
happyReduction_33 ((HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (SingleMatch (Var_ happy_var_1 happy_var_3) happy_var_6
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 5 14 happyReduction_34
happyReduction_34 ((HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (MultipleMatch (Var_ happy_var_1 happy_var_3) happy_var_5
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_2  15 happyReduction_35
happyReduction_35 _
	_
	 =  HappyAbsSyn15
		 (EmptyOutPatter
	)

happyReduce_36 = happyReduce 4 15 happyReduction_36
happyReduction_36 ((HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (MultipleOutPattern happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_3  15 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (SingleOutPattern happy_var_2
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  16 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn16
		 (SingleOutPattern happy_var_1
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  16 happyReduction_39
happyReduction_39 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
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

happyReduce_45 = happySpecReduce_3  18 happyReduction_45
happyReduction_45 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (GreaterOrEqual happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  18 happyReduction_46
happyReduction_46 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (SmallerOrEqual happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  18 happyReduction_47
happyReduction_47 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (And happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  18 happyReduction_48
happyReduction_48 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (Or happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_2  18 happyReduction_49
happyReduction_49 (HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (Not happy_var_2
	)
happyReduction_49 _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  18 happyReduction_50
happyReduction_50 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  18 happyReduction_51
happyReduction_51 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn18
		 (ComparableExpSingle happy_var_1
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happyReduce 11 19 happyReduction_52
happyReduction_52 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_10) `HappyStk`
	_ `HappyStk`
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
		 (IfElseStmt happy_var_3 happy_var_6 happy_var_10
	) `HappyStk` happyRest

happyReduce_53 = happyReduce 7 19 happyReduction_53
happyReduction_53 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (IfStmt happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_54 = happySpecReduce_2  20 happyReduction_54
happyReduction_54 _
	_
	 =  HappyAbsSyn20
		 (EmptyInitArea
	)

happyReduce_55 = happyReduce 4 20 happyReduction_55
happyReduction_55 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (SingleInitArea happy_var_2
	) `HappyStk` happyRest

happyReduce_56 = happyReduce 4 20 happyReduction_56
happyReduction_56 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (MultipleInitArea happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_57 = happySpecReduce_3  21 happyReduction_57
happyReduction_57 _
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn21
		 (SingleInitArea happy_var_1
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  21 happyReduction_58
happyReduction_58 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn21
		 (MultipleInitArea happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happyReduce 7 22 happyReduction_59
happyReduction_59 ((HappyAbsSyn23  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenFuncName _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (MultipleSegue happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_60 = happyReduce 7 22 happyReduction_60
happyReduction_60 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenFuncName _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (SingleSegue happy_var_5
	) `HappyStk` happyRest

happyReduce_61 = happySpecReduce_3  23 happyReduction_61
happyReduction_61 _
	_
	(HappyTerminal (TokenFuncName _ happy_var_1))
	 =  HappyAbsSyn23
		 (SingleSegue happy_var_1
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  23 happyReduction_62
happyReduction_62 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TokenFuncName _ happy_var_1))
	 =  HappyAbsSyn23
		 (MultipleSegue happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 62 62 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenIntValue _ happy_dollar_dollar -> cont 24;
	TokenVar _ happy_dollar_dollar -> cont 25;
	TokenFuncName _ happy_dollar_dollar -> cont 26;
	TokenAnd _ -> cont 27;
	TokenOr _ -> cont 28;
	TokenArrow _ -> cont 29;
	TokenCompare _ -> cont 30;
	TokenGreaterOrEqual _ -> cont 31;
	TokenSmallerOrEqual _ -> cont 32;
	TokenEq _ -> cont 33;
	TokenPlus _ -> cont 34;
	TokenMinus _ -> cont 35;
	TokenTimes _ -> cont 36;
	TokenDiv _ -> cont 37;
	TokenMod _ -> cont 38;
	TokenPower _ -> cont 39;
	TokenNot _ -> cont 40;
	TokenLParen _ -> cont 41;
	TokenRParen _ -> cont 42;
	TokenColon _ -> cont 43;
	TokenLBracket _ -> cont 44;
	TokenRBracket _ -> cont 45;
	TokenLCurlyBracket _ -> cont 46;
	TokenRCurlyBracket _ -> cont 47;
	TokenComma _ -> cont 48;
	TokenPipe _ -> cont 49;
	TokenTypeInt _ -> cont 50;
	TokenTypeBool _ -> cont 51;
	TokenSemiColon _ -> cont 52;
	TokenIf _ -> cont 53;
	TokenElse _ -> cont 54;
	TokenMain _ -> cont 55;
	TokenTrueValue _ -> cont 56;
	TokenFalseValue _ -> cont 57;
	TokenSmallerThan _ -> cont 58;
	TokenGreaterThan _ -> cont 59;
	TokenStdin _ -> cont 60;
	TokenStdout _ -> cont 61;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 62 tk tks = happyError' (tks, explist)
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

data SuperExp = Func

data T_ = TInt | TBool deriving (Eq)

instance Show T_ where
      show (TInt) = "Int"
      show (TBool) = "Bool"

data Var_ = Var_ String T_ deriving Show

data VarInit_ = VarIntInit_ Var_ Int
              | VarBoolInit_ Var_ Bool 
              deriving Show

data Match_ = EmptyMatch Exp_
            | MultipleMatch Var_ Match_
            | SingleMatch Var_ Exp_
            deriving Show

data Exp_ = CondExp Cond_
          | EqualsExp Equals_
          | OutPatternExp OutPattern_
          | SequenceExp Exp_ Exp_
          | SegueToFunction String [Var_] [ComparableExp_]
          deriving Show

data Maths_ = MathsPlus Maths_ Maths_
            | MathsMinus Maths_ Maths_
            | MathsTimes Maths_ Maths_
            | MathsDevide Maths_ Maths_
            | MathsMod Maths_ Maths_
            | MathsPower Maths_ Maths_
            | MathsNegative Maths_
            | MathsInt Int
            | MathsVar String
            deriving Show

data OutPattern_ = EmptyOutPatter
                 | MultipleOutPattern ComparableExp_ OutPattern_ 
                 | SingleOutPattern ComparableExp_
                 deriving Show

data Equals_ = Equals_ String ComparableExp_
             deriving Show

data Comparables_ = ComparablesMaths Maths_
                  | ComparablesBool Bool --Functions to be added!
                  deriving Show

data ComparableExp_ = EqualsTo ComparableExp_ ComparableExp_
                    | SmallerThan ComparableExp_ ComparableExp_
                    | GreaterThan ComparableExp_ ComparableExp_
                    | SmallerOrEqual ComparableExp_ ComparableExp_
                    | GreaterOrEqual ComparableExp_ ComparableExp_
                    | And ComparableExp_ ComparableExp_
                    | Or ComparableExp_ ComparableExp_
                    | Not ComparableExp_
                    | ComparableExpSingle Comparables_
                    deriving Show

data Cond_ = IfElseStmt ComparableExp_ Exp_ Exp_ 
           | IfStmt ComparableExp_ Exp_ 
           deriving Show

data FuncBodyInitArea_ = EmptyInitArea
                       | SingleInitArea VarInit_
                       | MultipleInitArea VarInit_ FuncBodyInitArea_
                       deriving Show

data FuncDeclaration_ = NormalFuncDeclaration String FuncBodyInitArea_ Match_
                      | MainFuncDeclaration Main_ 
                      deriving Show

data Main_ = MultipleSegue String Main_ 
           | SingleSegue String
           deriving Show
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4














































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}

















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc8814_0/ghc_2.h" #-}




























































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

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

{-# LINE 137 "templates/GenericTemplate.hs" #-}

{-# LINE 147 "templates/GenericTemplate.hs" #-}
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

{-# LINE 267 "templates/GenericTemplate.hs" #-}
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

{-# LINE 333 "templates/GenericTemplate.hs" #-}
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
