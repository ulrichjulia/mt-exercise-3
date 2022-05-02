#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)

#models=$base/models
data=$base/dataset/
tools=$base/tools
samples=$base/samples

dropout=$1
name=$2
temp=$3

mkdir -p samples

num_threads=4
device=""

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $base/dataset/iWeb \
        --temperature $temp \
        --words 100 \
        --checkpoint $base/models/model_$dropout.pt \
        --outf $base/samples/$name
)
