
#include <stdio.h>
#include <stdlib.h>      
#include <dlfcn.h>
#include <unistd.h>

int main(void)
{

    if( access("asset_dir/libb.so", F_OK ) == 0 ) {
        printf("file exists\n");
    } else {
        printf("file does not exists\n");
    }

    void *handle;
    int (*sum)(int, int);
    char *error;
    printf("open the dll...\n");
    handle = dlopen("asset_dir/libb.so", RTLD_NOW);

    if (!handle) {
       printf("%s\n", dlerror());
       fprintf(stderr, "%s\n", dlerror());
       exit(EXIT_FAILURE);
    }
    printf("...opened the dll!\n");
}