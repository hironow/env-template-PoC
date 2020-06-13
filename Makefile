ifneq (,$(wildcard ./.env))
    include .env
    export
    ENV_FILE_PARAM = --env-file .env
endif


# application presets
dev_url:=http://example.com
stg_url:=http://example.com
prd_url:=http://example.com


.DEFAULT_GOAL := help

.PHONY: help
help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

cmd-exists-%:
	@hash $(*) > /dev/null 2>&1 || \
		(echo "ERROR: '$(*)' must be installed and available on your PATH."; exit 1)

guard-%:
	@if [ -z '${${*}}' ]; then echo 'ERROR: environment variable $* not set' && exit 1; fi


# application command
PHONY: deploy
deploy: guard-APP_ENV ## deploy APP_ENV
	@make -j deploy-npm-foo deploy-npm-bar deploy-go-baz

deploy-npm-%:
	@cd $(*) && npm run deploy

deploy-go-%:
	@cd $(*) && go run main.go
