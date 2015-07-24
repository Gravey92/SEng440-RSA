#include <stdio.h>

// Get bit of decimal at position N
int get_bit(int decimal, int N)
{
    // Shifting the 1 for N bits
    int constant = 1 << (N);

    // if the bit is set, return 1
    if( decimal & constant )
    {
        return 1;
    }

    // If the bit is not set, return 0
    return 0;
}

int main()
{
    printf("Hello, World!\n");

    int j;
    for(j = 0; j < 64; j++)
    {
        if((13398879982453738453ULL >> j) & 1)
        {
            printf("1");
        } else {
            printf("0");
        }
    }

/*
    printf("\n");
    for(int i = 0; i < 12; i++)
    {
        printf("%d", get_bit(3233, i));
    } */
    return 0;
}