#!/bin/bash
mkdir /home/box/web/
cp -r ./* /home/box/web/

sudo ln -sf /home/box/web/etc/test.conf /etc/nginx/sites-enabled/default
#sudo /etc/init.d/nginx restart
#sudo ln -sf /home/box/web/etc/test.conf /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart

sudo /etc/init.d/mysql start
mysql -u root -e "create database qa_db;"
mysql -u root -e "create USER 'box'@'localhost' IDENTIFIED BY '';"
mysql -u root -e "grant all privileges on qa_db.* to 'box'@'localhost' with grant option;"

#sudo ln -sf /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/test
cd /home/box/web/ask/
#python ./manage.py syncdb
python ./manage.py makemigrations
python ./manage.py migrate
gunicorn -w 2 -c /home/box/web/etc/ask_conf.py ask.wsgi:application



#cd /home/box/web/
#gunicorn -w 2 -c /home/box/web/etc/hello_conf.py hello:app
#sudo gunicorn --bind='0.0.0.0:8080' -D hello:hello_app
#sudo gunicorn -c /etc/gunicorn.d/hello.conf.py /home/box/web/hello.py:hello_app
#sudo /etc/init.d/gunicorn restart hello:hello_app
#sudo /etc/init.d/mysql start
