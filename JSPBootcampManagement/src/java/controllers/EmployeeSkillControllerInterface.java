/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;
import models.*;

/**
 *
 * @author Pandu
 */
public interface EmployeeSkillControllerInterface {
    public EmployeeSkill getByid(String id);
    public List<EmployeeSkill> getAll();
    public List<EmployeeSkill> search(Object keyword);
    public boolean save(String id, String score, String isdeleted, String skill, String employee);
    public String delete(String id, String score, String isdeleted, String skill, String employee);
    public boolean deleteSoft(String id, String score, String isdeleted, String skill, String employee);
}
