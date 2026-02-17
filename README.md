# SimpleSocks5

**SimpleSocks5** is a lightweight Docker container running [3proxy](https://github.com/3proxy/3proxy), a SOCKS5 proxy server.  

- **Alpine-based**: For those looking for a minimal image size, the Alpine version offers a significantly smaller footprint, though it may not work on all devices (e.g., Raspberry Pi 3).

The container provides SOCKS5 proxy functionality with user authentication via a configurable `3proxy.cfg` file.  

## Features

- **Minimal image size**:  Based on Alpine, with the smallest size on Alpine.
- **User authentication**: Easily configure users in the `3proxy.cfg` file.
- **Cross-architecture support**: Available for multiple architectures.

## Supported Architectures

The Docker images are available for the following architectures:

- `linux/amd64`
- `linux/arm64`
- `linux/arm/v7`
- `linux/arm/v6`

## Tags and Versions

The Docker images are tagged as follows:

- **Alpine-based images**:
  - `simplesocks5:alpine`
  - `simplesocks5:latest`

## Usage

To start the SimpleSocks5 container:

1. Clone the repository:

   ```bash
   git clone https://github.com/rezzorix/simplesocks5.git
   cd simplesocks5

2. Configure the 3proxy.cfg file:

Edit the 3proxy.cfg file to set up your user authentication.

3. Start the container using Docker Compose
   ```bash
   docker-compose up -d

## Build your own image

Alternatively, if you prefer to build the image on your own:

1. Go to the ./build directory and run:

   ```bash
    cd ./build
    docker-compose build && docker-compose up -d

This will build the image for your current architecture with Debian by default.

Choosing a specific base image (Debian or Alpine) can be done by editing the ./build/docker-compose.yml:

   - **To build with Debian**:
   ```bash
   dockerfile: Dockerfile.debian
   ```

   - **To build with Alpine**:
   ```bash
   dockerfile: Dockerfile.alpine
   ```
