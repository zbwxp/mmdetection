#!/usr/bin/env bash

CONFIG=$1
WORK_DIR=$2
PORT=${PORT:-29500}

PYTHONPATH="$(dirname $0)/..":$PYTHONPATH \
python -m torch.distributed.launch --nproc_per_node=4 --master_port=$PORT \
    $(dirname "$0")/train.py $CONFIG --work-dir $WORK_DIR --launcher pytorch ${@:3}
