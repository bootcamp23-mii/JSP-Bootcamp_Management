/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;
import models.BatchClass;
import models.Employee;
import tools.HibernateUtil;

/**
 *
 * @author Lusiana
 */
public class Session implements SessionControllerInterface{
    EmployeeControllerInterface ec = new EmployeeController(HibernateUtil.getSessionFactory());
    BatchClassControllerInterface bc = new BatchClassController(HibernateUtil.getSessionFactory());
    @Override
    public boolean user(String user){
        Employee a = ec.getByid(user);
        if(!((a.getEmployeeRoleList().get(0).getRole().getId()).equals("CVR4")))
        {
            return false;
        }
        return true;
    }
    
    @Override
    public boolean admin(String user){
        Employee a = ec.getByid(user);
        if(!((a.getEmployeeRoleList().get(0).getRole().getId()).equals("CVR0")))
        {
            return false;
        }
        return true;
    }
    
    @Override
     public boolean trainer(String user){
        List<BatchClass> x = bc.search(user);
        if(x.isEmpty())
        {
            return false;
        }
        return true;
    }
    
}
