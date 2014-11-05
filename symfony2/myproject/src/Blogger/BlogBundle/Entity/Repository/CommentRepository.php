<?php
// src/Blogger/BlogBundle/Entity/Repository/CommentRepository.php

namespace Blogger\BlogBundle\Entity\Repository;

use Doctrine\ORM\EntityRepository;

/**
 * CommentRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class CommentRepository extends EntityRepository
{
    public function getCommentsForBlog($blogId, $approved = true)
    {
        $qb = $this->createQueryBuilder('c')
            ->select('c')
            ->where('c.blog = :blog_id')
            ->addOrderBy('c.created')
            ->setParameter('blog_id', $blogId);

        if (false === is_null($approved)) {
            $qb->andWhere('c.approved = :approved')
                ->setParameter('approved', $approved);
        }

        return $qb->getQuery()
            ->getResult();
    }

    public function getLatestComments($limit = 10)
    {
        $qb = $this->createQueryBuilder('c')
            ->select('c')
            ->addOrderBy('c.id', 'DESC');

        if (false === is_null($limit))
            $qb->setMaxResults($limit);

        return $qb->getQuery()
            ->getResult();
    }
}
