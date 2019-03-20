/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;
import models.BatchClass;
import models.Employee;
import models.Participant;
import tools.HibernateUtil;

/**
 *
 * @author Lusiana
 */
public class Session implements SessionControllerInterface {

    EmployeeControllerInterface ec = new EmployeeController(HibernateUtil.getSessionFactory());
    BatchClassControllerInterface bc = new BatchClassController(HibernateUtil.getSessionFactory());
    ParticipantControllerInterface pc = new ParticipantController(HibernateUtil.getSessionFactory());
    EmployeeRoleControllerInterface rc = new EmployeeRoleController(HibernateUtil.getSessionFactory());

    @Override
    public boolean user(String user) {
        Participant a = pc.getByid(user);
        if (a!=null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean admin(String user) {
        Employee a = ec.getByid(user);
        if (rc.search(user).size()>0) {
            if (((a.getEmployeeRoleList().get(0).getRole().getId()).equals("CVR0"))){
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean trainer(String user) {
        List<BatchClass> x = bc.search(user);
        if (x.isEmpty()) {
            return false;
        }
        return true;
    }

}
