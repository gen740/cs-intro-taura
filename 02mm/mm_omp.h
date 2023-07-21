/*
 * mm_seq.h --- ほとんど最適化されていない行列積
 */

/* A : MxK, B : KxN, C : MxN */
#include "matrix.h"

constexpr int L = n_lanes;
constexpr int P = 1;

void mm(matrix &A, matrix &B, matrix &C) {
  long M = A.n_rows, K = A.n_cols, N = B.n_cols;
  assert(B.n_rows == K);
  assert(C.n_rows == M);
  assert(C.n_cols == N);
  assert(N % (2L * L) == 0);
  assert(M % P == 0);

#pragma omp parallel for
  for (long i = 0; i < M; i += P) {
    for (long j = 0; j < N; j += L) {
      realv c[P];
      for (int n = 0; n < P; n++) {
        c[n] = set1(0.0);
      }
      for (long k = 0; k < K; k++) {
        for (int n = 0; n < P; n++) {
          c[n] += A(i + n, k) * B.loadv(k, j);
        }
      }
      for (int n = 0; n < P; n++) {
        C.storev(i + n, j, C.loadv(i + n, j) + c[n]);
      }
    }
  }
}
