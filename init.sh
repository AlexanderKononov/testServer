#!/bin/bash
mkdir /home/box/web/
cp -r ./* /home/box/web/

sudo ln -sf /home/box/web/etc/test.conf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
