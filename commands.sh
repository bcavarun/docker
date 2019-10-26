docker volume create --name test

docker run -it -d --mount source=test,target=/tmp ubuntu

docker tag ubuntu:19.04 ubuntu:latest
