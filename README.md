# gpu-burn
Multi-GPU CUDA stress test
http://wili.cc/blog/gpu-burn.html

Requires CUDA

uncomment the nvidia sources:

/etc/apt/sources.list.d/nvidia-l4t-apt-source.list

sudo apt-get update

sudo apt-get install cuda-toolkit-10-2

If you want to stress test the CPU then you need to install stress:

sudo apt-get install stress
