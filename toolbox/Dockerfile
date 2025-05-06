FROM debian:bookworm-20250407

RUN apt update && apt install -y wget curl gnupg2 lsb-release && \
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt update && \
    apt install -y postgresql-client-17 && \
    rm -rf /var/lib/apt/lists/* && \
    curl --location --show-error --silent --output mc https://dl.min.io/client/mc/release/linux-amd64/archive/mc.RELEASE.2023-11-20T16-30-59Z \
      && echo 'fdd901a5169d676f32483f9a2de977b7ff3a4fe83e254dcbc35e7a1545591565 mc' > mc.sha256 \
      && sha256sum --check mc.sha256 \
      && chmod +x mc \
      && mv mc /usr/bin/mc \
      && rm mc.sha256
