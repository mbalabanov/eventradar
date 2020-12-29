<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Event;
use App\Form\EventType;
use App\Entity\Team;
use App\Form\TeamType;
use App\Entity\Person;
use App\Form\PersonType;
use App\Entity\Location;
use App\Form\LocationType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/* This controller provides the functions and views for all visitors, even if they are not signed in. */

class DefaultController extends AbstractController
{
    /* This view shows all events. */
    /**
    * @Route("/", name="default_index")
    */
    public function default_index(): Response
    {

        /* Current date. Used to get future events and for comparisons in the template. */
        $datetimenow = new \DateTime();

        /* Get all categories for the category selection dropdown menu in the template. */
        $categories = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findBy([], ['name' => 'ASC']);
        
        /* Clear searchterm. The template requires the variable to assess if search results aber being shown. */
        $searchterm = '';

        /* Get future events. Only get event if eventdate is greater than current date. */
        $events = $this -> getDoctrine() -> getRepository(Event::class) -> createQueryBuilder('e')
            -> where('e.eventdate > :val')
            -> setParameter('val', $datetimenow)
            -> addOrderBy('e.eventdate', 'ASC')
            -> getQuery()
            -> getResult();

        /* Calls the correct template and provides the necessary infos. */
        return $this->render('event/index.html.twig', [
            'categories' => $categories,
            'searchterm' => $searchterm,
            'events' => $events,
            'datetoday' => $datetimenow,
        ]);
    }

    /**
    * @Route("/pastevents", name="pastevents_index")
    */
    public function pastevent_index(): Response
    {
        /* Current date. Used to get future events and for comparisons in the template. */
        $datetimenow = new \DateTime();

        /* Get all categories for the category selection dropdown menu in the template. */
        $categories = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findBy([], ['name' => 'ASC']);
        
        /* Set the searchterm to 'Past Events' to show the filters alert */
        $searchterm = 'Past Events';

        /* Get the past events. Only get event if eventdate is less than current date. */
        $events = $this -> getDoctrine() -> getRepository(Event::class) -> createQueryBuilder('e')
            -> where('e.eventdate < :val')
            -> setParameter('val', $datetimenow)
            -> addOrderBy('e.eventdate', 'ASC')
            -> getQuery()
            -> getResult();

        /* Calls the correct template and provides the necessary infos. */
        return $this->render('event/index.html.twig', [
            'categories' => $categories,
            'searchterm' => $searchterm,
            'events' => $events,
            'datetoday' => $datetimenow,
        ]);
    }

    /**
    * @Route("/categorysearch/{categoryname}", name="category_filter", methods={"GET"})
    */
    public function category_filter($categoryname, Request $request): Response
    {
        /* Current date. Used for comparisons in the template. */
        $datetimenow = new \DateTime();

        /* Get all categories for the category selection dropdown menu in the template. */
        $categories = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findBy([], ['name' => 'ASC']);

        /* Find the selected category. */
        $selectedcategory = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findOneBy(['name' => $categoryname]);

        /* Assign the selected category ID. */
        $categoryid = $selectedcategory -> getCategoryid();

        /* Get only the events with the selected category ID. */
        $events = $this->getDoctrine()
            ->getRepository(Event::class)
            ->findBy(['categoryid' => $categoryid], ['eventdate' => 'ASC']);
        
        /* Calls the correct template and provides the necessary infos. */
        return $this->render('event/index.html.twig', [
            'categories' => $categories,
            'searchterm' => $categoryname,
            'events' => $events,
            'datetoday' => $datetimenow,
        ]);
    }

    /**
    * @Route("/event/{eventid}", name="event_show", methods={"GET"})
    */
    public function event_show(Event $event): Response
    {
        /* Current date. Used for comparisons in the template. */
        $datetimenow = new \DateTime();

        /* Calls the correct 'show' template and provides the necessary infos. */
        return $this->render('event/show.html.twig', [
            'event' => $event,
            'datetoday' => $datetimenow,
        ]);
    }

    /**
    * @Route("/location/{locationid}", name="location_show", methods={"GET"})
    */
    public function location_show(Location $location): Response
    {

        /* Current date. Used for comparisons in the template. */
        $datetimenow = new \DateTime();

        /* Get events in this location */
        $locationevents = $this->getDoctrine()
            ->getRepository(Event::class)
            ->findBy(['locationid' => $location], ['eventdate' => 'DESC']);

        /* Calls the correct 'show' template and provides the necessary infos. */
        return $this->render('location/show.html.twig', [
            'location' => $location,
            'locationevents' => $locationevents,
            'datetoday' => $datetimenow,
        ]);
    }

    /* This view shows the team details with a list of all of its members (persons). */
    /**
    * @Route("/team/{teamid}", name="team_show", methods={"GET"})
    */
    public function team_show(Team $team): Response
    {
        /* Gets persons who are members of the team with the ID passed to the function */
        $members = $this->getDoctrine()
            ->getRepository(Person::class)
            ->findBy(['teamid' => $team]);

        /* Calls the correct 'show' template and provides the necessary infos. */
        return $this->render('team/show.html.twig', [
            'team' => $team,
            'members' => $members,
        ]);
    }
}
