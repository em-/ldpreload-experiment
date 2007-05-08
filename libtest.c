#include <unistd.h>
#include <stdio.h>

void print_sleep()
{
    printf("test sleeping\n");
}

unsigned int test_sleep(unsigned int seconds)
{
    print_sleep();
    return sleep(seconds);
}
