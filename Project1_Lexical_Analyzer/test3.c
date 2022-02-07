#include <stdio.h>
void bubble_sort(int arr[], int len) {
  int ncase = len;
  int sorted = 0, i = 0;
  while (1) {
    sorted = 1;
    for (i = 0; i < ncase - 1; i++) {
      if (arr[i] > arr[i + 1]) {
        int temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;
        sorted = 0;
      }
      ncase--;
    }
    if (sorted == 0) {
      continue;
    } else {
      break;
    }
  }
  return;
}
int main() {
    int arr[] = { 22, 34, 3, 32, 82, 55, 89, 50, 37, 5, 64, 35, 9, 70 };
    int len = sizeof(arr) / sizeof(int);
    bubble_sort(arr, len);
    int i;
    for (i = 0; i < len; i++)
        printf("%d", arr[i]);
    return 0;
}