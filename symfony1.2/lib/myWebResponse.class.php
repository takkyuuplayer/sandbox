<?php

class myWebResponse extends sfWebResponse
{
    /**
     * @overload
     */
    protected function normalizeHeaderName($name)
    {
        $callback = function(array $matches) {
            return sprintf("'-'%s", strtoupper($matches[1]));
        };
        return preg_replace_callback('/\-(.)/', $callback, strtr(ucfirst(strtolower($name)), '_', '-'));
    }
}
