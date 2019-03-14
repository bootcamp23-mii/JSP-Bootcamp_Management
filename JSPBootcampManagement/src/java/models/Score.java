/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author FES
 */
@Entity
@Table(name = "tb_t_score")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Score.findAll", query = "SELECT s FROM Score s")
    , @NamedQuery(name = "Score.findById", query = "SELECT s FROM Score s WHERE s.id = :id")
    , @NamedQuery(name = "Score.findByRating", query = "SELECT s FROM Score s WHERE s.rating = :rating")
    , @NamedQuery(name = "Score.findByIsdeleted", query = "SELECT s FROM Score s WHERE s.isdeleted = :isdeleted")})
public class Score implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private String id;
    @Basic(optional = false)
    @Column(name = "rating")
    private double rating;
    @Column(name = "isdeleted")
    private Short isdeleted;
    @JoinColumn(name = "aspect", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Aspect aspect;
    @JoinColumn(name = "evaluation", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Evaluation evaluation;

    public Score() {
    }

    public Score(String id) {
        this.id = id;
    }

    public Score(String id, double rating) {
        this.id = id;
        this.rating = rating;
    }

    public Score(String id, double rating, Short isdeleted, Aspect aspect, Evaluation evaluation) {
        this.id = id;
        this.rating = rating;
        this.isdeleted = isdeleted;
        this.aspect = aspect;
        this.evaluation = evaluation;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public Short getIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(Short isdeleted) {
        this.isdeleted = isdeleted;
    }

    public Aspect getAspect() {
        return aspect;
    }

    public void setAspect(Aspect aspect) {
        this.aspect = aspect;
    }

    public Evaluation getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(Evaluation evaluation) {
        this.evaluation = evaluation;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Score)) {
            return false;
        }
        Score other = (Score) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Score[ id=" + id + " ]";
    }
    
}
