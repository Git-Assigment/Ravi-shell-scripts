#!/bin/bash
#script to clean trmparary  files
#directories to clean
TEMP_DIRS=("tmp" "/var/tmp")
#logfile
LOG_FILE="/var/log/cleanup_temp.log"
#Timestamp
echo "===== Cleanup started at $(date) =====" >> $LOG_FILE
for DIR in "${TEMP_DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        echo "Cleaning $DIR ..." >> $LOG_FILE
        # Delete files older than 7 days
        find "$DIR" -type f -mtime +7 -exec rm -f {} \; 2>> $LOG_FILE
        # Delete empty subdirectories
        find "$DIR" -type d -empty -exec rmdir {} \; 2>> $LOG_FILE
    fi
done

echo "Cleanup finished at $(date)" >> $LOG_FILE
echo "===================================" >> $LOG_FILE



