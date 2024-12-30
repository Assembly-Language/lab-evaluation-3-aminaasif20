#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

void __stdcall asmfunc(int array[], int length, int *result);

#ifdef __cplusplus
}
#endif

int main() {
    system("cls");
    int abc;
    printf("assembly proc calling from C! \n");
    getch();
    int array[8] = {-1, -2, -3, 1, 2, 3, 4, 5};
    int result = 0;

    asmfunc(array, 8, &result); // assembly proc calling

    getch();

    printf("Sum of odd numbers: %d\n", result); // printing in C

    return 0;
}
