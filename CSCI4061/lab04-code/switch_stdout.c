// switch_stdout.c: demonstrates use of dup2() and dup() to redirect
// standard output to a new location temporarily and then restore it. 
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>

int main() {
    int stdout_bak = dup(STDOUT_FILENO); // make a backup of stdout

    // Open file for writing, create if needed, otherwise delete existing file
    // Grant user read and write permissions for new file
    int out_fd = open("mystery.txt", O_WRONLY|O_CREAT|O_TRUNC, S_IRUSR|S_IWUSR);
    if (out_fd == -1) { // check for errors opening file
        perror("Couldn't open file 'mystery.txt'");
        return 1; // Bail out if open fails
    }

    printf("1. Now you see me.\n"); // print to the screen

    dup2(out_fd, STDOUT_FILENO); // change stdout to go to mystery.txt
    printf("2. Now you don't!\n"); // print goes to mystery.txt
    close(out_fd); // close mystery.txt

    dup2(stdout_bak, STDOUT_FILENO); // restore stdout to screen
    printf("3. How mysterious...\n"); // print goes to screen
    return 0;
}
