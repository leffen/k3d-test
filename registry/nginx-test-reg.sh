#!/bin/bash

set -e 

docker pull nginx:latest
docker tag nginx:latest localhost:5000/my-nginx:latest
docker push localhost:5000/my-nginx:latest

