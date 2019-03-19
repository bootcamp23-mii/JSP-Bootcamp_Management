/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author FES
 */
public class SendEmailTemp {

    private static String toEmail;
    private static String fromEmail;
    private static String subject;
    private static String message;
    private static String password;

    public SendEmailTemp() {

    }

    public static String getToEmail() {
        return toEmail;
    }

    public static void setToEmail(String toEmail) {
        SendEmailTemp.toEmail = toEmail;
    }

    public static String getFromEmail() {
        return fromEmail;
    }

    public static void setFromEmail(String fromEmail) {
        SendEmailTemp.fromEmail = fromEmail;
    }

    public static String getSubject() {
        return subject;
    }

    public static void setSubject(String subject) {
        SendEmailTemp.subject = subject;
    }

    public static String getMessage() {
        return message;
    }

    public static void setMessage(String message) {
        SendEmailTemp.message = message;
    }

    public static String getPassword() {
        return password;
    }

    public static void setPassword(String password) {
        SendEmailTemp.password = password;
    }
}
