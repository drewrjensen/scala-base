FROM alpine:edge

RUN echo "@testing https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk update && \
  apk add --no-cache bash curl gzip libc6-compat openjdk24-jdk@testing && \
  curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > /usr/local/bin/cs && \
  chmod +x /usr/local/bin/cs && \
  cs setup --yes

ENTRYPOINT ["tail", "-f", "/dev/null"]