#include <stdio.h>
#include <time.h>
//C = T^E mod N (n == PQ)
// T = C^D mod N 
// p = 61, q = 53, N = 3233, e = 17, d = 2753

//17 = 1*2^0 + (8*2^1) 

const unsigned long long int e = 17;
const unsigned long long int d = 2753;
const unsigned long long int N = 3233;

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
	  unsigned long long int ciphertext = multiply_square(plaintext, e, 5);
	  return ciphertext;
}

unsigned long long int decrypt(unsigned long long int ciphertext)
{
    unsigned long long int plaintext = multiply_square(ciphertext, d, 12);
    return plaintext;
}

int main()
{
    for(int i=0; i < 10000; i++)
    {
	    decrypt(encrypt(3231));
    }
	return 1;
}
