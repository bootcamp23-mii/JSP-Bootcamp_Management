/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.*;
import org.hibernate.SessionFactory;

/**
 *
 * @author FES
 */
public class EmployeeLanguageController implements EmployeeLanguageControllerInterface {

    private DAOInterface<EmployeeLanguage> dao;

    public EmployeeLanguageController(SessionFactory factory) {
        dao = new GeneralDAO<>(factory, EmployeeLanguage.class);
    }

    @Override
    public EmployeeLanguage getByid(String id) {
        return dao.getById(id);
    }

    @Override
    public List<EmployeeLanguage> getAll() {
        return dao.getData("");
    }

    @Override
    public List<EmployeeLanguage> search(Object keyword) {
        return dao.getData(keyword);
    }
    
    @Override
    public List<EmployeeLanguage> searchWD(Object keyword) {
        return dao.getDataWD(keyword,0);
    }

    @Override
    public boolean save(String id, String score, String isActive, String isdeleted, String language, String employee) {
        if (dao.saveOrDelete(new EmployeeLanguage(id, new Double(null), new Short("0"), new Short("0"), new Language(language), new Employee(employee)), true)) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public String delete(String id, String score, String isActive, String isdeleted, String language, String employee) {
        if (dao.saveOrDelete(new EmployeeLanguage(id, new Double(null), new Short("0"), new Short("0"), new Language(language), new Employee(employee)), false)) {
            return "Delete Data Success!";
        } else {
            return "Delete Failed!";
        }
    }
    
    public boolean deleteSoft(String id, String score, String isActive, String isdeleted, String language, String employee) {
        if (dao.saveOrDelete(new EmployeeLanguage(id, new Double(null), new Short("0"), new Short("1"), new Language(language), new Employee(employee)), true)) {
            return true;
        } else {
            return false;
        }
    }
}
