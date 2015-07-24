#include <stdio.h>
#include <time.h>


const int e = 17;
const int d = 2753;
const int N = 3233;

int generate_table(unsigned long long int x, unsigned long long int * table2, int table_size)
{
    //int table[table_size]; // 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048
    table2[0] = x;
    for(int i = 1; i < table_size; i++)
    {
        table2[i] = (table2[i-1] * table2[i-1]) % N;
    }
    return 0;
}

int encrypt(int plaintext)
{
    unsigned long long int lookup[5];
    generate_table(plaintext, lookup, 5);
    unsigned long long int ciphertext = lookup[4]*lookup[0] % N;
    printf("Ciphertext = %llu\n", ciphertext);
	return ciphertext;
}

int decrypt(int ciphertext)
{
    unsigned long long int lookup[12];
    generate_table(ciphertext, lookup, 12);
    unsigned long long int plaintext = lookup[11]*lookup[9]*lookup[7]*lookup[6]*lookup[0] % N;
    printf("Plaintext = %llu\n", plaintext);
    return plaintext;
}

int main()
{
    double startTime = (float)clock();
	decrypt(encrypt(3230));
    double endTime = (float)clock();
    double timeElapsed = (endTime - startTime)/CLOCKS_PER_SEC;
    printf("Time elapsed: %lf\n", timeElapsed);
	return 1;
}