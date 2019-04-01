<?php
/**
 * Created by PhpStorm.
 * User: Administrateur
 * Date: 01/04/2019
 * Time: 16:06
 */

use Symfony\Component\Routing\Annotation\Route;

class adminController
{
    /**
     * @Route("/admin/createuser",name="Create_User")
     */
    public function createUser(){

    }

    /**
     * @Route("/admin",name="Show_User")
     */
    public function showUser(){

    }

    /**
     * @Route("admin/udapteUser",name="Udapte_User")
     */
    public  function updateUser(){

    }

    /**
     * @Route("admin/delete/{id}",name="Delete_User")
     */
    public function deleteUser(){

    }

}