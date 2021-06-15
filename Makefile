SHELL := /bin/bash

.PHONY: all
all: clean build run

.PHONY: clean
clean:
	[[ -z "$(docker images -q gowiki:latest)" ]] || docker rmi gowiki:latest

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
