/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bm.bootcampmanagement.servicesInterface.bm;

import com.bm.bootcampmanagement.entities.*;

/**
 *
 * @author FES
 */
public interface ClassesDAOInterface {
    Iterable<Classes> findAll();
    Classes findById(String id);
    Classes save(Classes entity);
    void delete(String id);
}
