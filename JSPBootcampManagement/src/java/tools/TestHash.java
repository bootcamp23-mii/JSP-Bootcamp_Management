/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.ActivationController;


/**
 *
 * @author FES
 */
public class TestHash {
    public static void main(String[] args) {
//        String a = "llllkkkkjjjj";
//        String salt = "$2a$10$d7lceQ8OdwIHu4hPsxiHD.";
//        System.out.println(BCrypt.hashpw(a, salt));
//        System.out.println(BCrypt.hashpw(a, salt));
//        System.out.println(BCrypt.checkpw(a, "$2a$10$d7lceQ8OdwIHu4hPsxiHD.wDnLo59ozy.a2NUTeAeAWz1FHX9NmRq"));
//        System.out.println(BCrypt.checkpw(a, BCrypt.hashpw(a, salt)));
        new ActivationController(HibernateUtil.getSessionFactory()).requestActivation("");
//        System.out.println(BCrypt.gensalt());
    }
}
