# Base image: Alpine Linux
FROM alpine:latest

# Install necessary packages (Dante and other dependencies)
RUN apk --no-cache add dante-server shadow

# Create a user for the proxy
RUN adduser -S dante

# Add a script to create users from environment variables
COPY danted.conf /etc/danted.conf
COPY create_user.sh /usr/local/bin/create_user.sh
RUN chmod +x /usr/local/bin/create_user.sh

# Copy manage_users.sh into the container
COPY manage_users.sh /usr/local/bin/manage_users.sh
RUN chmod +x /usr/local/bin/manage_users.sh

# Expose SOCKS5 port (default 1080)
EXPOSE 1080

# Set entrypoint to create users and start dante
ENTRYPOINT ["/usr/local/bin/create_user.sh"]

