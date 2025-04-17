FROM rust:latest AS builder

# Install musl target and musl-tools for static linking
RUN rustup target add x86_64-unknown-linux-musl
RUN apt-get update && apt-get install -y musl-tools

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

EXPOSE 8080
CMD ["/usr/local/bin/sample-rust"]
