#include <stdio.h>
#include <time.h>

// 64 bit stuff //
const unsigned long long int N = 3233ULL;
const unsigned long long int e = 17ULL;
const unsigned long long int d = 2753ULL;
const int num_bits = 12;

unsigned long long int montgomery_multiply(register unsigned long long int X, 
										   register unsigned long long int Y)
{
	register unsigned long long int T = 0;
	register unsigned long long int n;
	for(int i = 0; i < num_bits; i++)
	{
		n = (T & 1) + (((X >> i) & 1) & (Y & 1));
		T = (T + (((X >> i) & 1) ? Y : 0) + (n * N)) >> 1;
	}
	if ( T >= N)
	{
		T = T - N;
	}

	return T;
}

unsigned long long int multiply_square(unsigned long long int P, unsigned long long int exponent)
{

	//Prescale Z and P by R^2
	unsigned long long int rs = (1 << (2 * num_bits)) % N;
	unsigned long long int Z = montgomery_multiply(1, rs);
	P = montgomery_multiply(P, rs);

	for(int i = 0; i < num_bits; i++)
	{
        if((exponent >> i) & 1)
        {
        	Z = montgomery_multiply(Z, P);
        }

        P = montgomery_multiply(P, P);
	}

	//Descale
	Z = montgomery_multiply(1, Z);

	return Z;
}

unsigned long long int encrypt(unsigned long long int plaintext)
{
	//printf("Plaintext is: %llu\n", plaintext);
	unsigned long long int ciphertext = multiply_square(plaintext, e);

	//printf("Ciphertext is: %llu\n", ciphertext);
	return ciphertext;
}

unsigned long long int decrypt(unsigned long long int ciphertext)
{
    //printf("Ciphertext is %llu\n", ciphertext);
  
    unsigned long long int plaintext = multiply_square(ciphertext, d);
    
    //printf("Plaintext is %llu\n", plaintext);
    return plaintext;
}

int main()
{
    for(int i = 0; i < 10000; i++)
	{
		decrypt(encrypt(3231ULL));
	}
	return 1;
}
