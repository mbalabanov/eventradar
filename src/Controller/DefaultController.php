<?php

namespace App\Controller;

use App\Entity\Event;
use App\Form\EventType;
use App\Entity\Team;
use App\Form\TeamType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends AbstractController
{
    /**
     * @Route("/", name="default_index")
     */
    public function default_index(): Response
    {
        $events = $this->getDoctrine()
            ->getRepository(Event::class)
            ->findBy([], ['eventdate' => 'ASC']);

        return $this->render('event/index.html.twig', [
            'events' => $events,
        ]);
    }
}
