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
done_txt=0done.txt
log_txt=0log.txt

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

    echo "################################################## seq"
    ../03nbody/exe/nbody_seq.exe -n 131072 -s 1 > nbody_seq.log

    echo "################################################## simd"
    ../03nbody/exe/nbody_simd.exe -n 131072 -s 1 > nbody_simd.log

    echo "################################################## Omp"
    OMP_PROC_BIND=true OMP_NUM_THREADS=2 ../03nbody/exe/nbody_omp.exe -n 131072 -s 1 > nbody_omp2.log

    echo "################################################## Omp"
    OMP_PROC_BIND=true OMP_NUM_THREADS=4 ../03nbody/exe/nbody_omp.exe -n 131072 -s 1 > nbody_omp4.log

    echo "################################################## Omp"
    OMP_PROC_BIND=true OMP_NUM_THREADS=8 ../03nbody/exe/nbody_omp.exe -n 131072 -s 1 > nbody_omp8.log

    echo "################################################## Omp"
    OMP_PROC_BIND=true OMP_NUM_THREADS=16 ../03nbody/exe/nbody_omp.exe -n 131072 -s 1 > nbody_omp16.log

    echo "################################################## Omp"
    OMP_PROC_BIND=true OMP_NUM_THREADS=32 ../03nbody/exe/nbody_omp.exe -n 131072 -s 1 > nbody_omp32.log
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
