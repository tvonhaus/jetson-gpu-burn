TIME=500

tegrastats --logfile teststats.txt &
xterm -e ./gpu_burn -tc $TIME &
xterm -e stress --cpu 11  --timeout $TIME 
tegrastats --logfile teststats.txt --stop

read -r LINE < teststats.txt
DATE=$(echo "$LINE" | grep -oE [[:digit:]]{2}\-[[:digit:]]{2}\-[[:digit:]]{4})
TEST_TIME=$(echo "$LINE" | grep -oE [[:digit:]]{2}:[[:digit:]]{2}:[[:digit:]]{2})
echo "$DATE"
echo "$TEST_TIME"
echo "CPU Temp,GPU Temp,SOC0 Temp,SOC1 Temp,SOC2 Temp,Tdiode Temp" >> $DATE-$TEST_TIME.csv

while read p; do
	
	CPU_TEMP=$(echo "$p" | grep -oE CPU@[[:digit:]]*\\.?[[:digit:]]*)	

	SOC0_TEMP=$(echo "$p" | grep -oE SOC0@[[:digit:]]*\\.?[[:digit:]]*)

	SOC1_TEMP=$(echo "$p" | grep -oE SOC1@[[:digit:]]*\\.?[[:digit:]]*)

	SOC2_TEMP=$(echo "$p" | grep -oE SOC2@[[:digit:]]*\\.?[[:digit:]]*)

	GPU_TEMP=$(echo "$p" | grep -oE GPU@[[:digit:]]*\\.?[[:digit:]]*)

	TDIODE_TEMP=$(echo "$p" | grep -oE Tdiode@[[:digit:]]*\\.?[[:digit:]]*)

echo "${CPU_TEMP:4},${GPU_TEMP:4},${SOC0_TEMP:5},${SOC1_TEMP:5},${SOC2_TEMP:5},${TDIODE_TEMP:7}" >>  $DATE-$TEST_TIME.csv


done < teststats.txt

rm teststats.txt
