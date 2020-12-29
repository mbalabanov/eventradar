<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/* This controller only provides the route to the instructions page (login required) */

class InstructionsController extends AbstractController
{
    /**
    * @Route("/admin/instructions", name="instructions")
    */
    public function index(): Response
    {
        return $this->render('instructions/index.html.twig');
    }
}
