#!/bin/bash
mkdir /home/box/web/
cp -r ./* /home/box/web/

#sudo ln -sf /home/box/web/etc/test.conf /etc/nginx/sites-enabled/default
#sudo /etc/init.d/nginx restart
sudo ln -s /home/box/web/etc/test.conf /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart
sudo ln -s /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/test
sudo /etc/init.d/gunicorn restart
#sudo /etc/init.d/mysql start﻿
