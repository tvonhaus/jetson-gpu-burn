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

To view the stats, you can run tegrastats



## Installing jtop (graphical CPU/GPU usage command)

sudo apt-get -y install pip

sudo apt-get -y install python-pip

sudo -H pip install -U jetson-stats

jtop



## Common problems:

If you get this error:

./gpu_burn: error while loading shared libraries: libcublasLt.so.10: cannot open shared object file: No such file or directory

Use this to fix it:

sudo find / -name "libcublasLt.so.10.2.3.300" -exec ln -s '{}' /usr/lib/aarch64-linux-gnu/libcublasLt.so.10 ';'
