#!/bin/bash

# Define backup settings
backup_dir="/home/munya/Documents"
source_dir="/home/munya/Documents/munya"
backup_prefix="backup"
date_format="%Y%m%d%H%M%S"  # Format for the timestamp

# Get the current date and time
current_date=$(date +$date_format)

# Create a backup subdirectory with the current timestamp
backup_subdir="$backup_dir/$backup_prifix-$current_date"
mkdir -p "$backup_subdir"

# Archive and compress the source directory
tar -czvf "$backup_subdir/backup.tar.gz" "$source_dir"

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
else
    echo "Backup failed."
fi

# Clean up old backups (optional)
# You can modify this part to retain backups for a specific duration.
# For example, to keep backups for 7 days, you can use:
# find "$backup_dir" -type d -mtime +7 -exec rm -rf {} \;

# End of script

