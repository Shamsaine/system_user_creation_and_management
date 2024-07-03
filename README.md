# system_user_creation_and-management

Efficiently creating and managing users and group access to systems and organization files
# Linux User Creation Bash Script

## Overview
This script automates the creation of users and groups, sets up home directories with appropriate permissions, generates random passwords for the users, and logs all actions. It is designed for SysOps engineers to efficiently manage new developers in a Linux environment.

## Features
- **User and Group Creation:** Automatically creates users and their personal groups.
- **Multiple Group Assignment:** Assigns users to multiple groups based on the input file.
- **Home Directory Setup:** Creates home directories with correct permissions and ownership.
- **Password Generation:** Generates random passwords for each user.
- **Secure Password Storage:** Stores passwords securely in `/var/secure/user_passwords.csv`.
- **Logging:** Logs all actions to `/var/log/user_management.log`.
- **Error Handling:** Handles scenarios such as existing users and groups.

## Usage

### Prerequisites
- Ensure you have root privileges to run the script.
- Ensure you have the necessary permissions to create files in `/var/log` and `/var/secure`.

### Running the Script
1. Create an input text file with the following format:
    ```
    username; group1,group2,...
    ```
    Example:
    ```
    light; sudo,dev,www-data
    idimma; sudo
    mayowa; dev,www-data
    ```

2. Run the script with the input file as an argument:
    ```bash
    sudo bash create_users.sh <name-of-text-file>
    ```

### Example
Given an input file `users.txt`:




This work is part of the HNG internship program. To be a part of the amazing and exciting projects, visit  https://hng.tech/internship or https://hng.tech/hire for more information and opportunities
