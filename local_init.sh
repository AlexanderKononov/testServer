#!/bin/bash

#sudo ln -sf /home/kononov/git/testServer/etc/test.conf /etc/nginx/sites-enabled/default
#sudo /etc/init.d/nginx restart
sudo ln -sf /home/kononov/git/testServer/etc/test.conf /etc/nginx/sites-enabled/testServer.conf
sudo /etc/init.d/nginx restart
#sudo ln -sf /home/kononov/git/testServer/etc/testServer.py /etc/gunicorn.d/testServer.py
gunicorn --bind='0.0.0.0:8080' -D hello:hello_app
#gunicorn -c /etc/gunicorn.d/hello.conf.py /home/kononov/git/testServer/hello:hello_app
#/etc/init.d/gunicorn restart hello:hello_app
#sudo /etc/init.d/mysql start
