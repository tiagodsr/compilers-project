module IR where

import AST (BinOp(..)) 
import AST (UnOp(..))

data Instr = MOVE Temp Temp    -- temp1 := temp2
           | MOVEI Temp Int              -- temp1 := num
           | MOVES Temp Label String     -- temp1 := string
           | OP BinOp Temp Temp Temp     -- temp1 := temp2 op temp3
           | OP1 UnOp Temp Temp         -- temp1 := op temp2
           | OPI BinOp Temp Temp Int     -- temp1 := temp2 op num
           | LABEL Label                -- label no código
           | LABELF Label               -- label para função
           | JUMP Label                
           | COND Temp BinOp Temp Label Label -- condições
           | CONDF Temp BinOp Temp Label Label 
           | COND1 Temp Label Label
           | COND1F Temp Label Label
           | CALL_NOARGS Temp String  -- temp := chamada de função sem argumentos ( ex.: temp := readln() )
           | CALL Temp Temp [Temp] -- chamadas regulares
           | CALL1 Temp Temp -- chamadas simplificadas
           deriving (Eq,Show)

type Temp = String 
type Label = String
type Arg   = String 
type Saved = String



