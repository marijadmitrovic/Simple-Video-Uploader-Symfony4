<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\JoinColumn;

/**
 * @ORM\Entity(repositoryClass="App\Repository\CommentRepository")
 */
class Comment
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;


    /**
     * @ORM\Column(type="string")
     */
    private $name;


    /**
     * @ORM\Column(type="text")
     */
    private $text;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Video",inversedBy="comment")
     * @ORM\JoinColumn(name="video_id", referencedColumnName="id")
     * @ORM\JoinColumn(nullable=false)
     */
    private $video;

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    public function getName(): string
    {
        return (string)$this->name;
    }

    /**
     * @param mixed $name
     */
    public function setName($name): void
    {
        $this->name = $name;
    }


    /**
     * @return mixed
     */
    public function getText()
    {
        return $this->text;
    }

    public function setText(string $text): void
    {
        $this->text = $text;
    }


    /**
     * @return mixed
     */
    public function getVideo()
    {
        return $this->video;
    }

    public function setVideo(Video $video): void
    {
        $this->video = $video;
    }

}
