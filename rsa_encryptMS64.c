#include <stdio.h>
#include <time.h>

// 64 bit stuff //
const unsigned long long int N = 3233ULL;//13398879982453738453ULL;
const unsigned long long int e = 17ULL;//65537ULL;
const unsigned long long int d = 2753ULL;//1423568384412577985ULL;

unsigned long long int multiply_square(unsigned long long int P, unsigned long long int exponent, int num_bits)
{
	unsigned long long int Z = 1;
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

unsigned long long int encrypt(unsigned long long int plaintext)
{
	printf("Plaintext is: %llu\n", plaintext);

	unsigned long long int ciphertext = multiply_square(plaintext, e, 64);

	printf("Ciphertext is: %llu\n", ciphertext);
	return ciphertext;
}

unsigned long long int decrypt(unsigned long long int ciphertext)
{
    printf("Ciphertext is %llu\n", ciphertext);
    
    unsigned long long int plaintext = multiply_square(ciphertext, d, 64);
    
    printf("Plaintext is %llu\n", plaintext);
    return plaintext;
}

int main()
{
    double startTime = (float)clock()/CLOCKS_PER_SEC;
	decrypt(encrypt(3230ULL));
    double endTime = (float)clock()/CLOCKS_PER_SEC;

    double timeElapsed = endTime - startTime;
    printf("Time elapsed: %lf", timeElapsed);
	return 1;
}