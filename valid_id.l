%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
^[A-Za-z][A-Za-z0-9]*$    
{ 
    printf("%s is accepted\n", yytext); 
    exit(0); 
}
.                          { 
    printf("%s is not accepted\n", yytext); 
    exit(0); 
}
\n                         { /* Ignore newline */ }
%%

int yywrap() 
{
    return 1;
}

int main()
{
    printf("Enter the string: ");
    yylex();
    return 0;
}
