FROM alpine:3.22 AS builder

ENV THREEPROXY_VERSION=0.9.5

RUN apk add --no-cache \
    build-base \
    wget \
    tar \
    openssl-dev && \
    DIR="$(mktemp -d)" && cd "$DIR" && \
    wget -O 3proxy.tar.gz "https://github.com/3proxy/3proxy/archive/refs/tags/${THREEPROXY_VERSION}.tar.gz" && \
    tar -xf 3proxy.tar.gz && mv 3proxy-* 3proxy && \
    cd 3proxy && \
    make -f Makefile.Linux WITH_SSL=yes WITH_POLL=yes && \
    install -m 0755 bin/3proxy /usr/local/bin/3proxy && \
    cd / && rm -rf "$DIR"

FROM alpine:3.22

RUN apk add --no-cache ca-certificates

COPY --from=builder /usr/local/bin/3proxy /usr/local/bin/3proxy
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 1080

ENTRYPOINT ["/entrypoint.sh"]
