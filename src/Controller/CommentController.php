<?php


namespace App\Controller;

use App\Entity\Comment;
use App\Form\CommentType;
use App\Entity\Video;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;



class CommentController extends AbstractController
{


    /**
     * @Route("/comment/new/{id}",name="new_comment")
     *
     */
    public function newAction(Request $request, Video $video)
    {
        $comment = new Comment();
        $comment->setVideo($video);
        $form = $this->createForm(CommentType::class, $comment);


        $form->handleRequest($request);


        if ($form->isSubmitted() && $form->isValid()) {

            $em = $this->getDoctrine()->getManager();
            $em->persist($comment);

            $em->flush();

            $this->addFlash('success', 'Comment added');

            return $this->redirectToRoute('home');
        }


        return $this->render('viv/new_comment.html.twig', [



            'form' => $form->createView()
        ]);


        }

}


