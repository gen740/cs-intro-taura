#!/bin/bash
#------ pjsub option --------#
#PJM -L rscgrp=lecture
#PJM -L node=1
#PJM --mpi proc=1
#PJM --omp thread=1
#PJM -L elapse=0:01:00
#PJM -g gt11
#PJM -j
#PJM -o 0done.txt
done_txt=1done.txt
log_txt=1log.txt

# 使い方 :
# (1) batch_main の中に計算ノードで実行したいコマンドを書く
# (2) 必要に応じて 上記 elapse=0:01:00 (1分) を変更
# (3) (/work/gt11/ユーザ名 の下のどこかで)
#     ./submit.sh
#
# 普通に pjsub を使うのに比べて便利なところ
# * 実行が何時始まっていつ終わったかがわかりやすい
# * 毎回違う名前の出力ファイルを作らない
# * 標準出力と標準エラーを同じファイルに書いてくれる

batch_main() {
    # ここに, 計算ノードで実行したいコマンドを書く
    echo "whoami: $(whoami)"
    echo "pwd: $(pwd)"
    echo "hostname: $(hostname)"

    echo "################################################## Omp"
    OMP_PROC_BIND=true OMP_NUM_THREADS=2 ../02mm/exe/mm_omp.exe -K 2048 -M 256 -N 2048 > mm_omp2_1.log

    echo "################################################## Omp"
    OMP_PROC_BIND=true OMP_NUM_THREADS=4 ../02mm/exe/mm_omp.exe -K 2048 -M 256 -N 2048 > mm_omp4_1.log

    echo "################################################## Omp"
    OMP_PROC_BIND=true OMP_NUM_THREADS=8 ../02mm/exe/mm_omp.exe -K 2048 -M 256 -N 2048 > mm_omp8_1.log

    echo "################################################## Omp"
    OMP_PROC_BIND=true OMP_NUM_THREADS=16 ../02mm/exe/mm_omp.exe -K 2048 -M 256 -N 2048 > mm_omp16_1.log

    echo "################################################## Omp"
    OMP_PROC_BIND=true OMP_NUM_THREADS=32 ../02mm/exe/mm_omp.exe -K 2048 -M 256 -N 2048 > mm_omp32_1.log

    echo "################################################## Omp"
    OMP_PROC_BIND=true OMP_NUM_THREADS=56 ../02mm/exe/mm_omp.exe -K 2048 -M 256 -N 2048 > mm_omp56_1.log

    echo "################################################## SIMD"
    ../02mm/exe/mm_simd.exe -K 2048 -M 256 -N 2048 > mm_simd_1.log

    echo "################################################## Sequencial"
    ../02mm/exe/mm_seq.exe -K 2048 -M 256 -N 2048 > mm_seq_1.log
}

# ここから下は書き換える必要なし
wait_finish() {
    pjstat ${jobid}
    while pjstat ${jobid} | grep ${jobid} | grep QUEUED > /dev/null ; do
        echo -n .
        sleep 1
    done
    echo "started"
    pjstat ${jobid}
    while pjstat ${jobid} | grep ${jobid} > /dev/null ; do
        echo -n .
        sleep 1
    done
    echo 
}

if [ "$PJM_JOBNAME" = "" ] ; then
    rm -f ${done_txt} ${log_txt}
    if [ "$1" = "" ] ; then
        jobid=$(pjsub $0 | grep -o -E 'pjsub Job [0-9]+ submitted' | cut -d ' ' -f 3)
    else
        jobid=$(pjsub -x CMDLINE="$*" $0 | grep -o -E 'pjsub Job [0-9]+ submitted' | cut -d ' ' -f 3)
    fi
    if [ "$jobid" != "" ]; then
        wait_finish
    fi
    cat ${log_txt}
else
    batch_main > ${log_txt} 2>&1
fi
# pjsub --interact -L rscgrp=regular-cache -L node=1 -L elapse=0:01:00 -g gc64
