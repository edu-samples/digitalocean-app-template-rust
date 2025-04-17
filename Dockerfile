<<<<<<< HEAD
FROM debian:buster-slim AS build
RUN apt-get update && apt-get install -y build-essential curl pkg-config libssl-dev ca-certificates && rm -rf /var/lib/apt/lists/*
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
=======
FROM rust:latest AS builder

# Install musl target and musl-tools for static linking
RUN rustup target add x86_64-unknown-linux-musl
RUN apt-get update && apt-get install -y musl-tools

>>>>>>> 53b923e (fix: build statically linked Rust binary with musl and use Alpine base image)
WORKDIR /usr/src/app

COPY Cargo.toml ./
RUN mkdir src && echo "fn main() {}" > src/main.rs
RUN cargo build --release --target x86_64-unknown-linux-musl

COPY . .
RUN cargo build --release --target x86_64-unknown-linux-musl

# Use a minimal base image
FROM alpine:latest
RUN apk --no-cache add ca-certificates

COPY --from=builder /usr/src/app/target/x86_64-unknown-linux-musl/release/sample-rust /usr/local/bin/sample-rust

<<<<<<< HEAD
FROM debian:buster-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/src/app/target/release/sample-rust /usr/local/bin/sample-rust
=======
>>>>>>> 53b923e (fix: build statically linked Rust binary with musl and use Alpine base image)
EXPOSE 8080
CMD ["/usr/local/bin/sample-rust"]
