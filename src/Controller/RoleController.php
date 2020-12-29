<?php

namespace App\Controller;

use App\Entity\Role;
use App\Form\RoleType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/* This controller is only provided to signed-in users (as per definition in security.yaml) */

/**
 * @Route("/admin/role")
 */
class RoleController extends AbstractController
{
    /* This view shows all roles. */
    /**
     * @Route("/", name="role_index", methods={"GET"})
     */
    public function role_index(): Response
    {
        /* Gets all roles, sorts them and passes them onto the template */
        $roles = $this->getDoctrine()
            ->getRepository(Role::class)
            ->findAll();

        return $this->render('role/index.html.twig', [
            'roles' => $roles,
        ]);
    }

    /* This view provides the form to add a new role. */
    /**
     * @Route("/new", name="role_new", methods={"GET","POST"})
     */
    public function role_new(Request $request): Response
    {
        /* Creates a new role object based on the class. */
        $role = new Role();

        /* Generates the role with the inputs that populate the new role */
        $form = $this->createForm(RoleType::class, $role);
        $form->handleRequest($request);

        /* When the form is submitted, receives the posted form inputs for the new role and sends them to the DB. */
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($role);
            $entityManager->flush();

            return $this->redirectToRoute('role_index');
        }

        /* Provides the role infos and the form to the template. */
        return $this->render('role/new.html.twig', [
            'role' => $role,
            'form' => $form->createView(),
        ]);
    }

    /* This view provides the form to edit an existing role. */
    /**
     * @Route("/{roleid}/edit", name="role_edit", methods={"GET","POST"})
     */
    public function role_edit(Request $request, Role $role): Response
    {
        /* Generates a form pre-populated with the data of the role ID provided to this function. */
        $form = $this->createForm(RoleType::class, $role);
        $form->handleRequest($request);

        /* On submitting the form, the data in the DB is updated with the inputs. */
        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('role_index');
        }

        /* Provides the role infos and the form to the template. */
        return $this->render('role/edit.html.twig', [
            'role' => $role,
            'form' => $form->createView(),
        ]);
    }

    /* In this view signed-in users can delete an existing role. */
    /**
     * @Route("/{roleid}", name="role_delete", methods={"DELETE"})
     */
    public function role_delete(Request $request, Role $role): Response
    {
        /* Deletes the role with the ID passed onto the function. Checks validity of token to do so. */
        if ($this->isCsrfTokenValid('delete'.$role->getRoleid(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($role);
            $entityManager->flush();
        }

        return $this->redirectToRoute('role_index');
    }
}
