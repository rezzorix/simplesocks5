# SimpleSocks5

**SimpleSocks5** is a lightweight SOCKS5 proxy server built with [3proxy](https://github.com/3proxy/3proxy).
It is based on Debian Bookworm "slim" to ensure minimal image size while maintaining maximum compatibility.


## Features

- **Minimal image size**: Built on Debian Bookworm "slim" for a small, efficient container.
- **User authentication**: Easily configure users in the `3proxy.cfg` file.
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
   ```

2. Configure the 3proxy.cfg file:

    Edit the 3proxy.cfg file to set up your user authentication.

3. Start the container using Docker Compose.

  ```bash
    docker-compose up -d
  ```

## Build It Yourself

If you prefer to build this on your own:

1. After cloning the repository as above, go  to the `./build` directory:

   ```bash
   cd build
   ```
   
2. Run the following command to build and start the container:

  ```bash
  sudo docker compose build && sudo docker compose up -d
  ```

This will build the image for the architecture of your system and start the SOCKS5 proxy server.
