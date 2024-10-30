#!/bin/sh

mkdir -p shared
docker run --rm -it -v $(pwd)/shared:/shared oqs-ossl3
