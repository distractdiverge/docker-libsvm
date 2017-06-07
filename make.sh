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

echo "Creating Build Image: 'REPOSITORY/$CONTAINER.build'"
docker build -t $REPOSITORY/$CONTAINER.build -f Dockerfile.build .

echo "Creating Build Container: '$CONTAINER.target'"
docker create --name $CONTAINER.target $REPOSITORY/$CONTAINER.build

mkdir ./target/

echo "Copying artifacts from Build Container"
docker cp $CONTAINER.target:/usr/src/libsvm/svm-predict ./target/
docker cp $CONTAINER.target:/usr/src/libsvm/svm-scale ./target/
docker cp $CONTAINER.target:/usr/src/libsvm/svm-train ./target/

echo "Removing Build Container: '$CONTAINER.target'"
docker rm $CONTAINER.target

echo "Removing Build Image: '$REPOSITORY/$CONTAINER.build'"
docker rmi $REPOSITORY/$CONTAINER.build

echo "Creating final image: '$REPOSITORY/$CONTAINER'"
docker build -t $REPOSITORY/$CONTAINER .
