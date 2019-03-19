/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import models.SendEmailTemp;

/**
 *
 * @author FES
 */
public class MailTest {
    public static void main(String[] args) {
        SendEmailTemp.setMessage("<html>\n" +
                "<body>\n" +
                "\n" +
                "<a href=\"http://pushpalankajaya.blogspot.com\">\n" +
                "This is a link</a>\n" +
                "\n" +
                "</body>\n" +
                "</html>");
        SendEmailTemp.setSubject("coba mail");
        SendEmailTemp.setToEmail("thomasyanuar@outlook.com");
        new SendMail().generateMail();
    }
}
