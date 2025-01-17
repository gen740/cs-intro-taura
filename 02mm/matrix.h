#pragma once
#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <x86intrin.h>
// #include "cpu_clock.h"
#include "counter.h"

typedef float real;
#if __AVX512F__
typedef real realv __attribute__((vector_size(64), aligned(sizeof(real))));
realv set1(real c) { return _mm512_set1_ps(c); }
#elif __AVX2__
typedef real realv __attribute__((vector_size(32), aligned(sizeof(real))));
realv set1(real c) { return _mm256_set1_ps(c); }
#endif
enum { n_lanes = sizeof(realv) / sizeof(real) };

/* 行列クラス
   matrix A;
   init(A, M, N, rg);
 */
struct matrix {
  long n_rows; // 計算対象の行数
  long n_cols; // 計算対象の列数
  long ld;     // 1行の要素数(a[i,j]からa[i+1,j]までの要素数)
  real *a;     // 要素の配列(行優先: a(0,0), a(0,1), ...)
  // A(i,j) で (i,j)要素へアクセスできるようにするための関数
  real &operator()(long i, long j) { return a[i * ld + j]; }
  realv loadv(long i, long j) { return *((realv *)(&a[i * ld + j])); }
  void storev(long i, long j, realv v) { *((realv *)(&a[i * ld + j])) = v; }
};

/* Aを MxNのゼロ行列にする */
void zero(matrix &A, long M, long N) {
  A.n_rows = M;
  A.n_cols = N;
  A.ld = N;
  A.a = (real *)_mm_malloc(sizeof(real) * M * N, 64);
  for (long i = 0; i < M; i++) {
    for (long j = 0; j < N; j++) {
      A(i, j) = 0.0;
    }
  }
}

/* Aの要素をランダムに初期化する */
void init(matrix &A, long M, long N, unsigned short rg[3]) {
  A.n_rows = M;
  A.n_cols = N;
  A.ld = N;
  A.a = (real *)_mm_malloc(sizeof(real) * M * N, 64);
  for (long i = 0; i < M; i++) {
    for (long j = 0; j < N; j++) {
      A(i, j) = -1.0 + 2.0 * erand48(rg); /* 乱数 */
    }
  }
}

void destroy(matrix &A) {
  A.n_rows = 0;
  A.n_cols = 0;
  A.ld = 0;
  free(A.a);
  A.a = 0;
}

/* プログラムのオプション
   C : MxN (zero)
   A : MxK (乱数)
   B : KxN (乱数)
   として C += A * B を repeat回繰り返す.
   seedは乱数の種
 */
typedef struct {
  long M;
  long N;
  long K;
  long repeat;
  long seed;
} options_t;

#include MMx_H

void help(options_t *o, char *argv0) {
  fprintf(
      stderr,
      "usage:\n"
      "  %s [options]:\n"
      "perform matrix matrix multiply of (M,N) += (M,K) * (K,N) \n"
      "options:\n"
      " -M num : set M to num (%ld)\n"
      " -N num : set N to num (%ld)\n"
      " -K num : set K to num (%ld)\n"
      " -r num : repeat num times (%ld)\n"
      " -x X : set random seed to X, to change initial configuration (%ld)\n",
      argv0, o->M, o->N, o->K, o->repeat, o->seed);
}

/* コマンドラインを処理して, options_t 構造体にオプションをセット */
int parse_args(int argc, char **argv, options_t *o) {
  o->M = 16;
  o->N = 32;
  o->K = 128;
  o->repeat = 1;
  o->seed = 9876543210987654L;
  while (1) {
    int f = getopt(argc, argv, "M:N:K:r:x:");
    switch (f) {
    case -1:
      return 1; // OK
    case 'M':
      o->M = atol(optarg);
      break;
    case 'N':
      o->N = atol(optarg);
      break;
    case 'K':
      o->K = atol(optarg);
      break;
    case 'r':
      o->repeat = atol(optarg);
      break;
    case 'x':
      o->seed = atol(optarg);
      break;
    default:
      help(o, argv[0]);
      exit(1);
    }
  }
  assert(0); // should not reach here
}

/* C の要素をいくつかチェックしてあっていそうかチェック */
void check(matrix &A, matrix &B, matrix &C, long repeat) {
  unsigned short rg[3] = {729, 918, 723};
  float max_rel_err = 0.0;
  for (long t = 0; t < 10; t++) {
    /* ランダムな要素(C(i,j))を選ぶ */
    long i = nrand48(rg) % C.n_rows;
    long j = nrand48(rg) % C.n_cols;
    /*  C(i,j) は以下で計算できるはず */
    real s = 0.0;
    for (long k = 0; k < A.n_cols; k++) {
      s += A(i, k) * B(k, j);
    }
    /* repeat回繰り返しているからその repeat 倍 */
    s *= repeat;
    /* 相対エラーをチェック (1.0e-3 以内という保証はないが) */
    float rel_err = fabs((C(i, j) - s) / s);
    if (rel_err > 1.0e-3) {
      fprintf(stderr, "error: C(%ld,%ld) = %f != %f\n", i, j, C(i, j), s);
      exit(1);
    }
    if (rel_err > max_rel_err)
      max_rel_err = rel_err;
  }
  printf("OK: max relative error = %f\n", max_rel_err);
}
