void main() {
  int a;
  int b;
  int c;
  a = 3;
  b = 4;
  printf("a = ");
  printf("%d", a);
  printf("b = ");
  printf("%d", b);
  if (a > b) {
    printf("a > b\n");
    printf("c = a ^ 2 - b ^ 2\n");
    c = a * a - b * b; 
    printf("c = ");
    printf("%d", c);
  } else {
    printf("else\n");
    printf("c = b ^ 2 - a ^ 2\n");
    c = b * b - a * a;
    printf("c = ");
    printf("%d", c);
  }
  
  printf("c = a ^ 2 + b ^ 2\n");
  c = a * a + b * b;
  printf("c = ");
  printf("%d", c);

  if (c == 25) {
    printf("c == 25\n");
  }
  if (c != 30) {
    printf("c != 30\n");
  }
}
