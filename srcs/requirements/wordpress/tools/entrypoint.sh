cd /var/www/html/wordpress

wp core download --path="/var/www/html/wordpress" --allow-root
wp config create --path="/var/www/html/wordpress" --allow-root --dbname=$DB_DATABASE --dbuser=$DB_USER --dbpass=$DB_USER_PSW --dbhost=$DB_HOST --dbprefix=wp_
wp core install --path="/var/www/html/wordpress" --allow-root --url=$DOMAIN_NAME --title=$WP_SITE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PSW --admin_email=$WP_ADMIN_EMAIL
wp plugin update --allow-root --all
wp user create --path="/var/www/html/wordpress" --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PSW

chown www-data:www-data /var/www/html/wordpress/wp-content/uploads -R

mkdir -p /run/php/
php-fpm7.3 -F