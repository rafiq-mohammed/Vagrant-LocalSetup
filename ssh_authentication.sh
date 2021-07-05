# AUTHOR:  sa.mdrafiq@gmail.com
# DATE:    05-07-2021
# USECASE: This script will be used to enable ssh authentication using passwords.

#!/bin/bash

echo "[TASK 1] Install Generic Updates"
apt-get update -y

echo "[TASK 2] Enable ssh password authentication"
sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl reload sshd