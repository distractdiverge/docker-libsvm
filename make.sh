#!/bin/sh

REPOSITORY=alexlapinski
CONTAINER=libsvm

#
# Build Scripts for the libsvm binaries
#  1. Build the docker build container
#  2. Create new image from docker build container
#  3. Copy binaries from build image
#  4. Create final docker image with binaries
#

docker build -t $REPOSITORY/$CONTAINER.build -f Dockerfile.build .
docker create --name $CONTAINER.target $REPOSITORY/$CONTAINER.build

mkdir ./target/

docker cp $CONTAINER.target:/usr/src/libsvm/svm-predict ./target/
docker cp $CONTAINER.target:/usr/src/libsvm/svm-scale ./target/
docker cp $CONTAINER.target:/usr/src/libsvm/svm-train ./target/

docker build -t $REPOSITORY/$CONTAINER .
