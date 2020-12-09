#!/bin/bash
mkdir /home/box/web/
cp -r ./* /home/box/web/

#sudo ln -sf /home/box/web/etc/test.conf /etc/nginx/sites-enabled/default
#sudo /etc/init.d/nginx restart
sudo ln -sf /home/box/web/etc/test.conf /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart
sudo ln -sf /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/test
cd /home/box/web/
sudo gunicorn --bind='0.0.0.0:8080' -D hello:hello_app
#sudo gunicorn -c /etc/gunicorn.d/hello.conf.py /home/box/web/hello.py:hello_app
#sudo /etc/init.d/gunicorn restart hello:hello_app
#sudo /etc/init.d/mysql start
