#!/bin/sh
DEBIAN_CODENAME=$1
COREDNS_VERSION=$2
IMAGE_NAME=coredns-debian:v${COREDNS_VERSION}-${DEBIAN_CODENAME}
sudo docker build --build-arg DEBIAN_CODENAME=${DEBIAN_CODENAME} --build-arg COREDNS_VERSION=${COREDNS_VERSION} -t ${IMAGE_NAME} .
sudo docker run --rm ${IMAGE_NAME} sh -c "cat coredns_*.deb" > coredns-v${COREDNS_VERSION}-${DEBIAN_CODENAME}.deb
