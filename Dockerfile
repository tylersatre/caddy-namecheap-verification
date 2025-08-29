FROM caddy:2-builder AS builder

RUN wget -O go.tar.gz https://go.dev/dl/go1.24.0.linux-amd64.tar.gz && \
    rm -rf /usr/local/go && tar -C /usr/local -xzf go.tar.gz

RUN xcaddy build \
    --with github.com/caddy-dns/namecheap@master \
    --with github.com/greenpau/caddy-security

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
