FROM debian:buster

ARG DB_USER
ARG DB_DATABASE
ARG DB_USER_PSW
ARG DB_ROOT_PSW

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysql
RUN chown -R mysql:mysql /var/run/mysql

COPY ./conf/mariadb.conf ./etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start && mysql -u root -e   "CREATE DATABASE IF NOT EXISTS mariadb; \
                        ALTER USER 'root'@'localhost' IDENTIFIED BY '1234'; \
                        GRANT ALL PRIVILEGES ON mariadb.* TO 'louis'@'%' IDENTIFIED BY '1234'; \
                        FLUSH PRIVILEGES;"


EXPOSE 3306

RUN apt-get install dumb-init -y

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["mysqld", "--bind-address=0.0.0.0"]