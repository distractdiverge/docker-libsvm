FROM alpine:latest

COPY ./target/svm-train /usr/bin/svm-train
COPY ./target/svm-predict /usr/bin/svm-predict
COPY ./target/svm-scale /usr/bin/svm-scale
