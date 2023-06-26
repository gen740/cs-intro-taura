/*
 * mm_seq.h --- ほとんど最適化されていない行列積
 */

/* A : MxK, B : KxN, C : MxN */
#include "matrix.h"

constexpr int L = 4;

void mm(matrix &A, matrix &B, matrix &C) {
  long M = A.n_rows, K = A.n_cols, N = B.n_cols;
  assert(B.n_rows == K);
  assert(C.n_rows == M);
  assert(C.n_cols == N);
  assert(N % L == 0);

  for (long i = 0; i < M; i++) {
    for (long j = 0; j < N; j += L) {
      realv c0 = set1(0.0);
      realv c1 = set1(0.0);
      for (long k = 0; k < K; k++) {
        c0 +=A(i,k) * B.loadv(k,j);
        c1 += A(i,k) *B.loadv(k,j+L);
      }
      C.storev(i, j, C.loadv(i,j));
    }
  }
}

// 0.828509 GFLOPS normal
