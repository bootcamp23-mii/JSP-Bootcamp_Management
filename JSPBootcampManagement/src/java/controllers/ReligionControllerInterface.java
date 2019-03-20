/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;
import models.Religion;

/**
 *
 * @author FES
 */
public interface ReligionControllerInterface {
    public Religion getById(String id);
    public List<Religion> getAll();
    public List<Religion> search(Object keyword);
}
