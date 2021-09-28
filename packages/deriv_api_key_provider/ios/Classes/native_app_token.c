#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

const int ATS[] =  {57, 15, 38, 11, 99, 55, 53, 121, 5, 60, 104, 124, 78, 54, 114, 55, 27, 113, 20, 24, 75, 21, 50, 124, 117, 74, 11, 7, 76, 90, 50, 20, 108, 110, 86, 43, 4, 126, 84, 66, 69, 88, 102, 124, 114, 36, 91, 122, 79, 115, 104, 49, 100, 73, 79, 5, 81, 81, 2, 124, 2, 52, 4, 41};

unsigned short qtf(const char);
unsigned short jhf(const char);
unsigned short shf(const char);
char* getAppToken();

unsigned short qtf(const char c) {
    const unsigned short s = 0x0020;
    const unsigned short p = 0x0007;
    
    unsigned short r = 0x5555;

    r ^= c;
    r = (r << p) | (r >> (s - p));
   
   return r;
}

unsigned short jhf(const char c) {
    unsigned short r = 0x0000;
    unsigned short m[] = {0x000A, 0x0006, 0x0003, 0x000B, 0x000F};

    r = c;

    for (int i = 0; i < 5; i++) {
        if (i % 2) {
            r ^= r >> m[i];
        } else {
            r += r << m[i];
        }
    }
    
    return r;
}

unsigned short shf(const char c) {
    unsigned short r = 0x0000;

    r = (r << 0x0003) + (r >> (sizeof(r) * CHAR_BIT - 0x0003)) + c;
    
    return r;
}

char* getAppToken() {
    const int bs = 0x0008;
    const int m = 0x0064;

    int l = sizeof(ATS) / sizeof(ATS[0]);
        
    int i = 0x0000;
    char* r = (char*) malloc(sizeof(char) * l * bs);
    
    while(i < l) {
        char c = ATS[i] % 0x0080;
        unsigned short q = 0x0000;

        if (i == q) {
            strcpy(r, "");
        }
        
        char* t = (char*) malloc(sizeof(char) * bs);
        strcpy(t, "");

        if (i % 0x0003) {
            q = jhf(c) ^ jhf(i);
        } else if (i % 0x0007) {
            q = qtf(c) ^ jhf(i);
        } else if (i % 0x000B) {
            q = shf(c) ^ jhf(i);
        } else {
            q = jhf(c) ^ qtf(c);
        }
        
        sprintf(t, "%02X%02X", (unsigned char)(q / m), (unsigned char)(q % m));
        strcat(r, t);

        i++;
    }
    
    return r;
}
