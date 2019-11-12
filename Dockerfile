FROM mediawiki

RUN apt-get update
RUN apt-get install -y zip unzip
COPY ./GoogleLogin ./extensions/GoogleLogin
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-dev
WORKDIR ./extensions/GoogleLogin
RUN composer install --no-dev