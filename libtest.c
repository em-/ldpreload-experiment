#include <unistd.h>
#include <stdio.h>

unsigned int test_sleep(unsigned int seconds)
{
    printf("test sleeping\n");
    return sleep(seconds);
}
