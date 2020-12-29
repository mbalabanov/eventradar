<?php

namespace App\Controller;

use App\Entity\Country;
use App\Form\CountryType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/* This controller is only provided to signed-in users (as per definition in security.yaml) */

/**
* @Route("/admin/country")
*/
class CountryController extends AbstractController
{
    /* This view shows all countries. */
    /**
    * @Route("/", name="country_index", methods={"GET"})
    */
    public function country_index(): Response
    {
        /* Gets all countries, sorts them and passes them onto the template */
        $countries = $this->getDoctrine()
            ->getRepository(Country::class)
            ->findBy([], ['name' => 'ASC']);

        return $this->render('country/index.html.twig', [
            'countries' => $countries,
        ]);
    }

    /* This view provides the form to add a new country. */
    /**
     * @Route("/new", name="country_new", methods={"GET","POST"})
     */
    public function country_new(Request $request): Response
    {
        /* Creates a new country object based on the class. */
        $country = new Country();

        /* Generates the form with the inputs that populate the new country */
        $form = $this->createForm(CountryType::class, $country);
        $form->handleRequest($request);

        /* When the form is submitted, receives the posted form inputs for the new country and sends them to the DB. */
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($country);
            $entityManager->flush();

            return $this->redirectToRoute('country_index');
        }

        /* Provides the country infos and the form to the template. */
        return $this->render('country/new.html.twig', [
            'country' => $country,
            'form' => $form->createView(),
        ]);
    }

    /* This view provides the form to edit an existing country. */
    /**
    * @Route("/{countryid}/edit", name="country_edit", methods={"GET","POST"})
    */
    public function country_edit(Request $request, Country $country): Response
    {
        /* Generates a form pre-populated with the data of the country ID provided to this function. */
        $form = $this->createForm(CountryType::class, $country);
        $form->handleRequest($request);

        /* On submitting the form, the data in the DB is updated with the inputs. */
        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('country_index');
        }

        /* Provides the country infos and the form to the template. */
        return $this->render('country/edit.html.twig', [
            'country' => $country,
            'form' => $form->createView(),
        ]);
    }

    /* In this view signed-in users can delete an existing country. */
    /**
    * @Route("/{countryid}", name="country_delete", methods={"DELETE"})
    */
    public function country_delete(Request $request, Country $country): Response
    {
        /* Deletes the country with the ID passed onto the function. Checks validity of token to do so. */
        if ($this->isCsrfTokenValid('delete'.$country->getCountryid(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($country);
            $entityManager->flush();
        }

        return $this->redirectToRoute('country_index');
    }
}
