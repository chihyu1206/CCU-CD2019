#include <stdio.h>
void main(void) {
  void a;
  char chr;
  int i = 2;
  float f;
  double df;
  char *ptr;
  int a[10];
  i = i++;
  int j = i--;
  int arr_size = sizeof(a) / sizeof(int);
  int boolean = i & j;
  boolean = i * j;
  boolean = i - j;
  boolean = !boolean;
  i = j;
  i *= j;
  i /= j;
  i %= j;
  i += j;
  i -= j;
  i <<= j;
  i >>= j;
  i &= j;
  i ^= j;
  i |= j;
  return;  
}