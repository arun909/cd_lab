%{
#include<stdio.h>
int line_count=0, word_count=0, char_count=0;
FILE *fp;
%}

%%
\n { line_count++; }
[ \t]+ { char_count+=yyleng; }
[^ \t\n]+ { word_count++; char_count+=yyleng; }

%%

int yywrap() {
    return 1;
}

int main() {
    yyin=fopen("input.txt","r");
    yylex();
    printf("lines:%d\n", line_count);
    printf("words:%d\n", word_count);
    printf("characters:%d\n", char_count);
    fclose(yyin);
    return 0;
}
