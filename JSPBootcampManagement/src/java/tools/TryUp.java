/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.EmployeeController;
import controllers.UploadController;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import javax.imageio.ImageIO;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

/**
 *
 * @author FES
 */
public class TryUp {
    public static void main(String[] args) throws FileNotFoundException, IOException {
        UploadController up = new UploadController(HibernateUtil.getSessionFactory());
//        EmployeeController e = new EmployeeController(HibernateUtil.getSessionFactory());
//        File file = new File("./web/assets/img/apple-icon.png");
//        InputStream is = new FileInputStream(file);
//        System.out.println(is);
//        byte[] data = new byte[is.available()];
//        up.Upload("14201", "./web/assets/img/apple-icon.png");
//        Icon icon
//        JOptionPane.showMessageDialog(null, up.Download("14201"));
//        JOptionPane.showMessageDialog(null, "","test",JOptionPane.PLAIN_MESSAGE,new ImageIcon(ImageIO.read(new ByteArrayInputStream(data))));
//        JOptionPane.showMessageDialog(null, "","test",JOptionPane.PLAIN_MESSAGE,new ImageIcon(up.Download("14201")));
//        System.out.println(e.getByid("14303").getParticipant());
//        System.out.println();
    }
}
