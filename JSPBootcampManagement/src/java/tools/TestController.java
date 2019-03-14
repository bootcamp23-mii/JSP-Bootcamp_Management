/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.EducationHistoryController;
import controllers.EducationHistoryControllerInterface;
import controllers.EmployeeController;
import controllers.ParticipantController;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import models.*;
import org.hibernate.SessionFactory;
import org.hibernate.engine.jdbc.connections.spi.ConnectionProvider;

/**
 *
 * @author FES
 */
public class TestController {
    public static void main(String[] args) throws FileNotFoundException, IOException {
        SessionFactory factory = HibernateUtil.getSessionFactory();
//        EducationHistoryControllerInterface eh = new EducationHistoryController(factory);
//        EmployeeController emp = new EmployeeController(factory);
//        List<Employee> empList = emp.searchWD("14201");
        List<Participant> pList = new ParticipantController(factory).getAll();
        System.out.println(factory);

//        for (Participant data : pList) {
//            System.out.println(data.getEmployee().getName());
//            System.out.println(data.getBatchClass().getTrainer().getName());
//            System.out.println(data.getBatchClass().getBatch().getName());
//            System.out.println(data.getBatchClass().getClasses().getName());
//            System.out.println(data.getBatchClass().getRoom().getName());
//            System.out.println("");
//        }
    }
}
