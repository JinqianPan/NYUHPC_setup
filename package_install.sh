#! /bin/bash

#######################
# Need to change here #
#######################
# change to your own netid
NetID=PleaseChangeHere

# the file name in /scratch/$NetID/
STORE_OVERLAY_FILE=my_env

###########################
# Do not need change here #
###########################
BASE_PACKAGES_OVERLAY=overlay-base.ext3
IMAGE_DIRECTORY=/scratch/work/public/singularity

# Open singularity
singularity exec --overlay $BASE_PACKAGES_OVERLAY:rw \
    $IMAGE_DIRECTORY/cuda11.2.2-cudnn8-devel-ubuntu20.04.sif \
    /bin/bash << 'EOF'
source /ext3/env.sh

# Update and install packages
conda update -n base conda -y
conda clean --all --yes
conda install pip
conda install ipykernel
EOF