# Docker - libSVM
A dockerized libsvm for building and running libSVM in a docker container.

[libSVM Homepage](https://www.csie.ntu.edu.tw/~cjlin/libsvm/)
[Example Docker Workflow](https://medium.com/@alexeiled/docker-pattern-the-build-container-b0d0e86ad601)

## Setting up the build container
```bash
docker build -t build-img -f Dockerfile.build
docker create --name build-cont build-img
```

## Running the build of libSVM
```bash
docker cp build-cont:/usr/src/libsvm/svm-train ./target/svm-train
docker cp build-cont:/usr/src/libsvm/svm-scale ./target/svm-scale
docker cp build-cont:/usr/src/libsvm/svm-predict ./target/svm-predict
```

## Building the final container with artifacts
```bash
docker build -t libsvm
```
