void main() {
  float a;
  float b;
  float c;
  a = 9.8;
  b = 3.14;
  printf("a = ");
  printf("%f", a);
  printf("b = ");
  printf("%f", b);
  
  c = a + b;
  printf("a + b = ");
  printf("%f", c);
  
  c = a - b;
  printf("a - b = ");
  printf("%f", c);

  c = a * b;
  printf("a * b = ");
  printf("%f", c);

  c = a / b;
  printf("a / b = ");
  printf("%f", c);
  
  printf("c = a / b, 20.20 * c / 11.24 = ");
  c = 20.20 * c / 11.24;
  printf("%f", c);
  
  c = -c;
  printf("-c = ");
  printf("%f", c);
}
