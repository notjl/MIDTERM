#!/bin/bash

docker stop midtermapp
docker rm midtermapp
rm -r tempdir
./build.sh