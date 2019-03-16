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
 * @author gerydanu
 */
public class ErrorBankController implements ErrorBankControllerInterface {
    private DAOInterface<ErrorBank> dao;

    public ErrorBankController(SessionFactory factory) {
        dao = new GeneralDAO<>(factory, ErrorBank.class);
    }

    @Override
    public ErrorBank getByid(String id) {
        return dao.getById(id);
    }

    @Override
    public List<ErrorBank> getAll() {
        return dao.getData("");
    }

    @Override
    public List<ErrorBank> search(Object keyword) {
        return dao.getData(keyword);
    }

    @Override
    public boolean save(String id, Date submitdate, String description, String solution, String classes, String employee) {
            if (dao.saveOrDelete(new ErrorBank(id,submitdate, description, solution, new Classes(classes), new Employee(employee)), true)) {
                return true;
            }
        return false;
    }

    @Override
    public String delete(String id, Date submitdate, String description, String solution, Classes classes, Employee employee) {
        if (dao.saveOrDelete(new ErrorBank(id, submitdate, description, solution, classes, employee), false)) {
            return "Delete Data Success!";
        } else {
            return "Delete Failed!";
        }
    }
}
