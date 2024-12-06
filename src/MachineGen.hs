module MachineGen where 

import CodeGen
import IR
import AST

import Control.Monad.State (State)
import qualified Control.Monad.State as State

-- Cria argumentos para chamadas de função
createArg :: [Temp] -> Int -> String
createArg [] _ = ""
createArg (x:xs) n = "\tmove $a" ++ show n ++ ", $" ++ x ++ "\n" ++ createArg xs (n + 1)

-- Decodifica operações binárias
opDecode :: Instr -> String 
opDecode (OP op t1 t2 t3) 
   = case op of
     Add -> "\tadd $" ++ t1 ++ ", $" ++ t2 ++ ", $" ++ t3 ++ "\n"
     Sub -> "\tsub $" ++ t1 ++ ", $" ++ t2 ++ ", $" ++ t3 ++ "\n"
     Mult -> "\tmul $" ++ t1 ++ ", $" ++ t2 ++ ", $" ++ t3 ++ "\n"
     Div -> "\tdiv $" ++ t2 ++ ", $" ++ t3 ++ "\n\tmflo $" ++ t1 ++ "\n"
     Mod -> "\tdiv $" ++ t2 ++ ", $" ++ t3 ++ "\n\tmfhi $" ++ t1 ++ "\n"
     And -> "\tand $" ++ t1 ++ ", $" ++ t2 ++ ", $" ++ t3 ++ "\n"
     Or -> "\tor $" ++ t1 ++ ", $" ++ t2 ++ ", $" ++ t3 ++ "\n"
     Lt -> "\tslt $" ++ t1 ++ ", $" ++ t2 ++ ", $" ++ t3 ++ "\n"
     Gt -> "\tsgt $" ++ t1 ++ ", $" ++ t2 ++ ", $" ++ t3 ++ "\n"
     Eq -> "\tseq $" ++ t1 ++ ", $" ++ t2 ++ ", $" ++ t3 ++ "\n"
     Le -> "\tsle $" ++ t1 ++ ", $" ++ t2 ++ ", $" ++ t3 ++ "\n"
     Ge -> "\tsge $" ++ t1 ++ ", $" ++ t2 ++ ", $" ++ t3 ++ "\n"
     Ne -> "\tsne $" ++ t1 ++ ", $" ++ t2 ++ ", $" ++ t3 ++ "\n"

-- Decodifica operações unárias
opDecode (OP1 op t1 t2) 
   = case op of 
      Not -> "\tnor $" ++ t1 ++ ", $zero ,$" ++ t2 ++ "\n"
      Neg -> "\tsub $" ++ t1 ++ ", $zero ,$" ++ t2 ++ "\n"

-- Decodifica operações com literais imediatos
opDecode (OPI op t1 t2 n)
   = case op of 
      Add -> "\taddi $" ++ t1 ++ ", $" ++ t2 ++ ", " ++ show n ++ "\n"

-- Decodifica chamadas de função
callDecode :: Instr -> String
callDecode (CALL1 "print" t) =
    "\tmove $a0, $" ++ t ++ "\n" ++
    "\tli $v0, 1\n" ++  -- Syscall para imprimir inteiros (CORRIGIDO)
    "\tsyscall\n"
callDecode (CALL1 "printString" t) =
    "\tmove $a0, $" ++ t ++ "\n" ++
    "\tli $v0, 4\n" ++  -- Syscall para imprimir strings
    "\tsyscall\n"


-- Salva o estado da pilha
saveStack :: [Temp] -> Int -> String
saveStack [] n = "" 
saveStack (x:xs) n 
 | n == 4  = "\taddiu $sp, $sp, -" ++ show n ++ "\n\tsw $" ++ x ++ ", " ++ show n ++ "($sp)\n" ++ saveStack xs (n + 4)
 | otherwise = "\tsw $" ++ x ++ ", " ++ show n ++ "($sp)\n" ++ saveStack xs (n + 4)

-- Restaura o estado da pilha
loadStack :: [Temp] -> Int -> String 
loadStack [] n = "\taddiu $sp, $sp, " ++ show (n - 4) ++ "\n"
loadStack (x:xs) n = "\tlw $" ++ x ++ ", " ++ show n ++ "($sp)\n" ++ loadStack xs (n + 4)

