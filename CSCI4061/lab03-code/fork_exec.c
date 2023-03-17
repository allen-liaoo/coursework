#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main() {
    int child_status = -1;

    // TODO Fork a child process to run the command "cat QUESTIONS.sha256"
    // The parent should wait and print out the child's exit code
    pid_t pid = fork();

    if (pid == 0) {
        execlp("cat", "cat", "QUESTIONS.sha256", NULL);
    } else {
        wait(&child_status);
    }

    printf("Child exited with status %d\n", child_status);
    return 0;
}
