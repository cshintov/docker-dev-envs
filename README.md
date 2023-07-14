# Rust Development with Docker

This repository provides a Docker-based development environment for Rust. It
allows you to write and run Rust programs without having to install the Rust
toolchain on your local machine. All you need is Docker and Docker Compose.

## Prerequisites

- Docker: You can download it from [Docker's official website](https://www.docker.com/get-started).
- Docker Compose: It's included in the Docker desktop installations for Windows
  and Mac. For Linux, you can follow the instructions on the [official Docker Compose installation guide](https://docs.docker.com/compose/install/).

## Setup

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/yourusername/yourrepository.git
    ```

2. Navigate to the cloned repository:

    ```bash
    cd yourrepository
    ```

3. Build the Docker image:

    ```bash
    make build
    ```

4. Initialize a new Rust project:

    ```bash
    make init
    ```

5. Add cargo-watch to deps:

    ```bash 
    echo [dev-dependencies] >> Cargo.toml
    echo cargo-watch = "7.8.0" >> Cargo.toml
    ```

5. Install the dependencies:

    ```bash
    make deps
    ```

## Development

To start the development server with live reloading, run:

```bash
make watch
```

This will start a Docker container and run cargo watch -x run inside the
container. Any changes you make to your Rust source code will automatically
trigger a rebuild of your application and immediately reflect in the running
application inside the Docker container.

## Cleanup

To stop and remove your Docker container, run:

```bash
make clean
```

## Notes

- The cargo init . command creates a new Rust project in your current
  directory. If you want to specify a different name for your project, you can
  modify the init target in the Makefile.
- The `make deps` command installs the dependencies specified in your
  `Cargo.toml` file. If you add new dependencies to your `Cargo.toml` file, you
  should run make deps again to install them.
- The make watch command starts the development server with live reloading. If
  you want to run a different command inside the Docker container, you can
  modify the watch target in the Makefile.

