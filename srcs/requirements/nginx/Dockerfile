FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install nginx -y && apt-get install -y openssl

RUN openssl req -x509 -newkey rsa:2048 -nodes -subj /C=FR \
	-keyout /etc/ssl/lorampon.42.fr.key -out /etc/ssl/lorampon.42.fr.crt

COPY /conf/nginx.conf /etc/nginx/sites-available/lorampon.42.fr.conf

RUN	ln -s /etc/nginx/sites-available/lorampon.42.fr.conf /etc/nginx/sites-enabled/lorampon.42.fr.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
