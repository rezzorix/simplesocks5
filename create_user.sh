#!/bin/sh

# Create users from environment variables
for user_entry in $USER1 $USER2 $USER3; do
    if [ -n "$user_entry" ]; then
        username=$(echo $user_entry | cut -d':' -f1)
        password=$(echo $user_entry | cut -d':' -f2)
        
        echo "Creating user $username"
        adduser -D "$username"
        echo "$username:$password" | chpasswd
    fi
done

# Start the Dante SOCKS5 proxy server
exec danted -f /etc/danted.conf

