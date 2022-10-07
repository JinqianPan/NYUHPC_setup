# Easy way to setup NYU HPC in Greene
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