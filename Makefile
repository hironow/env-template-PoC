.DEFAULT_GOAL := help

.PHONY: help
help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

PHONY: deploy-dev
deploy-dev: ## deploy-dev
	@make -j deploy-foo-dev deploy-bar-dev

PHONY: deploy-stg
deploy-stg: ## deploy-stg
	@make -j deploy-foo-stg deploy-bar-stg

PHONY: deploy-prd
deploy-prd: ## deploy-prd
	@make -j deploy-foo-prd deploy-bar-prd

PHONY: deploy-foo-dev
deploy-foo-dev: ## deploy-foo-dev
	@cd foo && npm run deploy:dev

PHONY: deploy-foo-stg
deploy-foo-stg: ## deploy-foo-stg
	@cd foo && npm run deploy:stg

PHONY: deploy-foo-prd
deploy-foo-prd: ## deploy-foo-prd
	@cd foo && npm run deploy:prd

PHONY: deploy-bar-dev
deploy-bar-dev: ## deploy-bar-dev
	@cd bar && npm run deploy:dev

PHONY: deploy-bar-stg
deploy-bar-stg: ## deploy-bar-stg
	@cd bar && npm run deploy:stg

PHONY: deploy-bar-prd
deploy-bar-prd: ## deploy-bar-prd
	@cd bar && npm run deploy:prd