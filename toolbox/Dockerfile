FROM debian:bookworm-20260803

ENV McUri="https://dl.min.io/client/mc/release/linux-amd64/archive/mc.RELEASE.2025-08-13T08-35-41Z"
ENV McSha256="01f866e9c5f9b87c2b09116fa5d7c06695b106242d829a8bb32990c00312e891"

ENV RcloneVersion="1.75.0"
ENV RcloneSha256="aa2804e08f48250e71009c727124b6341cd0288465804a9a09d14663cabafbaa"

RUN apt update && apt install -y wget curl gnupg2 lsb-release unzip && \
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt update && \
    apt install -y postgresql-client-18 && \
    rm -rf /var/lib/apt/lists/* && \
    curl --location --show-error --silent --output mc $McUri \
      && echo "$McSha256 mc" > mc.sha256 \
      && sha256sum --check mc.sha256 \
      && chmod +x mc \
      && mv mc /usr/bin/mc \
      && rm mc.sha256 \
    && curl --location --show-error --silent --output rclone.zip "https://downloads.rclone.org/v${RcloneVersion}/rclone-v${RcloneVersion}-linux-amd64.zip" \
      && echo "$RcloneSha256 rclone.zip" > rclone.sha256 \
      && sha256sum --check rclone.sha256 \
      && unzip -q rclone.zip \
      && mv "rclone-v${RcloneVersion}-linux-amd64/rclone" /usr/bin/rclone \
      && chmod +x /usr/bin/rclone \
      && rm -rf rclone.zip rclone.sha256 "rclone-v${RcloneVersion}-linux-amd64" \
    && curl --location --show-error --silent --output awscliv2.zip "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
      && unzip -q awscliv2.zip \
      && ./aws/install \
      && rm -rf awscliv2.zip aws
