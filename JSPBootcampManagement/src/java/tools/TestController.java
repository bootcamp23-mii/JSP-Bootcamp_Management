/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import controllers.EducationController;
import controllers.EducationHistoryController;
import controllers.EducationHistoryControllerInterface;
import controllers.EmployeeController;
import controllers.EvaluationController;
import controllers.LoginController;
import controllers.ParticipantController;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import models.*;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;
import org.hibernate.SessionFactory;
import org.hibernate.engine.jdbc.connections.spi.ConnectionProvider;

/**
 *
 * @author FES
 */
public class TestController {

    public static void main(String[] args) throws FileNotFoundException, IOException, JRException, SQLException {
        SessionFactory factory = HibernateUtil.getSessionFactory();
//        EducationHistoryControllerInterface eh = new EducationHistoryController(factory);
//        EmployeeController emp = new EmployeeController(factory);
//        List<Employee> empList = emp.searchWD("14201");
        List<Participant> pList = new ParticipantController(factory).searchWD("");
        System.out.println(factory);
        LoginController logCon = new LoginController(factory);
        System.out.println(logCon.login("14303", "admin"));
        EducationHistoryControllerInterface ehc = new EducationHistoryController(factory);
//        System.out.println(ehc.save("", "3,9", "CVE11", "14201"));

//        List<Participant> pList = new ParticipantController(factory).searchWD("");
//        System.out.println(new ParticipantController(factory).save("14307", "", "BBC2","14307"));
        for (Participant data : pList) {
            System.out.println(data.getEmployee().getName());
//            System.out.println(data.getBatchClass().getTrainer().getName());
//            System.out.println(data.getBatchClass().getBatch().getName());
//            System.out.println(data.getBatchClass().getClasses().getName());
//            System.out.println(data.getBatchClass().getRoom().getName());
//            System.out.println(data.getParticipant().getParticipant().getBatchClass().getBatch().getName());
        }
        String fileName = "./src/java/reports/score.jrxml";
        String filetoFill = "./src/java/reports/score.jasper";
        JasperCompileManager.compileReport(fileName);
        Map param = new HashMap();
        param.put("setId", "14303");
        Connection conn = HibernateUtil.getSessionFactory().getSessionFactoryOptions().getServiceRegistry().getService(ConnectionProvider.class).getConnection();
        JasperFillManager.fillReport(filetoFill, param, conn);
//            javax.swing.JOptionPane.showMessageDialog(null, conn);
        JasperPrint jp = JasperFillManager.fillReport(filetoFill, param, conn);
        JasperViewer.viewReport(jp, false);
    }
}
