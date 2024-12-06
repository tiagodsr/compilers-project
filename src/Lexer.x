{
module Lexer where
}

%wrapper "basic"
$alpha = [_a-zA-Z]
$digit = [0-9]

tokens :-
$white+                         ;  -- Ignora espaços em branco
"/*"($white|[^\*]|\*[^\/])*"*/" ;  -- Ignora Comentários de bloco
"//".*                          ;  -- Ignora Comentários de linha

-- Expressões condicionais, Palavras-chave e funções específicas do subset Kotlin
"if"                            {\_ -> Tif}
"else"                          {\_ -> Telse}
"while"                         {\_ -> Twhile}
"true"                          {\s -> Bol True}
"false"                         {\s -> Bol False}
"print"                         {\_ -> Tprint}
"readln"                        {\_ -> Treadln}
"val"                           {\_ -> TvalDecl}
"var"                           {\_ -> TvarDecl}
"fun"                           {\_ -> Tfun}        -- Reconhecimento da palavra-chave "fun"

-- permite strings em aspas duplas que podem ter espaços e caracteres numéricos
\"[^\"]*\"                      {\s -> Str (init (tail s))} -- para strings com " "
$alpha($alpha|$digit)*          {\s -> Tid s} -- ID das variaveis
$digit+                         {\s -> Tnum (read s)} -- para digitos inteiros

-- Operadores Aritméticos
"+"                             {\_ -> Tplus}
"++"                            {\_ -> Tplusplus}
"-"                             {\_ -> Tminus}
"--"                            {\_ -> Tminusminus}
"*"                             {\_ -> Ttimes}
"/"                             {\_ -> Tdiv}
"%"                             {\_ -> Tmod}

-- Operadores Lógicos e de Comparação
"=="                            {\_ -> Tequal}
"="                             {\_ -> Tassign}
"!="                            {\_ -> Tnequal}
"<"                             {\_ -> Tless}
"<="                            {\_ -> TlessEq}
">"                             {\_ -> Tgreater}
">="                            {\_ -> TgreaterEq}
"&&"                            {\_ -> Tand}
"||"                            {\_ -> Tor}
"!"                             {\_ -> Tbang}

-- Parênteses, chavetas e outros delimitadores
"("                             {\_ -> Tlparen}
")"                             {\_ -> Trparen}
"{"                             {\_ -> Tlbrace}
"}"                             {\_ -> Trbrace}
";"                             {\_ -> Tsemicolon}
","                             {\_ -> Tcomma}
":"                             {\_ -> Tcolon}

{
data Token = Tif 
           | Telse
           | Twhile
           | Tprint
           | Treadln
           | TvalDecl
           | TvarDecl
           | Tfun              
           | Tnum Int 
           | TIntType
           | TBooleanType
           | TStringType
           | Str String
           | Tid String
           | Bol Bool
           | Tplus
           | Tplusplus
           | Tminus 
           | Tminusminus
           | Ttimes 
           | Tdiv 
           | Tmod
           | Tequal
           | Tassign
           | Tnequal
           | Tless 
           | TlessEq 
           | Tgreater
           | TgreaterEq
           | Tand 
           | Tor 
           | Tbang
           | Tlparen 
           | Trparen 
           | Tlbrace 
           | Trbrace 
           | Tsemicolon
           | Tcomma
           | Tcolon
           deriving (Show, Eq)
}