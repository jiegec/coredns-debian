ARG DEBIAN_CODENAME
FROM debian:${DEBIAN_CODENAME}
ARG COREDNS_VERSION
RUN sed -i "s/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list.d/*
RUN apt update
RUN apt install -y dpkg-dev golang-go git build-essential debhelper jq lsb-release curl
RUN git clone https://github.com/coredns/coredns
RUN cd coredns && git checkout v${COREDNS_VERSION}
RUN git clone https://github.com/coredns/debian && mv debian/debian coredns/debian
RUN cd coredns && dpkg-buildpackage -us -uc -b --target-arch amd64
