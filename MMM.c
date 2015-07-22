#include <stdio.h>
#include <time.h>


unsigned long long int x = 17;
unsigned long long int y = 22;
unsigned long long int m = 23;//3233;
unsigned long long int mBitLength = 5;
unsigned long long int one = 1;

//Want X*Y mod M
//R is 2^bits in M, X, and Y.

unsigned long long int mmm()
{
    unsigned long long int t = 0;
    unsigned long long int mu = 0;

    for(unsigned long long int i = 0; i < mBitLength; i++)
    {
        mu = (t & one) + (((x>>i) & one)* (y & one));
        printf("t is =%llu", (t));
        printf("(x>>i) & one) is =%llu ", (((x>>i) & one)));
        printf("y is =%llu\n", (y & one));

        t = (t+ ( ((x>>i) & one) * y) + (mu*m))/2;
        printf("%llu\n", (t));

    }
    if(t>=m){
        t=t-m;
    }
    return t;
}

int main()
{
    /*
    double startTime = (float)clock()/CLOCKS_PER_SEC;
    decrypt(encrypt(1));
    double endTime = (float)clock()/CLOCKS_PER_SEC;

    double timeElapsed = endTime - startTime;
    printf("Time elapsed: %lf", timeElapsed);
    */
    printf("start\n");
    fflush(stdout);
    mmm();
    printf("fin");
    fflush(stdout);
    return 1;
}