/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDAO;
import java.util.List;
import models.Religion;
import org.hibernate.SessionFactory;

/**
 *
 * @author FES
 */
public class ReligionController implements ReligionControllerInterface {
    
    GeneralDAO<Religion> dao;
    public ReligionController(SessionFactory factory) {
        dao = new GeneralDAO<>(factory, Religion.class);
    }

    @Override
    public Religion getById(String id) {
        return dao.getById(id);
    }

    @Override
    public List<Religion> getAll() {
        return dao.getData("");
    }

    @Override
    public List<Religion> search(Object keyword) {
        return dao.getData(keyword);
    }
    
    
}
