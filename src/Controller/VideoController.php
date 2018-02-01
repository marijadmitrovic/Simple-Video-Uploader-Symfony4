<?php

namespace App\Controller;


use App\Entity\Comment;
use App\Entity\User;
use App\Entity\Video;

use App\Form\VideoType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\File\UploadedFile;




class VideoController extends Controller
{

    /**
     * @Route("/",name="home")
     */
    public function homeAction()
    {
        $videos = $this->getDoctrine()
            ->getRepository(Video::class)
            ->findAll();

        if (!$videos) {
            return $this->redirectToRoute('new_video');
        }

        return $this->render('viv/home.html.twig', ['videos' => $videos]);
    }


    /**
     * @Route("/video/new", name="new_video")
     *
     */
    public function newAction(Request $request)
    {

        $user = $this->getUser();


        $video = new Video();
        $video->setUser($user);


        $form = $this->createForm(VideoType::class, $video);


        $form->handleRequest($request);


        if ($form->isSubmitted() && $form->isValid()) {


            /**
             * @var UploadedFile $file
             */
            $file = $video->getFile();
            $fileName = md5(uniqid()) . '.' . $file->guessExtension();


            $file->move(
                $this->getParameter('videos_directory'),
                $fileName
            );


            $video->setFile($fileName);
            $em = $this->getDoctrine()->getManager();
            $em->persist($video);


            $em->flush();

            $this->addFlash('success', 'Video added');

            return $this->redirectToRoute('home');
        }


        return $this->render('viv/new.html.twig', [

            'form' => $form->createView()
        ]);




    }


    /**
     * @Route("/video/{id}", name="show_video")
     */
    public function showAction(Video $video,  Request $request)
    {
        $comments = $this->getDoctrine()
            ->getRepository(Comment::class)
            ->findBy(['video' => $video]);

        return $this->render('viv/show.html.twig', [
            'video' => $video,
            'comments' => $comments

        ]);
    }


}
