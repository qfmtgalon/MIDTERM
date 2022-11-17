#!/bin/bash

mkdir temp
mkdir temp/templates
mkdir temp/static

cp midterm_app.py temp/.
cp -r templates/* temp/templates/.
cp -r static/* temp/static/.

echo "FROM python"> temp/Dockerfile
echo "RUN pip install flask" >> temp/Dockerfile
echo "COPY ./static /home/myapp/static" >> temp/Dockerfile
echo "COPY ./templates /home/myapp/templates">> temp/Dockerfile
echo "COPY midterm_app.py /home/myapp">> temp/Dockerfile
echo "EXPOSE 5050" >> temp/Dockerfile
echo "CMD python3 /home/myapp/midterm_app.py">> temp/Dockerfile

cd temp
docker build -t midtermapp .
docker run -t -d -p 5050:5050 --name midtermrun midtermapp
docker ps -a