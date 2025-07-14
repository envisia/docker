FROM debian:bookworm-20250407

ENV McUri=https://dl.min.io/client/mc/release/linux-amd64/archive/mc.RELEASE.2025-05-21T01-59-54Z
ENV McSha256=fb11c542a9d781fb228de1126c267a7933e98bee831654462fb352d5c9e94d24

RUN apt update && apt install -y wget curl gnupg2 lsb-release && \
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt update && \
    apt install -y postgresql-client-17 && \
    rm -rf /var/lib/apt/lists/* && \
    curl --location --show-error --silent --output mc $McUri \
      && echo '$McSha256 mc' > mc.sha256 \
      && sha256sum --check mc.sha256 \
      && chmod +x mc \
      && mv mc /usr/bin/mc \
      && rm mc.sha256
