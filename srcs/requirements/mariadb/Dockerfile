FROM debian:buster

ARG DB_USER
ARG DB_DATABASE
ARG DB_USER_PSW
ARG DB_ROOT_PSW

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysql
RUN chown -R mysql:mysql /var/run/mysql

RUN service mysql start && mysql -u root -e   "CREATE DATABASE IF NOT EXISTS $DB_DATABASE; \
                        ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PSW'; \
                        GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PSW'; \
                        FLUSH PRIVILEGES;"


EXPOSE 3306

CMD ["mysqld", "--bind-address=0.0.0.0"]