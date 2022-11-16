#!/bin/bash

mkdir -p tempdir
cp -r {midterm_app.py,templates,static} tempdir
cat > tempdir/Dockerfile << EOF
FROM python:alpine
RUN pip install flask
COPY ./static /home/myapp/static/
COPY ./templates /home/myapp/templates
COPY ./midterm_app.py /home/myapp/
EXPOSE 5050
CMD python3 /home/myapp/midterm_app.py
EOF
cd tempdir
docker build -t midterm .
docker run -td -p 5050:5050 --name midtermapp midterm
docker ps -a