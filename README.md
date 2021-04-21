# jetson-gpu-burn forked from the initial gpu-burn
Multi-GPU CUDA stress test - http://wili.cc/blog/gpu-burn.html

The initial GPU burn has a temperature property that is not configured for the Jetson GPU systems. This repository contains the modified gpu-burn to work with Jetson systems as well as a script to stress the GPU and CPU.

The script requires CUDA and stress. If you are using a Connect Tech BSP, then the nvidia sources are commented out initially and you may not be able to find cuda-toolkit-10-2.


To enable the NVIDIA sources again, uncomment the nvidia repo in the following file:

/etc/apt/sources.list.d/nvidia-l4t-apt-source.list

sudo apt-get update

sudo apt-get install cuda-toolkit-10-2

If you want to stress test the CPU then you need to install stress:

sudo apt-get install stress

Last, you can run make, and then run script.sh to stress the GPU and CPUs
