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
;
        $repoArticles = $this->getDoctrine()->getRepository(Article::class);
        $article = $repoArticles->find($idArticle);

        $repoComments = $this->getDoctrine()->getManager()->getRepository(Comments::class);

        $comment = $repoComments->findBy(["article"=>$idArticle]);

        $form = $this->createFormBuilder($comment)
            ->add('comment',TextareaType::class)
            ->add('save',SubmitType::class)
            ->getForm();

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {




            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($comment);
            $entityManager->flush();

            return $this->redirectToRoute('blog_article');
        }


        return $this->render("blog/article.html.twig",["article"=>$article,"user"=>$this->getUser(),"comments"=>$comment,"form"=> $form->createView()]);

    }


}