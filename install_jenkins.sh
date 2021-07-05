# AUTHOR:  sa.mdrafiq@gmail.com
# DATE:    05-07-2021
# USECASE: This script will be used to install jenkins on Ubuntu along with required prerequisites.

#!/bin/bash

echo "[TASK 1] Install Generic Updates"
apt-get update -y

echo "[TASK 1] Install Java 8"
sudo apt install openjdk-8-jdk -y

echo "[TASK 1] Install Maven, GIT, wget & Unzip"
sudo apt install maven git wget unzip -y

echo "[TASK 1] Install Jenkins"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update -y && sudo apt-get install jenkins -y
