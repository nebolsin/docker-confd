FROM golang:1.9-alpine as confd
ARG CONFD_VERSION=0.14.0
ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="Sergey Nebolsin <sergey@nebols.in>" \
      org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.vcs-ref="${VCS_REF}" \
      org.label-schema.vcs-url="https://github.com/nebolsin/docker-confd" \
      org.label-schema.version=$CONFD_VERSION \
      org.label-schema.schema-version="1.0"

RUN apk add --no-cache make unzip libressl
RUN mkdir -p /go/src/github.com/kelseyhightower/confd \
 && ln -s /go/src/github.com/kelseyhightower/confd /app

WORKDIR /app

RUN wget -O /tmp/confd.zip https://github.com/kelseyhightower/confd/archive/v${CONFD_VERSION}.zip \
 && unzip -d /tmp/confd /tmp/confd.zip \
 && cp -r /tmp/confd/*/* /app \
 && rm -rf /tmp/confd* \
 && make build
