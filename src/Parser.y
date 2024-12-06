{
module Parser where 
import Lexer
import AST
}

%name parser 
%tokentype {Token}
%error {parseError}

%token
num         {Tnum $$}
str         {Str $$}
id          {Tid $$}
bol         {Bol $$}
val_decl    {TvalDecl}
var_decl    {TvarDecl}
fun         {Tfun}
if          {Tif}
else        {Telse}
while       {Twhile}
print       {Tprint}
readln      {Treadln}
'='         {Tassign}
'=='        {Tequal}
'!='        {Tnequal}
'<'         {Tless}
'>'         {Tgreater}
'<='        {TlessEq}
'>='        {TgreaterEq}
'+'         {Tplus}
'-'         {Tminus}
'*'         {Ttimes}
'/'         {Tdiv}
'%'         {Tmod}
'&&'        {Tand}
'||'        {Tor}
'++'        {Tplusplus}
'--'        {Tminusminus}
'('         {Tlparen}
')'         {Trparen}
'{'         {Tlbrace}
'}'         {Trbrace}
';'         {Tsemicolon}
','         {Tcomma}
':'         {Tcolon}
'!'         {Tbang}

%right '='
%nonassoc ifX  
%right else   

%left '||'
%left '&&'
%left '==' '!='
%left '<' '>' '<=' '>='
%left '+' '-'
%left '*' '/' '%'
%right '!' '++' '--'
%left '(' ')' ';' 

%%

Program : Fn                                          { $1 }

Fn : FunMain                                          { $1 }

FunMain : fun id_main '(' ')' '{' Stmts '}'           { Main $6 }

id_main : id                                          { if $1 == "main" then $1 else parseError [] }

Stmts : Stmt                                          { [$1] }      
      | Stmt Stmts                                    { $1 : $2 }

Stmt : Simple                                         { Simple $1 }
     | Simple ';'                                     { Simple $1 }
     | print '(' Exp ')'                              { Print $3 }
     | print '(' Exp ')' ';'                          { Print $3 }
     | while '(' Exp ')' Stmt                         { While $3 $5 }
     | if '(' Exp ')' Stmt %prec ifX                  { If $3 $5 }
     | if '(' Exp ')' Stmt else Stmt                  { IfElse $3 $5 $7 }
     | '{' Stmts '}'                                  { Block $2 }
     | '{' '}'                                        { Block [] }

Simple : val_decl id '=' Exp                          { DefVal $2 (Just $4) }
       | var_decl id '=' Exp                          { DefVar $2 (Just $4) }
       | id '=' Exp                                   { Assign $1 $3 }
       | id '++'                                      { Incr $1 }
       | id '--'                                      { Decr $1 }
       | Exp                                          { Expression $1 }

Exp : num                                            { Num $1 }
    | str                                            { StringVal $1 }
    | id                                             { Ident $1 }
    | bol                                            { BoolVal $1 }
    | '(' Exp ')'                                    { $2 }
    | id '(' ParamCall ')'                           { FnCall $1 $3 }     
    | readln '(' ')'                                 { ReadLine }
    | Exp '+' Exp                                    { Op Add $1 $3 }
    | Exp '-' Exp                                    { Op Sub $1 $3 }
    | Exp '*' Exp                                    { Op Mult $1 $3 }
    | Exp '/' Exp                                    { Op Div $1 $3 }
    | Exp '%' Exp                                    { Op Mod $1 $3 }
    | Exp '&&' Exp                                   { Op And $1 $3 }
    | Exp '||' Exp                                   { Op Or $1 $3 }
    | '!' Exp                                        { Op1 Not $2 } -- p.e.  !(false)
    | '-' Exp                                        { Op1 Neg $2 } -- p.e.  -(x+z)
    | Exp '<' Exp                                    { Op Lt $1 $3 }
    | Exp '>' Exp                                    { Op Gt $1 $3 }
    | Exp '==' Exp                                   { Op Eq $1 $3 }
    | Exp '<=' Exp                                   { Op Le $1 $3 }
    | Exp '>=' Exp                                   { Op Ge $1 $3 }
    | Exp '!=' Exp                                   { Op Ne $1 $3 }

ParamCall : Exp                                      { [$1] }
          | Exp ',' ParamCall                        { $1 : $3 }
          |                                          { [] }

{
parseError :: [Token] -> a
parseError toks = error "parse error"
}
