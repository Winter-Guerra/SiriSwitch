
#define SSLog(...) ((^{printf("%s\n", [[NSString stringWithFormat:__VA_ARGS__] UTF8String]);fflush(stdout);})())

