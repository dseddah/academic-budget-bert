#!/bin/sh
SCRIPTDIR=`dirname $0`
RAWDATA=$1
MODELDIR=$2
VOCFILE=$3

echo " ==> reading raw data from $RAWDATA"
echo "$SCRIPTDIR/prepare_data.sh $RAWDATA $RAWDATA/shards"

#rm -rf $RAWDATA/shards
mkdir -p $RAWDATA/shards
#$SCRIPTDIR/prepare_data.sh $RAWDATA $RAWDATA/shards
NBFILESCREATED=`ls $RAWDATA/shards/* |wc -l`
echo "$NBFILESCREATED in $RAWDATA/shards"

#exit


echo " ==> Preparing pretrain files from $RAWDATA/shards"
echo "$SCRIPTDIR/prepare_train_files.sh $RAWDATA/shards/ $RAWDATA/shards2PreTrain/ $VOCFILE"

#rm -rf $RAWDATA/shards2PreTrain/
mkdir -p $RAWDATA/shards2PreTrain/

#$SCRIPTDIR/prepare_train_files.sh $RAWDATA/shards/ $RAWDATA/shards2PreTrain/ $VOCFILE
NBFILESCREATED=`ls $RAWDATA/$RAWDATA/shards2PreTrain/ |wc -l`
echo "$NBFILESCREATED in $RAWDATA/shards2PreTrain/"

exit

echo "===> running pretraining"
echo "$SCRIPTDIR/run_pretraining.sh $RAWDATA/shards2PreTrain/ $MODELDIR"
./run_pretraining.sh $RAWDATA/shards2PreTrain/ $MODELDIR

du -h $MODELDIR
