<?php

$cfg['blowfish_secret'] = '111111111111111111111111111111111111111111110';

$i = 1;

$cfg['Servers'][$i]['auth_type'] = 'cookie';

$cfg['Servers'][$i]['host'] = 'mysql-service';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;

$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['controluser'] = 'root';
$cfg['Servers'][$i]['controlpass'] = 'pass';

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';

$cfg['TempDir'] = '/tmp';
