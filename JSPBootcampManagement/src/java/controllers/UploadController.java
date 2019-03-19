/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import java.awt.Image;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import models.*;
import org.hibernate.SessionFactory;

/**
 *
 * @author FES
 */
public class UploadController implements UploadControllerInterface {

    private DAOInterface<Employee> dao;

    public UploadController(SessionFactory factory) {
        dao = new GeneralDAO<>(factory, Employee.class);
    }

    @Override
    public boolean Upload(String id, String path) {
        try {
            System.out.println(path);
            Employee data = dao.getById2(id);
//            File file = new File("./web/assets/img/apple-icon.png");
            File file = new File(path);
            System.out.println(file.getAbsolutePath());
            InputStream is = new FileInputStream(file);
            byte[] photo = new byte[is.available()];
            is.read(photo);
            is.close();
            if (dao.saveOrDelete(new Employee(id, data.getName(),
                    data.getBirthDate(), data.getGender(),
                    data.getMarriedStatus(), data.getAddress(),
                    data.getEmail(), data.getPhone(), data.getOnboardDate(),
                    data.getPassword(), data.getSecurityQestion(), data.getSecurityAnswer(),
                    photo, new Short(data.getIsdeleted().toString()), new Religion(data.getReligion().getId()),
                    new District(data.getBirthPlace().getId()), new Village(data.getVillage().getId()),
                    new District(data.getHiringLocation().getId()), null), true)) {
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    public Image Download(String id) {
        Image image = null;
        Employee data = dao.getById2(id);
        try {
            InputStream io = new ByteArrayInputStream(data.getPhoto());
            return ImageIO.read(new ByteArrayInputStream(data.getPhoto()));
        } catch (IOException ex) {
            Logger.getLogger(UploadController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return image;
    }

}
