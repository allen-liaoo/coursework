// optimized versions of matrix diagonal summing
#include "matvec.h"

// You can write several different versions of your optimized function
// in this file and call one of them in the last function.

int sumdiag_VER1(matrix_t mat, vector_t vec) {
  if(vec.len != (mat.rows + mat.cols -1)){
    printf("sumdiag_base: bad sizes\n");
    return 1;
  }

  for(int i=0; i<vec.len; i++){
    vec.data[i] = 0;
  }

  int idx = 0;
  for (int i = 0; i < mat.rows; i++) {    // loop by row then column
    int d = 0 - i + mat.cols - 1;         // calculate d outside inner loop
    for(int j = 0; j < mat.cols; j++) {  
      vec.data[d] += mat.data[idx+j];   // get matrix and vector element and vector element, add them together
      d++;    // update d
    }
    idx += mat.cols;
  }
  return 0;
}

int sumdiag_VER2(matrix_t mat, vector_t vec) {
  // OPTIMIZED CODE HERE
  return 0;
}

int sumdiag_OPTM(matrix_t mat, vector_t vec) {
  // call your preferred version of the function
  return sumdiag_VER1(mat, vec);
}
