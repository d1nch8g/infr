<?php
$CONFIG = array (
  'apps_paths' => 
  array (
    0 => 
    array (
      'path' => '/var/www/owncloud/apps',
      'url' => '/apps',
      'writable' => false,
    ),
    1 => 
    array (
      'path' => '/var/www/owncloud/custom',
      'url' => '/custom',
      'writable' => true,
    ),
  ),
  'trusted_domains' => 
  array (
    0 => 'cloud.fmnx.ru',
  ),
  'datadirectory' => '/mnt/data/files',
  'dbtype' => 'sqlite',
  'dbhost' => '',
  'dbname' => 'owncloud',
  'dbuser' => '',
  'dbpassword' => '',
  'dbtableprefix' => 'oc_',
  'log_type' => 'owncloud',
  'supportedDatabases' => 
  array (
    0 => 'sqlite',
    1 => 'mysql',
    2 => 'pgsql',
  ),
  'upgrade.disable-web' => true,
  'default_language' => 'en',
  'overwrite.cli.url' => 'http://localhost/',
  'htaccess.RewriteBase' => '/',
  'logfile' => '/mnt/data/files/owncloud.log',
  'memcache.local' => '\\OC\\Memcache\\APCu',
  'filelocking.enabled' => true,
  'passwordsalt' => '6NDqLpOwcy1y0JJDpsvmeQ81f3nNNe',
  'secret' => 'eAlGUfmkN5Exh0Wmk3KZpLEv38JV4yWGu1bK2Jl0f1O9ysZm',
  'version' => '10.12.0.6',
  'allow_user_to_change_mail_address' => '',
  'logtimezone' => 'UTC',
  'installed' => true,
  'instanceid' => 'oce0t8db8s2k',
);
