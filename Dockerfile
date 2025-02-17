FROM caddy:2-builder AS builder

COPY --from=golang:1-alpine /usr/local/go/ /usr/local/go/

RUN xcaddy build \
    --with github.com/caddy-dns/namecheap \
    --with github.com/greenpau/caddy-security

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
