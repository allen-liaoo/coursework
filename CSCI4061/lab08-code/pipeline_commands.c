#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main() {
    // Run equivalent of the command pipeline 'sort -r numbers.txt | head -n 10'

    // TODO Create pipe
    int fds[2];
    if (pipe(fds) == -1) {
        perror("pipe");
        return 1;
    }

    pid_t child_pid = fork();
    if (child_pid == -1) {
        perror("fork");
        // TODO insert any necessary cleanup
        close(fds[0]);
        close(fds[1]);
        return 1;
    } else if (child_pid == 0) {
        // TODO Close write end of pipe
        close(fds[1]);

        // TODO Run the 'head' command, setting up input from pipe first
        if (dup2(fds[0], STDIN_FILENO) == -1) {
        perror("dup2");
        return 1;
    }
        execlp("head", "head", "-n", "10", NULL);
        return 0; // Not reached on successful exec()
    } else {
        // TODO close read end of pipe
        close(fds[0]);
    }

    // TODO Run the 'sort' command, setting up output to pipe first
    if (dup2(fds[1], STDOUT_FILENO) == -1) {
        perror("dup2");
        return 1;
    }
    execlp("sort", "sort", "-r", "numbers.txt", NULL);

    return 0; // Not reached on successful exec()
}
