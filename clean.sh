#!/bin/sh

REPOSITORY=alexlapinski
CONTAINER=libsvm

#
# Companion script to 'make.sh'
#  Used to cleanup docker artifacts
#

echo "Removing local artifacts"
rm -rf ./target/

echo "Removing Build Container: '$CONTAINER.target'"
docker rm $CONTAINER.target

echo "Removing Build Image: '$REPOSITORY/$CONTAINER.build'"
docker rmi $REPOSITORY/$CONTAINER.build
