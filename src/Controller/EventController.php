<?php

namespace App\Controller;

use App\Entity\Event;
use App\Form\EventType;
use App\Entity\Team;
use App\Form\TeamType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/* This controller is only provided to signed-in users (as per definition in security.yaml) */

/**
 * @Route("/admin/event")
 */
class EventController extends AbstractController
{
    /* This view provides the form to add a new event. */
    /**
    * @Route("/new", name="event_new", methods={"GET","POST"})
    */
    public function event_new(Request $request): Response
    {
        /* Creates a new event object based on the class. */
        $event = new Event();

        /* Generates the form with the inputs that populate the new event */
        $form = $this->createForm(EventType::class, $event);
        $form->handleRequest($request);

        /* When the form is submitted, receives the posted form inputs for the new events and sends them to the DB. */
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($event);
            $entityManager->flush();

            return $this->redirectToRoute('default_index');
        }

        /* Provides the event infos and the form to the template. */
        return $this->render('event/new.html.twig', [
            'event' => $event,
            'form' => $form->createView(),
        ]);
    }

    /* This view provides the form to edit an existing event. */
    /**
     * @Route("/{eventid}/edit", name="event_edit", methods={"GET","POST"})
     */
    public function event_edit(Request $request, Event $event): Response
    {
        /* Generates a form pre-populated with the data of the event ID provided to this function. */
        $form = $this->createForm(EventType::class, $event);
        $form->handleRequest($request);

        /* On submitting the form, the data in the DB is updated with the inputs. */
        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('default_index');
        }

        /* Provides the event infos and the form to the template. */
        return $this->render('event/edit.html.twig', [
            'event' => $event,
            'form' => $form->createView(),
        ]);
    }

    /* In this view signed-in users can delete an existing event. */
    /**
    * @Route("/{eventid}", name="event_delete", methods={"DELETE"})
    */
    public function event_delete(Request $request, Event $event): Response
    {
        /* Deletes the event with the ID passed onto the function. Checks validity of token to do so. */
        if ($this->isCsrfTokenValid('delete'.$event->getEventid(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($event);
            $entityManager->flush();
        }

        return $this->redirectToRoute('default_index');
    }
}
