#include <fcntl.h>
#include <netdb.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <unistd.h>

#define BUFSIZE 512
#define N_FILES 3
#define HOST "44.199.183.158"
#define PORT "http"

const char *files[] = {
    "index.html",
    "gatsby.txt",
    "ocelot.jpg"
};

// Establish a TCP connection with a server
// host: Name of server to connect to
// port: Port to connect to
// Returns a new TCP socket file descriptor on success or -1 on error
int connect_to_server(const char *host, const char *port) {
    struct addrinfo hints = {};
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;
    struct addrinfo *res;

    int status;
    if ((status = getaddrinfo(host, port, &hints, &res)) != 0) {
        printf("Connect error: %s\n", gai_strerror(status));
        return -1;
    }

    int sockfd = socket(res->ai_family, res->ai_socktype, 0);
    if (sockfd == -1) {
        freeaddrinfo(res);
        return -1;
    }

    if (connect(sockfd, res->ai_addr, res->ai_addrlen) == -1) {
        close(sockfd);
        freeaddrinfo(res);
        return -1;
    }

    return sockfd;
}

// Writes an HTTP request to a TCP socket
// sock_fd: File descriptor to write request to
// file: Name of the file to request from server
// Returns 0 on success or -1 on error
int write_http_request(int sock_fd, const char *file) {
    int sock_fd_copy = dup(sock_fd);
    if (sock_fd_copy == -1) {
        perror("dup");
        return -1;
    }
    FILE *sock_stream = fdopen(sock_fd_copy, "w");
    if (sock_stream == NULL) {
        perror("fdopen");
        close(sock_fd_copy);
        fclose(sock_stream);
        return -1;
    }

    char http_req[128];
    sprintf(http_req, "GET /%s HTTP/1.0\r\n\r\n", file);
    // printf("%s\n", http_req);
    int len = strlen(http_req);

    if (write(sock_fd, http_req, len) != len) {
        perror("write");
        fclose(sock_stream);
        close(sock_fd_copy);
        return -1;
    }

    if (fclose(sock_stream) != 0) {
        perror("close");
        close(sock_fd_copy);
        return -1;
    }
    close(sock_fd_copy);
    return 0;
}

// Reads an HTTP response from a TCP socket
// sock_fd: File descriptor to read response from
// file: Name of file to save response body to
// Returns 0 on success or -1 on error
int read_http_response(int sock_fd, const char *file) {
    // stdio FILE * gives us 'fgets()' to easily read line by line
    int sock_fd_copy = dup(sock_fd);
    if (sock_fd_copy == -1) {
        perror("dup");
        return -1;
    }
    FILE *socket_stream = fdopen(sock_fd_copy, "r");
    if (socket_stream == NULL) {
        perror("fdopen");
        close(sock_fd_copy);
        return -1;
    }
    // Disable the usual stdio buffering
    if (setvbuf(socket_stream, NULL, _IONBF, 0) != 0) {
        perror("setvbuf");
        fclose(socket_stream);
        return -1;
    }

    // Keep consuming lines until we find an empty line
    // This marks the end of the response headers and beginning of actual content
    char buf[BUFSIZE];
    while (fgets(buf, BUFSIZE, socket_stream) != NULL) {
        if (strcmp(buf, "\r\n") == 0) {
            break;
        }
    }

    if (fclose(socket_stream) != 0) {
        perror("fclose");
        return -1;
    }

    // Open destination file for writing
    int file_fd = open(file, O_WRONLY|O_CREAT|O_TRUNC, S_IRUSR|S_IWUSR);
    if (file_fd == -1) {
        perror("open");
        return -1;
    }

    int bytes_read;
    while ((bytes_read = read(sock_fd, buf, BUFSIZE)) > 0) {
        if (write(file_fd, buf, bytes_read) == -1) {
            perror("write");
            close(file_fd);
            return -1;
        }
    }
    if (bytes_read == -1) {
        perror("read");
        close(file_fd);
        return -1;
    }

    if (close(file_fd) != 0) {
        perror("close");
        return -1;
    }

    return 0;
}

int main(int argc, char **argv) {
    // Request each file in above array
    for (int i = 0; i < N_FILES; i++) {
        int sock_fd = connect_to_server(HOST, PORT);
        if (sock_fd == -1) {
            return 1;
        }

        if (write_http_request(sock_fd, files[i]) == -1) {
            close(sock_fd);
            return 1;
        }
        if (read_http_response(sock_fd, files[i]) == -1) {
            close(sock_fd);
            return 1;
        }

        if (close(sock_fd) == -1) {
            return 1;
        }
    }

    return 0;
}
