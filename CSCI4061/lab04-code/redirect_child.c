// redirect_child.c: starts a child process which will print into a
// file instead of onto the screen. Uses dup2(), fork(), and wait()

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    if (argc < 2) { // check for at least 1 command line arg
        printf("Usage: %s <childfile>\n", argv[0]);
        return 1;
    }

    // Uncomment lines below to use specified output file and command-line args in child process
    char *output_file = argv[1]; // output file that child process will print into
    char *child_argv[] = {"wc", "nums.txt", NULL}; // child command/arguments to execute;


    // TODO: Spawn a child process, which will exec the "wc" command with the arguments in 'child_argv'
    // Redirect the output of the command to 'output_file'
    int isParent = fork();
    
    if (!isParent) {
        int out_fd = open(output_file, O_WRONLY|O_CREAT|O_TRUNC, S_IRUSR|S_IWUSR);
        int stdoutfd = dup(STDOUT_FILENO);

        dup2(out_fd, STDOUT_FILENO);
        execvp("wc", child_argv);
        printf("test");
        close(out_fd);
        dup2(stdoutfd, STDOUT_FILENO);
    }
    
    // TODO: In the parent, wait for the child and ensure it terminated normally using wait macros
    // Print "Child complete, return code <status_code>" if child terminated normally, replacing
    //    <status_code> with the child's numerical status code
    // Print "Child exited abnormally" if child terminated abnormally
    else {
        int status;
        waitpid(isParent, &status, 0);
        if (WIFEXITED(status)) {
            printf("Child complete, return code %d\n", WEXITSTATUS(status));
        } else {
            printf("Child exited abnormally\n");
        }
    }
}
