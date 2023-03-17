# CSCI 2021 lab Makefile
AN=lab01
CLASS=4061

CFLAGS = -Wall -Werror -g
CC     = gcc $(CFLAGS)
SHELL  = /bin/bash
CWD    = $(shell pwd | sed 's/.*\///g')

PROGRAMS = list_main

all: $(PROGRAMS)

# cleaning target to remove compiled programs/objects
clean:
	rm -f $(PROGRAMS) *.o

clean-tests:
	rm -rf test-results

help:
	@echo 'Typical usage is:'
	@echo '  > make                          # build all programs'
	@echo '  > make clean                    # remove all compiled items'
	@echo '  > make zip                      # create a zip file for submission'
	@echo '  > make test                     # run all tests'
	@echo '  > make test-quiz                # run tests that verify quiz answers'
	@echo '  > make test-code                # run tests that verify code is correct'
	@echo '  > make test-code testnum=3      # run tests for code, only test #3'


# 'make zip' to create zip file for submission
zip: clean clean-tests
	rm -f $(AN)-code.zip
	cd .. && zip "$(CWD)/$(AN)-code.zip" -r "$(CWD)"
	@echo Zip created in $(AN)-code.zip
	@if (( $$(stat -c '%s' $(AN)-code.zip) > 10*(2**20) )); then echo "WARNING: $(AN)-code.zip seems REALLY big, check there are no abnormally large test files"; du -h $(AN)-code.zip; fi
	@if (( $$(unzip -t $(AN)-code.zip | wc -l) > 256 )); then echo "WARNING: $(AN)-code.zip has 256 or more files in it which may cause submission problems"; fi


list.o: list.c list.h
	$(CC) -c list.c

list_main.o: list_main.c
	$(CC) -c list_main.c

list_main: list_main.o list.o   # Compile the list_main program
	$(CC) -o list_main list_main.o list.o

# testing targets
test: test-setup list_main
	./testy test_$(AN).org

test-quiz: test-setup QUESTIONS.txt
	./testy test_$(AN).org 1

test-code: test-setup list_main
	./testy test_list_main.org $(testnum)

test-setup:
	@chmod u+x ./testy
	@chmod u+x ./test_quiz_filter