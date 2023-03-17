#include <stdio.h>
#include <stdlib.h>

// Read the last 'num_ints' from the binary file with name 'file_name'
// Returns 0 upon success or 1 if an error occurs
int read_last_ints(const char *file_name, int num_ints) {
    // TODO Not yet implemented
	FILE* file = fopen(file_name, "r");
	if (file == NULL) {
		perror("Error: ");
		return 1;
	}
	
	if (fseek(file, (-1*num_ints*sizeof(int)), SEEK_END) == -1) {
		perror("Error: ");
		return 1;
	}

	int nums[num_ints];
	fread(nums, sizeof(int), num_ints, file);
	if (ferror(file)) {
		perror("Error: ");
		return 1;
	}

	for (int i = 0; i < num_ints; i++) {
		printf("%d\n", nums[i]);
	}
	
    return 0;
}

int main(int argc, char **argv) {
    if (argc < 3) {
        printf("Usage: %s <file_name> <num_ints>\n", argv[0]);
        return 1;
    }

    const char *file_name = argv[1];
    int num_ints = atoi(argv[2]);
    if (read_last_ints(file_name, num_ints) != 0) {
        printf("Failed to read last %d ints from file %s\n", num_ints, file_name);
        return 1;
    }
    return 0;
}