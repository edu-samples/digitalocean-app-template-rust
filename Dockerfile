FROM rust:latest AS builder
WORKDIR /usr/src/app

COPY Cargo.toml ./
RUN mkdir src && echo "fn main() {}" > src/main.rs
RUN cargo build --release

COPY . .
RUN cargo build --release

FROM debian:buster-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/src/app/target/release/sample-rust /usr/local/bin/sample-rust
EXPOSE 8080
CMD ["sample-rust"]
