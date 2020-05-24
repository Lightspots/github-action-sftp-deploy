FROM ubuntu:focal

RUN apt-get update && apt-get install -y lftp && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]