#include <stdio.h>
#include <stdbool.h>

typedef enum {
    q0, q01, q10, q11
} state;

state transition(state currentstate, char symbol) {
    switch (currentstate) {
        case q0:
            if (symbol == 'a') return q10;
            if (symbol == 'b') return q01;
            break;
        case q01:
            if (symbol == 'a') return q11;
            if (symbol == 'b') return q0;
            break;
        case q10:
            if (symbol == 'a') return q0;
            if (symbol == 'b') return q11;
            break;
        case q11:
            if (symbol == 'a') return q01;
            if (symbol == 'b') return q10;
            break;
    }
    return q0;
}

bool isAccepted(char *input) {
    state currentstate = q0;
    for (int i = 0; input[i] != '\0'; i++) {
        currentstate = transition(currentstate, input[i]);
    }
    return currentstate == q10;
}

int main() 
{
    char input[100];
    printf("Enter a string over {a, b}: ");
    scanf("%s", input);
    if (isAccepted(input)) {
        printf("The string is accepted by the DFA.\n");
    } else {
        printf("The string is not accepted by the DFA.\n");
    }
    return 0;
}
