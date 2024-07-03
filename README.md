# system_user_creation_and-management (Linux User Creation Bash Script)

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
### Script Explanation

#### Script Initialization:
- Checks if the script is run as root.
- Ensures the input file is provided.
- Sets up log and secure directories.

#### Password Generation:
- Function to generate a random password using `openssl rand`.

#### Reading the Input File:
- Loops through each line of the input file.
- Trims whitespace from usernames and group names.

#### User and Group Creation:
- Checks if the user already exists.
- Creates the user and their personal group.
- Sets up the user’s password and stores it securely.
- Creates additional groups if they don't exist and adds the user to these groups.

#### Logging:
- Logs each action to `/var/log/user_management.log`.
- Stores user passwords in `/var/secure/user_passwords.csv` with restricted permissions.

### Secure File Storage
- Passwords are stored in `/var/secure/user_passwords.csv` with permissions set to `600` (readable only by the file owner).

## Project Round Up
In conclusion, this project focuses on automating the creation and management of Linux users and groups using a Bash script. By handling tasks such as setting up home directories with appropriate permissions, generating secure random passwords, and logging all actions, the script provides a comprehensive solution for system administration. Additionally, it demonstrates best practices in error handling and secure storage of sensitive information. This project is crucial part of my development as a DevOps engineer, as it equiped me with essential skills in scripting, system automation, and user management. Mastery of these skills not only enhances my ability to maintain and secure systems but also prepares me for more complex tasks in DevOps, where efficiency and reliability are paramount.


This work is part of the HNG internship program. To be a part of the amazing and exciting projects, visit  https://hng.tech/internship or https://hng.tech/hire for more information and opportunities
