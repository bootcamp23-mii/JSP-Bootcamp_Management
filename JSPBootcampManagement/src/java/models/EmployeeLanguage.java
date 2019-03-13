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
@Table(name = "tb_t_employee_language")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EmployeeLanguage.findAll", query = "SELECT e FROM EmployeeLanguage e")
    , @NamedQuery(name = "EmployeeLanguage.findById", query = "SELECT e FROM EmployeeLanguage e WHERE e.id = :id")
    , @NamedQuery(name = "EmployeeLanguage.findByIsdeleted", query = "SELECT e FROM EmployeeLanguage e WHERE e.isdeleted = :isdeleted")})
public class EmployeeLanguage implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private String id;
    @Column(name = "isdeleted")
    private Short isdeleted;
    @JoinColumn(name = "LANGUAGE", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Language language;
    @JoinColumn(name = "EMPLOYEE", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Employee employee;

    public EmployeeLanguage() {
    }

    public EmployeeLanguage(String id) {
        this.id = id;
    }

    public EmployeeLanguage(String id, Short isdeleted, Language language, Employee employee) {
        this.id = id;
        this.isdeleted = isdeleted;
        this.language = language;
        this.employee = employee;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Short getIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(Short isdeleted) {
        this.isdeleted = isdeleted;
    }

    public Language getLanguage() {
        return language;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
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
        if (!(object instanceof EmployeeLanguage)) {
            return false;
        }
        EmployeeLanguage other = (EmployeeLanguage) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.EmployeeLanguage[ id=" + id + " ]";
    }
    
}
