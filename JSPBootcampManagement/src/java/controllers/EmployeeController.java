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
import models.District;
import models.Employee;
import models.Participant;
import models.Religion;
import models.Village;
import org.hibernate.SessionFactory;

/**
 *
 * @author Firsta
 */
public class EmployeeController implements EmployeeControllerInterface {

    private DAOInterface<Employee> dao;
    private SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

    public EmployeeController(SessionFactory factory) {
        dao = new GeneralDAO(factory, Employee.class);
    }

    @Override
    public Employee getByid(String id) {
        return dao.getById(id);
    }

    @Override
    public List<Employee> getAll() {
        return dao.getData("");
    }

    @Override
    public List<Employee> search(Object keyword) {
        return dao.getData(keyword);
    }

    @Override
    public List<Employee> searchWD(Object keyword) {
        return dao.getDataWD(keyword, 0);
    }

    @Override
    public String save(String id, String name, String birthdate, String gender, String marriedStatus, String address, String email, String phone, String onboardDate, String password, String securityQestion, String securityAnswer, String hiringLocation, String birthPlace, String religion, String village) {
        try {
            if (dao.saveOrDelete(new Employee(id, name, dateFormat.parse(birthdate), gender, marriedStatus, address, email, phone, dateFormat.parse(onboardDate), password, securityQestion, securityAnswer, new Short("0"), new Religion(religion), new District(birthPlace), new Village(village), new District(hiringLocation), null), true)) {
                return "Save Data Success";
            }
        } catch (ParseException ex) {
            Logger.getLogger(PlacementController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Save Failed";
    }
    @Override
    public String insert(String id, String name, String birthdate, String gender, String marriedStatus, String address, String email, String phone, String onboardDate, String password, String securityQestion, String securityAnswer, String hiringLocation, String birthPlace, String religion, String village) {
        try {
            if (dao.saveOrDelete(new Employee(id, name, dateFormat.parse(birthdate), gender, marriedStatus, address, email, phone, dateFormat.parse(onboardDate), password, securityQestion, securityAnswer, new Short("1"), new Religion(religion), new District(birthPlace), new Village(village), new District(hiringLocation), null), true)) {
                return "Save Data Success";
            }
        } catch (ParseException ex) {
            Logger.getLogger(PlacementController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Save Failed";
    }

    @Override
    public String delete(String id, String name, String birthdate, String gender, String marriedStatus, String address, String email, String phone, String onboardDate, String password, String securityQestion, String securityAnswer, String hiringLocation, String birthPlace, String religion, String village) {
        try {

            if (dao.saveOrDelete(new Employee(id, name, dateFormat.parse(birthdate), gender, marriedStatus, address, email, phone, dateFormat.parse(onboardDate), password, securityQestion, securityAnswer, new Short("0"), new Religion(religion), new District(birthPlace), new Village(village), new District(hiringLocation),null), true)) {
                return "Delete Data Success";
            }
        } catch (ParseException ex) {
            Logger.getLogger(PlacementController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Delete Failed";
    }

    @Override
    public String deleteSoft(String id, String name, String birthdate, String gender, String marriedStatus, String address, String email, String phone, String onboardDate, String password, String securityQestion, String securityAnswer, String hiringLocation, String birthPlace, String religion, String village) {
        String tempID = "";
        List<Employee> dataList = searchWD("");
        for (Employee employee : dataList) {
            if (employee.getName().equals(name)
                    && dateFormat.format(employee.getBirthDate()).equals(birthdate)
                    && employee.getGender().equals(gender)
                    && employee.getMarriedStatus().equals(marriedStatus)
                    && employee.getAddress().equals(address)
                    && employee.getEmail().equals(email)
                    && employee.getPhone().equals(phone)
                    && dateFormat.format(employee.getOnboardDate()).equals(onboardDate)
                    && employee.getPassword().equals(password)
                    && employee.getAddress().equals(address)
                    && employee.getSecurityQestion().equals(securityQestion)
                    && employee.getSecurityAnswer().equals(securityAnswer)
                    && employee.getHiringLocation().getId().equals(hiringLocation)
                    && employee.getBirthPlace().getId().equals(birthPlace)
                    && employee.getReligion().getId().equals(religion)
                    && employee.getVillage().getId().equals(village)) {
                tempID = employee.getId();
            }
        }
        try {
            if (dao.saveOrDelete(new Employee(id, name, dateFormat.parse(birthdate), gender, marriedStatus, address, email, phone, dateFormat.parse(onboardDate), password, securityQestion, securityAnswer, new Short("0"), new Religion(religion), new District(birthPlace), new Village(village), new District(hiringLocation),null), true)) {
                return "Delete Data Success!";
            }
        } catch (ParseException ex) {
            Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Delete Failed!";
    }
}
