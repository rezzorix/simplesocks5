FROM alpine:latest

# Specify the latest 3proxy version (check for latest release on GitHub)
ENV THREEPROXY_VERSION=0.9.4

# Install 3proxy to /usr/local/bin
RUN apk add --no-cache alpine-sdk wget tar && \
  export DIR=$(mktemp -d) && cd $DIR && \
  wget https://github.com/3proxy/3proxy/archive/refs/tags/${THREEPROXY_VERSION}.tar.gz && tar -xf ${THREEPROXY_VERSION}.tar.gz && mv 3proxy* 3proxy && \
  cd 3proxy && \
  make -f Makefile.Linux WITH_SSL=yes WITH_POLL=yes && \
  mv bin/3proxy /usr/local/bin/ && \
  cd && rm -rf $DIR && \
  apk del alpine-sdk

# Copy the config files
#COPY 3proxy.cfg /etc/3proxy/3proxy.cfg

# Expose the SOCKS5 proxy port
EXPOSE 1080

# Start 3proxy on container startup
CMD ["3proxy", "/etc/3proxy/3proxy.cfg"]

