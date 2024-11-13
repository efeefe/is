<?php
namespace Grav\Plugin;

use Grav\Common\Plugin;

class SubdomainRouterPlugin extends Plugin
{
    public static function getSubscribedEvents()
    {
        return [
            'onPluginsInitialized' => ['onPluginsInitialized', 0]
        ];
    }

    public function onPluginsInitialized()
    {
        // Only run the plugin on the frontend
        if ($this->isAdmin()) {
            return;
        }

        // Detect the subdomain
        $host = $_SERVER['HTTP_HOST'];
        if (strpos($host, 'fbr.efeefe.me') !== false) {
            // Point to the desired page folder for the subdomain
            $this->grav['page']->route('/stuff/fbr');
        }
    }
}
