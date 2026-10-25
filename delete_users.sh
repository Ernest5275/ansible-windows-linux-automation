#!/bin/bash
# Deletes every user listed in the first column of a CSV file.
# Usage: delete_users.sh <csv_file>
csv_file="$1"

while IFS=, read -r username rest; do
  [ "$username" = "username" ] && continue   # skip the header row
  [ -z "$username" ] && continue
  if id "$username" &>/dev/null; then
    userdel -r "$username"
    echo "Deleted $username"
  else
    echo "Skipped $username (not found)"
  fi
done < "$csv_file"
