<?php

namespace App\Controller;

use App\Entity\Contest;
use App\Form\ContestType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/* This controller is only provided to signed-in users (as per definition in security.yaml) */

/**
* @Route("/admin/contest")
*/
class ContestController extends AbstractController
{
    /* This view shows all contests. */
    /**
    * @Route("/", name="contest_index", methods={"GET"})
    */
    public function contest_index(): Response
    {
        /* Gets a list of all contests and passes it onto the template */
        $contests = $this->getDoctrine()
            ->getRepository(Contest::class)
            ->findBy([], ['name' => 'ASC']);

        return $this->render('contest/index.html.twig', [
            'contests' => $contests,
        ]);
    }

    /* This view provides the form to add a new contst. */
    /**
    * @Route("/new", name="contest_new", methods={"GET","POST"})
    */
    public function new(Request $request): Response
    {

        /* Creates a new contest object based on the class. */
        $contest = new Contest();

        /* Generates the form with the inputs that populate the new contest */
        $form = $this->createForm(ContestType::class, $contest);
        $form->handleRequest($request);

        /* When the form is submitted, receives the posted form inputs for the new contest and sends them to the DB. */
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($contest);
            $entityManager->flush();

            return $this->redirectToRoute('contest_index');
        }

        /* Provides the content infos and the form to the template. */
        return $this->render('contest/new.html.twig', [
            'contest' => $contest,
            'form' => $form->createView(),
        ]);
    }

    /* This view provides the form to edit an existing contest. */
    /**
    * @Route("/{contestid}/edit", name="contest_edit", methods={"GET","POST"})
    */
    public function edit(Request $request, Contest $contest): Response
    {
        /* Generates a form pre-populated with the data of the contest ID provided to this function. */
        $form = $this->createForm(ContestType::class, $contest);
        $form->handleRequest($request);

        /* On submitting the form, the data in the DB is updated with the inputs. */
        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('contest_index');
        }

        /* Provides the contest infos and the form to the template. */
        return $this->render('contest/edit.html.twig', [
            'contest' => $contest,
            'form' => $form->createView(),
        ]);
    }

    /* In this view signed-in users can delete an existing contest. */
    /**
     * @Route("/{contestid}", name="contest_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Contest $contest): Response
    {
        /* Deletes the contest with the ID passed onto the function. Checks validity of token to do so. */
        if ($this->isCsrfTokenValid('delete'.$contest->getContestid(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($contest);
            $entityManager->flush();
        }

        return $this->redirectToRoute('contest_index');
    }
}
