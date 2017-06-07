# Docker - libSVM
A dockerized libsvm for building and running libSVM in a docker container.

[libSVM Homepage](https://www.csie.ntu.edu.tw/~cjlin/libsvm/)
[Example Docker Workflow](https://medium.com/@alexeiled/docker-pattern-the-build-container-b0d0e86ad601)

The following steps required to build the final image can be executed using ```make.sh``` or each command below can be run manually.

## Build the build image
```bash
docker build -t build-img -f Dockerfile.build
```

## Create a build container from the build image
```bash
docker create --name build-cont build-img
```

## Grab the artifacts from the build container
```bash
docker cp build-cont:/usr/src/libsvm/svm-train ./target/svm-train
docker cp build-cont:/usr/src/libsvm/svm-scale ./target/svm-scale
docker cp build-cont:/usr/src/libsvm/svm-predict ./target/svm-predict
```

## Building the final image
```bash
docker build -t libsvm
```

## Run a container from the final image
```bash
docker run xyz?
```
