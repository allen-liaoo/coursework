#include "hashset.h"

int main(int argc, char *argv[]) {
    printf("Hashset Application\n");
    printf("Commands:\n");
    printf("  hashcode <item>  : prints out the numeric hash code for the given key (does not change the hash set)\n");
    printf("  contains <item>  : prints the value associated with the given item or NOT PRESENT\n");
    printf("  add <item>       : inserts the given item into the hash set, reports existing items\n");
    printf("  print            : prints all items in the hash set in the order they were addded\n");
    printf("  structure        : prints detailed structure of the hash set\n");
    printf("  clear            : reinitializes hash set to be empty with default size\n");
    printf("  save <file>      : writes the contents of the hash set to the given file\n");
    printf("  load <file>      : clears the current hash set and loads the one in the given file\n");
    printf("  next_prime <int> : if <int> is prime, prints it, otherwise finds the next prime and prints it\n");
    printf("  expand           : expands memory size of hash set to reduce its load factor\n");
    printf("  bye              : exit the program\n");

    int echo = 0;                                // controls echoing, 0: echo off, 1: echo on
    if(argc > 1 && strcmp("-echo",argv[1]) == 0) { // turn echoing on via -echo command line option
        echo = 1;
    }

    char cmd[128];
    hashset_t hs;
    int success;
    hashset_init(&hs, HASHSET_DEFAULT_TABLE_SIZE);

    while(1){
        printf("HS|> ");                 
        success = fscanf(stdin,"%s",cmd);   // read a command
        if(success == EOF) {                // check for end of input
            printf("\n");                   // found end of input
            break;                          // break from loop
        }

        if(strcmp("bye", cmd) == 0) {     // check for exit command
            if(echo){
                printf("bye\n");
            }
            break;                          // break from loop
        }

        else if (strcmp("add", cmd) == 0) {
            fscanf(stdin, "%s", cmd);       // read string to search for
            if (echo) {
                printf("add %s\n", cmd);
            }

            success = hashset_add(&hs, cmd);
            if (!success) {
                printf("Item already present, no changes made\n");
            }
        }

        else if (strcmp("contains", cmd) == 0) {
            fscanf(stdin, "%s", cmd);       // read string to search for
            if (echo) {
                printf("contains %s\n", cmd);
            }

            success = hashset_contains(&hs, cmd);
            if(success){
                printf("FOUND: %s\n", cmd);
            }
            else{
                printf("NOT PRESENT\n");
            }
        }

        else if (strcmp("print", cmd) == 0) {
            if (echo) {
                printf("print\n");
            }

            hashset_write_items_ordered(&hs, stdout);
        }

        else if (strcmp("hashcode", cmd) == 0) {
            fscanf(stdin, "%s", cmd);
            if (echo) {
                printf("hashcode %s\n", cmd);
            }

            long hs = hashcode(cmd);
            printf("%ld\n", hs);
        }

        else if (strcmp("structure", cmd) == 0) {
            if (echo) {
                printf("structure\n");
            }

            hashset_show_structure(&hs);
        }

        else if (strcmp("clear", cmd) == 0) {
            if (echo) {
                printf("clear\n");
            }

            // free fields then re-initialize
            hashset_free_fields(&hs);
            hashset_init(&hs, HASHSET_DEFAULT_TABLE_SIZE);
        }

        else if (strcmp("save", cmd) == 0) {
            fscanf(stdin, "%s", cmd);
            if (echo) {
                printf("save %s\n", cmd);
            }

            hashset_save(&hs, cmd);
        }

        else if (strcmp("load", cmd) == 0) {
            fscanf(stdin, "%s", cmd);
            if (echo) {
                printf("load %s\n", cmd);
            }

            success = hashset_load(&hs, cmd);
            if (!success) printf("load failed\n");
        }

        else if (strcmp("next_prime", cmd) == 0) {
            int prime = -1;
            fscanf(stdin, "%d", &prime);
            if (echo) {
                printf("next_prime %d\n", prime);
            }

            prime = next_prime(prime);
            printf("%d\n", prime);
        }

        else if (strcmp("expand", cmd) == 0) {
            if (echo) {
                printf("expand\n");
            }

            hashset_expand(&hs);
        }

        else{                                 // unknown command
            if(echo){
                printf("%s\n", cmd);
            }
            printf("unknown command %s\n", cmd);
        }
    }
    
    hashset_free_fields(&hs);
    return 0;
}