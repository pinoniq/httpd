#!/usr/bin/env bash

block_symfony="
<VirtualHost *:80>
    ServerName $HOSTNAME
    ServerAlias *.$HOSTNAME

    DocumentRoot \"/var/www/web\"

    EnableSendfile off

    DirectoryIndex app.php app_dev.php

    SetEnv ENVIRONMENT $ENVIRONMENT

    <Directory /var/www>
        Options FollowSymlinks
        AllowOverride All
        Require all granted
    </Directory>

    <FilesMatch \.php$>
        SetHandler \"proxy:fcgi://php:9000\"
    </FilesMatch>
</VirtualHost>
"

block_drupal="
<VirtualHost *:80>
    ServerName $HOSTNAME
    ServerAlias *.$HOSTNAME

    DocumentRoot \"/var/www\"

    EnableSendfile off

    DirectoryIndex index.php

    SetEnv ENVIRONMENT $ENVIRONMENT

    <Directory /var/www>
        Options FollowSymlinks
        AllowOverride All
        Require all granted
    </Directory>

    <FilesMatch \.php$>
        SetHandler \"proxy:fcgi://php:9000\"
    </FilesMatch>
</VirtualHost>
"

block_laravel="
<VirtualHost *:80>
    ServerName $HOSTNAME
    ServerAlias *.$HOSTNAME

    DocumentRoot \"/var/www/public\"

    EnableSendfile off

    DirectoryIndex index.php

    SetEnv ENVIRONMENT $ENVIRONMENT

    <Directory /var/www>
        Options FollowSymlinks
        AllowOverride All
        Require all granted
    </Directory>

    <FilesMatch \.php$>
        SetHandler \"proxy:fcgi://php:9000\"
    </FilesMatch>
</VirtualHost>
"

vhost="block_$FLAVOR"
echo "${!vhost}" > "/usr/local/apache2/conf/extra/httpd-vhosts.conf"
httpd-foreground
