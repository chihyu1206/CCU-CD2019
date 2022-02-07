void main() {
  int a;
  int b;
  int c;
  a = 87;
  b = 99;
  printf("a = ");
  printf("%d", a);
  printf("b = ");
  printf("%d", b);
  printf("The relation between a and b: ");
  if (a > b) {
    printf("a > b\n");
  } else {
    printf("a <= b\n");
  }
  c = a + b;
  printf("a + b = ");
  printf("%d", c);
  
  c = a - b;
  printf("a - b = ");
  printf("%d", c);

  c = a * b;
  printf("a * b = ");
  printf("%d", c);

  c = a / b;
  printf("a / b = ");
  printf("%d", c);

  c = a * a + b * b;
  printf("c = a ^ 2 + b ^ 2\n");
  printf("c = ");
  printf("%d", c);
  
  c = -c;
  printf("-c = ");
  printf("%d", c);
}
