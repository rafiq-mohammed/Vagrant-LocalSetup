# AUTHOR:  sa.mdrafiq@gmail.com
# DATE:    05-07-2021
# USECASE: This script will be used to install PostgresSQL on Ubuntu along with required prerequisites.

#!/bin/bash
echo "[TASK 1] Install Generic Updates"
sudo apt-get update -y && sudo apt-get upgrade -y

echo "[TASK 2] Install PostgreSQL"
sudo apt install postgresql -y

echo "[TASK 2] Create users and roles in PostgreSQL"
sudo su postgres
psql -U postgres -c "CREATE ROLE postgres;"
psql -U postgres -c "ALTER ROLE  postgres  WITH LOGIN;"
psql -U postgres -c "ALTER USER  postgres  CREATEDB;"
psql -U postgres -c "ALTER USER  postgres  WITH PASSWORD 'postgres';"
exit

#echo "[TASK 2] Create users and roles in PostgreSQL"
# bind 5432 to the public IP so we can access it from outside the machine
# first find the config file
#sudo find / -name "postgresql.conf"
#sudo nano /etc/postgresql/12/main/postgresql.conf
# edit the config file to allow listen addresses beyond localhost by adding/modifying this line: 
#listen_addresses = '*'
# find the hba conf
#sudo find / -name "pg_hba.conf"
#sudo nano /etc/postgresql/12/main/pg_hba.conf
# add these 2 lines to the end of that file
#host    all             all              0.0.0.0/0                       md5
#host    all             all              ::/0                            md5

# restart the server
#sudo systemctl restart postgresql