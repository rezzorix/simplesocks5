# SimpleSocks5

SimpleSocks5 is a lightweight Docker image running **3proxy** as a **SOCKS5 proxy server**, built on **Alpine Linux**.

It is designed to be:
- minimal
- fast
- predictable
- suitable for running on multiple VPS nodes

## Key Characteristics

- **Alpine-based**  
  Small image size (~10 MB), minimal attack surface.

- **3proxy (SOCKS5)**  
  Native SOCKS5 proxy with username/password authentication.

- **Multi-architecture**  
  Built for common x86 and ARM platforms.

- **Configuration via environment variables**  
  No static `3proxy.cfg` required for basic usage.

The image is built automatically via GitHub Actions and published to GHCR.

## Supported Architectures

The image is built for:

- `linux/amd64`
- `linux/arm64`
- `linux/arm/v7`
- `linux/arm/v6`

Available Images

Images are published to GHCR:
ghcr.io/rezzorix/simplesocks5:alpine
ghcr.io/rezzorix/simplesocks5:latest

## Basic Usage (Docker)

Example `docker-compose.yml`:

```yaml
services:
  socks5:
    image: ghcr.io/rezzorix/simplesocks5:latest
    container_name: socks5
    restart: unless-stopped
    ports:
      - "1080:1080"
    environment:
      PROXY_USER: yourusername
      PROXY_PASSWORD: yourpassword
```


Start the container:

```docker compose up -d```

The SOCKS5 proxy will be available at:

```socks5://yourusername:yourpassword@<host-ip>:1080```

## Configuration Model

Authentication is enabled by default.

Credentials are provided via environment variables:

- PROXY_USER
- PROXY_PASSWORD

One user per container instance.
For more advanced setups (ACLs, multiple users, chaining, etc.), the image can be extended with a custom 3proxy.cfg.

## Security Notes

- SOCKS5 authentication is not encrypted by the protocol itself.
- HTTPS/TLS at the application layer is expected.
- Credentials act as access control, not confidentiality.
