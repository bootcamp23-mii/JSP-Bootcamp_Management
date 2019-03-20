/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import models.SendEmailTemp;

/**
 *
 * @author FES
 */
public class SendMail {

    public void generateMail() {
        Properties props = new Properties();
                SendEmailTemp.setFromEmail("lgg121770@gmail.com");
        SendEmailTemp.setPassword("123Q123Q@");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getDefaultInstance(props);
        try {
            InternetAddress fromAddress = new InternetAddress(SendEmailTemp.getFromEmail());
            InternetAddress toAddress = new InternetAddress(SendEmailTemp.getToEmail());
            Message message = new MimeMessage(session);
            message.setFrom(fromAddress);
            message.addHeader("Content-type", "text/html; charset=UTF-8");
            message.setRecipient(Message.RecipientType.TO, toAddress);
            message.setSubject(SendEmailTemp.getSubject());
            message.setContent(SendEmailTemp.getMessage(),"text/html");
            Transport.send(message, SendEmailTemp.getFromEmail(), SendEmailTemp.getPassword());
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
    }
}
