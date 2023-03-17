#include <stdio.h>
#include <stdlib.h>
#include <sys/poll.h>
#include <sys/wait.h>
#include <unistd.h>

#define NUM_CHILDREN 7
#define RAND_SEED 4061

// Closes first n file descriptors in an array
int close_all(int *fds, int n) {
    int ret_val = 0;
    for (int i = 0; i < n; i++) {
        if (close(fds[i]) == -1) {
            perror("close");
            ret_val = 1;
        }
    }
    return ret_val;
}

int main() {
    int child_values[] = {4, 8, 15, 16, 23, 42, 108};
    srand(RAND_SEED);

    // Create a pipe for each child process
    int pipe_fds[2 * NUM_CHILDREN];
    for (int i = 0; i < NUM_CHILDREN; i++) {
        if (pipe(pipe_fds + 2*i) == -1) {
            perror("pipe");
            close_all(pipe_fds, 2*i);
            return 1;
        }
    }

    // Launch child processes, each writing to pipe after random delay
    for (int i = 0; i < NUM_CHILDREN; i++) {
        int delay = rand() % 13;

        pid_t child_pid = fork();
        if (child_pid == -1) {
            perror("fork");
            close_all(pipe_fds, 2 * NUM_CHILDREN);
            return 1;
        }

        else if (child_pid == 0) {
            sleep(delay);

            int ret_val = 0;
            if (write(pipe_fds[2*i + 1], child_values + i, sizeof(int)) == -1) {
                perror("write");
                ret_val = 1;
            }
            if (close_all(pipe_fds, 2 * NUM_CHILDREN) == 1) {
                ret_val = 1;
            }
            return ret_val;
        }
    }

    // TODO Change this code to read from pipes as soon as data is available
    // Use the poll() system call
    struct pollfd fds[NUM_CHILDREN];
    for (int i = 0; i < NUM_CHILDREN; i++) {
        fds[i].fd = pipe_fds[2*i];
        fds[i].events = POLLIN;// | POLLUP;
    }

    int j = 0;
    while (j < NUM_CHILDREN) {
        if (poll(fds, NUM_CHILDREN, -1) == -1) {
            close_all(pipe_fds, 2 * NUM_CHILDREN);
            return 1;
        }
        for (int i = 0; i < NUM_CHILDREN; i++) {
            if (fds[i].revents & POLLIN) {
                int result;
                if (read(pipe_fds[2*i], &result, sizeof(int)) == -1) {
                    perror("read");
                    close_all(pipe_fds, 2 * NUM_CHILDREN);
                    return 1;
                }
                printf("Child %d Result: %d\n", i, result);
                j++;
            }
        }
    }

    // for (int i = 0; i < NUM_CHILDREN; i++) {
    //     int result;
    //     if (read(pipe_fds[2*i], &result, sizeof(int)) == -1) {
    //         perror("read");
    //         close_all(pipe_fds, 2 * NUM_CHILDREN);
    //         return 1;
    //     }
    //     printf("Child %d Result: %d\n", i, result);
    // }
    // End TODO block

    int ret_val = close_all(pipe_fds, 2 * NUM_CHILDREN);
    // Wait for all children -- not strictly necessary but good practice
    for (int i = 0; i < NUM_CHILDREN; i++) {
        if (wait(NULL) == -1) {
            perror("wait");
            ret_val = 1;
        }
    }
    return ret_val;
}
