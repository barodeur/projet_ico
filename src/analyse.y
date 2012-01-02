%{
#include <stdio.h>
#include <stdlib.h>
// #include "Arbre.h"
%}

%union {
	int nombre;
  node Node;
}

%token NOMBRE
%token PLUS MOINS MULT DIV PUISSANCE 
%token SIN COS TAN LN
%token VAR
%token GAUCHE DROITE
%token FIN

%left PLUS MOINS
%left MULT DIV
%left SIN COS TAN
%right PUISSANCE

%start ligne

%type<nombre> NOMBRE
%type<Node> exp

%%

ligne:
     FIN
|   exp { result = $1 }
|   exp FIN { result = $1 }
;

exp:

exp   3 + 2
lex   NOMBRE{3}  PLUS  NOMBRE{2}
bison NODE{NODE{null, 3, null}, PLUS, 2}


    NOMBRE { $$ = create_int_node($1) }
	NOMBRE { $$ = $1 }
|   VAR { $$ = create_var_node() }
|   exp PLUS exp { $$ = create_op_node($1, PLUS, $3) }
|   exp MOINS exp { $$ = create_op_node($1, MOINS, $3) }
|   MOINS exp { $$ = create_op_node($2, MOINS, NULL) }
|   exp MULT exp { $$ = create_op_node($1, MULT, $3) }
|   exp DIV exp { $$ = create_op_node($1, DIV, $3) }
|   exp PUISSANCE exp { $$ = create_op_node($1, PUISSANCE, $3) }
|   SIN GAUCHE exp DROITE { $$ = create_op_node($3, SIN, NULL) }
|   COS GAUCHE exp DROITE { $$ = create_op_node($3, COS, NULL) }
|   TAN GAUCHE exp DROITE { $$ = create_op_node($3, TAN, NULL) }
|   GAUCHE exp DROITE { $$ = $2 }
;

%%

int yywrap()
{
    return 1;
}

int yyerror(char *s) {
  printf("%s\n", s);
}
