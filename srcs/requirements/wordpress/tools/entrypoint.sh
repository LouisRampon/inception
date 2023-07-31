cd /var/www/html/wordpress

wp core download --allow-root 2> err.txt
wp config create --allow-root --dbname=$DB_DATABASE --dbuser=$DB_USER --dbpass=$DB_USER_PSW --dbhost=$DB_HOST --dbprefix=wp_ 2>> err.txt
wp core install --allow-root --url=$DOMAIN_NAME --title="$WP_SITE" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PSW --admin_email=$WP_ADMIN_EMAIL 2>> err.txt
wp plugin update --allow-root --all 2>> err.txt
wp user create --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PSW 2>> err.txt

chown www-data:www-data /var/www/html/wordpress/wp-content/uploads -R

mkdir -p /run/php/
php-fpm7.3 -F