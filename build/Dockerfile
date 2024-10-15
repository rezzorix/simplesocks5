FROM debian:bullseye-slim AS builder

ENV THREEPROXY_VERSION=0.9.4

# Install 3proxy with build dependencies
RUN apk add --no-cache alpine-sdk wget tar && \
  export DIR=$(mktemp -d) && cd $DIR && \
  wget https://github.com/3proxy/3proxy/archive/refs/tags/${THREEPROXY_VERSION}.tar.gz && \
  tar -xf ${THREEPROXY_VERSION}.tar.gz && mv 3proxy* 3proxy && \
  cd 3proxy && \
  make -f Makefile.Linux WITH_SSL=yes WITH_POLL=yes && \
  mv bin/3proxy /usr/local/bin/

# Final stage
FROM alpine:latest

# Copy 3proxy from builder stage
COPY --from=builder /usr/local/bin/3proxy /usr/local/bin/3proxy

EXPOSE 1080

CMD ["3proxy", "/etc/3proxy/3proxy.cfg"]
