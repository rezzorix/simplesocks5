FROM debian:bookworm-slim AS builder

ENV THREEPROXY_VERSION=0.9.4

# Step 1: Update and install necessary build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    wget \
    tar \
    ca-certificates && \
    echo "Dependencies installed successfully"

# Step 2: Download, build, and install 3proxy
RUN export DIR=$(mktemp -d) && cd $DIR && \
    wget https://github.com/3proxy/3proxy/archive/refs/tags/${THREEPROXY_VERSION}.tar.gz && \
    echo "Downloaded 3proxy source" && \
    tar -xf ${THREEPROXY_VERSION}.tar.gz && mv 3proxy* 3proxy && \
    cd 3proxy && \
    echo "Building 3proxy..." && \
    make -f Makefile.Linux WITH_SSL=yes WITH_POLL=yes && \
    mv bin/3proxy /usr/local/bin/ && \
    echo "3proxy built successfully and moved to /usr/local/bin"

# Step 3: Clean up
RUN apt-get remove --purge -y build-essential wget tar && \
    apt-get autoremove -y && apt-get clean && \
    echo "Cleaned up build dependencies"

# Final stage
FROM debian:bookworm-slim

# Copy 3proxy from builder stage
COPY --from=builder /usr/local/bin/3proxy /usr/local/bin/3proxy

# Expose the SOCKS5 proxy port
EXPOSE 1080

# Run 3proxy
CMD ["3proxy", "/etc/3proxy/3proxy.cfg"]
