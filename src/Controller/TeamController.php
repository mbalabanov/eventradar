<?php

namespace App\Controller;

use App\Entity\Team;
use App\Form\TeamType;
use App\Entity\Person;
use App\Form\PersonType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/* This controller is only provided to signed-in users (as per definition in security.yaml) */

/**
 * @Route("/admin/team")
 */
class TeamController extends AbstractController
{
    /* This view shows all teams. */
    /**
     * @Route("/", name="team_index", methods={"GET"})
     */
    public function team_index(): Response
    {
        /* Gets all teams, sorts them and passes them onto the template */
        $teams = $this->getDoctrine()
            ->getRepository(Team::class)
            ->findBy([], ['name' => 'ASC']);

        return $this->render('team/index.html.twig', [
            'teams' => $teams,
        ]);
    }

    /* This view provides the form to edit an existing team. */
    /**
     * @Route("/{teamid}/edit", name="team_edit", methods={"GET","POST"})
     */
    public function team_edit(Request $request, Team $team): Response
    {
        /* Generates a form pre-populated with the data of the team ID provided to this function. */
        $form = $this->createForm(TeamType::class, $team);
        $form->handleRequest($request);

        /* On submitting the form, the data in the DB is updated with the inputs. */
        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('team_index');
        }

        /* Provides the team infos and the form to the template. */
        return $this->render('team/edit.html.twig', [
            'team' => $team,
            'form' => $form->createView(),
        ]);
    }

    /* This view provides the form to add a new team. */
    /**
     * @Route("/new", name="team_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        /* Creates a new team object based on the class. */
        $team = new Team();

        /* Generates the form with the inputs that populate the new team. */
        $form = $this->createForm(TeamType::class, $team);
        $form->handleRequest($request);

        /* When the form is submitted, receives the posted form inputs for the new team and sends them to the DB. */
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($team);
            $entityManager->flush();

            return $this->redirectToRoute('team_index');
        }

        /* Provides the category infos and the form to the template. */
        return $this->render('team/new.html.twig', [
            'team' => $team,
            'form' => $form->createView(),
        ]);
    }

    /* In this view signed-in users can delete an existing category. */
    /**
     * @Route("/{teamid}", name="team_delete", methods={"DELETE"})
     */
    public function team_delete(Request $request, Team $team): Response
    {
        /* Deletes the category with the ID passed onto the function. Checks validity of token to do so. */
        if ($this->isCsrfTokenValid('delete'.$team->getTeamid(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($team);
            $entityManager->flush();
        }

        return $this->redirectToRoute('team_index');
    }
}
