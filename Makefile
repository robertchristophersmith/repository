.PHONY: composer coverage cs integration it test unit

it: cs test

composer:
	composer self-update
	composer validate
	composer install

coverage: composer
	vendor/bin/phpunit --configuration=test/Unit/phpunit.xml --coverage-text

cs: composer
	vendor/bin/php-cs-fixer fix --config=.php_cs --diff --verbose

integration: composer
	vendor/bin/phpunit --configuration=test/Integration/phpunit.xml

test: unit integration

unit: composer
	vendor/bin/phpunit --configuration=test/Unit/phpunit.xml
