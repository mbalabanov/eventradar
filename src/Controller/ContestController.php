<?php

namespace App\Controller;

use App\Entity\Contest;
use App\Form\ContestType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/admin/contest")
 */
class ContestController extends AbstractController
{
    /**
     * @Route("/", name="contest_index", methods={"GET"})
     */
    public function contest_index(): Response
    {
        $contests = $this->getDoctrine()
            ->getRepository(Contest::class)
            ->findAll();

        return $this->render('contest/index.html.twig', [
            'contests' => $contests,
        ]);
    }

    /**
     * @Route("/new", name="contest_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $contest = new Contest();
        $form = $this->createForm(ContestType::class, $contest);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($contest);
            $entityManager->flush();

            return $this->redirectToRoute('contest_index');
        }

        return $this->render('contest/new.html.twig', [
            'contest' => $contest,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{contestid}/edit", name="contest_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Contest $contest): Response
    {
        $form = $this->createForm(ContestType::class, $contest);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('contest_index');
        }

        return $this->render('contest/edit.html.twig', [
            'contest' => $contest,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{contestid}", name="contest_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Contest $contest): Response
    {
        if ($this->isCsrfTokenValid('delete'.$contest->getContestid(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($contest);
            $entityManager->flush();
        }

        return $this->redirectToRoute('contest_index');
    }
}
