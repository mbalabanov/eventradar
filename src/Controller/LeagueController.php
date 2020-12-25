<?php

namespace App\Controller;

use App\Entity\League;
use App\Form\LeagueType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/league")
 */
class LeagueController extends AbstractController
{
    /**
     * @Route("/", name="league_index", methods={"GET"})
     */
    public function index(): Response
    {
        $leagues = $this->getDoctrine()
            ->getRepository(League::class)
            ->findAll();

        return $this->render('league/index.html.twig', [
            'leagues' => $leagues,
        ]);
    }

    /**
     * @Route("/new", name="league_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $league = new League();
        $form = $this->createForm(LeagueType::class, $league);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($league);
            $entityManager->flush();

            return $this->redirectToRoute('league_index');
        }

        return $this->render('league/new.html.twig', [
            'league' => $league,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{leagueid}", name="league_show", methods={"GET"})
     */
    public function show(League $league): Response
    {
        return $this->render('league/show.html.twig', [
            'league' => $league,
        ]);
    }

    /**
     * @Route("/{leagueid}/edit", name="league_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, League $league): Response
    {
        $form = $this->createForm(LeagueType::class, $league);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('league_index');
        }

        return $this->render('league/edit.html.twig', [
            'league' => $league,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{leagueid}", name="league_delete", methods={"DELETE"})
     */
    public function delete(Request $request, League $league): Response
    {
        if ($this->isCsrfTokenValid('delete'.$league->getLeagueid(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($league);
            $entityManager->flush();
        }

        return $this->redirectToRoute('league_index');
    }
}
