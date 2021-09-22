#!/bin/sh

SRCDIR=$1
OUTDIR=$2

python ./dataset/shard_data.py \
    --dir $SRCDIR \
    -o $OUTDIR \
    --num_train_shards 256 \
    --num_test_shards 128 \
    --frac_test 0.1
