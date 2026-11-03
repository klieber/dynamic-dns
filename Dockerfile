FROM alpine:3.20

RUN apk add --no-cache bash bind-tools curl jq

COPY update-dns /update-dns
RUN chmod +x /update-dns

ENTRYPOINT ["/update-dns"]
