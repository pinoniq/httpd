#!/usr/bin/env bash

vhost="
<VirtualHost *:80>
    ServerName $HOSTNAME
    ServerAlias *.$HOSTNAME

    DocumentRoot \"/var/www/$DOCUMENT_ROOT\"

    EnableSendfile off

    DirectoryIndex $INDEX

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

echo "$vhost" > "/usr/local/apache2/conf/extra/httpd-vhosts.conf"
httpd-foreground
