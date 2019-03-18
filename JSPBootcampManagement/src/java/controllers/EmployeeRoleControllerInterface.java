/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.Date;
import java.util.List;
import models.*;

/**
 *
 * @author Pandu
 */
    public interface EmployeeRoleControllerInterface {
    public EmployeeRole getByid(String id);
    public List<EmployeeRole> getAll();
    public List<EmployeeRole> search(Object keyword);
    public List<EmployeeRole> searchWD(Object keyword);
    public boolean save(String id, Date startDate, Date endDate, String isdeleted, String role, String employee);
    public String delete(String id, Date startDate, Date endDate, String isdeleted, String role, String employee);
    public boolean deleteSoft(String id, Date startDate, Date endDate, String isdeleted, String role, String employee);
}
