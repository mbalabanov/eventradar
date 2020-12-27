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

class DefaultController extends AbstractController
{
    /**
     * @Route("/", name="default_index")
     */
    public function default_index(): Response
    {

        $datetimenow = new \DateTime();

        $categories = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findBy([], ['name' => 'ASC']);
        
        $searchterm = '';

        $events = $this -> getDoctrine() -> getRepository(Event::class) -> createQueryBuilder('e')
            -> where('e.eventdate > :val')
            -> setParameter('val', $datetimenow)
            -> addOrderBy('e.eventdate', 'ASC')
            -> getQuery()
            -> getResult();

        return $this->render('event/index.html.twig', [
            'categories' => $categories,
            'searchterm' => $searchterm,
            'events' => $events,
        ]);
    }

    /**
     * @Route("/pastevents", name="pastevents_index")
     */
    public function pastevent_index(): Response
    {

        $datetimenow = new \DateTime();

        $categories = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findBy([], ['name' => 'ASC']);
        
        $searchterm = 'Past Events';

        $events = $this -> getDoctrine() -> getRepository(Event::class) -> createQueryBuilder('e')
            -> where('e.eventdate < :val')
            -> setParameter('val', $datetimenow)
            -> addOrderBy('e.eventdate', 'ASC')
            -> getQuery()
            -> getResult();

        return $this->render('event/index.html.twig', [
            'categories' => $categories,
            'searchterm' => $searchterm,
            'events' => $events,
        ]);
    }

    /**
    * @Route("/categorysearch/{categoryname}", name="category_filter", methods={"GET"})
    */
    public function category_filter($categoryname, Request $request): Response
    {

        $categories = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findBy([], ['name' => 'ASC']);

        $selectedcategory = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findOneBy(['name' => $categoryname]);

        $categoryid = $selectedcategory -> getCategoryid();

        $events = $this->getDoctrine()
            ->getRepository(Event::class)
            ->findBy(['categoryid' => $categoryid], ['eventdate' => 'ASC']);

        return $this->render('event/index.html.twig', [
            'categories' => $categories,
            'searchterm' => $categoryname,
            'events' => $events,
        ]);
    }

    /**
     * @Route("/event/{eventid}", name="event_show", methods={"GET"})
     */
    public function event_show(Event $event): Response
    {
        return $this->render('event/show.html.twig', [
            'event' => $event,
        ]);
    }

    /**
     * @Route("/location/{locationid}", name="location_show", methods={"GET"})
     */
    public function location_show(Location $location): Response
    {

        $locationevents = $this->getDoctrine()
        ->getRepository(Event::class)
        ->findBy(['locationid' => $location]);
        

/*
    $em = $this->getEntityManager();
    $qb = $em->createQueryBuilder();

    $q = $qb->select(array('p'))
            ->from('YourProductBundle:Product', 'p')
            ->where(
                    $qb->expr()->gt('p.eventdate', $datetimenow)
                )
            ->orderBy('p.price', 'DESC')
            ->getQuery();
*/

        return $this->render('location/show.html.twig', [
            'location' => $location,
            'locationevents' => $locationevents,
        ]);
    }

    /**
     * @Route("/team", name="team_index", methods={"GET"})
     */
    public function team_index(): Response
    {
        $teams = $this->getDoctrine()
            ->getRepository(Team::class)
            ->findBy([], ['name' => 'ASC']);

        return $this->render('team/index.html.twig', [
            'teams' => $teams,
        ]);
    }

    /**
     * @Route("/team/{teamid}", name="team_show", methods={"GET"})
     */
    public function team_show(Team $team): Response
    {

        $members = $this->getDoctrine()
            ->getRepository(Person::class)
            ->findBy(['teamid' => $team]);

        return $this->render('team/show.html.twig', [
            'team' => $team,
            'members' => $members,
        ]);
    }
}
