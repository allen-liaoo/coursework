#include <stdio.h>

int copy_file(const char *source_file, const char *dest_file) {
	FILE *source = fopen(source_file, "r");
	FILE *dest = fopen(dest_file, "w");
	
	if (source == NULL || dest == NULL) {
		perror("Error: ");
		return 1;
	}

	unsigned char c[128];
	size_t read;
	while ((read = fread(c, sizeof(unsigned char), 128, source)) != 0) {
		if (ferror(source)) {
			perror("Error: ");
			return 1;
		}
		fwrite(c, sizeof(unsigned char), read, dest);
		if (ferror(dest)) {
			perror("Error: ");
			return 1;
		}
	}

	fclose(source);
	fclose(dest);
    return 0;
}

int main(int argc, char **argv) {
    if (argc < 3) {
        printf("Usage: %s <source> <dest>\n", argv[0]);
        return 1;
    }

    // copy_file should print out any relevant error messages
    return copy_file(argv[1], argv[2]);
}