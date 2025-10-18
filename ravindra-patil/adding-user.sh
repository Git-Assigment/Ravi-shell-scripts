#!/bin/bash
#Create user and set random password for the user. Also Force password change on first log
while read user
do
    echo "Creating User - $user"
    sudo useradd -s /bin/bash -d /home/$user $user

# Generate a random password (8 characters)
password=$(openssl rand -base64 8)

 echo "$user:$password" | sudo chpasswd

# Force user to change password on first login
    sudo passwd -e $user

 # Print credentials (optional: better to save to a file for security)
    echo "User: $user, Password: $password"
done < "$1"

