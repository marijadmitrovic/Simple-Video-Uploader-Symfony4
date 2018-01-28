<?php

namespace App\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class LoginController extends Controller
{
    /**
     * @Route("/login", name="login")
     */
    public function loginAction(Request $request,AuthenticationUtils $authenticationUtils)
    {


        $errors = $authenticationUtils->getLastAuthenticationError();


        $lastUsername = $authenticationUtils->getLastUsername();



        //todo napraviti poruku
//        if ($lastUsername->isSubmitted() && $lastUsername->isValid()) {
//            $user = $form->getData();
//
//            $this->addFlash('success','Loged in!');
//            return $this->redirectToRoute('home');
//        }


        return $this->render('security/login.html.twig', [
            'errors' => $errors,
            'username' => $lastUsername
            ]);
    }

    /**
     * @Route("/logout" , name="logout")
     */
    public function logoutAction(){


    }
}
