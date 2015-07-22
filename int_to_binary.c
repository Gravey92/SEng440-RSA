#include <stdio.h>

int main()
{
    printf("Hello, World!\n");

    int i = 2753;
    int j;
    for(j = 0; j < 64; j++)
    {
        if((2753 >> j) & 1)
        {
            printf("1");
        } else {
            printf("0");
        }
    }
    return 0;
}