package com.luv2code.enquiryapp.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.data.jpa.repository.Query;

import com.fasterxml.jackson.annotation.JsonInclude;

/**
 * The persistent class for the institute database table.
 * 
 */
@Entity
@Table(name = "institute", schema = "enquiry")
public class Institute implements Serializable {
	


    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "institute_id")
    private Integer instituteId;
    @Column(name = "name")
    private String name;
    @Column(name = "doe")
    @Temporal(TemporalType.DATE)
    private Date doe;

    @JoinColumn(name = "enquiry_contact_id", referencedColumnName = "enquiry_contact_id")
    @ManyToOne
    private Contact contact;

  
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Transient    
    private List<Enquiry> enquiryList;
    
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Transient         
    private List<Course> courseList;
 

    public Institute() {
    }

    //This Constructor used for InstituteRepository Where
    /*
     *	@Query("SELECT new com.luv2code.enquiryapp.domain.Institute() FROM Institute AS i")
		public List<Institute> getInstitueList(); 
     */
    public Institute(Integer instituteId, String name) {
        this.instituteId = instituteId;
        this.name = name;
    }

    public Institute(String name, Date doe, Contact contact) {
        this.name = name;
        this.doe = doe;
        this.contact = contact;
    }

    public Institute(Integer instituteId) {
        this.instituteId = instituteId;
    }

    public Integer getInstituteId() {
        return instituteId;
    }

    public void setInstituteId(Integer instituteId) {
        this.instituteId = instituteId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDoe() {
        return doe;
    }

    public void setDoe(Date doe) {
        this.doe = doe;
    }

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }

    public List<Enquiry> getEnquiryList() {
        return enquiryList;
    }

    public void setEnquiryList(List<Enquiry> enquiryList) {
        this.enquiryList = enquiryList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (instituteId != null ? instituteId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Institute)) {
            return false;
        }
        Institute other = (Institute) object;
        if ((this.instituteId == null && other.instituteId != null) || (this.instituteId != null && !this.instituteId.equals(other.instituteId))) {
            return false;
        }
        return true;
    }

    @Override
	public String toString() {
		return "Institute [instituteId=" + instituteId + "]";
	}

	public List<Course> getCourseList() {
        return courseList;
    }

    public void setCourseList(List<Course> courseList) {
        this.courseList = courseList;
    }
}