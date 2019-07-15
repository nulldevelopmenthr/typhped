.PHONY: all

docker-up:
	docker-sync start
	docker-compose up -d

docker-stop:
	docker-compose stop
	docker-sync stop

docker-cli:
	docker-compose exec ali-cli bash

test: spec unit behat

quality: phpcbf cs-fix stan codesniffer mess-detector

unit: ## Run phpunit tests
	vendor/bin/phpunit


spec: ## Run phpspec
	vendor/bin/phpspec run


behat: ## Run behat
	APP_ENV=test vendor/bin/behat


cs-fix: ## Fix all code style violations using php-cs-fixer
	vendor/bin/php-cs-fixer fix

cs-check: ## Check for coding style violations
	vendor/bin/php-cs-fixer fix --dry-run --diff


stan: ## Run phpstan checks
	vendor/bin/phpstan analyse -l 7 -c etc/phpstan.neon src/ tests/

codesniffer: ## Run php_codesniffer
	vendor/bin/phpcs --standard=etc/phpcs.xml.dist -n

phpcbf: ## Run phpcbf
	vendor/bin/phpcbf --standard=etc/phpcs.xml.dist -n

mess-detector: ## Run php mess detector
	vendor/bin/phpmd src text etc/phpmd.xml
	vendor/bin/phpmd tests text etc/phpmd.xml