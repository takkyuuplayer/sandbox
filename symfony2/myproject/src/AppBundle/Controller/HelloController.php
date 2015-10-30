<?php
namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;

class HelloController
{
    /**
     * @Route("/hello/{name}", name="hello")
     */
    public function indexAction($name, Request $request)
    {
        $page = $request->query->get('page', 1);
        return new Response('<html><body>Hello '.$page.'!</body></html>');
    }
}
