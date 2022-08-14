%{

#include <stdio.h>
#include <string.h>
#include "y.tab.h"
void error();
%}

%option yylineno

%%

"test"          {return(TEST);}             
.           {error(); return(ERROR);}

%%


void error(){
    fprintf(stderr,"Lexer error\n");
}

int yywrap(){
    return 1;
}
