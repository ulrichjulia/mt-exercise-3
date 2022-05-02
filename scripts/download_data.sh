#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# link default training data for easier access

mkdir -p $data/wikitext-2

for corpus in train valid test; do
    absolute_path=$(realpath $tools/pytorch-examples/word_language_model/data/wikitext-2/$corpus.txt)
    ln -snf $absolute_path $data/wikitext-2/$corpus.txt
done

# download a different interesting data set!

mkdir -p $data/grimm

mkdir -p $data/grimm/raw

wget https://www.gutenberg.org/files/52521/52521-0.txt
mv 52521-0.txt $data/grimm/raw/tales.txt

# preprocess slightly

cat dataset/iWeb/test1/*.txt | python scripts/preprocess_raw.py >> dataset/iWeb/test1_cleaned.txt

# tokenize, fix vocabulary upper bound

cat dataset/iWeb/test1_cleaned.txt | python scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" --sent-tokenize > dataset/iWeb/test1_preprocessed.txt

# split into train, valid and test

head -n 440 dataset/iWeb/test1_preprocessed.txt | tail -n 400 > dataset/iWeb/valid.txt
head -n 840 dataset/iWeb/test1_preprocessed.txt | tail -n 400 > dataset/iWeb/test.txt
tail -n 3075 dataset/iWeb/test1_preprocessed.txt | head -n 2955 > dataset/iWeb/train.txt
