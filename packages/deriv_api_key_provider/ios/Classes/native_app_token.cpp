#include <stdint.h>

extern "C" __attribute__((visibility("default"))) __attribute__((used))
char* get_app_token() {
    return "deriv_api_token";
}
