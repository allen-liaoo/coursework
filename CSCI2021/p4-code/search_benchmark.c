#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "search.h"
// #include "search_funcs.c"

int lenofnum(int num);
void printcputime(clock_t begin, clock_t end);

// Complete this main to benchmark the search algorithms outlined in
// the project specification
int main(int argc, char *argv[]){
  if (argc < 4) {
    printf("usage: ./search_benchmark <minpow> <maxpow> <repeats> [which]\n");
    printf("which is a combination of:\n");
    printf("a : Linear Array Search\n");
    printf("l : Linked List Search\n");
    printf("b : Binary Array Search\n");
    printf("t : Binary Tree Search\n");
    printf("(default all)\n");
    return 0;
  }

  // command line parameters
  int minpow = atoi(argv[1]);
  int maxpow = atoi(argv[2]);
  int repeats = atoi(argv[3]);

  // searches to be performed
  int run_linear_array = 0;
  int run_linear_list  = 0;
  int run_binary_list  = 0;
  int run_binary_tree  = 0;

  if (argc > 4) {
    char *found;
    found = strstr(argv[4], "a");
    if (found) run_linear_array = 1;
    found = strstr(argv[4], "l");
    if (found) run_linear_list = 1;
    found = strstr(argv[4], "b");
    if (found) run_binary_list = 1;
    found = strstr(argv[4], "t");
    if (found) run_binary_tree = 1;

  // default: run all searches
  } else {
    run_linear_array = 1;
    run_linear_list  = 1;
    run_binary_list  = 1;
    run_binary_tree  = 1;
  }

  // print first row
  printf("LENGTH SEARCHES");
  if (run_linear_array) printf("      array");
  if (run_linear_list) printf("       list");
  if (run_binary_list) printf("     binary");
  if (run_binary_tree) printf("       tree");
  printf("\n");

  int amount = maxpow - minpow + 1;
  clock_t begin, end;

  // get the starting length
  int len = 1;
  for (int i = 0; i < minpow; i++) {
    len *= 2;
  }

  // loop through the rows
  for (int i = 0; i < amount; i++) {
    // put the right number of spaces before the length number
    int spaces = 6 - lenofnum(len);
    for (int j = 0; j < spaces; j++) {
      printf(" ");
    }
    printf("%d ", len);

    // put the right number of spaces before the number of searches
    int searches = len * repeats * 2;
    spaces = 8 - lenofnum(searches);
    for (int j = 0; j < spaces; j++) {
      printf(" ");
    }
    printf("%d ", searches);

    // begin searches
    int searchuntil = 2 * len - 1;

    if (run_linear_array) {
      int *array = make_evens_array(len);

      // search and time it
      begin = clock();
      for (int j = 0; j < repeats; j++) {
        for (int k = 0; k < searchuntil; k++) {
          linear_array_search(array, len, k);
        }
      }
      end = clock();
      printcputime(begin, end);
      free(array);
    }

    if (run_linear_list) {
      list_t *list = make_evens_list(len);

      begin = clock();
      for (int j = 0; j < repeats; j++) {
        for (int k = 0; k < searchuntil; k++) {
          linkedlist_search(list, len, k);
        }
      }
      end = clock();
      printcputime(begin, end);
      list_free(list);
    }

    if (run_binary_list) {
      int *array = make_evens_array(len);

      begin = clock();
      for (int j = 0; j < repeats; j++) {
        for (int k = 0; k < searchuntil; k++) {
          binary_array_search(array, len, k);
        }
      }
      end = clock();
      printcputime(begin, end);
      free(array);
    }

    if (run_binary_tree) {
      bst_t *tree = make_evens_tree(len);

      begin = clock();
      for (int j = 0; j < repeats; j++) {
        for (int k = 0; k < searchuntil; k++) {
          binary_tree_search(tree, len, k);
        }
      }
      end = clock();
      printcputime(begin, end);
      bst_free(tree);
    }

    printf("\n");
    len = len * 2;
  }

  return 0;
}

int lenofnum(int num) {
  int len = 0;
  while (num > 0) {
    num = num / 10;
    len++;
  }
  return len;
}

void printcputime(clock_t begin, clock_t end) {
  printf("%.4e ", ((double) (end - begin)) / CLOCKS_PER_SEC);
}