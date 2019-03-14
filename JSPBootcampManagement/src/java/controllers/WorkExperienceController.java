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
public class WorkExperienceController implements WorkExperienceControllerInterface {

    private DAOInterface<WorkExperience> dao;
    private SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

    public WorkExperienceController(SessionFactory factory) {
        dao = new GeneralDAO<>(factory, WorkExperience.class);
    }

    @Override
    public WorkExperience getByid(String id) {
        return dao.getById(id);
    }

    @Override
    public List<WorkExperience> getAll() {
        return dao.getData("");
    }

    @Override
    public List<WorkExperience> search(Object keyword) {
        return dao.getData(keyword);
    }

    @Override
    public String save(String id, String name, String description, String startDate, String endDate, String employee) {
        try {
            if (dao.saveOrDelete(new WorkExperience(id, name, description, dateFormat.parse(startDate), dateFormat.parse(endDate), new Short("0"), new Employee(employee)), true)) {
                return "Save Data Success!";
            }
        } catch (ParseException ex) {
            Logger.getLogger(WorkExperienceController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Save Failed!";
    }

    @Override
    public String delete(String id, String name, String description, String startDate, String endDate, String employee) {
        try {
            if (dao.saveOrDelete(new WorkExperience(id, name, description, dateFormat.parse(startDate), dateFormat.parse(endDate), new Short("0"), new Employee(employee)), false)) {
                return "Delete Data Success!"; 
            }
        } catch (ParseException ex) {
            Logger.getLogger(WorkExperienceController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Delete Failed!";
    }
}
