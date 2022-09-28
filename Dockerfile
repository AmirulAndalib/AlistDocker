FROM alpine:edge

ARG TARGETPLATFORM BUILDPLATFORM

WORKDIR /alist/

RUN chmod -R 705 /alist/ && \
    chmod -R 777 /alist/ && \
    chmod -R +x /alist/

RUN apk update && apk upgrade && \
    apk add --upgrade --update --no-cache \
    wget curl apk-tools bash sudo git zip unzip \
    coreutils busybox gcompat musl-locales \
    musl-utils musl musl-dev pv jq
