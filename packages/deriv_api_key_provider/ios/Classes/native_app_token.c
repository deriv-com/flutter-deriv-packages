#include <stdlib.h>
#include <string.h>

char* gat(int* str, const int l) {
    char* result = (char*) malloc(sizeof(char) * l);

    strcpy(result, "");

    for (int i = 0; i < l; i++) {
        char temp[] = {(char)(str[i] % 128), '\0'};

        strcat(result, temp);
    }


    return result;
}
