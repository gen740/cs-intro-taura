#pragma once
#include "particle.h"
#include <cstdint>
#include <iostream>

/**
   @file nbody_seq.h --- single-core, non-vectorized implementation
 */

/**
   @brief pがqから受ける加速度を計算して p->acc に加算 (mM/(r^2+eps^2)
   r/sqrt(r^2+eps^2))
   @return pがqから受けるポテンシャル (-mM/(r^2+eps^2))
 */
inline realv interact2(particlev *p, /** 力を受ける粒子 */
                       particle *q,  /** 力を与える粒子 */
                       real eps      /** ソフトニングパラメータ */
) {
  vecv dx = q->pos - p->pos;
  realv r2 = norm2v(dx) + eps * eps;
  realv rinv = rsqrtv(r2);
  vecv f = dx * (q->m * rinv * rinv * rinv);
  p->acc = p->acc + f;
  return -p->m * q->m * rinv;
}

/**
   @brief 全粒子(p[0] ... p[n-1])が受ける加速度を計算
   @return 全ポテンシャル
 */
inline real interact_all(long n,        /** 粒子数 */
                         particle *p,   /** 粒子配列 */
                         particlev *pv, /** SIMD粒子の配列(未使用)  */
                         options_t *o /** コマンドラインオプション  */
) {
  realv U{0.0};
  real eps = o->eps;

  for (long i = 0; i < n / n_lanes; i++) {
    for (long j = 0; j < n_lanes; j++) {
      pv[i].m[j] = p[i * n_lanes + j].m;
      pv[i].pos.x[0][j] = p[i * n_lanes + j].pos.x[0];
      pv[i].pos.x[1][j] = p[i * n_lanes + j].pos.x[1];
      pv[i].pos.x[2][j] = p[i * n_lanes + j].pos.x[2];
      pv[i].acc.x[0][j] = 0;
      pv[i].acc.x[1][j] = 0;
      pv[i].acc.x[2][j] = 0;
    }
  }

  for (long i = 0; i < n / n_lanes; i++) {
    for (long j = 0; j < n; j++) {
      uint64_t diff = static_cast<uint64_t>(j - i * n_lanes);
      realv factor{0.0};
      for (int k = 0; k < n_lanes; k++) {
        factor[k] = 1.0;
      }
      if (diff < 8) {
        factor[diff] = 0.0;
      }
      U += interact2(pv + i, p + j, eps) * factor;
    }
  }

  for (long i = 0; i < n / n_lanes; i++) {
    for (long j = 0; j < n_lanes; j++) {
      p[i * n_lanes + j].acc.x[0] = pv[i].acc.x[0][j];
      p[i * n_lanes + j].acc.x[1] = pv[i].acc.x[1][j];
      p[i * n_lanes + j].acc.x[2] = pv[i].acc.x[2][j];
    }
  }

  real sum{0};
  for (int i = 0; i < n_lanes; i++) {
    sum += U[i];
  }

  return 0.5 * sum;
}

/**
   @brief 全粒子(p[0] ... p[n-1])の運動エネルギー
   @return 全運動エネルギー
 */
inline real kinetic(long n,     /** 粒子数 */
                    particle *p /** 粒子配列 */
) {
  real K = 0.0;
  for (long i = 0; i < n; i++) {
    K += 0.5 * p[i].m * norm2(p[i].vel);
  }
  return K;
}

/**
   @brief 全粒子(p[0]...p[n-1])の加速度が与えられた状態で,
   全粒子のdt時間後の速度と位置を計算
   @return dt
 */
inline real update(long n,      /** 粒子数 */
                   particle *p, /** 粒子配列 */
                   real dt      /** 時間 */
) {
  for (long i = 0; i < n; i++) {
    p[i].vel = p[i].vel + p[i].acc * dt;
    p[i].pos = p[i].pos + p[i].vel * dt;
  }
  return dt;
}
