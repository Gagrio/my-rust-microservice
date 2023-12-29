# Use the official Rust image as the base image
FROM rust:latest as builder

# Set the working directory in the container
WORKDIR /usr/src/myapp

# Copy the Rust project files
COPY /src .

# Build the Rust application
RUN cargo build --release

# Create a new lightweight image for running the application
FROM debian:buster-slim

# Set the working directory in the container
WORKDIR /usr/src/myapp

# Copy only the necessary files from the builder image
COPY --from=builder /usr/src/myapp/target/release/myapp .

# Expose the port on which the application will run
EXPOSE 8080

# Command to run the application
CMD ["./myapp"]
