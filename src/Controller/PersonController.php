<?php

namespace App\Controller;

use App\Entity\Person;
use App\Entity\Country;
use App\Entity\Role;
use App\Form\PersonType;
use App\Form\CountryType;
use App\Form\RoleType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/person")
 */
class PersonController extends AbstractController
{
    /**
     * @Route("/", name="person_index", methods={"GET"})
     */
    public function index(): Response
    {
        $people = $this->getDoctrine()
            ->getRepository(Person::class)
            ->findBy([], ['lastname' => 'ASC']);

        $countries = $this->getDoctrine()
            ->getRepository(Country::class)
            ->findBy([], ['name' => 'ASC']);

        return $this->render('person/index.html.twig', [
            'people' => $people,
            'countries' => $countries,
        ]);
    }

    /**
     * @Route("/new", name="person_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $person = new Person();
        $form = $this->createForm(PersonType::class, $person);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($person);
            $entityManager->flush();

            return $this->redirectToRoute('person_index');
        }

        return $this->render('person/new.html.twig', [
            'person' => $person,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{personid}/edit", name="person_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Person $person): Response
    {
        $form = $this->createForm(PersonType::class, $person);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('person_index');
        }

        return $this->render('person/edit.html.twig', [
            'person' => $person,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{personid}", name="person_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Person $person): Response
    {
        if ($this->isCsrfTokenValid('delete'.$person->getPersonid(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($person);
            $entityManager->flush();
        }

        return $this->redirectToRoute('person_index');
    }
}
