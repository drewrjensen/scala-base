FROM alpine:edge

RUN echo "@testing https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update
RUN apk add --no-cache bash
RUN apk add --no-cache curl
RUN apk add --no-cache gzip
RUN apk add --no-cache libc6-compat
RUN apk add --no-cache openjdk23-jre@testing
RUN curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs
RUN chmod +x cs
RUN ./cs setup --yes
RUN echo "Export PATH=\"$PATH:/usr/lib/jvm/java-23-openjdk\"" > ~/.profile

ENTRYPOINT ["tail", "-f", "/dev/null"]