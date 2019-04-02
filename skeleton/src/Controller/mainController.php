<?php


namespace App\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class mainController extends AbstractController
{
    /**
     * @Route("/",name="homepage")
     */
public function homepage(Request $request, AuthenticationUtils $authenticationUtils){

    //   return the homepage view
    $error = $authenticationUtils->getLastAuthenticationError();

    $lastUsername = $authenticationUtils->getLastUsername();


    if (true === $this->get('security.authorization_checker')->isGranted('ROLE_ADMIN')) {
        return $this->redirectToRoute('show_user');
    }
    if (true === $this->get('security.authorization_checker')->isGranted('ROLE_USER')) {
        return $this->redirectToRoute('blog');
    } else {
        return $this->render('homepage.html.twig', [
            'last_username' => $lastUsername,
            'error' => $error,

        ]);
    }

}



}