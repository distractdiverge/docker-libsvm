#!/bin/sh

#
# Build Scripts for the libsvm binaries
#  1. Build the docker build container
#  2. Create new image from docker build container
#  3. Copy binaries from build image
#  4. Create final docker image with binaries
#

docker build -t libsvm.build -f Dockerfile.build .
docker create --name libsvm.target libsvm.build

mkdir ./target/

docker cp libsvm.target:/usr/src/libsvm/svm-predict ./target/
docker cp libsvm.target:/usr/src/libsvm/svm-scale ./target/
docker cp libsvm.target:/usr/src/libsvm/svm-train ./target/
