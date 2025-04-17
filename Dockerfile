FROM debian:buster-slim AS build
RUN apt-get update && apt-get install -y build-essential curl pkg-config libssl-dev ca-certificates && rm -rf /var/lib/apt/lists/*
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
WORKDIR /usr/src/app

COPY Cargo.toml ./
RUN mkdir src && echo "fn main() {}" > src/main.rs
RUN cargo build --release

COPY . .
RUN cargo build --release

FROM debian:buster-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/src/app/target/release/sample-rust /usr/local/bin/sample-rust
EXPOSE 8080
CMD ["/usr/local/bin/sample-rust"]
