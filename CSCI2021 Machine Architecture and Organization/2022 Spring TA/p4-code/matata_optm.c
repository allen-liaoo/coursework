// optimized versions of matrix A^T*A operation
#include "matvec.h"
#include <string.h>

int matata_VER1(matrix_t mat, matrix_t ans) {
    // omit creating transpose matrix
    // use memset to zero ans matrix (rather than a loop)
    memset(ans.data, 0, ans.rows*ans.cols*sizeof(int));

    // reorder memory access pattern to favor cache
    for (int r = 0; r < mat.rows; r++) {
        for (int i = 0; i < ans.rows; i++) {
            int lead = MGET(mat, r, i);
            for (int j = 0; j < ans.cols; j++) {
                int x = MGET(mat, r, j);
                x *= lead;
                x += MGET(ans, i, j);
                MSET(ans, i, j, x);
            }
        }
    }
    return 0;
}

// ADDITIONAL VERSIONS HERE

// symmetry; not worth it
int matata_VER2(matrix_t mat, matrix_t ans) {
    // omit creating transpose matrix
    // use memset to zero ans matrix (rather than a loop)
    memset(ans.data, 0, ans.rows*ans.cols*sizeof(int));

    // reorder memory access pattern to favor cache
    // compute only half of the matrix (symmetry)
    for (int r = 0; r < mat.rows; r++) {
        for (int i = 0; i < ans.rows; i++) {
            int lead = MGET(mat, r, i);
            for (int j = 0; j < ans.cols; j++) {
                if (j < i) {
                    int x = MGET(ans, j, i);
                    MSET(ans, i, j, x);
                } else {
                    int x = MGET(mat, r, j);
                    x *= lead;
                    x += MGET(ans, i, j);
                    MSET(ans, i, j, x);
                }
            }
        }
    }
    return 0;
}

// split up addition destination
int matata_VER3(matrix_t mat, matrix_t ans) {
    // omit creating transpose matrix
    // use memset to zero ans matrix (rather than a loop)
    memset(ans.data, 0, ans.rows*ans.cols*sizeof(int));

    // reorder memory access pattern to favor cache
    for (int r = 0; r < mat.rows; r++) {
        for (int i = 0; i < ans.rows; i++) {
            int lead = MGET(mat, r, i);
            for (int j = 0; j < ans.cols; j++) {
                int x = MGET(mat, r, j);
                x *= lead;
                int y = MGET(ans, i, j);
                x += y;
                MSET(ans, i, j, x);
            }
        }
    }
    return 0;
}

// rid of MSET/MGET
int matata_VER4(matrix_t mat, matrix_t ans) {
    // omit creating transpose matrix
    // use memset to zero ans matrix (rather than a loop)
    memset(ans.data, 0, ans.rows*ans.cols*sizeof(int));

    // reorder memory access pattern to favor cache
    register int len = mat.cols;
    for (int r = 0; r < mat.rows; r++) {
        for (int i = 0; i < ans.rows; i++) {
            register int lead = mat.data[r*len+i];
            for (int j = 0; j < ans.cols; j++) {
                register int x = mat.data[r*len+j];
                x *= lead;
                register int y = ans.data[i*len+j];
                x += y;
                ans.data[i*len+j] = x;
            }
        }
    }
    return 0;
}

// extract arithmetic operations with multiple use, make them variables
// sometimes get bonus points, average 39 points
int matata_VER5(matrix_t mat, matrix_t ans) {
    // omit creating transpose matrix
    // use memset to zero ans matrix (rather than a loop)
    memset(ans.data, 0, ans.rows*ans.cols*sizeof(int));

    // reorder memory access pattern to favor cache
    register int len = mat.cols;
    for (int r = 0; r < len; r++) {
        for (int i = 0; i < len; i++) {
            register int rbase = r*len;
            register int lead = mat.data[r*len+i];
            register int ibase = i*len;
            for (int j = 0; j < len; j++) {
                register int x = mat.data[rbase+j];
                x *= lead;
                register int index = ibase+j;
                register int y = ans.data[index];
                x += y;
                ans.data[index] = x;
            }
        }
    }
    return 0;
}

// loop unrolling
int matata_VER6(matrix_t mat, matrix_t ans) {
    // omit creating transpose matrix
    // use memset to zero ans matrix (rather than a loop)
    memset(ans.data, 0, ans.rows*ans.cols*sizeof(int));

    // reorder memory access pattern to favor cache
    register int len = mat.cols;
    for (int r = 0; r < len; r++) {
        for (int i = 0; i < len; i++) {
            register int rlen = r*len;
            register int ilen = i*len;
            register int lead = mat.data[r*len+i];
            register int j;
            for (j = 0; j < len-3; j+=3) {
                register int rbase = rlen+j;
                register int ibase = ilen+j;
                // 1
                {
                    register int x1 = mat.data[rbase];
                    x1 *= lead;
                    register int y1 = ans.data[ibase];
                    x1 += y1;
                    ans.data[ibase] = x1;
                }
                // 2
                {
                    register int x2 = mat.data[rbase+1];
                    x2 *= lead;
                    register int y2 = ans.data[ibase+1];
                    x2 += y2;
                    ans.data[ibase+1] = x2;
                }
                // 3
                {
                    register int x3 = mat.data[rbase+2];
                    x3 *= lead;
                    register int y3 = ans.data[ibase+2];
                    x3 += y3;
                    ans.data[ibase+2] = x3;
                }
            }
            // take care of the last few cases
            for (; j < len; j++) {
                register int x = mat.data[rlen+j];
                x *= lead;
                register int y = ans.data[ilen+j];
                x += y;
                ans.data[ilen+j] = x;
            }
        }
    }
    return 0;
}

int matata_OPTM(matrix_t mat, matrix_t ans) {
  if(mat.rows != mat.cols ||                    // must be a square matrix for A^T*A
     mat.rows != ans.rows ||
     mat.cols != ans.cols)
  {
    printf("matata_OPTM: dimension mismatch\n");
    return 1;
  }

  // Call to some version of optimized code
  return matata_VER6(mat, ans);
}