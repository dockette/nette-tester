# Based on Debian Jessie
FROM debian:jessie

# Environment
ENV TESTER_PATH=/srv/tester/
ENV TESTER_BIN=/srv/tester/vendor/bin/tester
ENV APP_PATH=/srv/app/

# Jessie is EOL, packages live on archive.debian.org
RUN echo "deb http://archive.debian.org/debian jessie main" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list && \
    printf 'Acquire::Check-Valid-Until "false";\nAPT::Get::AllowUnauthenticated "true";\n' > /etc/apt/apt.conf.d/99archive

# Install PHP, cURL, Git
RUN apt-get update && \
    apt-get install -y git curl php5-cli php5-cgi php5-mysql php5-pgsql php5-mcrypt php5-curl php5-json

# Install Composer, Nette Tester
RUN curl -sS https://getcomposer.org/installer | php && \
  mv composer.phar /usr/local/bin/composer && \
  mkdir $TESTER_PATH && mkdir $APP_PATH && \
  composer require nette/tester:~1.6.0 -d $TESTER_PATH

# Clean image
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Volumes
VOLUME $APP_PATH

# Default command
COPY ./run-tester.sh /srv/run-tester.sh
RUN chmod 755 /srv/run-tester.sh
CMD ["/srv/run-tester.sh"]
