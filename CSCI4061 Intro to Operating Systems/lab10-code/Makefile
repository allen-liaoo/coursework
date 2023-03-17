AN = lab10
CFLAGS = -Wall -Werror -g
CC = gcc $(CFLAGS)
SHELL = /bin/bash
CWD    = $(shell pwd | sed 's/.*\///g')

all: udp_client

course_list.o: course_list.h course_list.c
	$(CC) -c course_list.c

udp_client: udp_client.c
	$(CC) -o $@ $^

clean:
	rm -f *.o udp_server udp_client

help:
	@echo 'Typical usage is:'
	@echo '  > make                          # build all programs'
	@echo '  > make clean                    # remove all compiled items'
	@echo '  > make zip                      # create a zip file for submission'
	@echo '  > make test                     # run all tests'
	@echo '  > make test-quiz                # run tests that verify quiz answers'
	@echo '  > make test-code                # run tests that verify code is correct'

test-setup:
	@chmod u+x ./testy ./test_quiz_filter

test: test-setup udp_client
	./testy test_$(AN).org

test-quiz: test-setup QUESTIONS.txt
	./testy test_$(AN).org 1

test-code: test-setup udp_client
	./testy test_$(AN).org 2

clean-tests:
	@echo Removing temporary test files
	rm -rf *.o test-results

zip: clean clean-tests
	rm -f $(AN)-code.zip
	cd .. && zip "$(CWD)/$(AN)-code.zip" -r "$(CWD)"
	@echo Zip created in $(AN)-code.zip
	@if (( $$(stat -c '%s' $(AN)-code.zip) > 10*(2**20) )); then echo "WARNING: $(AN)-code.zip seems REALLY big, check there are no abnormally large test files"; du -h $(AN)-code.zip; fi
	@if (( $$(unzip -t $(AN)-code.zip | wc -l) > 256 )); then echo "WARNING: $(AN)-code.zip has 256 or more files in it which may cause submission problems"; fi
