#!/bin/sh
SRCDIR=$1
OUTDIR=$2
VOCFILE=$3

set -x
echo "called with: ./prepare_train_files.sh $*"
echo "run python ./dataset/generate_samples.py --dir $SRCDIR  -o $OUTDIR --dup_factor 10 --seed 42  --vocab_file $VOCFILE --do_lower_case 1  --masked_lm_prob 0.15 --max_seq_length 128  --model_name bert-base \
    --max_predictions_per_seq 20 \
    --n_processes 16 "
python ./dataset/generate_samples.py \
    --dir $SRCDIR \
    -o $OUTDIR \
    --dup_factor 10 \
    --seed 42 \
    --vocab_file $VOCFILE \
    --do_lower_case 1 \
    --masked_lm_prob 0.15 \
    --max_seq_length 128 \
    --model_name roberta-base \
    --max_predictions_per_seq 20 \
    --n_processes 16