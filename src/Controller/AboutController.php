<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/* This controller only provides the route to the about page */

class AboutController extends AbstractController
{
    /**
    * @Route("/about", name="about")
    */
    public function index(): Response
    {
        return $this->render('about/index.html.twig');
    }
}
