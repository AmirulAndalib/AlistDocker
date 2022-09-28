FROM alpine:edge

WORKDIR /alist/

RUN chmod -R 705 /alist/ && \
    chmod -R 777 /alist/ && \
    chmod -R +x /alist/

RUN apk update && apk upgrade && \
    apk add --upgrade --update --no-cache \
    wget curl apk-tools bash sudo git zip unzip \
    coreutils busybox gcompat musl-locales \
    musl-utils musl musl-dev pv jq

RUN curl -L https://github.com/alist-org/alist/releases/latest/download/alist-linux-musl-amd64.tar.gz -o alist.tar.gz && \
    tar -zxvf alist.tar.gz && \
    rm -f alist.tar.gz && \
    chmod -R +x ./alist
