<?php

use Localheinz\PhpCsFixer\Config;

$header = <<<EOF
Copyright (c) 2017 Andreas Möller

@link https://github.com/localheinz/repository
EOF;

$config = Config\Factory::fromRuleSet(new Config\RuleSet\Php71($header));

$config->getFinder()->in(__DIR__);

$cacheDir = \getenv('TRAVIS') ? \getenv('HOME') . '/.php-cs-fixer' : __DIR__;

$config->setCacheFile($cacheDir . '/.php_cs.cache');

return $config;
