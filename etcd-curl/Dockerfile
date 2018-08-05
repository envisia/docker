FROM debian:stable

ENV ETCD_VER v3.3.9

RUN apt-get update && apt-get install -y curl && apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*
COPY certs/* /etc/ssl/certs/
RUN mkdir -p /tmp/etcd-download-test && \
    curl -L https://storage.googleapis.com/etcd/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz && \
    tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/etcd-download-test --strip-components=1 && \
    rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz && \
    mv /tmp/etcd-download-test/etcdctl /usr/bin/etcdctl && \
    rm -rf /tmp/etcd-download-test/
