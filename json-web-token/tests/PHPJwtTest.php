<?php

class JWTTest extends PHPUnit_Framework_TestCase
{
    function testEncodeDecode()
    {
        $payload = array(
            'cross_id' => 15,
            '_csrf_token' => 'fuga',
            'exp' => time() + 20,
        );
        var_dump(JWT::encode($payload, 'KEY'));
        var_dump(JWT::encode($payload, 'KEY2'));
    }
}
