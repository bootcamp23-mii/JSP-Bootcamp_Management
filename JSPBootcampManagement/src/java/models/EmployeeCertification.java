/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author FES
 */
@Entity
@Table(name = "tb_t_employee_certification")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EmployeeCertification.findAll", query = "SELECT e FROM EmployeeCertification e")
    , @NamedQuery(name = "EmployeeCertification.findById", query = "SELECT e FROM EmployeeCertification e WHERE e.id = :id")
    , @NamedQuery(name = "EmployeeCertification.findByCERTIFICATEDate", query = "SELECT e FROM EmployeeCertification e WHERE e.cERTIFICATEDate = :cERTIFICATEDate")
    , @NamedQuery(name = "EmployeeCertification.findByCERTIFICATENumber", query = "SELECT e FROM EmployeeCertification e WHERE e.cERTIFICATENumber = :cERTIFICATENumber")
    , @NamedQuery(name = "EmployeeCertification.findByIsdeleted", query = "SELECT e FROM EmployeeCertification e WHERE e.isdeleted = :isdeleted")})
public class EmployeeCertification implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private String id;
    @Column(name = "CERTIFICATEDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date cERTIFICATEDate;
    @Column(name = "CERTIFICATENumber")
    private String cERTIFICATENumber;
    @Column(name = "isdeleted")
    private Short isdeleted;
    @JoinColumn(name = "CERTIFICATE", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Certificate certificate;
    @JoinColumn(name = "EMPLOYEE", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Employee employee;

    public EmployeeCertification() {
    }

    public EmployeeCertification(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getCERTIFICATEDate() {
        return cERTIFICATEDate;
    }

    public void setCERTIFICATEDate(Date cERTIFICATEDate) {
        this.cERTIFICATEDate = cERTIFICATEDate;
    }

    public String getCERTIFICATENumber() {
        return cERTIFICATENumber;
    }

    public void setCERTIFICATENumber(String cERTIFICATENumber) {
        this.cERTIFICATENumber = cERTIFICATENumber;
    }

    public Short getIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(Short isdeleted) {
        this.isdeleted = isdeleted;
    }

    public Certificate getCertificate() {
        return certificate;
    }

    public void setCertificate(Certificate certificate) {
        this.certificate = certificate;
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
        if (!(object instanceof EmployeeCertification)) {
            return false;
        }
        EmployeeCertification other = (EmployeeCertification) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.EmployeeCertification[ id=" + id + " ]";
    }
    
}
