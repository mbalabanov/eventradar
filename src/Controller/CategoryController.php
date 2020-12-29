<?php

namespace App\Controller;

use App\Entity\Category;
use App\Form\CategoryType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/* This controller is only provided to signed-in users (as per definition in security.yaml) */

/**
* @Route("/admin/category")
*/
class CategoryController extends AbstractController
{
    /* This view shows all categories. */
    /**
    * @Route("/", name="category_index", methods={"GET"})
    */
    public function category_index(): Response
    {
        /* Gets all categories, sorts them and passes them onto the template */
        $categories = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findBy([], ['name' => 'ASC']);

        return $this->render('category/index.html.twig', [
            'categories' => $categories,
        ]);
    }

    /* This view provides the form to add a new category. */
    /**
    * @Route("/new", name="category_new", methods={"GET","POST"})
    */
    public function new(Request $request): Response
    {
        /* Creates a new category object based on the class. */
        $category = new Category();

        /* Generates the form with the inputs that populate the new category */
        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        /* When the form is submitted, receives the posted form inputs for the new category and sends them to the DB. */
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($category);
            $entityManager->flush();

            return $this->redirectToRoute('category_index');
        }

        /* Provides the category infos and the form to the template. */
        return $this->render('category/new.html.twig', [
            'category' => $category,
            'form' => $form->createView(),
        ]);
    }

    /* This view provides the form to edit an existing category. */
    /**
    * @Route("/{categoryid}/edit", name="category_edit", methods={"GET","POST"})
    */
    public function edit(Request $request, Category $category): Response
    {
        /* Generates a form pre-populated with the data of the category ID provided to this function. */
        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        /* On submitting the form, the data in the DB is updated with the inputs. */
        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('category_index');
        }

        /* Provides the category infos and the form to the template. */
        return $this->render('category/edit.html.twig', [
            'category' => $category,
            'form' => $form->createView(),
        ]);
    }

    /* In this view signed-in users can delete an existing category. */
    /**
    * @Route("/{categoryid}", name="category_delete", methods={"DELETE"})
    */
    public function delete(Request $request, Category $category): Response
    {
        /* Deletes the category with the ID passed onto the function. Checks validity of token to do so. */
        if ($this->isCsrfTokenValid('delete'.$category->getCategoryid(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($category);
            $entityManager->flush();
        }

        return $this->redirectToRoute('category_index');
    }
}
