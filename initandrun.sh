#!/bin/sh

# Export php path
export PATH="/app/.heroku/php/bin:${PATH}"

# Add custom commands
cd /app
rm -f config/config.php
if [ "$LB_ENV" = "production" ]; then cp config/config.dist.php config/config.php; fi; \
if [ "$LB_ENV" = "dev" ]; then cp config/config.devel.php config/config.php; fi; \
echo '$conf["settings"]["database"]["user"] = ' "'$DB_USER';" >>config/config.php; \
echo '$conf["settings"]["database"]["password"] = ' "'$DB_PASSWORD';" >>config/config.php; \
echo '$conf["settings"]["database"]["hostspec"] = ' "'$DB_HOST';" >>config/config.php; \
echo '$conf["settings"]["database"]["name"] = ' "'$DB_DATABASE';" >>config/config.php; \
echo '$conf["settings"]["install.password"] = ' "'$INSTALL_PASSWORD';" >>config/config.php; \
echo '$conf["settings"]["sript.url"] = ' "'$SCRIPT_URL';" >>config/config.php; \
echo '$conf["settings"]["admin.email"] = ' "'$ADMIN_EMAIL';" >>config/config.php; \
echo '$conf["settings"]["email"]["default.from.address"] = ' "'$DEFAULT_FROM_EMAIL';" >>config/config.php; \
echo '$conf["settings"]["email"]["default.from.name"] = ' "'$DEFAULT_FROM_NAME';" >>config/config.php; \
echo '$conf["settings"]["image.upload.directory"] = ' "'$IMAGE_UPLOAD_DIR';" >>config/config.php; \
echo '$conf["settings"]["default.language"] = ' "'$DEFAULT_LANG';" >>config/config.php; \
echo '$conf["settings"]["admin.email.name"] = ' "'$ADMIN_EMAIL_NAME';" >>config/config.php; \
echo '$conf["settings"]["app.title"] = ' "'$APP_TITLE';" >>config/config.php; \
echo '$conf["settings"]["default.timezone"] = ' "'$DEF_TZ';" >>config/config.php; \
echo '$conf["settings"]["allow.self.registration"] = ' "'$ALLOW_SELF_REGISTRATION';" >>config/config.php; \
echo '$conf["settings"]["phpmailer"]["smtp.host"] = ' "'$SMTP_HOST';" >>config/config.php; 

# Start Apache
echo "Start Apache!"
exec heroku-php-apache2 Web
