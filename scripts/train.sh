#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)

models=$base/models
data=$base/dataset
tools=$base/tools

mkdir -p models

num_threads=4
device=""

dropout=$1

SECONDS=0

(cd tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $base/dataset/iWeb \
        --epochs 40 \
        --log-interval 100 \
        --emsize 200 --nhid 200 --dropout $dropout --tied \
        --save $base/models/model_$dropout.pt
)

echo "time taken:"
echo "$SECONDS seconds"
