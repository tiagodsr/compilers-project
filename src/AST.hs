module AST where 

import Lexer

-- Representa declarações de variáveis
type Decl = String  -- Em Kotlin, o tipo pode não ser especificado , então usamos apenas o nome da variável

-- Função específica main() ou fun main()
data Fn = Main [Stm]              -- Representa a função main() com uma lista de statements
          deriving Show

-- Statements
data Stm = Print Exp
         | While Exp Stm
         | If Exp Stm
         | IfElse Exp Stm Stm
         | Block [Stm]
         | Simple Simple
        deriving Show

-- Declarações e expressões simples, como variáveis e atribuições
data Simple = DefVal String (Maybe Exp)   -- Definição de constante val
            | DefVar String (Maybe Exp)   -- Definição de variável var
            | Assign String Exp           -- Atribuição de variável
            | Incr String                 -- Incremento (++)
            | Decr String                 -- Decremento (--)
            | Expression Exp              -- Qualquer expressão
            deriving Show

-- Expressões possíveis no subset de Kotlin
data Exp = Num Int 
         | Ident String
         | BoolVal Bool
         | StringVal String
         | FnCall String [Exp]
         | ReadLine     -- equivalente ao readln()
         | Op BinOp Exp Exp 
         | Op1 UnOp Exp
         deriving (Eq, Show)

-- Operadores Aritméticos e Booleanos 
data BinOp = Add | Sub | Mult | Div | Mod | And | Or | Lt | Gt | Eq | Le | Ge | Ne  
         deriving (Eq, Show)

data UnOp = Neg | Not
          deriving (Eq, Show)
