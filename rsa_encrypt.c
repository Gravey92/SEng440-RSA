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

const int e = 17;
const int d = 2753;
const int N = 3233;

int encrypt(int plaintext)
{
	printf("Plaintext is: %d\n", plaintext);
	int cipher = plaintext;
	for(int i = 0; i < 16; i++)
	{
        cipher = (cipher * plaintext) % N;
	}

	printf("Ciphertext is: %d\n", cipher);
	return cipher;
}

//2753 = 2048 + 512 + 128 + 64 + 1
int decrypt(int ciphertext)
{
    printf("Ciphertext is %d\n", ciphertext);
    
    int plaintext;
    int decrypt_table[12]; // 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048
    decrypt_table[0] = ciphertext;
    for(int i = 1; i < 12; i++)
    {
    	decrypt_table[i] = (decrypt_table[i-1] * decrypt_table[i-1]) % N;
    }
    plaintext = (decrypt_table[11] * decrypt_table[9]) % N;
    plaintext = (plaintext * decrypt_table[7]) % N;
    plaintext = (plaintext * decrypt_table[6]) % N;
    plaintext = (plaintext * ciphertext) % N;
    
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