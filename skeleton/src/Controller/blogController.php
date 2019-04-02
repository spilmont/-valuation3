<?php
/**
 * Created by PhpStorm.
 * User: Onatouvus
 * Date: 02/04/2019
 * Time: 21:29
 */

namespace App\Controller;


use App\Entity\Article;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/blog")
 */
class blogController extends AbstractController
{
    /**
     * @return \Symfony\Component\HttpFoundation\Response
     * @Route("/",name="blog")
     */
    public function blogPage(){

        $repoArticle = $this->getDoctrine()->getRepository(Article::class);
        $article = $repoArticle->findAll();


      return  $this->render('blog/blog.html.twig',['articles'=>$article]);
    }


}