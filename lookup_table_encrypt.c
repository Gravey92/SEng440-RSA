#include <stdio.h>
#include <time.h>


const unsigned long long int e = 17;
const unsigned long long int d = 2753;
const unsigned long long int N = 3233;

unsigned long long int generate_table(unsigned long long int x, unsigned long long int * table2, int table_size)
{
    table2[0] = x;
    for(int i = 1; i < table_size; i++)
    {
        table2[i] = (table2[i-1] * table2[i-1]) % N;
    }
    return 0;
}

unsigned long long int encrypt(unsigned long long int plaintext)
{
    unsigned long long int lookup[5];
    generate_table(plaintext, lookup, 5);
    unsigned long long int ciphertext = lookup[4]*lookup[0] % N;
	  return ciphertext;
}

unsigned long long int decrypt(unsigned long long int ciphertext)
{
    unsigned long long int lookup[12];
    generate_table(ciphertext, lookup, 12);
    unsigned long long int plaintext = (lookup[11]*lookup[9]) % N;
    plaintext = (plaintext * lookup[7]) % N;
    plaintext = (plaintext * lookup[6]) % N;
    plaintext = (plaintext * lookup[0]) % N;
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
