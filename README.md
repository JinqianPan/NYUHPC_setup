# Easy way to setup NYU HPC in Greene 
**[HPC official guide for terminal](https://sites.google.com/nyu.edu/nyu-hpc/hpc-systems/greene/software/singularity-with-miniconda#h.keuu4ltugboh)**

**[HPC official guide for OOD](https://sites.google.com/nyu.edu/nyu-hpc/hpc-systems/greene/software/open-ondemand-ood-with-condasingularity)**

Here I just write code for terminal version.
1. Go to your /scratch/NetID/ file and clone this github
```
cd /scratch/NetID/
```
```
git clone git@github.com:JinqianPan/NYUHPC_setup.git
```
```
cd NYUHPC_setup
```
2. Go to create_overlay.sh (Line 7) change the NetID
3. Option: run the code in Greene to see available overlay, if you want you could change the overlay in create_overlay.sh (Line 12).
```
ls /scratch/work/public/overlay-fs-ext3
```
4. Option: you could customize your file name in /scratch/NetID/ (create_overlay.sh Line 15)
5. Run the shell file
```
bash create_overlay.sh
```
6. Go to /scratch/NetID/my_env and vim /ext3/env.sh
```
cd /scratch/NetID/my_env
```
```
singularity exec --overlay overlay-base.ext3:rw /scratch/work/public/singularity/cuda11.2.2-cudnn8-devel-ubuntu20.04.sif /bin/bash
```
```
vim /ext3/env.sh
```
7. Copy and paste ("i" for insert mode, after paste enter "esc" and type ":wq" for save file)
```
#!/bin/bash

source /ext3/miniconda3/etc/profile.d/conda.sh
export PATH=/ext3/miniconda3/bin:$PATH
export PYTHONPATH=/ext3/miniconda3/bin:$PATH
```
8. Go back to folder and run the shell file
```
cd /scratch/NetID/NYUHPC_setup
```
```
bash package_install.sh
```