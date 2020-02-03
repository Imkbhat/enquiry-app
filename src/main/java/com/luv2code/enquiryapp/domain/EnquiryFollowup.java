package com.luv2code.enquiryapp.domain;

import java.io.Serializable;
import javax.persistence.*;

import java.sql.Date;
import java.sql.Timestamp;


/**
 * The persistent class for the enquiry_followup database table.
 * 
 */
@Entity
@Table(name="enquiry_followup", schema = "enquiry")
public class EnquiryFollowup implements Serializable {
	private static final long serialVersionUID = 1L;
	private String details;
	private Date doe;
	private Integer enquiryFollowupId;
	private Integer enquiryId;

	public EnquiryFollowup() {
	}

	public EnquiryFollowup(String details, Date doe, Integer enquiryId) {
		this.details = details;
		this.doe = doe;
		this.enquiryId = enquiryId;
	}

	@Column(length=200)
	public String getDetails() {
		return this.details;
	}

	public void setDetails(String details) {
		this.details = details;
	}


	public Date getDoe() {
		return this.doe;
	}

	public void setDoe(Date doe) {
		this.doe = doe;
	}

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="enquiry_followup_id", nullable=false)
	public Integer getEnquiryFollowupId() {
		return this.enquiryFollowupId;
	}

	public void setEnquiryFollowupId(Integer enquiryFollowupId) {
		this.enquiryFollowupId = enquiryFollowupId;
	}


	@Column(name="enquiry_id")
	public Integer getEnquiryId() {
		return this.enquiryId;
	}

	public void setEnquiryId(Integer enquiryId) {
		this.enquiryId = enquiryId;
	}

}