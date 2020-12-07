#!/bin/bash

mkdir /home/box/web/
cp -r ./* /home/box/web/

sudo rm -rf /etc/nginx/sites-enabled/default
sudo ﻿ln -sf ./etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart
