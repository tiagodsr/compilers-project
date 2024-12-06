{-# OPTIONS_GHC -w #-}
module Parser where 
import Lexer
import AST
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,270) ([0,4,0,0,8,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,16384,0,0,0,0,0,0,2,0,0,8,44992,1027,532,0,0,64,48896,4110,2128,0,0,512,0,49024,15,0,0,0,0,0,0,0,512,384,0,0,0,0,2,0,0,4,0,0,0,8192,0,0,16384,0,0,32768,0,0,0,1,480,513,258,960,1026,516,24448,2055,1128,3840,4104,2064,0,0,0,0,0,0,0,0,1024,0,0,0,0,64512,1151,0,0,56,0,0,4096,0,2063,4112,8,4126,8224,16,8252,16448,32,32768,0,0,0,1,0,480,513,258,0,0,0,0,0,0,3840,4104,2064,7680,8208,4128,15360,16416,8256,30720,32832,16512,61440,128,33025,57344,257,514,49153,515,1028,32770,1031,2056,4,2063,4112,8,4126,8224,16,8252,16448,32,16504,32896,64,33008,256,129,480,513,258,0,0,0,0,0,0,0,0,0,0,65472,3,0,65408,3,0,0,0,0,0,0,0,0,0,0,0,56,0,0,112,0,0,248,0,0,496,0,0,992,0,0,1984,0,0,4088,0,0,8176,0,0,65528,128,0,0,16,0,65504,3,7680,8208,4128,15360,16416,8256,0,65280,287,0,65024,575,0,64512,1151,0,0,0,0,0,0,0,0,0,0,0,0,2,15100,16448,33,30200,32896,66,0,16382,0,0,32764,0,0,0,0,1920,2052,1032,0,0,0,0,2,0,0,0,0,0,0,0,61440,235,34049,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Program","Fn","FunMain","id_main","Stmts","Stmt","Simple","Exp","ParamCall","num","str","id","bol","val_decl","var_decl","fun","if","else","while","print","readln","'='","'=='","'!='","'<'","'>'","'<='","'>='","'+'","'-'","'*'","'/'","'%'","'&&'","'||'","'++'","'--'","'('","')'","'{'","'}'","';'","','","':'","'!'","%eof"]
        bit_start = st Prelude.* 49
        bit_end = (st Prelude.+ 1) Prelude.* 49
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..48]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (19) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (19) = happyShift action_4
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 _ = happyReduce_2

action_4 (15) = happyShift action_7
action_4 (7) = happyGoto action_6
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (49) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (41) = happyShift action_8
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_4

action_8 (42) = happyShift action_9
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (43) = happyShift action_10
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (13) = happyShift action_15
action_10 (14) = happyShift action_16
action_10 (15) = happyShift action_17
action_10 (16) = happyShift action_18
action_10 (17) = happyShift action_19
action_10 (18) = happyShift action_20
action_10 (20) = happyShift action_21
action_10 (22) = happyShift action_22
action_10 (23) = happyShift action_23
action_10 (24) = happyShift action_24
action_10 (33) = happyShift action_25
action_10 (41) = happyShift action_26
action_10 (43) = happyShift action_27
action_10 (48) = happyShift action_28
action_10 (8) = happyGoto action_11
action_10 (9) = happyGoto action_12
action_10 (10) = happyGoto action_13
action_10 (11) = happyGoto action_14
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (44) = happyShift action_60
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (13) = happyShift action_15
action_12 (14) = happyShift action_16
action_12 (15) = happyShift action_17
action_12 (16) = happyShift action_18
action_12 (17) = happyShift action_19
action_12 (18) = happyShift action_20
action_12 (20) = happyShift action_21
action_12 (22) = happyShift action_22
action_12 (23) = happyShift action_23
action_12 (24) = happyShift action_24
action_12 (33) = happyShift action_25
action_12 (41) = happyShift action_26
action_12 (43) = happyShift action_27
action_12 (48) = happyShift action_28
action_12 (8) = happyGoto action_59
action_12 (9) = happyGoto action_12
action_12 (10) = happyGoto action_13
action_12 (11) = happyGoto action_14
action_12 _ = happyReduce_5

action_13 (45) = happyShift action_58
action_13 _ = happyReduce_7

action_14 (26) = happyShift action_45
action_14 (27) = happyShift action_46
action_14 (28) = happyShift action_47
action_14 (29) = happyShift action_48
action_14 (30) = happyShift action_49
action_14 (31) = happyShift action_50
action_14 (32) = happyShift action_51
action_14 (33) = happyShift action_52
action_14 (34) = happyShift action_53
action_14 (35) = happyShift action_54
action_14 (36) = happyShift action_55
action_14 (37) = happyShift action_56
action_14 (38) = happyShift action_57
action_14 _ = happyReduce_21

action_15 _ = happyReduce_22

action_16 _ = happyReduce_23

action_17 (25) = happyShift action_41
action_17 (39) = happyShift action_42
action_17 (40) = happyShift action_43
action_17 (41) = happyShift action_44
action_17 _ = happyReduce_24

action_18 _ = happyReduce_25

action_19 (15) = happyShift action_40
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (15) = happyShift action_39
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (41) = happyShift action_38
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (41) = happyShift action_37
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (41) = happyShift action_36
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (41) = happyShift action_35
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (13) = happyShift action_15
action_25 (14) = happyShift action_16
action_25 (15) = happyShift action_30
action_25 (16) = happyShift action_18
action_25 (24) = happyShift action_24
action_25 (33) = happyShift action_25
action_25 (41) = happyShift action_26
action_25 (48) = happyShift action_28
action_25 (11) = happyGoto action_34
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (13) = happyShift action_15
action_26 (14) = happyShift action_16
action_26 (15) = happyShift action_30
action_26 (16) = happyShift action_18
action_26 (24) = happyShift action_24
action_26 (33) = happyShift action_25
action_26 (41) = happyShift action_26
action_26 (48) = happyShift action_28
action_26 (11) = happyGoto action_33
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (13) = happyShift action_15
action_27 (14) = happyShift action_16
action_27 (15) = happyShift action_17
action_27 (16) = happyShift action_18
action_27 (17) = happyShift action_19
action_27 (18) = happyShift action_20
action_27 (20) = happyShift action_21
action_27 (22) = happyShift action_22
action_27 (23) = happyShift action_23
action_27 (24) = happyShift action_24
action_27 (33) = happyShift action_25
action_27 (41) = happyShift action_26
action_27 (43) = happyShift action_27
action_27 (44) = happyShift action_32
action_27 (48) = happyShift action_28
action_27 (8) = happyGoto action_31
action_27 (9) = happyGoto action_12
action_27 (10) = happyGoto action_13
action_27 (11) = happyGoto action_14
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (13) = happyShift action_15
action_28 (14) = happyShift action_16
action_28 (15) = happyShift action_30
action_28 (16) = happyShift action_18
action_28 (24) = happyShift action_24
action_28 (33) = happyShift action_25
action_28 (41) = happyShift action_26
action_28 (48) = happyShift action_28
action_28 (11) = happyGoto action_29
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_36

action_30 (41) = happyShift action_44
action_30 _ = happyReduce_24

action_31 (44) = happyShift action_84
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_15

action_33 (26) = happyShift action_45
action_33 (27) = happyShift action_46
action_33 (28) = happyShift action_47
action_33 (29) = happyShift action_48
action_33 (30) = happyShift action_49
action_33 (31) = happyShift action_50
action_33 (32) = happyShift action_51
action_33 (33) = happyShift action_52
action_33 (34) = happyShift action_53
action_33 (35) = happyShift action_54
action_33 (36) = happyShift action_55
action_33 (37) = happyShift action_56
action_33 (38) = happyShift action_57
action_33 (42) = happyShift action_83
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (34) = happyShift action_53
action_34 (35) = happyShift action_54
action_34 (36) = happyShift action_55
action_34 _ = happyReduce_37

action_35 (42) = happyShift action_82
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (13) = happyShift action_15
action_36 (14) = happyShift action_16
action_36 (15) = happyShift action_30
action_36 (16) = happyShift action_18
action_36 (24) = happyShift action_24
action_36 (33) = happyShift action_25
action_36 (41) = happyShift action_26
action_36 (48) = happyShift action_28
action_36 (11) = happyGoto action_81
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (13) = happyShift action_15
action_37 (14) = happyShift action_16
action_37 (15) = happyShift action_30
action_37 (16) = happyShift action_18
action_37 (24) = happyShift action_24
action_37 (33) = happyShift action_25
action_37 (41) = happyShift action_26
action_37 (48) = happyShift action_28
action_37 (11) = happyGoto action_80
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (13) = happyShift action_15
action_38 (14) = happyShift action_16
action_38 (15) = happyShift action_30
action_38 (16) = happyShift action_18
action_38 (24) = happyShift action_24
action_38 (33) = happyShift action_25
action_38 (41) = happyShift action_26
action_38 (48) = happyShift action_28
action_38 (11) = happyGoto action_79
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (25) = happyShift action_78
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (25) = happyShift action_77
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (13) = happyShift action_15
action_41 (14) = happyShift action_16
action_41 (15) = happyShift action_30
action_41 (16) = happyShift action_18
action_41 (24) = happyShift action_24
action_41 (33) = happyShift action_25
action_41 (41) = happyShift action_26
action_41 (48) = happyShift action_28
action_41 (11) = happyGoto action_76
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_19

action_43 _ = happyReduce_20

action_44 (13) = happyShift action_15
action_44 (14) = happyShift action_16
action_44 (15) = happyShift action_30
action_44 (16) = happyShift action_18
action_44 (24) = happyShift action_24
action_44 (33) = happyShift action_25
action_44 (41) = happyShift action_26
action_44 (48) = happyShift action_28
action_44 (11) = happyGoto action_74
action_44 (12) = happyGoto action_75
action_44 _ = happyReduce_46

action_45 (13) = happyShift action_15
action_45 (14) = happyShift action_16
action_45 (15) = happyShift action_30
action_45 (16) = happyShift action_18
action_45 (24) = happyShift action_24
action_45 (33) = happyShift action_25
action_45 (41) = happyShift action_26
action_45 (48) = happyShift action_28
action_45 (11) = happyGoto action_73
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (13) = happyShift action_15
action_46 (14) = happyShift action_16
action_46 (15) = happyShift action_30
action_46 (16) = happyShift action_18
action_46 (24) = happyShift action_24
action_46 (33) = happyShift action_25
action_46 (41) = happyShift action_26
action_46 (48) = happyShift action_28
action_46 (11) = happyGoto action_72
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (13) = happyShift action_15
action_47 (14) = happyShift action_16
action_47 (15) = happyShift action_30
action_47 (16) = happyShift action_18
action_47 (24) = happyShift action_24
action_47 (33) = happyShift action_25
action_47 (41) = happyShift action_26
action_47 (48) = happyShift action_28
action_47 (11) = happyGoto action_71
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (13) = happyShift action_15
action_48 (14) = happyShift action_16
action_48 (15) = happyShift action_30
action_48 (16) = happyShift action_18
action_48 (24) = happyShift action_24
action_48 (33) = happyShift action_25
action_48 (41) = happyShift action_26
action_48 (48) = happyShift action_28
action_48 (11) = happyGoto action_70
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (13) = happyShift action_15
action_49 (14) = happyShift action_16
action_49 (15) = happyShift action_30
action_49 (16) = happyShift action_18
action_49 (24) = happyShift action_24
action_49 (33) = happyShift action_25
action_49 (41) = happyShift action_26
action_49 (48) = happyShift action_28
action_49 (11) = happyGoto action_69
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (13) = happyShift action_15
action_50 (14) = happyShift action_16
action_50 (15) = happyShift action_30
action_50 (16) = happyShift action_18
action_50 (24) = happyShift action_24
action_50 (33) = happyShift action_25
action_50 (41) = happyShift action_26
action_50 (48) = happyShift action_28
action_50 (11) = happyGoto action_68
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (13) = happyShift action_15
action_51 (14) = happyShift action_16
action_51 (15) = happyShift action_30
action_51 (16) = happyShift action_18
action_51 (24) = happyShift action_24
action_51 (33) = happyShift action_25
action_51 (41) = happyShift action_26
action_51 (48) = happyShift action_28
action_51 (11) = happyGoto action_67
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (13) = happyShift action_15
action_52 (14) = happyShift action_16
action_52 (15) = happyShift action_30
action_52 (16) = happyShift action_18
action_52 (24) = happyShift action_24
action_52 (33) = happyShift action_25
action_52 (41) = happyShift action_26
action_52 (48) = happyShift action_28
action_52 (11) = happyGoto action_66
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (13) = happyShift action_15
action_53 (14) = happyShift action_16
action_53 (15) = happyShift action_30
action_53 (16) = happyShift action_18
action_53 (24) = happyShift action_24
action_53 (33) = happyShift action_25
action_53 (41) = happyShift action_26
action_53 (48) = happyShift action_28
action_53 (11) = happyGoto action_65
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (13) = happyShift action_15
action_54 (14) = happyShift action_16
action_54 (15) = happyShift action_30
action_54 (16) = happyShift action_18
action_54 (24) = happyShift action_24
action_54 (33) = happyShift action_25
action_54 (41) = happyShift action_26
action_54 (48) = happyShift action_28
action_54 (11) = happyGoto action_64
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (13) = happyShift action_15
action_55 (14) = happyShift action_16
action_55 (15) = happyShift action_30
action_55 (16) = happyShift action_18
action_55 (24) = happyShift action_24
action_55 (33) = happyShift action_25
action_55 (41) = happyShift action_26
action_55 (48) = happyShift action_28
action_55 (11) = happyGoto action_63
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (13) = happyShift action_15
action_56 (14) = happyShift action_16
action_56 (15) = happyShift action_30
action_56 (16) = happyShift action_18
action_56 (24) = happyShift action_24
action_56 (33) = happyShift action_25
action_56 (41) = happyShift action_26
action_56 (48) = happyShift action_28
action_56 (11) = happyGoto action_62
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (13) = happyShift action_15
action_57 (14) = happyShift action_16
action_57 (15) = happyShift action_30
action_57 (16) = happyShift action_18
action_57 (24) = happyShift action_24
action_57 (33) = happyShift action_25
action_57 (41) = happyShift action_26
action_57 (48) = happyShift action_28
action_57 (11) = happyGoto action_61
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_8

action_59 _ = happyReduce_6

action_60 _ = happyReduce_3

action_61 (26) = happyShift action_45
action_61 (27) = happyShift action_46
action_61 (28) = happyShift action_47
action_61 (29) = happyShift action_48
action_61 (30) = happyShift action_49
action_61 (31) = happyShift action_50
action_61 (32) = happyShift action_51
action_61 (33) = happyShift action_52
action_61 (34) = happyShift action_53
action_61 (35) = happyShift action_54
action_61 (36) = happyShift action_55
action_61 (37) = happyShift action_56
action_61 _ = happyReduce_35

action_62 (26) = happyShift action_45
action_62 (27) = happyShift action_46
action_62 (28) = happyShift action_47
action_62 (29) = happyShift action_48
action_62 (30) = happyShift action_49
action_62 (31) = happyShift action_50
action_62 (32) = happyShift action_51
action_62 (33) = happyShift action_52
action_62 (34) = happyShift action_53
action_62 (35) = happyShift action_54
action_62 (36) = happyShift action_55
action_62 _ = happyReduce_34

action_63 _ = happyReduce_33

action_64 _ = happyReduce_32

action_65 _ = happyReduce_31

action_66 (34) = happyShift action_53
action_66 (35) = happyShift action_54
action_66 (36) = happyShift action_55
action_66 _ = happyReduce_30

action_67 (34) = happyShift action_53
action_67 (35) = happyShift action_54
action_67 (36) = happyShift action_55
action_67 _ = happyReduce_29

action_68 (32) = happyShift action_51
action_68 (33) = happyShift action_52
action_68 (34) = happyShift action_53
action_68 (35) = happyShift action_54
action_68 (36) = happyShift action_55
action_68 _ = happyReduce_42

action_69 (32) = happyShift action_51
action_69 (33) = happyShift action_52
action_69 (34) = happyShift action_53
action_69 (35) = happyShift action_54
action_69 (36) = happyShift action_55
action_69 _ = happyReduce_41

action_70 (32) = happyShift action_51
action_70 (33) = happyShift action_52
action_70 (34) = happyShift action_53
action_70 (35) = happyShift action_54
action_70 (36) = happyShift action_55
action_70 _ = happyReduce_39

action_71 (32) = happyShift action_51
action_71 (33) = happyShift action_52
action_71 (34) = happyShift action_53
action_71 (35) = happyShift action_54
action_71 (36) = happyShift action_55
action_71 _ = happyReduce_38

action_72 (28) = happyShift action_47
action_72 (29) = happyShift action_48
action_72 (30) = happyShift action_49
action_72 (31) = happyShift action_50
action_72 (32) = happyShift action_51
action_72 (33) = happyShift action_52
action_72 (34) = happyShift action_53
action_72 (35) = happyShift action_54
action_72 (36) = happyShift action_55
action_72 _ = happyReduce_43

action_73 (28) = happyShift action_47
action_73 (29) = happyShift action_48
action_73 (30) = happyShift action_49
action_73 (31) = happyShift action_50
action_73 (32) = happyShift action_51
action_73 (33) = happyShift action_52
action_73 (34) = happyShift action_53
action_73 (35) = happyShift action_54
action_73 (36) = happyShift action_55
action_73 _ = happyReduce_40

action_74 (26) = happyShift action_45
action_74 (27) = happyShift action_46
action_74 (28) = happyShift action_47
action_74 (29) = happyShift action_48
action_74 (30) = happyShift action_49
action_74 (31) = happyShift action_50
action_74 (32) = happyShift action_51
action_74 (33) = happyShift action_52
action_74 (34) = happyShift action_53
action_74 (35) = happyShift action_54
action_74 (36) = happyShift action_55
action_74 (37) = happyShift action_56
action_74 (38) = happyShift action_57
action_74 (46) = happyShift action_91
action_74 _ = happyReduce_44

action_75 (42) = happyShift action_90
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (26) = happyShift action_45
action_76 (27) = happyShift action_46
action_76 (28) = happyShift action_47
action_76 (29) = happyShift action_48
action_76 (30) = happyShift action_49
action_76 (31) = happyShift action_50
action_76 (32) = happyShift action_51
action_76 (33) = happyShift action_52
action_76 (34) = happyShift action_53
action_76 (35) = happyShift action_54
action_76 (36) = happyShift action_55
action_76 (37) = happyShift action_56
action_76 (38) = happyShift action_57
action_76 _ = happyReduce_18

action_77 (13) = happyShift action_15
action_77 (14) = happyShift action_16
action_77 (15) = happyShift action_30
action_77 (16) = happyShift action_18
action_77 (24) = happyShift action_24
action_77 (33) = happyShift action_25
action_77 (41) = happyShift action_26
action_77 (48) = happyShift action_28
action_77 (11) = happyGoto action_89
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (13) = happyShift action_15
action_78 (14) = happyShift action_16
action_78 (15) = happyShift action_30
action_78 (16) = happyShift action_18
action_78 (24) = happyShift action_24
action_78 (33) = happyShift action_25
action_78 (41) = happyShift action_26
action_78 (48) = happyShift action_28
action_78 (11) = happyGoto action_88
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (26) = happyShift action_45
action_79 (27) = happyShift action_46
action_79 (28) = happyShift action_47
action_79 (29) = happyShift action_48
action_79 (30) = happyShift action_49
action_79 (31) = happyShift action_50
action_79 (32) = happyShift action_51
action_79 (33) = happyShift action_52
action_79 (34) = happyShift action_53
action_79 (35) = happyShift action_54
action_79 (36) = happyShift action_55
action_79 (37) = happyShift action_56
action_79 (38) = happyShift action_57
action_79 (42) = happyShift action_87
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (26) = happyShift action_45
action_80 (27) = happyShift action_46
action_80 (28) = happyShift action_47
action_80 (29) = happyShift action_48
action_80 (30) = happyShift action_49
action_80 (31) = happyShift action_50
action_80 (32) = happyShift action_51
action_80 (33) = happyShift action_52
action_80 (34) = happyShift action_53
action_80 (35) = happyShift action_54
action_80 (36) = happyShift action_55
action_80 (37) = happyShift action_56
action_80 (38) = happyShift action_57
action_80 (42) = happyShift action_86
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (26) = happyShift action_45
action_81 (27) = happyShift action_46
action_81 (28) = happyShift action_47
action_81 (29) = happyShift action_48
action_81 (30) = happyShift action_49
action_81 (31) = happyShift action_50
action_81 (32) = happyShift action_51
action_81 (33) = happyShift action_52
action_81 (34) = happyShift action_53
action_81 (35) = happyShift action_54
action_81 (36) = happyShift action_55
action_81 (37) = happyShift action_56
action_81 (38) = happyShift action_57
action_81 (42) = happyShift action_85
action_81 _ = happyFail (happyExpListPerState 81)

action_82 _ = happyReduce_28

action_83 _ = happyReduce_26

action_84 _ = happyReduce_14

action_85 (45) = happyShift action_95
action_85 _ = happyReduce_9

action_86 (13) = happyShift action_15
action_86 (14) = happyShift action_16
action_86 (15) = happyShift action_17
action_86 (16) = happyShift action_18
action_86 (17) = happyShift action_19
action_86 (18) = happyShift action_20
action_86 (20) = happyShift action_21
action_86 (22) = happyShift action_22
action_86 (23) = happyShift action_23
action_86 (24) = happyShift action_24
action_86 (33) = happyShift action_25
action_86 (41) = happyShift action_26
action_86 (43) = happyShift action_27
action_86 (48) = happyShift action_28
action_86 (9) = happyGoto action_94
action_86 (10) = happyGoto action_13
action_86 (11) = happyGoto action_14
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (13) = happyShift action_15
action_87 (14) = happyShift action_16
action_87 (15) = happyShift action_17
action_87 (16) = happyShift action_18
action_87 (17) = happyShift action_19
action_87 (18) = happyShift action_20
action_87 (20) = happyShift action_21
action_87 (22) = happyShift action_22
action_87 (23) = happyShift action_23
action_87 (24) = happyShift action_24
action_87 (33) = happyShift action_25
action_87 (41) = happyShift action_26
action_87 (43) = happyShift action_27
action_87 (48) = happyShift action_28
action_87 (9) = happyGoto action_93
action_87 (10) = happyGoto action_13
action_87 (11) = happyGoto action_14
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (26) = happyShift action_45
action_88 (27) = happyShift action_46
action_88 (28) = happyShift action_47
action_88 (29) = happyShift action_48
action_88 (30) = happyShift action_49
action_88 (31) = happyShift action_50
action_88 (32) = happyShift action_51
action_88 (33) = happyShift action_52
action_88 (34) = happyShift action_53
action_88 (35) = happyShift action_54
action_88 (36) = happyShift action_55
action_88 (37) = happyShift action_56
action_88 (38) = happyShift action_57
action_88 _ = happyReduce_17

action_89 (26) = happyShift action_45
action_89 (27) = happyShift action_46
action_89 (28) = happyShift action_47
action_89 (29) = happyShift action_48
action_89 (30) = happyShift action_49
action_89 (31) = happyShift action_50
action_89 (32) = happyShift action_51
action_89 (33) = happyShift action_52
action_89 (34) = happyShift action_53
action_89 (35) = happyShift action_54
action_89 (36) = happyShift action_55
action_89 (37) = happyShift action_56
action_89 (38) = happyShift action_57
action_89 _ = happyReduce_16

action_90 _ = happyReduce_27

action_91 (13) = happyShift action_15
action_91 (14) = happyShift action_16
action_91 (15) = happyShift action_30
action_91 (16) = happyShift action_18
action_91 (24) = happyShift action_24
action_91 (33) = happyShift action_25
action_91 (41) = happyShift action_26
action_91 (48) = happyShift action_28
action_91 (11) = happyGoto action_74
action_91 (12) = happyGoto action_92
action_91 _ = happyReduce_46

action_92 _ = happyReduce_45

action_93 (21) = happyShift action_96
action_93 _ = happyReduce_12

action_94 _ = happyReduce_11

action_95 _ = happyReduce_10

action_96 (13) = happyShift action_15
action_96 (14) = happyShift action_16
action_96 (15) = happyShift action_17
action_96 (16) = happyShift action_18
action_96 (17) = happyShift action_19
action_96 (18) = happyShift action_20
action_96 (20) = happyShift action_21
action_96 (22) = happyShift action_22
action_96 (23) = happyShift action_23
action_96 (24) = happyShift action_24
action_96 (33) = happyShift action_25
action_96 (41) = happyShift action_26
action_96 (43) = happyShift action_27
action_96 (48) = happyShift action_28
action_96 (9) = happyGoto action_97
action_96 (10) = happyGoto action_13
action_96 (11) = happyGoto action_14
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_13

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happyReduce 7 6 happyReduction_3
happyReduction_3 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Main happy_var_6
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_1  7 happyReduction_4
happyReduction_4 (HappyTerminal (Tid happy_var_1))
	 =  HappyAbsSyn7
		 (if happy_var_1 == "main" then happy_var_1 else parseError []
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  8 happyReduction_5
happyReduction_5 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  8 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 : happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  9 happyReduction_7
happyReduction_7 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (Simple happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  9 happyReduction_8
happyReduction_8 _
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (Simple happy_var_1
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happyReduce 4 9 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Print happy_var_3
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 5 9 happyReduction_10
happyReduction_10 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Print happy_var_3
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 5 9 happyReduction_11
happyReduction_11 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (While happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 5 9 happyReduction_12
happyReduction_12 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (If happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 7 9 happyReduction_13
happyReduction_13 ((HappyAbsSyn9  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (IfElse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_3  9 happyReduction_14
happyReduction_14 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Block happy_var_2
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  9 happyReduction_15
happyReduction_15 _
	_
	 =  HappyAbsSyn9
		 (Block []
	)

happyReduce_16 = happyReduce 4 10 happyReduction_16
happyReduction_16 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Tid happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (DefVal happy_var_2 (Just happy_var_4)
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 4 10 happyReduction_17
happyReduction_17 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Tid happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (DefVar happy_var_2 (Just happy_var_4)
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_3  10 happyReduction_18
happyReduction_18 (HappyAbsSyn11  happy_var_3)
	_
	(HappyTerminal (Tid happy_var_1))
	 =  HappyAbsSyn10
		 (Assign happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  10 happyReduction_19
happyReduction_19 _
	(HappyTerminal (Tid happy_var_1))
	 =  HappyAbsSyn10
		 (Incr happy_var_1
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  10 happyReduction_20
happyReduction_20 _
	(HappyTerminal (Tid happy_var_1))
	 =  HappyAbsSyn10
		 (Decr happy_var_1
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  10 happyReduction_21
happyReduction_21 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Expression happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 (HappyTerminal (Tnum happy_var_1))
	 =  HappyAbsSyn11
		 (Num happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  11 happyReduction_23
happyReduction_23 (HappyTerminal (Str happy_var_1))
	 =  HappyAbsSyn11
		 (StringVal happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  11 happyReduction_24
happyReduction_24 (HappyTerminal (Tid happy_var_1))
	 =  HappyAbsSyn11
		 (Ident happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  11 happyReduction_25
happyReduction_25 (HappyTerminal (Bol happy_var_1))
	 =  HappyAbsSyn11
		 (BoolVal happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  11 happyReduction_26
happyReduction_26 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happyReduce 4 11 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Tid happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (FnCall happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_3  11 happyReduction_28
happyReduction_28 _
	_
	_
	 =  HappyAbsSyn11
		 (ReadLine
	)

happyReduce_29 = happySpecReduce_3  11 happyReduction_29
happyReduction_29 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Op Add happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  11 happyReduction_30
happyReduction_30 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Op Sub happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  11 happyReduction_31
happyReduction_31 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Op Mult happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  11 happyReduction_32
happyReduction_32 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Op Div happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  11 happyReduction_33
happyReduction_33 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Op Mod happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  11 happyReduction_34
happyReduction_34 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Op And happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  11 happyReduction_35
happyReduction_35 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Op Or happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_2  11 happyReduction_36
happyReduction_36 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Op1 Not happy_var_2
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_2  11 happyReduction_37
happyReduction_37 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Op1 Neg happy_var_2
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  11 happyReduction_38
happyReduction_38 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Op Lt happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  11 happyReduction_39
happyReduction_39 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Op Gt happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  11 happyReduction_40
happyReduction_40 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Op Eq happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  11 happyReduction_41
happyReduction_41 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Op Le happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  11 happyReduction_42
happyReduction_42 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Op Ge happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  11 happyReduction_43
happyReduction_43 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Op Ne happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  12 happyReduction_44
happyReduction_44 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  12 happyReduction_45
happyReduction_45 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_0  12 happyReduction_46
happyReduction_46  =  HappyAbsSyn12
		 ([]
	)

happyNewToken action sts stk [] =
	action 49 49 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Tnum happy_dollar_dollar -> cont 13;
	Str happy_dollar_dollar -> cont 14;
	Tid happy_dollar_dollar -> cont 15;
	Bol happy_dollar_dollar -> cont 16;
	TvalDecl -> cont 17;
	TvarDecl -> cont 18;
	Tfun -> cont 19;
	Tif -> cont 20;
	Telse -> cont 21;
	Twhile -> cont 22;
	Tprint -> cont 23;
	Treadln -> cont 24;
	Tassign -> cont 25;
	Tequal -> cont 26;
	Tnequal -> cont 27;
	Tless -> cont 28;
	Tgreater -> cont 29;
	TlessEq -> cont 30;
	TgreaterEq -> cont 31;
	Tplus -> cont 32;
	Tminus -> cont 33;
	Ttimes -> cont 34;
	Tdiv -> cont 35;
	Tmod -> cont 36;
	Tand -> cont 37;
	Tor -> cont 38;
	Tplusplus -> cont 39;
	Tminusminus -> cont 40;
	Tlparen -> cont 41;
	Trparen -> cont 42;
	Tlbrace -> cont 43;
	Trbrace -> cont 44;
	Tsemicolon -> cont 45;
	Tcomma -> cont 46;
	Tcolon -> cont 47;
	Tbang -> cont 48;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 49 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError toks = error "parse error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
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
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
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
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
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





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
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
