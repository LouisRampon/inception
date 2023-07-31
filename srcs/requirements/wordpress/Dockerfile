FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install curl -y

RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

RUN service php7.3-fpm start && service php7.3-fpm stop

RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&&		chmod +x wp-cli.phar \
&&		mv wp-cli.phar /usr/local/bin/wp

COPY	/tools/entrypoint.sh /tmp

COPY	/conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["sh", "/tmp/entrypoint.sh" ]