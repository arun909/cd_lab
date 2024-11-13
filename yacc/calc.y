%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
input:      expr '\n'    { printf("Result= %d\n", $1); }
        |   '\n'
        ;

expr:       expr '+' expr    { $$ = $1 + $3; }
        |   expr '-' expr    { $$ = $1 - $3; }
        |   expr '*' expr    { $$ = $1 * $3; }
        |   expr '/' expr    { $$ = $1 / $3; }
        |   '(' expr ')'     { $$ = $2; }
        |   NUMBER           { $$ = $1; }
        ;

%%
void yyerror(const char *s) {
    printf("Invalid expression\n");
}

int main(void) {
    printf("Enter the expression\n");
    return yyparse();
}