module Main where 

import Lexer
import Parser
import AST
import IR
import CodeGen   
import MachineGen 

import qualified Data.Map as Map
import           Control.Monad.State (State)
import qualified Control.Monad.State as State

-- starting values for temporary and label counters
initialSupply :: Supply
initialSupply = (0,0,0,0)

-- run a code generation action with initial supply
runCodeGen :: State Supply [Instr] -> [Instr]
runCodeGen gen = State.evalState gen initialSupply

main = do
     txt <- getContents
     let tokens = alexScanTokens txt
     putStrLn "Tokens gerados pelo Lexer:\n"
     print tokens -- Lexer Tokens
     putStrLn "\nAST resultante do Parser:\n"
     print (parser $ alexScanTokens txt)
     let pars = parser $ alexScanTokens txt -- AST with parser
     putStrLn "\nCódigo intermédio de 3 endereços:\n"
     let code = runCodeGen $ transProgram [pars] -- Middle Code
     printIR code
     putStrLn "\nA gerar o código Máquina (MIPS) no ficheiro 'machine_code.txt' ..." 
     let machine = progDecode code -- Machine Code
     writeFile "machine_code.txt" machine  -- Escreve o código MIPS em um arquivo
     putStrLn "Código de máquina gerado em 'machine_code.txt'."

printIR :: [Instr] -> IO ()
printIR = mapM_ print
