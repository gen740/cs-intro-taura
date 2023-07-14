/*
 * mm_seq.h --- ほとんど最適化されていない行列積
 */

/* A : MxK, B : KxN, C : MxN */
#include "matrix.h"

void mm(matrix &A, matrix &B, matrix &C) {
  long M = A.n_rows, K = A.n_cols, N = B.n_cols;
  assert(B.n_rows == K);
  assert(C.n_rows == M);
  assert(C.n_cols == N);
  for (long i = 0; i < M; i++) {
    for (long j = 0; j < N; j++) {
      real c = 0.0;
      for (long k = 0; k < K; k++) {
        asm volatile("# seq1");
        c += A(i, k) * B(k, j);
      }
      asm volatile("# seq2");
      C(i, j) += c;
    }
  }
}
