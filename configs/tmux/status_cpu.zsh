#!/bin/zsh

idle_stat=$(mpstat 1 1 -o JSON | jq '.sysstat.hosts | .[0] | .statistics | .[0] | ."cpu-load" | .[0] | .idle')
used=$(printf %.2f "100-$idle_stat")
echo "CPU: ${used}%"


# stats_start=$(cat /proc/stat)
# start_idles=$(cat /proc/stat | grep cpu | awk '{print $5}')
# echo $stats_start
# sleep 1
# stats_end=$(cat /proc/stat)
# end_idles=$(cat /proc/stat | grep cpu)

# time_start=$(echo ${stats_start} | grep btime | awk '{print $2}')
# time_end=$(echo ${stats_end} | grep btime | awk '{print $2}')
# # time_passed=$(awk '{print $time_end - $time_start}')
# # echo $time_passed
# awk '{ for(i=1; i<=NF;i++) j+=$i; print j; j=0 }'
