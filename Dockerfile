FROM ubuntu:20.04

RUN apt-get -q update && apt-get install -y dnsutils curl && apt-get clean

ADD update-dns /update-dns

ENTRYPOINT ["/update-dns"]
