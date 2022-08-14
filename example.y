%{
#include <stdio.h>

int yylex();
int yyerror(const char *str);
extern int yylineno;

%}

%locations

%token TEST ERROR

%start program

%%

program: TEST
;

%%

int yyerror(const char *str)
{
	fprintf(stderr,"Syntax error on line %d\n",yylineno);
	return 1;
}

int main()
{
    return yyparse();
}
