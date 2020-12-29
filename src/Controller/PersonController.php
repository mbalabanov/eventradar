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

/* This controller is only provided to signed-in users (as per definition in security.yaml) */

/**
 * @Route("/admin/person")
 */
class PersonController extends AbstractController
{
    /* This view shows all persons. */
    /**
     * @Route("/", name="person_index", methods={"GET"})
     */
    public function person_index(): Response
    {
        /* Gets all persons, sorts them and passes them onto the template */
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

    /* This view provides the form to add a new person. */
    /**
     * @Route("/new", name="person_new", methods={"GET","POST"})
     */
    public function person_new(Request $request): Response
    {
        /* Creates a new person object based on the class. */
        $person = new Person();

        /* Generates the form with the inputs that populate the new person */
        $form = $this->createForm(PersonType::class, $person);
        $form->handleRequest($request);

        /* When the form is submitted, receives the posted form inputs for the new person and sends them to the DB. */
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($person);
            $entityManager->flush();

            return $this->redirectToRoute('person_index');
        }

        /* Provides the person infos and the form to the template. */
        return $this->render('person/new.html.twig', [
            'person' => $person,
            'form' => $form->createView(),
        ]);
    }

    /* This view provides the form to edit an existing person. */
    /**
     * @Route("/{personid}/edit", name="person_edit", methods={"GET","POST"})
     */
    public function person_edit(Request $request, Person $person): Response
    {
        /* Generates a form pre-populated with the data of the person ID provided to this function. */
        $form = $this->createForm(PersonType::class, $person);
        $form->handleRequest($request);

        /* On submitting the form, the data in the DB is updated with the inputs. */
        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('person_index');
        }

        /* Provides the person infos and the form to the template. */
        return $this->render('person/edit.html.twig', [
            'person' => $person,
            'form' => $form->createView(),
        ]);
    }

    /* In this view signed-in users can delete an existing person. */
    /**
     * @Route("/{personid}", name="person_delete", methods={"DELETE"})
     */
    public function person_delete(Request $request, Person $person): Response
    {
        /* Deletes the person with the ID passed onto the function. Checks validity of token to do so. */
        if ($this->isCsrfTokenValid('delete'.$person->getPersonid(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($person);
            $entityManager->flush();
        }

        return $this->redirectToRoute('person_index');
    }
}
