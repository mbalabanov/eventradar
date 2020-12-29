<?php

namespace App\Controller;

use App\Entity\League;
use App\Form\LeagueType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/* This controller is only provided to signed-in users (as per definition in security.yaml) */

/**
 * @Route("/admin/league")
 */
class LeagueController extends AbstractController
{
    /* This view shows all leagues. */
    /**
     * @Route("/", name="league_index", methods={"GET"})
     */
    public function league_index(): Response
    {
        /* Gets all leagues, sorts them and passes them onto the template */
        $leagues = $this->getDoctrine()
            ->getRepository(League::class)
            ->findBy([], ['name' => 'ASC']);

        return $this->render('league/index.html.twig', [
            'leagues' => $leagues,
        ]);
    }

    /* This view provides the form to add a new league. */
    /**
     * @Route("/new", name="league_new", methods={"GET","POST"})
     */
    public function league_new(Request $request): Response
    {
        /* Creates a new league object based on the class. */
        $league = new League();

        /* Generates the form with the inputs that populate the new league */
        $form = $this->createForm(LeagueType::class, $league);
        $form->handleRequest($request);

        /* When the form is submitted, receives the posted form inputs for the new league and sends them to the DB. */
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($league);
            $entityManager->flush();

            return $this->redirectToRoute('league_index');
        }

        /* Provides the league infos and the form to the template. */
        return $this->render('league/new.html.twig', [
            'league' => $league,
            'form' => $form->createView(),
        ]);
    }

    /* This view provides the form to edit an existing league. */
    /**
    * @Route("/{leagueid}/edit", name="league_edit", methods={"GET","POST"})
    */
    public function league_edit(Request $request, League $league): Response
    {
        /* Generates a form pre-populated with the data of the league ID provided to this function. */
        $form = $this->createForm(LeagueType::class, $league);
        $form->handleRequest($request);

        /* On submitting the form, the data in the DB is updated with the inputs. */
        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('league_index');
        }

        /* Provides the league infos and the form to the template. */
        return $this->render('league/edit.html.twig', [
            'league' => $league,
            'form' => $form->createView(),
        ]);
    }

    /* In this view signed-in users can delete an existing league. */
    /**
     * @Route("/{leagueid}", name="league_delete", methods={"DELETE"})
     */
    public function league_delete(Request $request, League $league): Response
    {
        /* Deletes the league with the ID passed onto the function. Checks validity of token to do so. */
        if ($this->isCsrfTokenValid('delete'.$league->getLeagueid(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($league);
            $entityManager->flush();
        }

        return $this->redirectToRoute('league_index');
    }
}
