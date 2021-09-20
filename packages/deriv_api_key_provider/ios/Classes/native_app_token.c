#include <stdlib.h>
#include <string.h>

#define DEVELOPMENT_APP_TOKEN "DERIV_API_TOKEN"
#define PRODUCTION_APP_TOKEN_SEED "PRODUCTION_DERIV_API_TOKEN_SEED"

char* gdat();
char* gpat();

char* gdat() {
    return DEVELOPMENT_APP_TOKEN;
}

char* gpat() {
    int length = strlen(PRODUCTION_APP_TOKEN_SEED);
    char* result = (char*) malloc(sizeof(char) * length);
    
    strcpy(result, PRODUCTION_APP_TOKEN_SEED);
    
    return result;
}
