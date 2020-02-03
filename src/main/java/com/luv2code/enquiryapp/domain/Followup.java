package com.luv2code.enquiryapp.domain;

import java.io.Serializable;
import java.util.Date;

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


@Entity
@Table(name = "followup", schema = "enquiry")
public class Followup implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "followup_id")
    private Integer followupId;
    
    @Column(name = "doe")
    @Temporal(TemporalType.TIMESTAMP)
    private Date doe;
    
    @Column(name = "detail")
    private String detail;
   
    @JoinColumn(name = "enquiry_id", referencedColumnName = "enquiry_id")
    @ManyToOne
    private Enquiry enquiry;

    public Followup(Integer followupId, Date doe, String detail) {
        this.followupId = followupId;
        this.doe = doe;
        this.detail = detail;
    }

    
    
    public Followup() {
    }

    public Followup(Integer followupId) {
        this.followupId = followupId;
    }

    public Integer getFollowupId() {
        return followupId;
    }

    public void setFollowupId(Integer followupId) {
        this.followupId = followupId;
    }

    public Date getDoe() {
        return doe;
    }

    public void setDoe(Date doe) {
        this.doe = doe;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
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
        hash += (followupId != null ? followupId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Followup)) {
            return false;
        }
        Followup other = (Followup) object;
        if ((this.followupId == null && other.followupId != null) || (this.followupId != null && !this.followupId.equals(other.followupId))) {
            return false;
        }
        return true;
    }

	@Override
	public String toString() {
		return "Followup [followupId=" + followupId + "]";
	}
    
}
