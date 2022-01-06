%option noyywrap
%{
#include "stackInverse.tab.h"
%}
NUMBER [0-9]+

%%
"push" {return PUSH;}
"inverse" {return INVERSE;}
"inc" {return INC;}
"dec" {return DEC;}
"\$" {/*printf("%s", yytext);*/ return MONEY;}
\n {}
[ \t]+ {/*do nothing*/}
{NUMBER} {
    yylval.intVal = atoi(yytext);
    return(NUMBER);
}
%%
