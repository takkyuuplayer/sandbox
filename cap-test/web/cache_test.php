<?php
$deployment_path = '/workspace/cap-deployment/cap-test';
$realpath_cached = $deployment_path. '/shared/realpath.cached';

if (!file_exists($realpath_cached)) {
    clearstatcache(true);
    touch($realpath_cached);
}

usleep(rand(1000 * 500, 1000 * 1000));
require_once($deployment_path. '/current/web/load_cache.php');
