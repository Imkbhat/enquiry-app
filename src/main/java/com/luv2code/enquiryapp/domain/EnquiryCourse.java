package com.luv2code.enquiryapp.domain;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 * The persistent class for the enquiry_course database table.
 * 
 */
@Entity
@Table(name="enquiry_course", schema="enquiry")
public class EnquiryCourse implements Serializable {
	
	private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "enquiry_course_id")
    private Integer enquiryCourseId;
    @JoinColumn(name = "course_id", referencedColumnName = "course_id")
    @ManyToOne
    private Course course;
    @JoinColumn(name = "enquiry_id", referencedColumnName = "enquiry_id")
    @ManyToOne
    private Enquiry enquiry;
    

    public EnquiryCourse() {
    }

    public EnquiryCourse(Integer enquiryCourseId) {
        this.enquiryCourseId = enquiryCourseId;
    }

    public Integer getEnquiryCourseId() {
        return enquiryCourseId;
    }

    public void setEnquiryCourseId(Integer enquiryCourseId) {
        this.enquiryCourseId = enquiryCourseId;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Enquiry getEnquiry() {
        return enquiry;
    }

    public void setEnquiry(Enquiry enquiry) {
        this.enquiry = enquiry;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (enquiryCourseId != null ? enquiryCourseId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EnquiryCourse)) {
            return false;
        }
        EnquiryCourse other = (EnquiryCourse) object;
        if ((this.enquiryCourseId == null && other.enquiryCourseId != null) || (this.enquiryCourseId != null && !this.enquiryCourseId.equals(other.enquiryCourseId))) {
            return false;
        }
        return true;
    }

	@Override
	public String toString() {
		return "EnquiryCourse [enquiryCourseId=" + enquiryCourseId + "]";
	}
}