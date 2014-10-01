PHP=$(shell which php)
CURL=$(shell which curl)

setup:
	$(CURL) -s https://getcomposer.org/installer | php

install: setup
	$(PHP) composer.phar install

test:
	$(PHP) ./vendor/bin/phpunit --bootstrap ./vendor/autoload.php -c ./phpunit.xml.dist ./tests
