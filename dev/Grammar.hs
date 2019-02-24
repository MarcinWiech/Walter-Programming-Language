{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
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

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,250) ([0,18456,257,0,0,1024,0,0,0,0,0,2,0,0,32768,0,0,30,0,0,0,0,0,16,0,0,0,0,0,256,0,0,0,0,0,0,0,0,16384,32,0,24576,1312,4,0,2049,2,0,32772,0,0,0,6,0,32768,0,0,0,0,0,0,288,0,0,0,0,0,512,0,0,256,8,0,480,0,0,2072,6144,0,0,320,0,33152,4,0,1536,0,6,6144,8,0,24576,32,0,32768,129,0,0,518,0,0,18456,257,0,8288,24576,1,30720,0,0,0,0,0,0,0,416,0,64,1664,0,0,0,0,0,0,0,2072,22528,0,0,0,0,0,0,0,1536,2,22,0,32768,0,0,0,0,0,0,0,0,518,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,120,0,0,0,0,0,34840,0,0,0,0,0,0,0,0,0,0,0,32768,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,16384,0,0,0,24576,0,0,0,0,0,32768,4,0,0,0,0,30720,72,0,0,0,0,32768,23,0,0,0,0,0,376,0,0,1024,26624,0,8192,0,0,8288,24576,1,33152,32768,5,1536,2,22,6144,8,88,24576,32,352,32768,129,1408,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1536,16466,0,0,0,0,0,0,0,32768,129,0,0,0,0,0,16,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,4638,0,0,0,0,0,0,160,0,8192,0,0,0,0,0,33152,0,0,0,0,0,6144,328,1,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Exp","Maths","Equals","T","B","Var","VarInit","Match","MatchRec","OutPattern","OutPatternRec","Comparables","ComparableExp","Cond","FuncBodyInitArea","FuncBodyInitAreaRec","intValue","var","funcName","'='","'+'","'-'","'*'","'/'","'('","')'","':'","'['","']'","'{'","'}'","','","'>>'","intType","eof","boolType","';'","if","else","main","trueValue","falseValue","'=='","'!'","'<'","'>'","%eof"]
        bit_start = st * 50
        bit_end = (st + 1) * 50
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..49]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (20) = happyShift action_11
action_0 (21) = happyShift action_12
action_0 (28) = happyShift action_13
action_0 (31) = happyShift action_14
action_0 (33) = happyShift action_15
action_0 (41) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_5
action_0 (6) = happyGoto action_6
action_0 (9) = happyGoto action_7
action_0 (10) = happyGoto action_8
action_0 (11) = happyGoto action_9
action_0 (17) = happyGoto action_2
action_0 (18) = happyGoto action_10
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (41) = happyShift action_3
action_1 (17) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (28) = happyShift action_33
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (40) = happyShift action_32
action_4 (50) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (24) = happyShift action_28
action_5 (25) = happyShift action_29
action_5 (26) = happyShift action_30
action_5 (27) = happyShift action_31
action_5 _ = happyReduce_3

action_6 _ = happyReduce_2

action_7 (23) = happyShift action_27
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_5

action_9 (23) = happyShift action_26
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_7

action_11 _ = happyReduce_13

action_12 (23) = happyShift action_24
action_12 (30) = happyShift action_25
action_12 _ = happyReduce_14

action_13 (20) = happyShift action_11
action_13 (21) = happyShift action_12
action_13 (28) = happyShift action_13
action_13 (31) = happyShift action_14
action_13 (33) = happyShift action_15
action_13 (41) = happyShift action_3
action_13 (4) = happyGoto action_22
action_13 (5) = happyGoto action_23
action_13 (6) = happyGoto action_6
action_13 (9) = happyGoto action_7
action_13 (10) = happyGoto action_8
action_13 (11) = happyGoto action_9
action_13 (17) = happyGoto action_2
action_13 (18) = happyGoto action_10
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (21) = happyShift action_17
action_14 (32) = happyShift action_20
action_14 (38) = happyShift action_21
action_14 (9) = happyGoto action_19
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (21) = happyShift action_17
action_15 (34) = happyShift action_18
action_15 (9) = happyGoto action_7
action_15 (10) = happyGoto action_16
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (34) = happyShift action_68
action_16 (35) = happyShift action_69
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (30) = happyShift action_25
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_60

action_19 (32) = happyShift action_66
action_19 (35) = happyShift action_67
action_19 _ = happyFail (happyExpListPerState 19)

action_20 _ = happyReduce_28

action_21 (32) = happyShift action_65
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (29) = happyShift action_64
action_22 (40) = happyShift action_32
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (24) = happyShift action_28
action_23 (25) = happyShift action_29
action_23 (26) = happyShift action_30
action_23 (27) = happyShift action_31
action_23 (29) = happyShift action_63
action_23 _ = happyReduce_3

action_24 (20) = happyShift action_11
action_24 (21) = happyShift action_62
action_24 (28) = happyShift action_47
action_24 (44) = happyShift action_41
action_24 (45) = happyShift action_42
action_24 (5) = happyGoto action_60
action_24 (8) = happyGoto action_61
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (37) = happyShift action_58
action_25 (39) = happyShift action_59
action_25 (7) = happyGoto action_57
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (20) = happyShift action_11
action_26 (21) = happyShift action_46
action_26 (28) = happyShift action_47
action_26 (31) = happyShift action_56
action_26 (5) = happyGoto action_54
action_26 (13) = happyGoto action_55
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (20) = happyShift action_52
action_27 (21) = happyShift action_53
action_27 (44) = happyShift action_41
action_27 (45) = happyShift action_42
action_27 (8) = happyGoto action_51
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (20) = happyShift action_11
action_28 (21) = happyShift action_46
action_28 (28) = happyShift action_47
action_28 (5) = happyGoto action_50
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (20) = happyShift action_11
action_29 (21) = happyShift action_46
action_29 (28) = happyShift action_47
action_29 (5) = happyGoto action_49
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (20) = happyShift action_11
action_30 (21) = happyShift action_46
action_30 (28) = happyShift action_47
action_30 (5) = happyGoto action_48
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (20) = happyShift action_11
action_31 (21) = happyShift action_46
action_31 (28) = happyShift action_47
action_31 (5) = happyGoto action_45
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (20) = happyShift action_11
action_32 (21) = happyShift action_12
action_32 (28) = happyShift action_13
action_32 (31) = happyShift action_14
action_32 (33) = happyShift action_15
action_32 (41) = happyShift action_3
action_32 (4) = happyGoto action_44
action_32 (5) = happyGoto action_5
action_32 (6) = happyGoto action_6
action_32 (9) = happyGoto action_7
action_32 (10) = happyGoto action_8
action_32 (11) = happyGoto action_9
action_32 (17) = happyGoto action_2
action_32 (18) = happyGoto action_10
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (20) = happyShift action_38
action_33 (21) = happyShift action_39
action_33 (28) = happyShift action_40
action_33 (44) = happyShift action_41
action_33 (45) = happyShift action_42
action_33 (47) = happyShift action_43
action_33 (5) = happyGoto action_34
action_33 (8) = happyGoto action_35
action_33 (15) = happyGoto action_36
action_33 (16) = happyGoto action_37
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (24) = happyShift action_28
action_34 (25) = happyShift action_29
action_34 (26) = happyShift action_30
action_34 (27) = happyShift action_31
action_34 _ = happyReduce_40

action_35 (29) = happyReduce_58
action_35 (46) = happyReduce_58
action_35 (48) = happyReduce_58
action_35 (49) = happyReduce_58
action_35 _ = happyReduce_58

action_36 (46) = happyShift action_84
action_36 (48) = happyShift action_85
action_36 (49) = happyShift action_86
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (29) = happyShift action_80
action_37 (46) = happyShift action_81
action_37 (48) = happyShift action_82
action_37 (49) = happyShift action_83
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (29) = happyReduce_41
action_38 (46) = happyReduce_41
action_38 (48) = happyReduce_41
action_38 (49) = happyReduce_41
action_38 _ = happyReduce_13

action_39 (29) = happyReduce_57
action_39 (46) = happyReduce_57
action_39 (48) = happyReduce_57
action_39 (49) = happyReduce_57
action_39 _ = happyReduce_14

action_40 (20) = happyShift action_38
action_40 (21) = happyShift action_39
action_40 (28) = happyShift action_40
action_40 (44) = happyShift action_41
action_40 (45) = happyShift action_42
action_40 (47) = happyShift action_43
action_40 (5) = happyGoto action_78
action_40 (8) = happyGoto action_35
action_40 (15) = happyGoto action_36
action_40 (16) = happyGoto action_79
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_22

action_42 _ = happyReduce_23

action_43 (20) = happyShift action_38
action_43 (21) = happyShift action_39
action_43 (28) = happyShift action_40
action_43 (44) = happyShift action_41
action_43 (45) = happyShift action_42
action_43 (47) = happyShift action_43
action_43 (5) = happyGoto action_34
action_43 (8) = happyGoto action_35
action_43 (15) = happyGoto action_36
action_43 (16) = happyGoto action_77
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (40) = happyShift action_32
action_44 _ = happyReduce_6

action_45 _ = happyReduce_11

action_46 _ = happyReduce_14

action_47 (20) = happyShift action_11
action_47 (21) = happyShift action_46
action_47 (28) = happyShift action_47
action_47 (5) = happyGoto action_76
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_10

action_49 _ = happyReduce_9

action_50 _ = happyReduce_8

action_51 _ = happyReduce_26

action_52 _ = happyReduce_25

action_53 _ = happyReduce_27

action_54 (24) = happyShift action_28
action_54 (25) = happyShift action_29
action_54 (26) = happyShift action_30
action_54 (27) = happyShift action_31
action_54 _ = happyReduce_16

action_55 _ = happyReduce_15

action_56 (20) = happyShift action_11
action_56 (21) = happyShift action_46
action_56 (28) = happyShift action_47
action_56 (32) = happyShift action_75
action_56 (5) = happyGoto action_74
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_24

action_58 _ = happyReduce_21

action_59 _ = happyReduce_20

action_60 (24) = happyShift action_28
action_60 (25) = happyShift action_29
action_60 (26) = happyShift action_30
action_60 (27) = happyShift action_31
action_60 _ = happyReduce_17

action_61 _ = happyReduce_18

action_62 (29) = happyReduce_19
action_62 (40) = happyReduce_19
action_62 (42) = happyReduce_19
action_62 (50) = happyReduce_19
action_62 _ = happyReduce_14

action_63 _ = happyReduce_12

action_64 _ = happyReduce_4

action_65 _ = happyReduce_29

action_66 _ = happyReduce_30

action_67 (21) = happyShift action_17
action_67 (9) = happyGoto action_72
action_67 (12) = happyGoto action_73
action_67 _ = happyFail (happyExpListPerState 67)

action_68 _ = happyReduce_61

action_69 (21) = happyShift action_17
action_69 (9) = happyGoto action_7
action_69 (10) = happyGoto action_70
action_69 (19) = happyGoto action_71
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (34) = happyShift action_105
action_70 (35) = happyShift action_106
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_62

action_72 (32) = happyShift action_103
action_72 (35) = happyShift action_104
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_31

action_74 (24) = happyShift action_28
action_74 (25) = happyShift action_29
action_74 (26) = happyShift action_30
action_74 (27) = happyShift action_31
action_74 (32) = happyShift action_101
action_74 (35) = happyShift action_102
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_34

action_76 (24) = happyShift action_28
action_76 (25) = happyShift action_29
action_76 (26) = happyShift action_30
action_76 (27) = happyShift action_31
action_76 (29) = happyShift action_63
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_55

action_78 (24) = happyShift action_28
action_78 (25) = happyShift action_29
action_78 (26) = happyShift action_30
action_78 (27) = happyShift action_31
action_78 (29) = happyShift action_63
action_78 _ = happyReduce_40

action_79 (29) = happyShift action_100
action_79 (46) = happyShift action_81
action_79 (48) = happyShift action_82
action_79 (49) = happyShift action_83
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (30) = happyShift action_99
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (20) = happyShift action_38
action_81 (21) = happyShift action_39
action_81 (28) = happyShift action_40
action_81 (44) = happyShift action_41
action_81 (45) = happyShift action_42
action_81 (47) = happyShift action_43
action_81 (5) = happyGoto action_34
action_81 (8) = happyGoto action_35
action_81 (15) = happyGoto action_97
action_81 (16) = happyGoto action_98
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (20) = happyShift action_38
action_82 (21) = happyShift action_39
action_82 (28) = happyShift action_40
action_82 (44) = happyShift action_41
action_82 (45) = happyShift action_42
action_82 (47) = happyShift action_43
action_82 (5) = happyGoto action_34
action_82 (8) = happyGoto action_35
action_82 (15) = happyGoto action_95
action_82 (16) = happyGoto action_96
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (20) = happyShift action_38
action_83 (21) = happyShift action_39
action_83 (28) = happyShift action_40
action_83 (44) = happyShift action_41
action_83 (45) = happyShift action_42
action_83 (47) = happyShift action_43
action_83 (5) = happyGoto action_34
action_83 (8) = happyGoto action_35
action_83 (15) = happyGoto action_93
action_83 (16) = happyGoto action_94
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (20) = happyShift action_38
action_84 (21) = happyShift action_39
action_84 (28) = happyShift action_40
action_84 (44) = happyShift action_41
action_84 (45) = happyShift action_42
action_84 (47) = happyShift action_43
action_84 (5) = happyGoto action_34
action_84 (8) = happyGoto action_35
action_84 (15) = happyGoto action_91
action_84 (16) = happyGoto action_92
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (20) = happyShift action_38
action_85 (21) = happyShift action_39
action_85 (28) = happyShift action_40
action_85 (44) = happyShift action_41
action_85 (45) = happyShift action_42
action_85 (47) = happyShift action_43
action_85 (5) = happyGoto action_34
action_85 (8) = happyGoto action_35
action_85 (15) = happyGoto action_89
action_85 (16) = happyGoto action_90
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (20) = happyShift action_38
action_86 (21) = happyShift action_39
action_86 (28) = happyShift action_40
action_86 (44) = happyShift action_41
action_86 (45) = happyShift action_42
action_86 (47) = happyShift action_43
action_86 (5) = happyGoto action_34
action_86 (8) = happyGoto action_35
action_86 (15) = happyGoto action_87
action_86 (16) = happyGoto action_88
action_86 _ = happyFail (happyExpListPerState 86)

action_87 _ = happyReduce_54

action_88 _ = happyReduce_53

action_89 _ = happyReduce_50

action_90 _ = happyReduce_49

action_91 _ = happyReduce_46

action_92 _ = happyReduce_45

action_93 _ = happyReduce_52

action_94 _ = happyReduce_51

action_95 _ = happyReduce_48

action_96 _ = happyReduce_47

action_97 _ = happyReduce_44

action_98 _ = happyReduce_43

action_99 (20) = happyShift action_11
action_99 (21) = happyShift action_12
action_99 (28) = happyShift action_13
action_99 (31) = happyShift action_14
action_99 (33) = happyShift action_15
action_99 (41) = happyShift action_3
action_99 (4) = happyGoto action_111
action_99 (5) = happyGoto action_5
action_99 (6) = happyGoto action_6
action_99 (9) = happyGoto action_7
action_99 (10) = happyGoto action_8
action_99 (11) = happyGoto action_9
action_99 (17) = happyGoto action_2
action_99 (18) = happyGoto action_10
action_99 _ = happyFail (happyExpListPerState 99)

action_100 _ = happyReduce_56

action_101 _ = happyReduce_35

action_102 (20) = happyShift action_11
action_102 (21) = happyShift action_46
action_102 (28) = happyShift action_47
action_102 (5) = happyGoto action_109
action_102 (14) = happyGoto action_110
action_102 _ = happyFail (happyExpListPerState 102)

action_103 _ = happyReduce_32

action_104 (21) = happyShift action_17
action_104 (9) = happyGoto action_72
action_104 (12) = happyGoto action_108
action_104 _ = happyFail (happyExpListPerState 104)

action_105 _ = happyReduce_63

action_106 (21) = happyShift action_17
action_106 (9) = happyGoto action_7
action_106 (10) = happyGoto action_70
action_106 (19) = happyGoto action_107
action_106 _ = happyFail (happyExpListPerState 106)

action_107 _ = happyReduce_64

action_108 _ = happyReduce_33

action_109 (24) = happyShift action_28
action_109 (25) = happyShift action_29
action_109 (26) = happyShift action_30
action_109 (27) = happyShift action_31
action_109 (32) = happyShift action_113
action_109 (35) = happyShift action_114
action_109 _ = happyFail (happyExpListPerState 109)

action_110 _ = happyReduce_36

action_111 (40) = happyShift action_32
action_111 (42) = happyShift action_112
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (30) = happyShift action_116
action_112 _ = happyFail (happyExpListPerState 112)

action_113 _ = happyReduce_37

action_114 (20) = happyShift action_11
action_114 (21) = happyShift action_46
action_114 (28) = happyShift action_47
action_114 (5) = happyGoto action_109
action_114 (14) = happyGoto action_115
action_114 _ = happyFail (happyExpListPerState 114)

action_115 _ = happyReduce_38

action_116 (20) = happyShift action_11
action_116 (21) = happyShift action_12
action_116 (28) = happyShift action_13
action_116 (31) = happyShift action_14
action_116 (33) = happyShift action_15
action_116 (41) = happyShift action_3
action_116 (4) = happyGoto action_117
action_116 (5) = happyGoto action_5
action_116 (6) = happyGoto action_6
action_116 (9) = happyGoto action_7
action_116 (10) = happyGoto action_8
action_116 (11) = happyGoto action_9
action_116 (17) = happyGoto action_2
action_116 (18) = happyGoto action_10
action_116 _ = happyFail (happyExpListPerState 116)

action_117 _ = happyReduce_59

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

happyReduce_7 = happySpecReduce_1  4 happyReduction_7
happyReduction_7 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn4
		 (LOL happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  5 happyReduction_8
happyReduction_8 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MathsPlus happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MathsMinus happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  5 happyReduction_10
happyReduction_10 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MathsTimes happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  5 happyReduction_11
happyReduction_11 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MathsDevide happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  5 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  5 happyReduction_13
happyReduction_13 (HappyTerminal (TokenIntValue _ happy_var_1))
	 =  HappyAbsSyn5
		 (MathsInt happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  5 happyReduction_14
happyReduction_14 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn5
		 (MathsVar happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  6 happyReduction_15
happyReduction_15 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (EqualsInOut happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (EqualsInMaths happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  6 happyReduction_17
happyReduction_17 (HappyAbsSyn5  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (EqualsVarMaths happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  6 happyReduction_18
happyReduction_18 (HappyAbsSyn8  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (EqualsVarBool happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  6 happyReduction_19
happyReduction_19 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (EqualsVarVar happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  7 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn7
		 (TBool
	)

happyReduce_21 = happySpecReduce_1  7 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn7
		 (TInt
	)

happyReduce_22 = happySpecReduce_1  8 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn8
		 (True
	)

happyReduce_23 = happySpecReduce_1  8 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn8
		 (False
	)

happyReduce_24 = happySpecReduce_3  9 happyReduction_24
happyReduction_24 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn9
		 (Var_ happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  10 happyReduction_25
happyReduction_25 (HappyTerminal (TokenIntValue _ happy_var_3))
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (VarIntInit_ happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  10 happyReduction_26
happyReduction_26 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (VarBoolInit_ happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  10 happyReduction_27
happyReduction_27 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (VarStrInit_ happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  11 happyReduction_28
happyReduction_28 _
	_
	 =  HappyAbsSyn11
		 (EmptyMatch
	)

happyReduce_29 = happySpecReduce_3  11 happyReduction_29
happyReduction_29 _
	_
	_
	 =  HappyAbsSyn11
		 (EOFMatch
	)

happyReduce_30 = happySpecReduce_3  11 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (SingleMatch happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happyReduce 4 11 happyReduction_31
happyReduction_31 ((HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (MultipleMatch happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_32 = happySpecReduce_2  12 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn12
		 (SingleMatch happy_var_1
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  12 happyReduction_33
happyReduction_33 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn12
		 (MultipleMatch happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_2  13 happyReduction_34
happyReduction_34 _
	_
	 =  HappyAbsSyn13
		 (EmptyOutPatter
	)

happyReduce_35 = happySpecReduce_3  13 happyReduction_35
happyReduction_35 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (SingleOutPattern happy_var_2
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happyReduce 4 13 happyReduction_36
happyReduction_36 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (MultipleOutPattern happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_2  14 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn14
		 (SingleOutPattern happy_var_1
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  14 happyReduction_38
happyReduction_38 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn14
		 (MultipleOutPattern happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  15 happyReduction_39
happyReduction_39 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn15
		 (ComparablesVar happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  15 happyReduction_40
happyReduction_40 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn15
		 (ComparablesMaths happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  15 happyReduction_41
happyReduction_41 (HappyTerminal (TokenIntValue _ happy_var_1))
	 =  HappyAbsSyn15
		 (ComparablesInt happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  15 happyReduction_42
happyReduction_42 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn15
		 (ComparablesBool happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  16 happyReduction_43
happyReduction_43 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (EqualsToLR happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  16 happyReduction_44
happyReduction_44 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (EqualsToL happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  16 happyReduction_45
happyReduction_45 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 (EqualsToR happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  16 happyReduction_46
happyReduction_46 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 (EqualsTo happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  16 happyReduction_47
happyReduction_47 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (SmallerThanLR happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  16 happyReduction_48
happyReduction_48 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (SmallerThanL happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  16 happyReduction_49
happyReduction_49 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 (SmallerThanR happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  16 happyReduction_50
happyReduction_50 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 (SmallerThan happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  16 happyReduction_51
happyReduction_51 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (GreaterThanLR happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  16 happyReduction_52
happyReduction_52 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (GreaterThanL happy_var_1 happy_var_3
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  16 happyReduction_53
happyReduction_53 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 (GreaterThanR happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  16 happyReduction_54
happyReduction_54 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 (GreaterThan happy_var_1 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_2  16 happyReduction_55
happyReduction_55 (HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (Not happy_var_2
	)
happyReduction_55 _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  16 happyReduction_56
happyReduction_56 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  16 happyReduction_57
happyReduction_57 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn16
		 (ComparableExpVar happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  16 happyReduction_58
happyReduction_58 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn16
		 (ComparableExpBool happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happyReduce 9 17 happyReduction_59
happyReduction_59 ((HappyAbsSyn4  happy_var_9) `HappyStk`
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

happyReduce_60 = happySpecReduce_2  18 happyReduction_60
happyReduction_60 _
	_
	 =  HappyAbsSyn18
		 (EmptyInitArea
	)

happyReduce_61 = happySpecReduce_3  18 happyReduction_61
happyReduction_61 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (SingleInitArea happy_var_2
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happyReduce 4 18 happyReduction_62
happyReduction_62 ((HappyAbsSyn19  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (MultipleInitArea happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_63 = happySpecReduce_2  19 happyReduction_63
happyReduction_63 _
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn19
		 (SingleInitArea happy_var_1
	)
happyReduction_63 _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  19 happyReduction_64
happyReduction_64 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn19
		 (MultipleInitArea happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 50 50 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenIntValue _ happy_dollar_dollar -> cont 20;
	TokenVar _ happy_dollar_dollar -> cont 21;
	TokenFuncName _ happy_dollar_dollar -> cont 22;
	TokenEq _ -> cont 23;
	TokenPlus _ -> cont 24;
	TokenMinus _ -> cont 25;
	TokenTimes _ -> cont 26;
	TokenDiv _ -> cont 27;
	TokenLParen _ -> cont 28;
	TokenRParen _ -> cont 29;
	TokenColon _ -> cont 30;
	TokenLBracket _ -> cont 31;
	TokenRBracket _ -> cont 32;
	TokenLCurlyBracket _ -> cont 33;
	TokenRCurlyBracket _ -> cont 34;
	TokenComma _ -> cont 35;
	TokenPipe _ -> cont 36;
	TokenTypeInt _ -> cont 37;
	TokenEOF _ -> cont 38;
	TokenTypeBool _ -> cont 39;
	TokenSemiColon _ -> cont 40;
	TokenIf _ -> cont 41;
	TokenElse _ -> cont 42;
	TokenMain _ -> cont 43;
	TokenTrueValue _ -> cont 44;
	TokenFalseValue _ -> cont 45;
	TokenCompare _ -> cont 46;
	TokenNot _ -> cont 47;
	TokenSmallerThan _ -> cont 48;
	TokenGreaterThan _ -> cont 49;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 50 tk tks = happyError' (tks, explist)
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
          | LOL FuncBodyInitArea_
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

