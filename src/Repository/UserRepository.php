<?php

namespace App\Repository;

use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;
use Symfony\Bridge\Doctrine\Security\User\UserLoaderInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class UserRepository extends ServiceEntityRepository
//    implements UserLoaderInterface
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, User::class);
    }



//     todo login whit email

//   public function loadUserByUsername($username)
//    {
//      return  $this->createQueryBuilder('u')
//            ->where('u.username = :username OR u.email = :email')
//            ->setParameter('username', $username)
//            ->setParameter('email', $username)
//            ->getQuery()
//         ->getResult();
//   }


}
