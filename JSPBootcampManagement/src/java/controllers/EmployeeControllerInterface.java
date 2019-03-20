/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.Date;
import java.util.List;
import models.District;
import models.Employee;
import models.Religion;
import models.Village;

/**
 *
 * @author Firsta
 */
    public interface EmployeeControllerInterface {
    public Employee getByid(String id);
    public List<Employee> getAll();
    public List<Employee> search(Object keyword);
    public List<Employee> searchWD(Object keyword);
    public boolean save(String id, String name, Date birthdate, String gender, String marriedStatus, String address, String email, String phone, Date onboardDate, String password, String securityQestion, String securityAnswer, String hiringLocation, String birthPlace, String religion, String village);
    public String insert(String id, String name, String birthdate, String gender, String marriedStatus, String address, String email, String phone, String onboardDate, String password, String securityQestion, String securityAnswer, String hiringLocation, String birthPlace, String religion, String village);
    public boolean delete(String id, String name, String birthdate, String gender, String marriedStatus, String address, String email, String phone, String onboardDate, String password, String securityQestion, String securityAnswer, String hiringLocation, String birthPlace, String religion, String village);
    public boolean deleteSoft(String id, String name, String birthdate, String gender, String marriedStatus, String address, String email, String phone, String onboardDate, String password, String securityQestion, String securityAnswer, String hiringLocation, String birthPlace, String religion, String village);
    }
