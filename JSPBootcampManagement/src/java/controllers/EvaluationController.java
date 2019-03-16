/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import models.*;
import org.hibernate.SessionFactory;

/**
 *
 * @author gerydanu
 */
public class EvaluationController implements EvaluationControllerInterface {

    private DAOInterface<Evaluation> dao;

    public EvaluationController(SessionFactory factory) {
        dao = new GeneralDAO<>(factory, Evaluation.class);
    }

    @Override
    public Evaluation getByid(String id) {
        return dao.getById(id);
    }

    @Override
    public List<Evaluation> getAll() {
        return dao.getData("");
    }

    @Override
    public List<Evaluation> search(Object keyword) {
        return dao.getData(keyword);
    }
    
    @Override
    public List<Evaluation> searchWD(Object keyword) {
        return dao.getDataWD(keyword,0);
    }

    @Override
    public boolean save(String id, String isdaily, Date evaluationdate, String note, String participant, String lesson, String topic) {
        if (dao.saveOrDelete(new Evaluation(id, new Short(isdaily), evaluationdate, note, new Short("0"), new Employee(participant), new Lesson(lesson), new Topic(topic)), true)) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public String delete(String id, String isdaily, Date evaluationdate, String note, String isdeleted, String participant, String lesson, String topic) {
        if (dao.saveOrDelete(new Evaluation(id, new Short(isdaily), evaluationdate, note, new Short("0"), new Employee(participant), new Lesson(lesson), new Topic(topic)), false)) {
            return "Delete Data Success!";
        } else {
            return "Delete Failed!";
        }
    }

    @Override
    public boolean deleteSoft(String id, Short isdaily, Date evaluationdate, String note, String participant, String lesson, String topic) {
        if (dao.saveOrDelete(new Evaluation(id, isdaily, evaluationdate, note, new Short("1"), new Employee(participant), new Lesson(lesson), new Topic(topic)), true)) {
            return true;
        } else {
            return false;
        }
    }
}
