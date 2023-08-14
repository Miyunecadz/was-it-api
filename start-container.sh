#!/bin/bash

# Install composer dependencies
if [ "$APP_ENV" == "production" ] && [ -f "composer.json" ]; then
    composer config --global process-timeout 6000
    composer install --no-dev
    composer dump-autoload
fi

# Install npm dependencies
if [ "$APP_ENV" == "production" ] && [ -f "package.json" ]; then
    yarn add vite
    yarn install --production
    yarn build
fi

# Run apache foreground
apachectl -D FOREGROUND
