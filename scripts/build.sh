#!/usr/bin/env bash

my_dir="$(dirname "$0")"

docker build "$my_dir/../" -t pinoniq/httpd:$1
