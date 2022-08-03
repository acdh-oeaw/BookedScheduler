#!/bin/sh

# Export php path
export PATH="/app/.heroku/php/bin:${PATH}"

# Add custom commands


# Start Apache
echo "Start Apache!"
exec heroku-php-apache2 Web
