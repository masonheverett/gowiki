SHELL := /bin/bash

.DEFAULT_GOAL := help

.PHONY: help
help:
	@echo 'usage: make <target>'
	@echo 'targets:'
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##/:/' | column -c2 -t -s :)"

.PHONY: clean
clean: ## Delete gowiki latest image
	docker rmi -f gowiki:latest

.PHONY: build
build: ## Build gowiki latest image
	docker build -t gowiki .

.PHONY: run
run: ## Run gowiki latest (using go run)
	docker run -d --rm \
		--publish 8080:8080 \
		--name gowiki-app \
		gowiki

.PHONY: debug
debug: ## Debug gowiki latest (using dlv debug)
	docker run -d --rm \
		--publish 4040:4040 \
		--publish 8080:8080 \
		--security-opt=seccomp:unconfined \
		--name gowiki-debug \
		gowiki \
		dlv debug --listen=:4040 --headless=true --api-version=2 --log
