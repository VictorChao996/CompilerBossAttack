%{
#include<stdio.h>
#include<string.h>
int yylex();
void yyerror(const char *message);
/*
stack_top: point at the top of the stack
judge: some conditions will make this boolean value become false, such as add while stack size is lower 
            than two.
*/
int stack_top = -1,judge = 1;
int stack[30];
%}
%union{
    int intVal;
}
%token INC DEC PUSH INVERSE MONEY
%token <intVal> NUMBER
%type <intVal> expr

%%
/*Bottom up until reduce the start symbol : all*/
all : line MONEY
{

    printf("%d\n", stack[stack_top]);

};
line : expr line {/*nothing*/}
        |
        ;
expr : PUSH NUMBER { stack_top++; stack[stack_top] = $2; }
    |  INC {
            stack[stack_top]++;
        }
    |  DEC {
        stack[stack_top]--;
    }
    | INVERSE {
        int a = stack[stack_top];
        int temp = stack_top-1;
        int b = stack[temp];
        //printf("a = %d  b = %d \n", a,b );
        stack[stack_top] = b;
        stack[temp] = a;

    }
    ;
%%
void yyerror(const char *message)
{
    fprintf (stderr, "%s\n",message);
}
int main(int argc, char *argv[]){
    stack[0] = 52;
    yyparse();
    return(0);
}