-- Código de pré-amble (início da função)
prelude :: String
prelude = "\tsw $fp, -4($sp)\n\tsw $ra, -8($sp)\n\tmove $fp, $sp\n\taddiu $sp, $sp, -12\n"

-- Código de epílogo (fim da função)
epilogue :: String 
epilogue = "\tmove $sp, $fp\n\tlw $ra, -8($sp)\n\tlw $fp, -4($sp)\n\tjr $ra\n"

-- Decodifica condições
condDecode :: Instr -> String 
condDecode (COND t1 op t2 ltrue lfalse)
  = let str = case op of
                  Lt -> "bge "
                  Gt -> "ble "
                  Eq -> "bne "
                  Le -> "bgt "
                  Ge -> "blt " 
                  Ne -> "beq "
    in  "\t" ++ str ++ "$" ++ t1 ++ ", $" ++ t2 ++ ", " ++ lfalse ++ "\n"
condDecode (COND1 t1 ltrue lfalse)
  = "\tbeq $" ++ t1 ++ ", $zero, " ++ lfalse ++ "\n"

-- Decodifica uma instrução
instrDecode :: Instr -> String
instrDecode code = case code of
    MOVE t1 t2 ->
        "\tmove $" ++ t1 ++ ", $" ++ t2 ++ "\n"
    MOVEI t1 n ->
        "\tli $" ++ t1 ++ ", " ++ show n ++ "\n"
    MOVES t1 l str ->
        "\tla $" ++ t1 ++ ", " ++ l ++ "\n"
    OP op t1 t2 t3 ->
        opDecode (OP op t1 t2 t3)
    OP1 op t1 t2 ->
        opDecode (OP1 op t1 t2)
    OPI op t1 t2 n ->
        opDecode (OPI op t1 t2 n)
    LABEL l ->
        l ++ ":\n"
    LABELF l ->
        if l == "main"
        then l ++ ":\n"
        else l ++ ":\n" ++ prelude
    JUMP l ->
        "\tj " ++ l ++ "\n"
    COND t1 op t2 ltrue lfalse ->
        condDecode (COND t1 op t2 ltrue lfalse)
    COND1 t ltrue lfalse ->
        condDecode (COND1 t ltrue lfalse)
    CALL1 name t ->
        callDecode (CALL1 name t)
    CALL_NOARGS dest "readln" ->
        "\tli $v0, 8\n" ++         -- Syscall para leitura de string
        "\tla $a0, buffer\n" ++    -- Carrega o endereço do buffer
        "\tli $a1, 100\n" ++       -- Tamanho máximo da string
        "\tsyscall\n" ++
        "\tla $" ++ dest ++ ", buffer\n"  -- Armazena o endereço do buffer no destino
    CALL_NOARGS dest name ->
        "\tjal " ++ name ++ "\n" ++
        "\tmove $" ++ dest ++ ", $v0\n"
    CALL dest name args ->
        callDecode (CALL dest name args)

-- Gera a seção de dados para strings
dataSection :: [Instr] -> String
dataSection instrs =
    let bufferNeeded = any isReadln instrs
        bufferDef = if bufferNeeded then "buffer: .space 100\n" else ""
    in ".data\n" ++ bufferDef ++ collectStrings instrs ++ "\n"

-- Verifica se há uma chamada para 'readln'
isReadln :: Instr -> Bool
isReadln (CALL_NOARGS _ "readln") = True
isReadln _ = False

-- Função auxiliar para coletar strings das instruções
collectStrings :: [Instr] -> String
collectStrings [] = ""
collectStrings (MOVES _ l str : xs) = l ++ ": .asciiz \"" ++ str ++ "\"\n" ++ collectStrings xs
collectStrings (_ : xs) = collectStrings xs


-- Decodifica funções
funcDecode :: [Instr] -> String
funcDecode [] = ""
funcDecode ((LABELF "main"):xs) = instrDecode (LABELF "main") ++ funcDecode xs
funcDecode (x:xs) = instrDecode x ++ funcDecode xs

-- Decodifica o programa inteiro
progDecode :: [Instr] -> String
progDecode prog =
    dataSection prog ++ -- Gera a seção de dados primeiro
    ".text\n\tjal main\n\tli $v0, 10\n\tsyscall\n" ++
    funcDecode prog -- Funções e corpo principal na seção de texto