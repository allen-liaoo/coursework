#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>

#define DEPT_LEN 5
#define NAME_LEN 128

int main(int argc, char **argv) {
    if (argc != 3) {
        printf("Usage: %s <Department> <Number>\n", argv[0]);
        return 1;
    }
    // You may uncomment the following lines if you would like to use them
    const char *department = argv[1];
    int number = atoi(argv[2]);

    // TODO Send a request for a course's title to UDP server
    // You will need to use getaddrinfo() first
    // Followed by the socket() system call
    // And finally sendto() to send a request and recvfrom() to get the reply
    struct addrinfo spec = {0};
    spec.ai_family = AF_UNSPEC;
    spec.ai_socktype = SOCK_DGRAM;
    struct addrinfo *res = NULL;
    int status;
    if ((status = getaddrinfo("44.199.183.158", "4061", &spec, &res)) != 0) {
        printf("%s\n", gai_strerror(status));
        freeaddrinfo(res);
        return 1;
    }

    int sockfd;
    if ((sockfd = socket(res->ai_family, res->ai_socktype, 0)) == -1) {
        perror("socket fail\n");
        freeaddrinfo(res);
        return 1;
    }

    struct request {
        char c_dept[5];
        int c_num;
    };

    struct request req;
    strcpy(req.c_dept, department);
    req.c_num = number;
    if (sendto(sockfd, &req, sizeof(struct request), 0, res->ai_addr, res->ai_addrlen) == -1) {
        perror("sendto fail");
        return 1;
    }

    struct response {
        int status;
        char c_name[128];
    };
    struct response resp;
    struct addrinfo resadd = {0};
    if (recvfrom(sockfd, &resp, sizeof(struct response), 0, resadd.ai_addr, &resadd.ai_addrlen) == -1) {
        perror("recvfrom fail");
        return 1;
    }

    if (resp.status == -1) {
        printf("Course Not Found\n");
    } else {
        printf("Course Title: %s\n", resp.c_name);
    }
    return 0;
}
