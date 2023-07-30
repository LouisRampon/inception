FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install curl less -y

RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&&		chmod +x wp-cli.phar \
&&		mv wp-cli.phar /usr/local/bin/wp

RUN		mkdir -p /var/www/html/wordpress

COPY	/tools/entrypoint.sh /tmp

COPY	/conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000

RUN apt-get install dumb-init -y

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "/tmp/entrypoint.sh" ]