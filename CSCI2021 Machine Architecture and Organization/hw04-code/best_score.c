#include <stdio.h>

typedef struct {
  char name[128];               // name of student
  double score;                 // score on exam
} grade_t;
// struct which allows assignment of name/score such as in
//   best = curgrade;
//   printf("best is now: %s %f\n", best.name, best.score);

int main(int argc, char *argv[]){

  if(argc < 2){
    printf("usage: %s <filename>\n", argv[0]);
    printf("<filename> should have columns of names, numbers as in\n");
    printf("Darlene 91.0\n");
    printf("Angela  76.5\n");
    printf("Elliot  94.5\n");
    printf("Tyrell  87.5\n");
    printf("Dom     70.0\n");
    printf("Phillip 55.5\n");
    return 0;
  }

  // FILL IN YOUR CODE HERE
  char *filename = argv[1];
  FILE *fin = fopen(filename, "r");
  if (fin == NULL) {
    printf("could not open the file\n");
    return 0;
  }

  grade_t best = {.name = {}, .score = -1};
  while (1) {
    grade_t curgrade;
    int success = fscanf(fin, "%s", curgrade.name);
    if (success == EOF) break;

    fscanf(fin, "%lf", &curgrade.score);

    if (best.score < curgrade.score) {
      best = curgrade;
      printf("best is now: %s %f\n", best.name, best.score);
    }
  }

  if (best.score == -1) {
    printf("file was empty\n");
    return 0;
  }

  printf("Best score: %s %.6lf\n", best.name, best.score);

  fclose(fin);
  return 0;
}
