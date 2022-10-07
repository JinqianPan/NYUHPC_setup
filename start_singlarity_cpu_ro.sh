#!/bin/bash

NETID=PleaseChangeHere
BASE_PACKAGES_OVERLAY=overlay-base.ext3
OVERLAYDIR=my_env

ENVDIR=/scratch/$NETID/$OVERLAYDIR
RUNDIR=/scratch/$NETID

cd $ENVDIR

singularity exec --overlay $BASE_PACKAGES_OVERLAY:ro \
				/scratch/work/public/singularity/cuda11.2.2-cudnn8-devel-ubuntu20.04.sif \ 
				/bin/bash << 'EOF'
source /ext3/env.sh
cd ..
EOF