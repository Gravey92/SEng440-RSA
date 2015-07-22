#include <stdio.h>
#include <time.h>
//C = T^E mod N (n == PQ)
// T = C^D mod N 
// p = 61, q = 53, N = 3233, e = 17, d = 2753

//17 = 1*2^0 + (8*2^1) 

const int e = 17;
const int d = 2753;
const int N = 3233;

int multiply_square(int P, int exponent, int num_bits)
{
	int Z = 1;
	for(int i = 0; i < num_bits; i++)
	{
        if((exponent >> i) & 1)
        {
        	Z = (Z * P) % N;
        }

        P = (P * P) % N;
	}

	return Z;
}

int encrypt(int plaintext)
{
	printf("Plaintext is: %d\n", plaintext);

	int ciphertext = multiply_square(plaintext, e, 5);

	printf("Ciphertext is: %d\n", ciphertext);
	return ciphertext;
}

int decrypt(int ciphertext)
{
    printf("Ciphertext is %d\n", ciphertext);
    
    int plaintext = multiply_square(ciphertext, d, 12);
    
    printf("Plaintext is %d\n", plaintext);
    return plaintext;
}

int main()
{
    double startTime = (float)clock()/CLOCKS_PER_SEC;
	decrypt(encrypt(3230));
    double endTime = (float)clock()/CLOCKS_PER_SEC;

    double timeElapsed = endTime - startTime;
    printf("Time elapsed: %lf", timeElapsed);
	return 1;
}