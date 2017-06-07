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

echo ""
echo "Creating Build Image: '$REPOSITORY/$CONTAINER.build'"
docker build -t $REPOSITORY/$CONTAINER.build -f Dockerfile.build .

echo ""
echo "Creating Build Container: '$CONTAINER.target'"
docker create --name $CONTAINER.target $REPOSITORY/$CONTAINER.build

echo ""
echo "Copying artifacts from Build Container"
mkdir ./target/
docker cp $CONTAINER.target:/usr/src/libsvm/svm-predict ./target/
docker cp $CONTAINER.target:/usr/src/libsvm/svm-scale ./target/
docker cp $CONTAINER.target:/usr/src/libsvm/svm-train ./target/

echo ""
echo "Creating final image: '$REPOSITORY/$CONTAINER'"
docker build -t $REPOSITORY/$CONTAINER .
