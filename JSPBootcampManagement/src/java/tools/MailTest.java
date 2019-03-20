/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.ActivationController;
import models.SendEmailTemp;

/**
 *
 * @author FES
 */
public class MailTest {
    public static void main(String[] args) {
//        SendEmailTemp.setMessage("<html>\n" +
//                "<body>\n" +
//                "\n" +
//                "<a href=\"http://pushpalankajaya.blogspot.com\">\n" +
//                "<button>Ini link hentai<button></a>\n" +
//                "\n" +
//                "</body>\n" +
//                "</html>");
//        SendEmailTemp.setSubject("Panji Hentai");
//        SendEmailTemp.setToEmail("revilghost@gmail.com");
//        SendEmailTemp.setToEmail("pandu4431@gmail.com");
//        new SendMail().generateMail();
        ActivationController c=new ActivationController(HibernateUtil.getSessionFactory());
        c.requestActivation("14313");
    }
}
