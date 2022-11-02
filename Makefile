.SHELL := /bin/bash
.DEFAULT_GOAL := help

init: ## setup docker build, network, and databases
	docker network create sample || true
	docker compose up -d sample-mysql
	docker compose run --rm dockerize -wait tcp://nursebe-mysql:3306 -timeout 20s

command: cmd :=
command: ## command
	docker compose run --rm command $(cmd)

help: ## display this help screen
		@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
