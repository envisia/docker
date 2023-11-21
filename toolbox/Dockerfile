FROM debian:bookworm-20230814

RUN apt update && apt install -y wget curl gnupg2 lsb-release && \
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt update && \
    apt install -y postgresql-client && \
    rm -rf /var/lib/apt/lists/* && \
    curl --location --show-error --silent --output mc https://dl.min.io/client/mc/release/linux-amd64/mc.RELEASE.2023-08-08T17-23-59Z \
      && echo '561037e88761b17e558a5d5015186636b779965f0075789a15f895304c42991b mc' > mc.sha256 \
      && sha256sum --check mc.sha256 \
      && chmod +x mc \
      && mv mc /usr/bin/mc \
      && rm mc.sha256
