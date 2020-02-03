package com.luv2code.enquiryapp.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public interface EnquiryDto {
	
	Integer getEnquiryId();
	
	String getPhone();
	
	String getName();
	
	String getCourses();
	
	Integer getFollowUpCount();
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy")
	Date getDao();
	
	Float fees();
}
