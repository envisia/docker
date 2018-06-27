FROM php:7.0-fpm
MAINTAINER Martin Campbell <martin@campbellsoftware.co.uk>

# setup workdir
RUN mkdir /data
WORKDIR /data

# environment for osticket
ENV OSTICKET_VERSION 1.10.1
ENV HOME /data
ENV LC_ALL de_DE.UTF-8
ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y locales && apt clean -y && apt autoclean -y && apt autoremove -y && rm -rf /var/lib/apt/lists/*
RUN echo "LC_ALL=de_DE.UTF-8" >> /etc/environment && \
    echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen && \
    echo "LANG=de_DE.UTF-8" > /etc/locale.conf && \
    locale-gen de_DE.UTF-8 && \
    dpkg-reconfigure locales

# requirements and PHP extensions
RUN apt update && apt install -y \
    wget \
    msmtp \
    cron \
    unzip \
    ssmtp \
    ca-certificates \
    supervisor \
    nginx \
    libpng16-16 \
    libxml2 \
    libc-client2007e \
    libgssrpc4 \
    libkadm5clnt-mit11 \
    libkadm5srv-mit11 \
    libkdb5-8 \
    libssl-doc \
    mlock \
    openssl && \
    apt install -y libpng-dev libldb-dev libldap2-dev libxml2-dev libicu-dev autoconf g++ make libpcre3-dev libcurl4-openssl-dev libc-client2007e-dev libkrb5-dev && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install gd curl ldap mysqli sockets gettext mbstring xml intl opcache && \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install imap && \
    pecl install apcu && docker-php-ext-enable apcu && \
    apt remove -y libpng-dev libldb-dev libldap2-dev libxml2-dev libicu-dev autoconf g++ make libpcre3-dev libcurl4-openssl-dev libc-client2007e-dev libkrb5-dev && \
    apt clean -y && apt autoclean -y && apt autoremove -y && rm -rf /var/lib/apt/lists/*

# Download & install OSTicket
RUN wget -nv -O osTicket.zip http://osticket.com/sites/default/files/download/osTicket-v${OSTICKET_VERSION}.zip && \
    unzip osTicket.zip && \
    rm osTicket.zip && \
    chown -R www-data:www-data /data/upload/ && \
    chmod -R a+rX /data/upload/ /data/scripts/ && \
    chmod -R u+rw /data/upload/ /data/scripts/ && \
    mv /data/upload/setup /data/upload/setup_hidden && \
    chown -R root:root /data/upload/setup_hidden && \
    chmod 700 /data/upload/setup_hidden

# Download languages packs
RUN wget -nv -O upload/include/i18n/fr.phar http://osticket.com/sites/default/files/download/lang/fr.phar && \
    wget -nv -O upload/include/i18n/ar.phar http://osticket.com/sites/default/files/download/lang/ar.phar && \
    wget -nv -O upload/include/i18n/pt_BR.phar http://osticket.com/sites/default/files/download/lang/pt_BR.phar && \
    wget -nv -O upload/include/i18n/it.phar http://osticket.com/sites/default/files/download/lang/it.phar && \
    wget -nv -O upload/include/i18n/es_ES.phar http://osticket.com/sites/default/files/download/lang/es_ES.phar && \
    wget -nv -O upload/include/i18n/de.phar http://osticket.com/sites/default/files/download/lang/de.phar && \
    mv upload/include/i18n upload/include/i18n.dist

# Download LDAP plugin
RUN wget -nv -O upload/include/plugins/auth-ldap.phar http://osticket.com/sites/default/files/download/plugin/auth-ldap.phar && \
    wget -nv -O upload/include/plugins/storage-s3.phar http://osticket.com/sites/default/files/download/plugin/storage-s3.phar

# Configure nginx, PHP, msmtp and supervisor
COPY nginx.conf /etc/nginx/nginx.conf
COPY php-osticket.ini $PHP_INI_DIR/conf.d/
RUN touch /var/log/msmtp.log && \
    chown www-data:www-data /var/log/msmtp.log
COPY supervisord.conf /data/supervisord.conf
COPY msmtp.conf /data/msmtp.conf
COPY php.ini $PHP_INI_DIR/php.ini

COPY bin/ /data/bin

VOLUME ["/data/upload/include/plugins","/data/upload/include/i18n","/var/log/nginx"]
EXPOSE 80
CMD ["/data/bin/start.sh"]
