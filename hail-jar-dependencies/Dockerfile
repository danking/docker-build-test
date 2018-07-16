FROM gradle:alpine
MAINTAINER Hail Team <hail@broadinstitute.org>

USER root
RUN apk update && \
    apk upgrade && \
    apk add \
    bash \
    cmake \
    curl \
    g++ \
    git \
    make \
    openjdk8
