package com.luv2code.enquiryapp.command;

import com.luv2code.enquiryapp.domain.Enquiry;

public class EnquiryCommand {

	Enquiry enquiry;
	Integer[] courses;
	
	public Enquiry getEnquiry() {
		return enquiry;
	}
	
	public void setEnquiry(Enquiry enquiry) {
		this.enquiry = enquiry;
	}
	
	public Integer[] getCourses() {
		return courses;
	}
	
	public void setCourses(Integer[] courses) {
		this.courses = courses;
	}
	
	
}
