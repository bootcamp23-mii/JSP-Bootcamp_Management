/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Employee;
import models.SendEmailTemp;
import org.hibernate.SessionFactory;
import tools.SendMail;

/**
 *
 * @author FES
 */
public class ActivationController implements ActivationControllerInterface {

    private DAOInterface<Employee> dao;

    public ActivationController(SessionFactory factory) {
        dao = new GeneralDAO<>(factory, Employee.class);
    }

    @Override
    public void requestActivation(String id) {
        try {
            Employee emp = dao.getById(id);
            SendMail sendMail = new SendMail();

//            String hash = "$2a$10$d7lceQ8OdwIHu4hPsxiHD.wDnLo59ozy.a2NUTeAeAWz1FHX9NmRq";
            String hashEncode = URLEncoder.encode(emp.getPassword(), "UTF-8");
            SendEmailTemp.setMessage("<html>\n"
                    + "<body>\n"
                    + "\n"
                    + "Congratulation " + emp.getName() + ". Your account has been created. Please activation your account by click this link.\n<br>"
                    + "<a href=\"http://localhost:8084/JSPBootcampManagement/Activation?id=" + id + "&code=" + hashEncode + "\">\n"
                    + "<button>Click to Activation</button></a>\n"
                    + "\n"
                    + "</body>\n"
                    + "</html>");
            SendEmailTemp.setSubject("Account Activation for " + emp.getId());
            SendEmailTemp.setToEmail(emp.getEmail());
            sendMail.generateMail();
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(ActivationController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public boolean completeActivation(String id, String hash) {
        try {
            String hashDecode = URLDecoder.decode(hash, "UTF-8");
            if (dao.getById(id).getPassword().equalsIgnoreCase(hashDecode)) {
                Employee emp = dao.getById(id);
                SendMail sendMail = new SendMail();
                SendEmailTemp.setMessage("<html>\n"
                        + "<body>\n"
                        + "\n"
                        + "Congratulation " + emp.getName() + ". Your account activation was complete.<br>Your NIK: "+id+" <br>"
                        + "Your password is your phone number."
                        + "</body>\n"
                        + "</html>");
                SendEmailTemp.setSubject("Complete Account Activation for " + emp.getId());
                SendEmailTemp.setToEmail(emp.getEmail());
                sendMail.generateMail();
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

}
