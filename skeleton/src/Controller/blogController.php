<?php
/**
 * Created by PhpStorm.
 * User: Onatouvus
 * Date: 02/04/2019
 * Time: 21:29
 */

namespace App\Controller;


use App\Entity\Article;
use App\Entity\Comments;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\HttpFoundation\Request;
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

    /**
     * @Route("/article{idArticle}",name="blog_article")
     */
    public  function articlePage(Request $request,$idArticle){

        $commentaire = new Comments();
        $repoArticles = $this->getDoctrine()->getRepository(Article::class);
        $article = $repoArticles->find($idArticle);

        $repoComments = $this->getDoctrine()->getManager()->getRepository(Comments::class);

        $comment = $repoComments->findBy(["article"=>$idArticle],["id"=>"DESC"]);

        $form = $this->createFormBuilder($commentaire)
            ->add('comment',TextareaType::class)
            ->add('save',SubmitType::class)
            ->getForm();


        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {



            $commentaire->setUser($this->getUser());
            $commentaire->setArticle($repoArticles->findOneBy(["id"=>$idArticle]));


            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($commentaire);
            $entityManager->flush();

            return $this->redirectToRoute('blog_article',["idArticle"=>$idArticle]);
        }


        return $this->render("blog/article.html.twig",["article"=>$article,"user"=>$this->getUser(),"comments"=>$comment,"form"=> $form->createView()]);

    }


}