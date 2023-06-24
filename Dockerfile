# syntax=docker/dockerfile:1

FROM ubuntu:20.04

LABEL version="1.0"

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /usr/local/share
COPY files/cognitect-dev-tools-0.9.72.zip ./
RUN apt-get update -y \
  && apt-get -y autoremove \
  && apt-get clean \
  && apt-get install -y apt-utils unzip maven
RUN unzip cognitect-dev-tools-0.9.72.zip \
  && cd cognitect-dev-tools-0.9.72 \
  && ./install
