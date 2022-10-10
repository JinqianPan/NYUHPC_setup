#! /bin/bash

#######################
# Need to change here #
#######################
# change to your own netid
NetID=PleaseChangeHere

# You can copy and paste in Greene to see available options
# ls /scratch/work/public/overlay-fs-ext3
# Here we choose "overlay-15GB-500K.ext3" as example
BASE_PACKAGES_OVERLAY=overlay-15GB-500K.ext3

# the file name in /scratch/$NetID/
STORE_OVERLAY_FILE=my_env

###########################
# Do not need change here #
###########################
IMAGE_DIRECTORY=/scratch/work/public/singularity

# Build new file in the /scratch/<NetID>
mkdir /scratch/$NetID/$STORE_OVERLAY_FILE
# Go into file
cd /scratch/$NetID/$STORE_OVERLAY_FILE

# Copy and unzip overlay from overlay-fs-ext3
echo "Extracting base package overlay"
cp -rp /scratch/work/public/overlay-fs-ext3/$BASE_PACKAGES_OVERLAY.gz .
gunzip $BASE_PACKAGES_OVERLAY.gz
# Rename BASE_PACKAGES_OVERLAY to overlay-base.ext3
mv $BASE_PACKAGES_OVERLAY overlay-base.ext3
BASE_PACKAGES_OVERLAY=overlay-base.ext3

# Open singularity
singularity exec --overlay $BASE_PACKAGES_OVERLAY:rw \
    $IMAGE_DIRECTORY/cuda11.2.2-cudnn8-devel-ubuntu20.04.sif \
    /bin/bash << 'EOF'
# Install miniconda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh -b -p /ext3/miniconda3
rm Miniconda3-latest-Linux-x86_64.sh

EOF