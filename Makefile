SHELL := /bin/bash

.PHONY: all
all: clean build run

.PHONY: clean
clean:
	docker rmi -f gowiki:latest

.PHONY: build
build:
	docker build -t gowiki .

.PHONY: run
run:
	docker run --rm \
		--publish 40000:40000 \
		--publish 3000:3000 \
		--security-opt=seccomp:unconfined \
		--name gowiki \
		gowiki
