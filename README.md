# MT Exercise 3: Pytorch RNN Language Models


[Original repository](https://github.com/emmavdbold/mt-exercise-3) 


________________
README of original:
This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model).

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/emmavdbold/mt-exercise-3
    cd mt-exercise-3

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/install_packages.sh

Download and preprocess data:

    ./scripts/download_data.sh

Train a model:

    ./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from a trained model with:

    ./scripts/generate.sh

________________
# Changes 

Different dataset: 
- Here, a portion of the freely available samples of the [iWeb](https://www.english-corpora.org/iweb/) corpus are used.
- The prepocessing happened the same way as described in the original.

Command line arguments:
- To the `train.sh` and the `generate.sh# scripts a option has been added to indicate on the command line what droput should be used.

# Results: Training

| Epoch | 0 Dropout | 0.3 Dropout | 0.5 Dropout | 0.6 Dropout | 0.9 Dropout |
|:-----:|----------:|------------:|------------:|------------:|------------:|
|   1   |    384.38 |      390.99 |      389.02 |      380.94 |      404.90 |
|   5   |     55.00 |    65.23 |       73.41 |       72.32 |      152.54 |
|  10   |     30.00 |   35.43 |       45.01 |       60.16 |      130.06 |
|  15   |     29.84 |    33.85 |            39.22 |       53.57 |      123.43 |
|  20   |     29.84 |    34.10 |      39.25 |       52.94 |            123.86 |
|  25   |     29.84 |    34.01 |      39.33|       52.98 |      123.64 |
|  30   |     29.84 |  33.95 |      39.15 |       52.91 |      123.10 |
|  35   |     29.84 |    34.00 |      39.25 |       53.08 |      123.66 |
|  40   |     29.84 |  34.03 |      39.28 |       52.91 |      123.68 |

# Results: Validation

| Epoch | 0 Dropout | 0.3 Dropout |      0.5 Dropout | 0.6 Dropout | 0.9 Dropout |
|:-----:|----------:|------------:|-----------------:|------------:|------------:|
|   1   |    429.44 |      384.34 |           280.85 |      310.41 |      287.15 |
|   5   |  227.41|            215.28 |            202.44 |      186.56 |      254.33 |
|  10   | 195.07|       186.05 |            184.04 |      178.68 |      248.26 |
|  15   |  195.07 |       184.91 |            181.28 |      174.70 |      247.14 |
|  20   |  195.07 |       184.91 |            181.27 |      174.95 |      247.13 |
|  25   |  195.07 |       184.91 |            181.27 |      174.95 |      247.13 |
|  30   |    195.07 |       184.91 |            181.27 |      174.95 |      247.13 |
|  35   |  195.07 |       184.91 |            181.27 |      174.95 |      247.13 |
|  40   |    195.07 |       184.91 |            181.27 |      174.95 |    247.13 |

# Results: Test

| 0 Dropout | 0.3 Dropout |      0.5 Dropout | 0.6 Dropout | 0.9 Dropout |
|----------:|------------:|-----------------:|------------:|------------:|
|   190.90|      185.25|           179.50 |      174.03 |      251.63 |


________________
# Changes 

Different dataset: 
- Here, a portion of the freely available samples of the [iWeb](https://www.english-corpora.org/iweb/) corpus are used.
- The prepocessing happened the same way as described in the original.

Command line arguments:
- To the `train.sh` and the `generate.sh# scripts a option has been added to indicate on the command line what droput should be used.

# Results: Training

| Epoch | 0 Dropout | 0.3 Dropout | 0.5 Dropout | 0.6 Dropout | 0.9 Dropout |
|:-----:|----------:|------------:|------------:|------------:|------------:|
|   1   |    384.38 |      390.99 |      389.02 |      380.94 |      404.90 |
|   5   |     55.00 |    65.23 |       73.41 |       72.32 |      152.54 |
|  10   |     30.00 |   35.43 |       45.01 |       60.16 |      130.06 |
|  15   |     29.84 |    33.85 |            39.22 |       53.57 |      123.43 |
|  20   |     29.84 |    34.10 |      39.25 |       52.94 |            123.86 |
|  25   |     29.84 |    34.01 |      39.33|       52.98 |      123.64 |
|  30   |     29.84 |  33.95 |      39.15 |       52.91 |      123.10 |
|  35   |     29.84 |    34.00 |      39.25 |       53.08 |      123.66 |
|  40   |     29.84 |  34.03 |      39.28 |       52.91 |      123.68 |

# Results: Validation

| Epoch | 0 Dropout | 0.3 Dropout |      0.5 Dropout | 0.6 Dropout | 0.9 Dropout |
|:-----:|----------:|------------:|-----------------:|------------:|------------:|
|   1   |    429.44 |      384.34 |           280.85 |      310.41 |      287.15 |
|   5   |  227.41|            215.28 |            202.44 |      186.56 |      254.33 |
|  10   | 195.07|       186.05 |            184.04 |      178.68 |      248.26 |
|  15   |  195.07 |       184.91 |            181.28 |      174.70 |      247.14 |
|  20   |  195.07 |       184.91 |            181.27 |      174.95 |      247.13 |
|  25   |  195.07 |       184.91 |            181.27 |      174.95 |      247.13 |
|  30   |    195.07 |       184.91 |            181.27 |      174.95 |      247.13 |
|  35   |  195.07 |       184.91 |            181.27 |      174.95 |      247.13 |
|  40   |    195.07 |       184.91 |            181.27 |      174.95 |    247.13 |

# Results: Test

| 0 Dropout | 0.3 Dropout |      0.5 Dropout | 0.6 Dropout | 0.9 Dropout |
|----------:|------------:|-----------------:|------------:|------------:|
|   190.90|      185.25|           179.50 |      174.03 |      251.63 |

# Visualisation Training
![The charts of the training ppls.](https://github.com/ulrichjulia/mt-exercise-3//blob/eb42f95fc3c9e768b1a25124a8bb693eea64498e/results.png?raw=true)

# Visualisation Validation
![The charts of the training ppls.](https://github.com/ulrichjulia/mt-exercise-3/blob/9291bca4724089f4cd0b9871636ab0a46df30170/results_valid.png?raw=true)

