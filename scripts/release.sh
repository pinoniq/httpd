#!/usr/bin/env bash

# build our image. We kind of rely on $0 to return the correct value here
my_dir="$(dirname "$0")"
"$my_dir/build.sh" $1

# add it as latest
docker tag pinoniq/httpd:$1 pinoniq/httpd:latest

# push to docker
docker push pinoniq/httpd:$1
docker push pinoniq/httpd:latest
