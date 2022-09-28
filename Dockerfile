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

RUN case ${TARGETPLATFORM} in \
         "linux/amd64")  ARCH=amd64  ;; \
         "linux/arm64")  ARCH=arm64  ;; \
         "linux/arm/v7") ARCH=arm    ;; \
    esac \
    && wget -q https://github.com/alist-org/alist/releases/latest/download/alist-linux-musl-${ARCH}.tar.gz -O alist.tar.gz && \
    tar -zxvf alist.tar.gz && \
    rm -f alist.tar.gz && \
    chmod -R +x ./alist
