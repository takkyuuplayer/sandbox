<?php

class frontendConfiguration extends sfApplicationConfiguration
{
    public function configure()
    {
    }

    public function initConfiguration()
    {
        parent::initConfiguration();

        $dir = sprintf('local-git/sf/apps/%s/config', $this->getApplication());
        if ($file = $this->getConfigCache()->checkConfig("$dir/app.yml")) {
            include($file);
        }
    }
}
