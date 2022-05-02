#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# link default training data for easier access

mkdir -p $dataset/wikitext-2

for corpus in train valid test; do
    absolute_path=$(realpath $tools/pytorch-examples/word_language_model/data/wikitext-2/$corpus.txt)
    ln -snf $absolute_path $data/wikitext-2/$corpus.txt
done

# download a different interesting data set!

mkdir -p $dataset/iWeb

mkdir -p $dataset/iWeb/test1

# download on https://www.corpusdata.org/iweb_samples.asp (e.g. download samples 0-5)
mv text*.zip $dataset/iWeb/test1
unzip dataset/iWeb/test1/text*.zip -d dataset/iWeb/test1

# preprocess slightly

cat dataset/iWeb/test1/*.txt | python scripts/preprocess_raw.py >> dataset/iWeb/test1_cleaned.txt

# tokenize, fix vocabulary upper bound

cat dataset/iWeb/test1_cleaned.txt | python scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" --sent-tokenize > dataset/iWeb/test1_preprocessed.txt

# split into train, valid and test

head -n 440 dataset/iWeb/test1_preprocessed.txt | tail -n 400 > dataset/iWeb/valid.txt
head -n 840 dataset/iWeb/test1_preprocessed.txt | tail -n 400 > dataset/iWeb/test.txt
tail -n 3075 dataset/iWeb/test1_preprocessed.txt | head -n 2955 > dataset/iWeb/train.txt
