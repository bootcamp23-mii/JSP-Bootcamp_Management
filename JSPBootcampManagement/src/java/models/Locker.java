/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author FES
 */
@Entity
@Table(name = "tb_m_locker")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Locker.findAll", query = "SELECT l FROM Locker l")
    , @NamedQuery(name = "Locker.findById", query = "SELECT l FROM Locker l WHERE l.id = :id")
    , @NamedQuery(name = "Locker.findByTBMLOCKERNumber", query = "SELECT l FROM Locker l WHERE l.tBMLOCKERNumber = :tBMLOCKERNumber")})
public class Locker implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private String id;
    @Basic(optional = false)
    @Column(name = "TB_M_LOCKERNumber")
    private BigInteger tBMLOCKERNumber;
    @OneToMany(mappedBy = "locker", fetch = FetchType.LAZY)
    private List<EmployeeLocker> employeeLockerList;

    public Locker() {
    }

    public Locker(String id) {
        this.id = id;
    }

    public Locker(String id, BigInteger tBMLOCKERNumber) {
        this.id = id;
        this.tBMLOCKERNumber = tBMLOCKERNumber;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public BigInteger getTBMLOCKERNumber() {
        return tBMLOCKERNumber;
    }

    public void setTBMLOCKERNumber(BigInteger tBMLOCKERNumber) {
        this.tBMLOCKERNumber = tBMLOCKERNumber;
    }

    @XmlTransient
    public List<EmployeeLocker> getEmployeeLockerList() {
        return employeeLockerList;
    }

    public void setEmployeeLockerList(List<EmployeeLocker> employeeLockerList) {
        this.employeeLockerList = employeeLockerList;
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
        if (!(object instanceof Locker)) {
            return false;
        }
        Locker other = (Locker) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Locker[ id=" + id + " ]";
    }
    
}
