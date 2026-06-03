FROM wordpress:php8.3-apache

RUN set -eux; \
    apt-get update; \
    apt-get upgrade -y; \
    rm -rf /var/lib/apt/lists/*; \
    sed -ri 's/^#?ServerTokens .*/ServerTokens Prod/' /etc/apache2/conf-available/security.conf; \
    sed -ri 's/^#?ServerSignature .*/ServerSignature Off/' /etc/apache2/conf-available/security.conf; \
    printf '%s\n' 'expose_php = Off' > /usr/local/etc/php/conf.d/security.ini; \
    mkdir -p /usr/src/wordpress/wp-content/mu-plugins

COPY docker/.htaccess /usr/src/wordpress/.htaccess
COPY docker/hardening.php /usr/src/wordpress/wp-content/mu-plugins/hardening.php

RUN chown www-data:www-data /usr/src/wordpress/.htaccess \
    /usr/src/wordpress/wp-content/mu-plugins/hardening.php
