/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.Date;
import java.util.List;
import models.*;

/**
 *
 * @author gerydanu
 */
public interface EvaluationControllerInterface {
    public Evaluation getByid(String id);
    public List<Evaluation> getAll();
    public List<Evaluation> search(Object keyword);
    public List<Evaluation> searchWD(Object keyword);
    public boolean save(String id, String isdaily, Date evaluationdate, String note, String participant, String lesson, String topic);
    public String delete(String id, String isdaily, Date evaluationdate, String note, String isdeleted, String participant, String lesson, String topic);
    public boolean deleteSoft(String id, Short isdaily, Date evaluationdate, String note, String participant, String lesson, String topic);
}
