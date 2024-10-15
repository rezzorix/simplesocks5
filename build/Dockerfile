FROM debian:bookworm-slim AS builder

# Define the 3proxy version as an environment variable
ENV THREEPROXY_VERSION=0.9.4

# Make the TARGETPLATFORM argument available for the build stage
ARG TARGETPLATFORM
RUN echo "Building for target platform: $TARGETPLATFORM"

# Step 1: Install necessary build dependencies and download 3proxy source code
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    wget \
    tar \
    ca-certificates && \
    echo "Dependencies installed successfully" && \
    export DIR=$(mktemp -d) && cd $DIR && \
    wget https://github.com/3proxy/3proxy/archive/refs/tags/${THREEPROXY_VERSION}.tar.gz && \
    echo "Downloaded 3proxy source" && \
    tar -xf ${THREEPROXY_VERSION}.tar.gz && mv 3proxy* 3proxy && \
    cd 3proxy && \
    echo "Building 3proxy..." && \
    make -f Makefile.Linux WITH_SSL=yes WITH_POLL=yes && \
    mv bin/3proxy /usr/local/bin/3proxy && \
    echo "3proxy built successfully and moved to /usr/local/bin"

# Final stage
FROM debian:bookworm-slim

# Copy the 3proxy binary from the builder stage
COPY --from=builder /usr/local/bin/3proxy /usr/local/bin/3proxy

# Install ca-certificates for SSL support and clean up unnecessary files
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose the SOCKS5 proxy port
EXPOSE 1080

# Set the default command to run 3proxy with the configuration file
CMD ["3proxy", "/etc/3proxy/3proxy.cfg"]
