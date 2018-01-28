<?php
/**
 * Created by PhpStorm.
 * User: marija
 * Date: 27.1.18.
 * Time: 14.28
 */

namespace App\Controller;



use App\Form\LoginForm;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends Controller
{

//    /**
//     * @Route("/login", name="login")
//     */
//    public function login(Request $request,AuthenticationUtils $authUtils)
//    {
//
//        // get the login error if there is one
//        $error = $authUtils->getLastAuthenticationError();
//
//        // last username entered by the user
//        $lastUsername = $authUtils->getLastUsername();
//
//        $form = $this->createForm(LoginForm::class, [
//            '_username' => $lastUsername,
//        ]);
//
//
//        return $this->render('security/login.html.twig', array(
//            'form' => $form->createView(),
//            'error'         => $error,
//        ));
//
//
//    }


}

