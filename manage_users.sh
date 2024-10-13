#!/bin/sh

# Function to list all users
list_users() {
    echo "Listing all users:"
    cut -d: -f1 /etc/passwd
}

# Function to add a user
add_user() {
    echo "Enter username to add:"
    read username
    echo "Enter password for $username:"
    read -s password

    # Check if user already exists
    if id "$username" >/dev/null 2>&1; then
        echo "User $username already exists."
    else
        adduser -D "$username"
        echo "$username:$password" | chpasswd
        echo "User $username added successfully."
    fi
}

# Function to remove a user
remove_user() {
    echo "Enter username to remove:"
    read username

    # Check if user exists
    if id "$username" >/dev/null 2>&1; then
        deluser "$username"
        echo "User $username removed successfully."
    else
        echo "User $username does not exist."
    fi
}

# Display options to the user
echo "Choose an option:"
echo "1. List users"
echo "2. Add user"
echo "3. Remove user"
read choice

# Call the appropriate function based on the user's choice
case $choice in
    1)
        list_users
        ;;
    2)
        add_user
        ;;
    3)
        remove_user
        ;;
    *)
        echo "Invalid choice."
        ;;
esac

