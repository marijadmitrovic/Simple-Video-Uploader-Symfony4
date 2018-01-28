<?php

namespace App\Controller;

use App\Entity\Video;
use App\Form\VideoType;

use Symfony\Component\Config\Definition\Exception\Exception;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class VideoController extends AbstractController
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
            throw $this->createNotFoundException(
                'No videos found '
            );
        }



        return $this->render('viv/home.html.twig', ['videos' => $videos]);
    }


    /**
     * @Route("/video/new", name="new_video")
     */
    public function newAction(Request $request){
        $user = $this->getUser();

        $form = $this->createForm(VideoType::class, new Video());

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $formData = $form->getData();
            // $path = $user->getUploadRootDir();
            $path = __DIR__ . '/../../public/videob/';

            if (!$formData->getFile()) {
                $this->addFlash('error','Bad file, try again');
            } else {
                $tempPath = $formData->getFile()->getPathName();
                try {
                    $mimeType = $formData->getFile()->getMimeType();
                    if ($mimeType) {
                        $extension = explode('/', $mimeType)[1];
                    } else {
                        throw new Exception("Bad file! Try again");
                    }
                } catch (Exception $e) {
                    $this->addFlash('error','Bad file, try again');
                    return $this->redirectToRoute('home');
                }

                $fileName = 'video' . rand(10, 1000) . '.' .$extension;
                $newPath = $path . $fileName;

                copy($tempPath, $newPath);
                unlink($tempPath);

                $formData->setFile($fileName);

                $em = $this->getDoctrine()->getManager();
                $em->persist($formData);
                $em->flush();

                $this->addFlash('success','Video added');
            }

            return $this->redirectToRoute('home') ;
        }

        return $this->render('viv/new.html.twig',[

            'videoForm' => $form->createView()
        ]);
    }


    /**
     * @Route("/video/{id}", name="show_video")
     */
    public function showAction($id)
    {
        $video = $this->getDoctrine()
            ->getRepository(Video::class)
            ->find($id);

        if (!$video) {
            throw $this->createNotFoundException(
                'No video found for id '.$id
            );
        }



        return $this->render('viv/show.html.twig', ['video' => $video]);
    }





}
