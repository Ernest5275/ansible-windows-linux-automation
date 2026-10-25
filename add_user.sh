#!/bin/bash
# Creates a Linux user with a full name and an initial password.
# Usage: add_user.sh <username> <firstname> <lastname> <password>
set -euo pipefail

username="$1"
firstname="$2"
lastname="$3"
password="$4"

if id "$username" &>/dev/null; then
  echo "User $username already exists"
  exit 0
fi

useradd -m -c "$firstname $lastname" "$username"
echo "$username:$password" | chpasswd
echo "Created $username"
