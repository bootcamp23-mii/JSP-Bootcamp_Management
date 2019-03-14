/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import java.util.Date;
import java.util.List;
import models.*;
import org.hibernate.SessionFactory;

/**
 *
 * @author Pandu
 */
public class EmployeeSkillController implements EmployeeSkillControllerInterface {

    private DAOInterface<EmployeeSkill> dao;

    public EmployeeSkillController(SessionFactory factory) {
        dao = new GeneralDAO<>(factory, EmployeeSkill.class);
    }

    @Override
    public EmployeeSkill getByid(String id) {
        return dao.getById(id);
    }

    @Override
    public List<EmployeeSkill> getAll() {
        return dao.getData("");
    }

    @Override
    public List<EmployeeSkill> search(Object keyword) {
        return dao.getData(keyword);
    }

    @Override
    public String save(String id, String score, String isdeleted, String skill, String employee) {
        if (dao.saveOrDelete(new EmployeeSkill(id, new Double(score), new Short("0"), new Skill(skill), new Employee(employee)), true)) {
            return "Save Data Success!";
        } else {
            return "Save Failed!";
        }
    }

    @Override
    public String delete(String id, String score, String isdeleted, String skill, String employee) {
        if (dao.saveOrDelete(new EmployeeSkill(id, new Double(score), new Short("1"), new Skill(skill), new Employee(employee)), false)) {
            return "Delete Data Success!";
        } else {
            return "Delete Failed!";
        }
    }
}
