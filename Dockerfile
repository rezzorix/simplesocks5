# Stage 1: Build stage using Alpine
FROM alpine:latest as build

# Install dante and dependencies
RUN apk --no-cache add dante-server

# Stage 2: Minimal image
FROM scratch

# Copy necessary binaries from Alpine
COPY --from=build /usr/sbin/danted /usr/sbin/danted
COPY --from=build /etc/danted.conf /etc/danted.conf

# Expose the port for SOCKS5
EXPOSE 1080

# Run Dante SOCKS5 server
CMD ["/usr/sbin/danted", "-f", "/etc/danted.conf"]

