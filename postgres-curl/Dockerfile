FROM postgres:10.4

RUN apt-get update && apt-get install -y curl && apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*
COPY certs/* /etc/ssl/certs/
