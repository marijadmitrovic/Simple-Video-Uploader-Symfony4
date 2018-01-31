<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\JoinColumn;
use Symfony\Component\Validator\Constraints as Assert;


/**
 * @ORM\Entity(repositoryClass="App\Repository\VideoRepository")
 */
class Video
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;


    /**
     * @ORM\Column(type="string",length=80)
     */
    private $title;

    /**
     * @ORM\Column(type="text")
     */
    private $description;

    /**
     *@var string
     * @Assert\File(mimeTypes={ "video/mp4" })
     *@Assert\NotBlank(message="enter a video")
     *@ORM\Column(type="string")
     */
    private $file;

    /**
     * @var ArrayCollection|Comment[]
     * @ORM\OneToMany(targetEntity="App\Entity\Comment",mappedBy="video")
     */
    private $comments;

    /**
     * @return mixed
     */

    public function __construct()
    {
        $this->comments= new ArrayCollection();
    }



    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\User",inversedBy="video")
     *@JoinColumn(name="user_id", referencedColumnName="id")
     */
    private $user;





    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId($id): void
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @param mixed $title
     */
    public function setTitle($title): void
    {
        $this->title = $title;
    }

    /**
     * @return mixed
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param mixed $description
     */
    public function setDescription($description): void
    {
        $this->description = $description;
    }

    /**
     * @return mixed
     */
    public function getFile()
    {
        return $this->file;
    }

    /**
     * @param mixed $file
     */
    public function setFile($file): void
    {
        $this->file = $file;
    }

    /**
     * @return mixed
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * @param mixed $user
     */
    public function setUser(User $user): void
    {
        $this->user = $user;
    }

    public function __toString()
    {
        return $this->getTitle();
    }

    public function getComments()
    {
        return $this->comments;
    }

}
