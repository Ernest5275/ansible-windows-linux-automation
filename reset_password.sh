#!/bin/bash
# Resets a Linux user's password.
# Usage: reset_password.sh <username> <password>
set -euo pipefail

username="$1"
password="$2"

echo "$username:$password" | chpasswd
echo "Password reset for $username"
