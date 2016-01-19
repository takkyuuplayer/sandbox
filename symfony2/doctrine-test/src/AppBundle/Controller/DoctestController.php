<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class DoctestController extends Controller
{
  /**
   * @Route("/doctrine/insert")
   */
    public function insertAction()
    {

        $newProductName = 'Test from Symfony ' . time();

        $product = new \DoctrineTest\Entity\Product();
        $product->setName($newProductName);

        $em = $this->getDoctrine()->getManager();
        $em->persist($product);
        $em->flush();

        $productRepository = $em->getRepository('\DoctrineTest\Entity\Product');
        $products = $productRepository->getProducts();

        return $this->render('doctest/index.html.twig', ['products' => $products]);
    }
}
