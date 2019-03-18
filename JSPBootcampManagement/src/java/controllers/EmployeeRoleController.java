/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.*;
import org.hibernate.SessionFactory;

/**
 *
 * @author Pandu
 */
public class EmployeeRoleController implements EmployeeRoleControllerInterface {

    private DAOInterface<EmployeeRole> dao;
    private SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

    public EmployeeRoleController(SessionFactory factory) {
        dao = new GeneralDAO<>(factory, EmployeeRole.class);
    }

    @Override
    public EmployeeRole getByid(String id) {
        return dao.getById(id);
    }

    @Override
    public List<EmployeeRole> getAll() {
        return dao.getData("");
    }

    @Override
    public List<EmployeeRole> search(Object keyword) {
        return dao.getData(keyword);
    }

    @Override
    public List<EmployeeRole> searchWD(Object keyword) {
        return dao.getDataWD(keyword, 0);
    }

    @Override
    public boolean save(String id, Date startDate, Date endDate, String isdeleted, String role, String employee) {
        if (dao.saveOrDelete(new EmployeeRole(id, startDate, endDate, new Short("0"), new Role(role), new Employee(employee)), true)) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public String delete(String id, Date startDate, Date endDate, String isdeleted, String role, String employee) {
        if (dao.saveOrDelete(new EmployeeRole(id, startDate, endDate, new Short("0"), new Role(role), new Employee(employee)), false)) {
            return "Delete Data Success!";
        } else {
            return "Delete Failed!";
        }
    }

    @Override
    public boolean deleteSoft(String id, Date startDate, Date endDate, String isdeleted, String role, String employee) {
        if (dao.saveOrDelete(new EmployeeRole(id, startDate, endDate, new Short("1"), new Role(role), new Employee(employee)), true)) {
            return true;
        } else {
            return false;
        }
    }
}
