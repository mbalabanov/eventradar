<?php

namespace App\Controller;

use App\Entity\Location;
use App\Form\LocationType;
use App\Entity\Country;
use App\Form\CountryType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/* This controller is only provided to signed-in users (as per definition in security.yaml) */

/**
* @Route("/admin/location")
*/
class LocationController extends AbstractController
{
    /* This view shows all locations. */
    /**
     * @Route("/", name="location_index", methods={"GET"})
     */
    public function location_index(): Response
    {
        /* Gets all locations, sorts them and passes them onto the template */
        $locations = $this->getDoctrine()
            ->getRepository(Location::class)
            ->findBy([], ['name' => 'ASC']);

        return $this->render('location/index.html.twig', [
            'locations' => $locations,
        ]);
    }

    /* This view provides the form to add a new location. */
    /**
     * @Route("/new", name="location_new", methods={"GET","POST"})
     */
    public function location_new(Request $request): Response
    {
        /* Creates a new location object based on the class. */
        $location = new Location();

        /* Generates the form with the inputs that populate the new location */
        $form = $this->createForm(LocationType::class, $location);
        $form->handleRequest($request);

        /* When the form is submitted, receives the posted form inputs for the new location and sends them to the DB. */
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($location);
            $entityManager->flush();

            return $this->redirectToRoute('location_index');
        }

        /* Provides the location infos and the form to the template. */
        return $this->render('location/new.html.twig', [
            'location' => $location,
            'form' => $form->createView(),
        ]);
    }

    /* This view provides the form to edit an existing location. */
    /**
    * @Route("/{locationid}/edit", name="location_edit", methods={"GET","POST"})
    */
    public function location_edit(Request $request, Location $location): Response
    {
        /* Generates a form pre-populated with the data of the location ID provided to this function. */
        $form = $this->createForm(LocationType::class, $location);
        $form->handleRequest($request);

        /* On submitting the form, the data in the DB is updated with the inputs. */
        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('location_index');
        }

        /* Provides the location infos and the form to the template. */
        return $this->render('location/edit.html.twig', [
            'location' => $location,
            'form' => $form->createView(),
        ]);
    }

    /* In this view signed-in users can delete an existing location. */
    /**
     * @Route("/{locationid}", name="location_delete", methods={"DELETE"})
     */
    public function location_delete(Request $request, Location $location): Response
    {
        /* Deletes the location with the ID passed onto the function. Checks validity of token to do so. */
        if ($this->isCsrfTokenValid('delete'.$location->getLocationid(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($location);
            $entityManager->flush();
        }

        return $this->redirectToRoute('location_index');
    }
}
