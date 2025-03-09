#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    FILE *f = fopen("data.json", "w");
    if (f == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    srand(time(NULL));

    fprintf(f, "[\n");
    for (int i = 0; i < 10; i++) {
        int value = rand() % 100;
        fprintf(f, "  { \"id\": %d, \"value\": %d }%s\n", i, value, (i < 9) ? "," : "");
    }
    fprintf(f, "]\n");

    fclose(f);
    return 0;
}