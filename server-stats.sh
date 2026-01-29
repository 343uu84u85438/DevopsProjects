
#!bin/bash
 
echo "Server performance stats"

#Total CPU  usage 

echo "CPU Usage: $(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')"

#top -bn1 → runs top in batch mode once (non-interactive)

#grep "Cpu(s)" → gets the CPU summary line

#awk '{print 100 - $8"%"}' → subtracts idle CPU (column 8) from 100, adds %

#$( ... ) → command substitution, so the result is printed by echo

#Memory usage
Mem_Total=$(free -m | awk 'NR==2{print $2}')
Mem_used=$(free -m | awk 'NR==2{print $3}')
MEM_PERCENT=$(awk "BEGIN {printf \"%.2f\", $Mem_used*100/$Mem_Total}")
Mem_Free=$(free -m | awk  'NR==2{print $4}')
Mem_percentage=$( awk "BEGIN {printf \"%.2f\", $Mem_used*100/$Mem_Total}")
echo "Memory Usage: Used ${Mem_used}MB / Total ${Mem_Total}MB (${Mem_percentage}%)"

#free is a Linux command that shows memory usage.

#-m displays memory in megabytes (MB).
#$1 = Mem: (label)

#$2 = total memory

#$3 = used memory

#$4 = free memory

#$5 = shared

#$6 = buff/cache

#NR==2 → only process line 2, which contains actual memory info

#Total disk usage (Free vs Used including percentage)
Disk_Total=$(df -h / | awk 'NR==2{print $2}')
Disk_Used=$(df -h / | awk 'NR==2{print $3}')
Disk_free=$(df -h / | awk 'NR==2{print $4}')
Disk_Percentage=$(df -h / | awk 'NR==2{print $5}')
 
echo "Disk Usage: Used ${Disk_Used} /Total ${Disk_Total} ${Disk_Percentage})"



#Top  5 processes by CPU Usage
echo "Top 5 Processes by CPU Usage:"
 ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6



#ps = process status, shows running processes on Linux

#-e → shows all processes

#-o pid,comm,%cpu → output only 3 columns:

#pid → process ID

#comm → command name (the program)

#%cpu → CPU usage percentage



# 5️⃣ Top 5 Processes by Memory Usage
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo "===================================="





























