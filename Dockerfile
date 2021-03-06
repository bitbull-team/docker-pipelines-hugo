FROM alpine:3.9
MAINTAINER Karel Bemelmans <mail@karelbemelmans.com>

# Install packages needed to build
RUN apk add --update --no-cache \
    bash \
    ca-certificates \
    curl \
    python \
    py-pip \
    wget \
  && pip install --upgrade pip \
  && pip install -U awscli

# Install hugo.
ARG HUGO_VERSION=0.55.4

# Rember sha256sum (and md5sum) expect 2 spaces in front of the filename on alpine...
RUN curl -Ls https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
       -o /tmp/hugo.tar.gz \
  && tar xf /tmp/hugo.tar.gz -C /tmp \
  && mv /tmp/hugo /usr/bin/hugo \
  && rm -rf /tmp/hugo*
