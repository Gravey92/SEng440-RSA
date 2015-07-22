#include <stdio.h>
#include <time.h>
//C = T^E mod N (n == PQ)
// T = C^D mod N 
// p = 61, q = 53, N = 3233, e = 17, d = 2753

// 64 bit stuff //
// N = 13398879982453738453
// E = 65537
// D = 1423568384412577985
// P = 14680930577
// Q = 912672389

const unsigned long long int e = 17;
const unsigned long long int d = 2753;
const unsigned long long int N = 13398879982453738453ULL;//3233;

unsigned long long int encrypt(unsigned long long int plaintext)
{
	printf("Plaintext is: %lld\n", plaintext);
	unsigned long long int cipher = plaintext;
	for(unsigned long long int i = 0; i < 65537; i++)
	{
        cipher = (cipher * plaintext) % N;
	}

	printf("Ciphertext is: %lld\n", cipher);
	return cipher;
}

//2753 = 2048 + 512 + 128 + 64 + 1
unsigned long long int decrypt(unsigned long long int ciphertext)
{
    printf("Ciphertext is %lld\n", ciphertext);
    unsigned long long int plaintext = ciphertext;
    for(unsigned long long int i = 0ULL; i < 1423568384412577985ULL; i++)
    {
        plaintext = (plaintext * ciphertext) % N;
    }

    printf("Plaintext is: %lld\n", plaintext);
    return plaintext;
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
    printf("start");
    fflush(stdout);
    for(unsigned long long int i = 0ULL; i < 1423568384412577985ULL; i++)
    {
        /// do nothing plaintext = (plaintext * ciphertext) % N;
    }
    printf("fin");
    fflush(stdout);
    return 1;
}