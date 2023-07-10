#pragma once

#include "counter.h"
#include "nbody.h"
#include <assert.h>
#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <x86intrin.h>

void die(const char *s) {
  perror(s);
  exit(1);
}

#if __AVX512F__
enum { VS = 64 };
#elif __AVX2__
enum { VS = 32 };
#else
#error "neither __AVX512F__ nor __AVX2__ defined"
#endif

typedef int32_t particle_idx;
typedef real realv __attribute__((vector_size(VS), aligned(sizeof(real))));
typedef particle_idx particle_idxv
    __attribute__((vector_size(VS), aligned(sizeof(real))));
enum {
  n_lanes = sizeof(realv) / sizeof(real),
};

#if __AVX512F__
realv set1(real c) { return _mm512_set1_ps(c); }
#elif __AVX2__
realv set1(real c) { return _mm256_set1_ps(c); }
#else
#error "neither __AVX512F__ nor __AVX2__ defined"
#endif

struct vecv {
  realv x[3];
  vecv(realv a, realv b, realv c) {
    x[0] = a;
    x[1] = b;
    x[2] = c;
  }
  vecv(realv a) {
    x[0] = a;
    x[1] = a;
    x[2] = a;
  }
  vecv() {}
};

vec operator+(vec a, vec b) {
  return vec(a.x[0] + b.x[0], a.x[1] + b.x[1], a.x[2] + b.x[2]);
}

vecv operator+(vecv a, vecv b) {
  return vecv(a.x[0] + b.x[0], a.x[1] + b.x[1], a.x[2] + b.x[2]);
}

vec operator-(vec a, vec b) {
  return vec(a.x[0] - b.x[0], a.x[1] - b.x[1], a.x[2] - b.x[2]);
}

vecv operator-(vecv a, vecv b) {
  return vecv(a.x[0] - b.x[0], a.x[1] - b.x[1], a.x[2] - b.x[2]);
}

vecv operator-(vec a, vecv b) {
  return vecv(set1(a.x[0]) - b.x[0], set1(a.x[1]) - b.x[1],
              set1(a.x[2]) - b.x[2]);
}

vec operator*(vec a, real k) { return vec(k * a.x[0], k * a.x[1], k * a.x[2]); }

vecv operator*(vecv a, realv k) {
  return vecv(k * a.x[0], k * a.x[1], k * a.x[2]);
}

vec operator/(vec a, real k) { return a * (1.0 / k); }

real dot(vec u, vec v) {
  return u.x[0] * v.x[0] + u.x[1] * v.x[1] + u.x[2] * v.x[2];
}

realv dot(vecv u, vecv v) {
  return u.x[0] * v.x[0] + u.x[1] * v.x[1] + u.x[2] * v.x[2];
}

real norm2(vec u) { return dot(u, u); }

realv norm2v(vecv u) { return dot(u, u); }

typedef struct {
  particle_idx idx;
  real m;
  vec pos;
  vec vel;
  vec acc;
} particle;

typedef struct {
  particle_idxv idx;
  realv m;
  vecv pos;
  vecv vel;
  vecv acc;
} particlev;

typedef struct {
  long n_particles;
  long n_steps;
  real dt;
  real T;
  real rv;
  real eps;
  char *dump_file;
  long dump_n_particles;
  long dump_start;
  long dump_stop;
  long dump_interval;
  long seed;
} options_t;

#if __AVX512F__
realv rsqrtv(realv x) {
  __m256 x0 = {x[0], x[1], x[2], x[3]};
  __m256 x1 = {x[4], x[5], x[6], x[7]};
  __m256 y0 = _mm256_rsqrt_ps(x0);
  __m256 y1 = _mm256_rsqrt_ps(x1);
  realv y = {y0[0], y0[1], y0[2], y0[3], y1[0], y1[1], y1[2], y1[3]};
  return y;
}
#elif __AVX2__
realv rsqrtv(realv x) { return _mm256_rsqrt_ps(x); }
#endif

real rsqrt(real x) { return rsqrtv(set1(x))[0]; }
