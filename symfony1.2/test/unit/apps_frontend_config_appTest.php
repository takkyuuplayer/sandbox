<?php
require_once dirname(__FILE__).'/../bootstrap/unit.php';

$t = new lime_test(2);

ProjectConfiguration::getApplicationConfiguration( 'frontend', 'test', true);
$t->is(sfConfig::get('app_test_params_val1'), 'foobar');

ProjectConfiguration::getApplicationConfiguration( 'frontend', 'prod', true);
$t->is(sfConfig::get('app_test_params_val1'), 'secure');

