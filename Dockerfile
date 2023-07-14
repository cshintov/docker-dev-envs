# Use the official Rust image from the Docker Hub
FROM rust:1.71

RUN cargo install cargo-watch


FROM rust:1.71

COPY --from=0 /usr/local/cargo/bin/cargo-watch /usr/local/cargo/bin/cargo-watch

# Create a new user with the same user ID and group ID as the owner of the project directory
ARG UID
ARG GID
RUN groupadd -g $GID appuser && useradd -m -u $UID -g $GID appuser

# Switch to the new user
USER appuser

# Set the working directory
WORKDIR /home/appuser

# Copy the current directory contents into the container at /home/appuser
COPY --chown=appuser:appuser . .

# Specify the command to run on container start
CMD ["cargo", "run"]

