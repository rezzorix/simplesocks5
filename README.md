# SimpleSocks5

**SimpleSocks5** is a lightweight SOCKS5 proxy server built with [3proxy](https://github.com/z3APA3A/3proxy) and based on Alpine Linux to ensure minimal image size. 

It supports user authentication, which can be easily configured through a `3proxy.cfg` file for secure access.

## Features

- **Minimal image size**: Based on Alpine Linux, keeping the container small and efficient.
- **User authentication**: Easily configure users in `3proxy.cfg`.
- **Cross-architecture support**: Available for multiple architectures.

## Supported Architectures

The Docker images are available for the following architectures:

- `linux/amd64`
- `linux/arm64`
- `linux/arm/v7`
- `linux/arm/v6`

## Usage

To start the SimpleSocks5 container:

1. Clone the repository:

   ```bash
   git clone https://github.com/rezzorix/simplesocks5.git
   cd simplesocks5

2. Configure the 3proxy.cfg file:

    Edit the 3proxy.cfg file to set up your user authentication.

3. Start the container using Docker Compose.
  
  ```bash
    docker-compose up -d
