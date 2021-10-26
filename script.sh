xterm -e stress --cpu 8 &
xterm -e ./gpu_burn 100000 &
tegrastats  
