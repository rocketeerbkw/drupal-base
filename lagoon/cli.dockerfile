FROM uselagoon/php-8.4-cli-drupal:latest

COPY composer.* /app/
COPY assets /app/assets
RUN composer install --no-dev
COPY . /app
RUN mkdir -p -v -m775 /app/web/sites/default/files

# Define where the Drupal Root is located
ENV WEBROOT=web

RUN dd if=/dev/urandom bs=32 count=1 2>/dev/null | base64

