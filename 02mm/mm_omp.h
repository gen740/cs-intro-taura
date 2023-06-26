/*
 * mm_seq.h --- ほとんど最適化されていない行列積
 */

/* A : MxK, B : KxN, C : MxN */
#include "matrix.h"

constexpr int L = n_lanes;

void mm(matrix &A, matrix &B, matrix &C) {
  long M = A.n_rows, K = A.n_cols, N = B.n_cols;
  assert(B.n_rows == K);
  assert(C.n_rows == M);
  assert(C.n_cols == N);
  assert(N % (2L * L) == 0);
  assert(M % 8 == 0);

#pragma omp parallel for
  for (long i = 0; i < M; i += 8) {
    for (long j = 0; j < N; j += L) {
      realv c0 = set1(0.0);
      realv c1 = set1(0.0);
      realv c2 = set1(0.0);
      realv c3 = set1(0.0);
      realv c4 = set1(0.0);
      realv c5 = set1(0.0);
      realv c6 = set1(0.0);
      realv c7 = set1(0.0);
      for (long k = 0; k < K; k++) {
        c0 += A(i, k) * B.loadv(k, j);
        c1 += A(i + 1, k) * B.loadv(k, j + L);
        c2 += A(i + 2, k) * B.loadv(k, j + L);
        c3 += A(i + 3, k) * B.loadv(k, j + L);
        c4 += A(i + 4, k) * B.loadv(k, j + L);
        c5 += A(i + 5, k) * B.loadv(k, j + L);
        c6 += A(i + 6, k) * B.loadv(k, j + L);
        c7 += A(i + 7, k) * B.loadv(k, j + L);
      }
      C.storev(i, j, C.loadv(i, j) + c0);
      C.storev(i + 1, j, C.loadv(i + 1, j) + c1);
      C.storev(i + 2, j, C.loadv(i + 2, j) + c2);
      C.storev(i + 3, j, C.loadv(i + 3, j) + c3);
      C.storev(i + 4, j, C.loadv(i + 4, j) + c4);
      C.storev(i + 5, j, C.loadv(i + 5, j) + c5);
      C.storev(i + 6, j, C.loadv(i + 6, j) + c6);
      C.storev(i + 7, j, C.loadv(i + 7, j) + c7);
    }
  }
}

// 0.828509 GFLOPS normal
