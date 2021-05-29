FROM ubuntu:focal

RUN apt update && apt install -y wget curl gnupg2 && \
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt focal-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt update && \
    apt install -y postgresql-client && \
    rm -rf /var/lib/apt/lists/*
