<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class InstructionsController extends AbstractController
{
    /**
     * @Route("/admin/instructions", name="instructions")
     */
    public function index(): Response
    {
        return $this->render('instructions/index.html.twig', [
            'controller_name' => 'InstructionsController',
        ]);
    }
}
