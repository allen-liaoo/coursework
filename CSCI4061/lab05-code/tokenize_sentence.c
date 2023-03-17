#include <string.h>
#include <stdio.h>

#define BUF_LEN 512

void print_words(char *s) {
    // TODO Not yet implemented
    char *str;
    str = strtok(s, " ");
    while(str != NULL) {
        printf("%s\n", str);
        str = strtok(NULL, " ");
    }
}

int main(int argc, char **argv) {
    int echo = 0;
    if (argc > 1 && strcmp(argv[1], "-echo") == 0) {
        echo = 1;
    }

    char sentence[BUF_LEN];

    printf("sentence> ");
    while(fgets(sentence, BUF_LEN, stdin) != NULL) {
        if (echo) {
            printf("%s", sentence);
        }
        // Remove trailing newline from sentence
        int i = 0;
        while (sentence[i] != '\n') {
            i++;
        }
        sentence[i] = '\0';

        if (strcmp(sentence, "exit") == 0) {
            return 0;
        }

        print_words(sentence);

        printf("sentence> ");
    }

    printf("\n");
    return 0;
}