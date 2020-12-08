#!/bin/bash
mkdir /home/box/web/
cp -r ./* /home/box/web/

#sudo ln -sf /home/box/web/etc/test.conf /etc/nginx/sites-enabled/default
#sudo /etc/init.d/nginx restart
sudo rm /etc/nginx/sites-enabled/default
sudo ln -sf /home/box/web/etc/test.conf /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart
sudo ln -sf /home/box/web/etc/hello.conf.py /etc/gunicorn.d/hello.conf.py
sudo /etc/init.d/gunicorn -c hello.conf.py /home/box/web/hello.py:hello_app
#sudo /etc/init.d/mysql start﻿
