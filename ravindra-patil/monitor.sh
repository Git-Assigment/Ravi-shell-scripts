#!/bin/bash

TO="ravindra.postfix@gmail.com"

# current utilization
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d. -f1)
MEM=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')
DISK=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

MESSAGE=""

if [ "$CPU" -gt 1 ]; then
    MESSAGE+="CPU usage high: $CPU% \n"
fi

#  Memory
if [ "$MEM" -gt 80 ]; then
    MESSAGE+="Memory usage high: $MEM% \n"
fi

#  Disk
if [ "$DISK" -gt 10 ]; then
    MESSAGE+="Disk usage high: $DISK% \n"
fi

# Send mail if there is any alert
if [ -n "$MESSAGE" ]; then
    echo -e "$MESSAGE"  
    echo -e "$MESSAGE"   | mail -s "Resource Alert on $(hostname)" $TO
fi
