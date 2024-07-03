#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Check if input file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <name-of-text-file>"
    exit 1
fi

INPUT_FILE=$1

# Ensure log directory exists
LOG_FILE="/var/log/user_management.log"
SECURE_DIR="/var/secure"
PASSWORD_FILE="$SECURE_DIR/user_passwords.csv"

mkdir -p $SECURE_DIR
chmod 700 $SECURE_DIR

touch $LOG_FILE
touch $PASSWORD_FILE
chmod 600 $PASSWORD_FILE

# Function to generate random password
generate_password() {
    openssl rand -base64 12
}

# Read the input file line by line
while IFS=";" read -r username groups; do
    # Trim whitespaces
    username=$(echo $username | xargs)
    groups=$(echo $groups | xargs)
    
    if id "$username" &>/dev/null; then
        echo "User $username already exists" | tee -a $LOG_FILE
    else
        # Create user and personal group
        useradd -m -s /bin/bash "$username"
        echo "Created user $username" | tee -a $LOG_FILE
        
        # Set up user password
        password=$(generate_password)
        echo "$username:$password" | chpasswd
        echo "$username,$password" >> $PASSWORD_FILE
        
        # Assign user to additional groups
        if [ -n "$groups" ]; then
            IFS="," read -ra group_array <<< "$groups"
            for group in "${group_array[@]}"; do
                group=$(echo $group | xargs)
                if ! getent group "$group" > /dev/null; then
                    groupadd "$group"
                    echo "Created group $group" | tee -a $LOG_FILE
                fi
                usermod -aG "$group" "$username"
                echo "Added $username to group $group" | tee -a $LOG_FILE
            done
        fi
    fi
done < "$INPUT_FILE"

echo "User creation process completed" | tee -a $LOG_FILE

