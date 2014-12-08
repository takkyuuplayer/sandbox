<?php

usleep(rand(1000 * 500, 1000 * 1000));

$cache_path = dirname(__FILE__) . '/cache/cached';
echo "<h1>$cache_path</h1>";
if( file_exists($cache_path)) {
    echo 'cache used';
    require_once($cache_path);
    return;
}

$contents = '<h1>' . dirname(__FILE__) . '</h1>';
usleep(rand(1000 * 500, 1000 * 1000));

file_put_contents($cache_path, $contents);
echo $contents;

