#include <stdio.h>
#include <stdlib.h>
#define __USE_GNU
#include <dlfcn.h>

unsigned int sleep(unsigned int seconds)
{
    unsigned int (*origsleep)(unsigned int);
    char *error;

    origsleep = dlsym (RTLD_NEXT, "sleep");
    if ((error = dlerror ()) != NULL)
    {
        fprintf (stderr, "%s\n", error);
        exit(1);
    }

    printf("sleep less, do more\n");
    return origsleep(seconds/2);
}

void print_sleep()
{
    // Do nothing
}
