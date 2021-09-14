#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    unsigned long* element;
    int used;
    int size;
} Array;

void init_array(Array*);
void insert_array(Array*, unsigned long);
void free_array(Array*);

unsigned long get_hash(char*);

char* convert_to_hex(unsigned long);

char* get_app_token(int);

char* get_app_token(int isDebug) {
    if (isDebug) {
        return "deriv_api_token";
    }
    
    Array array;

    int counter = 0;

    char seed[] = {65, 79, 101, 99, 110, 86, 107, 55, 73, 72, 68, 55, 111, 66, 112, 113};
    int seedLength = sizeof(seed) / sizeof(seed[0]);

    init_array(&array);


    while (counter < seedLength) {
        insert_array(&array, get_hash(&(seed[counter++])));
    }

    counter = 0;

    char* result = malloc(254 * sizeof(char));

    while (counter < array.size) {
        strcat(result, convert_to_hex(array.element[counter++]));
    }

    free_array(&array);

    return result;
}

unsigned long get_hash(char* key) {
    unsigned long hash = 0;

    hash += key[0];
    hash += hash << 10;
    hash ^= hash >> 6;

    hash += key[strlen(key) / 2];
    hash += hash << 10;
    hash ^= hash >> 6;

    hash += key[strlen(key)];
    hash += hash << 10;
    hash ^= hash >> 6;

    hash += hash << 3;
    hash ^= hash >> 11;
    hash += hash << 15;

    return hash;
}

char* convert_to_hex(unsigned long value) {
    char* result = malloc(17 * sizeof(char));

    snprintf(result, 17, "%lX", value);

    return result;
}

void init_array(Array* array) {
    array->element = malloc(0 * sizeof(unsigned long));
    array->used = 0;
    array->size = 0;
}

void insert_array(Array* array, unsigned long element) {
    if (array->used == array->size) {
        array->size++;
        array->element = realloc(array->element, array->size * sizeof(unsigned long));
    }

    array->element[array->used++] = element;
}

void free_array(Array* array) {
    free(array->element);

    array->element = NULL;
    array->used = array->size = 0;
}
