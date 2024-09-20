FROM php:7.4-cli

RUN apt-get update && \
    apt-get install -y libaio1 unzip && \
    mkdir /opt/oracle && \
    cd /opt/oracle && \
    curl -o instantclient-basic-linux.x64-19.8.0.0.0dbru.zip https://download.oracle.com/otn_software/linux/instantclient/19800/instantclient-basic-linux.x64-19.8.0.0.0dbru.zip && \
    curl -o instantclient-sdk-linux.x64-19.8.0.0.0dbru.zip https://download.oracle.com/otn_software/linux/instantclient/19800/instantclient-sdk-linux.x64-19.8.0.0.0dbru.zip && \
    unzip instantclient-basic-linux.x64-19.8.0.0.0dbru.zip && \
    unzip instantclient-sdk-linux.x64-19.8.0.0.0dbru.zip && \
    rm -f instantclient-basic-linux.x64-19.8.0.0.0dbru.zip instantclient-sdk-linux.x64-19.8.0.0.0dbru.zip
    
RUN docker-php-ext-configure oci8 --with-oci8=instantclient,/opt/oracle/instantclient_19_8/ && \
    docker-php-ext-install oci8 && \
    echo /opt/oracle/instantclient_19_8 > /etc/ld.so.conf.d/oracle-instantclient.conf && \
    ldconfig

RUN pecl channel-update pecl.php.net && \
    pecl install oci8-2.2.0

WORKDIR /usr/src/myapp

COPY . /usr/src/myapp

CMD ["tail","-f", "/dev/null"]