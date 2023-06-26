/*
 * mm.cc --- 行列積
 */
#include "matrix.h"


int main(int argc, char ** argv) {
  options_t o[1];
  /* コマンドラインを処理 */
  if (!parse_args(argc, argv, o)) return 1; // NG
  unsigned short rg[3] = { (unsigned short)(o->seed >> 32),
			   (unsigned short)(o->seed >> 16),
			   (unsigned short)(o->seed >> 0) };
  long M = o->M, N = o->N, K = o->K;
  /* A : MxK, B : KxN, C : MxN として行列を初期化 */
  matrix A, B, C;
  init(A, M, K, rg);
  init(B, K, N, rg);
  zero(C, M, N);
  /* A, B, C の大きさやflopsを表示 */
  long A_sz = M * K * sizeof(real);
  long B_sz = K * N * sizeof(real);
  long C_sz = M * N * sizeof(real);
  long flops = 2 * M * N * K * o->repeat;
  long vfmadds = flops / (2 * n_lanes);
  printf("A = %ld x %ld (%ld bytes)\n", M, K, A_sz);
  printf("B = %ld x %ld (%ld bytes)\n", K, N, B_sz);
  printf("C = %ld x %ld (%ld bytes)\n", M, N, C_sz);
  printf("repeat C += A * B %ld times\n", o->repeat);
  printf("%ld flops, total %ld bytes\n",
	 flops, A_sz + B_sz + C_sz);
  profiler_t pr = mk_profiler();
  /* 本題. C += A * B を repeat 回繰り返す
     ここを測定する */
  for (long i = 0; i < o->repeat; i++) {
    mm(A, B, C);
  }
  counters_t c = profiler_get(pr);
  profiler_destroy(pr);
  long long dr = c.tsc;
  long long ds = c.ns;
  long dc = c.values[0];
  for (int i = 0; i < c.n; i++) {
    printf("%20s: %ld\n", c.names[i], c.values[i]);
  }
  printf("%20s: %ld\n", "ref cycles", c.tsc);
  printf("%20s: %.3f\n", "time", c.ns * 1.0e-9);
  printf("%.3f flops/clock = %.3f vfmadds/clock\n", flops / (double)dr, vfmadds / (double)dr);
  printf("%.3f flops/cpu clock = %.3f vfmadds/cpu clock\n", flops / (double)dc, vfmadds / (double)dc);
  printf("%f GFLOPS\n", flops / (double)ds);
  /* 結果がまともかどうかチェック */
  check(A, B, C, o->repeat);
  destroy(A);
  destroy(B);
  destroy(C);
  return 0;
}
