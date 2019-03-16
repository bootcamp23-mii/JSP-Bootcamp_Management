/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import java.util.List;
import models.*;
import org.hibernate.SessionFactory;

/**
 *
 * @author gerydanu
 */
public class ScoreController implements ScoreControllerInterface {
    private DAOInterface<Score> dao;

    public ScoreController(SessionFactory factory) {
        dao = new GeneralDAO<>(factory, Score.class);
    }

    @Override
    public Score getByid(String id) {
        return dao.getById(id);
    }

    @Override
    public List<Score> getAll() {
        return dao.getData("");
    }

    @Override
    public List<Score> search(Object keyword) {
        return dao.getData(keyword);
    }
    @Override
    public List<Score> searchWD(Object keyword) {
        return dao.getDataWD(keyword,0);
    }

    @Override
    public boolean save(String id, String rating, String aspect, String evaluation) {
        if (dao.saveOrDelete(new Score(id, new Double(rating), new Short("0"), new Aspect(aspect), new Evaluation(evaluation)), true)) {
            return true;
        } else {
            return false;
        }
    }
    
    @Override
    public String delete(String id, String rating, String aspect, String evaluation) {
        if (dao.saveOrDelete(new Score(id, new Double(rating), new Short("0"), new Aspect(aspect), new Evaluation(evaluation)), false)) {
            return "Delete Data Success!";
        } else {
            return "Delete Failed!";
        }
    }
    
    @Override
    public boolean deleteSoft(String id, double rating, String aspect, String evaluation) {
        if (dao.saveOrDelete(new Score(id, new Double(rating), new Short("1"), new Aspect(aspect), new Evaluation(evaluation)), true)) {
            return true;
        } else {
            return false;
        }
    }
}
