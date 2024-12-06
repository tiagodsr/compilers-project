module CodeGen where

import IR
import AST

import Data.Map (Map)
import qualified Data.Map as Map
import Control.Monad.State (State)
import qualified Control.Monad.State as State
import Data.Set (Set)
import qualified Data.Set as Set

-- Symbol table mapping identifiers to temporaries
type Table = Map String Temp

-- Supply counters for temporaries, labels, etc.
type Supply = (Int, Int, Int, Int)

-- Generate a new temporary
newTemp :: State Supply Temp
newTemp = do
    (temps, labels, args, lstr) <- State.get
    State.put (temps + 1, labels, args, lstr)
    return ("t" ++ show temps)

-- Generate a new label
newLabel :: State Supply Label
newLabel = do
    (temps, labels, args, lstr) <- State.get
    State.put (temps, labels + 1, args, lstr)
    return ("Label" ++ show labels)

-- Generate multiple temporaries
newTemps :: Int -> State Supply [Temp]
newTemps 0 = return []
newTemps n = do
    t <- newTemp
    ts <- newTemps (n - 1)
    return (t : ts)

-- Translate a list of statements
transStmList :: [Stm] -> Table -> Label -> Label -> State Supply [Instr]
transStmList [] _ _ _ = return []
transStmList (stm : rest) table lcond lend = do
    (code1, newTable) <- transStm stm table lcond lend
    code2 <- transStmList rest newTable lcond lend
    return (code1 ++ code2)

-- Translate function definitions
transFunDef (Main stms) = do
    code <- transStmList stms Map.empty "" ""
    return ([LABELF "main"] ++ code)

-- Translate the entire program
transProgram :: [Fn] -> State Supply [Instr]
transProgram [] = return []
transProgram (Main stms : xs) = do
    mainCode <- transFunDef (Main stms)
    restCode <- transProgram xs
    return (mainCode ++ restCode)

-- Translate expressions
transExpr :: Exp -> Table -> Temp -> State Supply [Instr]
transExpr (Num n) _ dest = return [MOVEI dest n]
transExpr (BoolVal b) _ dest = return [MOVEI dest (if b then 1 else 0)]
transExpr (StringVal s) _ dest = do
    label <- newLabel
    return [MOVES dest label s]
transExpr (Ident var) table dest =
    case Map.lookup var table of
        Just temp -> return [MOVE dest temp]
        Nothing -> error $ "Variable not defined: " ++ var
transExpr (FnCall name args) table dest = do
    (code, temps) <- transArgs args table
    return (code ++ [CALL dest name temps])
transExpr (Op op e1 e2) table dest = do
    t1 <- newTemp
    t2 <- newTemp
    code1 <- transExpr e1 table t1
    code2 <- transExpr e2 table t2
    return (code1 ++ code2 ++ [OP op dest t1 t2])
transExpr (Op1 op e) table dest = do
    t1 <- newTemp
    code <- transExpr e table t1
    return (code ++ [OP1 op dest t1])
transExpr ReadLine _ dest = do
    return [CALL_NOARGS dest "readln"]

-- Translate function arguments
transArgs :: [Exp] -> Table -> State Supply ([Instr], [Temp])
transArgs [] _ = return ([], [])
transArgs (e : es) table = do
    t <- newTemp
    code1 <- transExpr e table t
    (code2, temps) <- transArgs es table
    return (code1 ++ code2, t : temps)

-- Translate simple statements
transSimple :: Simple -> Table -> State Supply ([Instr], Table)
transSimple (DefVar var (Just expr)) table = do
    temp <- newTemp
    code <- transExpr expr table temp
    let newTable = Map.insert var temp table
    return (code, newTable) -- Sem MOVE redundante
transSimple (DefVar var Nothing) table = do
    temp <- newTemp
    let newTable = Map.insert var temp table
    return ([], newTable) -- Apenas cria a variável

transSimple (DefVal var (Just expr)) table = do
    temp <- newTemp
    code <- transExpr expr table temp
    let newTable = Map.insert var temp table
    return (code, newTable) -- Sem MOVE redundante
transSimple (DefVal var Nothing) table = do
    temp <- newTemp
    let newTable = Map.insert var temp table
    return ([], newTable) -- Apenas cria a constante

transSimple (Assign var expr) table =
    case Map.lookup var table of
        Just dest -> do
            code <- transExpr expr table dest
            return (code, table) -- MOVE explícito em atribuições
        Nothing -> error $ "Variable not defined: " ++ var

transSimple (Incr var) table =
    case Map.lookup var table of
        Just dest -> return ([OPI Add dest dest 1], table)
        Nothing -> error $ "Variable not defined: " ++ var

transSimple (Decr var) table =
    case Map.lookup var table of
        Just dest -> return ([OPI Sub dest dest 1], table)
        Nothing -> error $ "Variable not defined: " ++ var

transSimple (Expression e) table = do
    temp <- newTemp
    code <- transExpr e table temp
    return (code, table)

-- Translate statements
transStm :: Stm -> Table -> Label -> Label -> State Supply ([Instr], Table)
transStm (Simple simple) table _ _ = transSimple simple table
transStm (Print exp) table _ _ = do
    case exp of
        StringVal str -> do
            temp <- newTemp
            label <- newLabel
            let newInstr = [MOVES temp label str, CALL1 "printString" temp]
            return (newInstr, table)
        Ident var -> do
            case Map.lookup var table of
                Just temp -> return ([CALL1 "print" temp], table)
                Nothing -> error $ "Variable not defined: " ++ var
        _ -> do
            temp <- newTemp
            code <- transExpr exp table temp
            return (code ++ [CALL1 "print" temp], table)

transStm (While cond body) table _ _ = do
    lcond <- newLabel
    lbody <- newLabel
    lend <- newLabel
    codeCond <- transCond cond table lbody lend
    (codeBody, newTable) <- transStm body table lcond lend
    return ([LABEL lcond] ++ codeCond ++ [LABEL lbody] ++ codeBody ++ [JUMP lcond, LABEL lend], newTable)
transStm (If cond thenStm) table _ _ = do
    ltrue <- newLabel
    lend <- newLabel
    codeCond <- transCond cond table ltrue lend
    (codeThen, newTable) <- transStm thenStm table ltrue lend
    return (codeCond ++ [LABEL ltrue] ++ codeThen ++ [LABEL lend], newTable)
transStm (IfElse cond thenStm elseStm) table _ _ = do
    ltrue <- newLabel
    lfalse <- newLabel
    lend <- newLabel
    codeCond <- transCond cond table ltrue lfalse
    (codeThen, table1) <- transStm thenStm table ltrue lend
    (codeElse, table2) <- transStm elseStm table1 lfalse lend
    return (codeCond ++ [LABEL ltrue] ++ codeThen ++ [JUMP lend, LABEL lfalse] ++ codeElse ++ [LABEL lend], table2)
transStm (Block stmts) table _ _ = do
    code <- transStmList stmts table "" ""
    return (code, table)

-- Translate conditions
transCond :: Exp -> Table -> Label -> Label -> State Supply [Instr]
transCond (Op And e1 e2) table ltrue lfalse = do
    lmid <- newLabel
    code1 <- transCond e1 table lmid lfalse
    code2 <- transCond e2 table ltrue lfalse
    return (code1 ++ [LABEL lmid] ++ code2)

transCond (Op Or e1 e2) table ltrue lfalse = do
    lmid <- newLabel
    code1 <- transCond e1 table ltrue lmid
    code2 <- transCond e2 table ltrue lfalse
    return (code1 ++ [LABEL lmid] ++ code2)

transCond (Op rel e1 e2) table ltrue lfalse = do
    t1 <- newTemp
    t2 <- newTemp
    code1 <- transExpr e1 table t1
    code2 <- transExpr e2 table t2
    return (code1 ++ code2 ++ [COND t1 rel t2 ltrue lfalse])

transCond (BoolVal b) _ ltrue lfalse =
    return [if b then JUMP ltrue else JUMP lfalse]

transCond (Ident var) table ltrue lfalse = do
    case Map.lookup var table of
        Just temp -> return [COND1 temp ltrue lfalse]
        Nothing -> error $ "Variable not defined: " ++ var