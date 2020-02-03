package com.luv2code.enquiryapp.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.luv2code.enquiryapp.domain.Contact;
import com.luv2code.enquiryapp.domain.Course;
import com.luv2code.enquiryapp.domain.Enquiry;
import com.luv2code.enquiryapp.domain.EnquiryAddress;
import com.luv2code.enquiryapp.domain.EnquiryCourse;
import com.luv2code.enquiryapp.domain.EnquirySource;
import com.luv2code.enquiryapp.domain.Institute;
import com.luv2code.enquiryapp.repo.CourseRepository;
import com.luv2code.enquiryapp.repo.EnquiryAddressRepository;
import com.luv2code.enquiryapp.repo.EnquiryContactRepository;
import com.luv2code.enquiryapp.repo.EnquiryCourseRepository;
import com.luv2code.enquiryapp.repo.EnquiryFollowUpRepository;
import com.luv2code.enquiryapp.repo.EnquiryRepository;
import com.luv2code.enquiryapp.repo.EnquirySourceRepository;
import com.luv2code.enquiryapp.repo.InstituteRepository;

@RestController
public class TestController {
	
	@Autowired
	CourseRepository courseRepository;
	
	@Autowired
	EnquiryRepository enquiryRepository;
	
	@Autowired
	EnquiryAddressRepository enquiryAddressRepository;
	
	@Autowired
	EnquiryContactRepository enquiryContactRepository;
	
	@Autowired
	EnquiryCourseRepository enquiryCourseRepository;
	
	@Autowired
	EnquiryFollowUpRepository enquiryFollowUpRepository;
	
	@Autowired
	EnquirySourceRepository enquirySourceRepository;
	
	@Autowired
	InstituteRepository instituteRepository;
	
	
	/* Course Starts Here*/
	
	@GetMapping("/test-save-course")
	public String testSaveCourse() {
		Course cs = null; //new Course(1, new BigDecimal(2000), 1, "VTU");
		courseRepository.save(cs);
		return "success";
	}
	
	@GetMapping("/test-course-list")
	public List<Course> courseList() {
		return courseRepository.findAll();
	}
	
	/* Course Ends Here*/
	
	
	/* Enquiry Starts Here*/
	
	@GetMapping("/test-save-enquiry")
	public String testSaveEnquiry() {
		Enquiry ecs = null;//new Enquiry(new BigDecimal(1000), 1, 1, 1, "Best Course");
		enquiryRepository.save(ecs);
		return "success";
	}
	
	@GetMapping("/test-enquiry-list")
	public List<Enquiry> enquiryList() {
		return enquiryRepository.findAll();
	}
	
	/* Course Ends Here*/
	
	/* EnquiryAddress Starts Here*/
	
	@GetMapping("/test-save-enquiry-address")
	public String testSaveEnquiryAddress() {
		EnquiryAddress ecs = null;//new EnquiryAddress("Karnataka", "India", "Kiran", "577422");
		enquiryAddressRepository.save(ecs);
		return "success";
	}
	
	@GetMapping("/test-enquiry-address-list")
	public List<EnquiryAddress> enquiryAddressList() {
		return enquiryAddressRepository.findAll();
	}
	
	/* EnquiryAddress Ends Here*/
	
	/* Enquiry Contact Starts Here*/
	
	@GetMapping("/test-save-contact")
	public String testSaveEnquiryContact() {
		Contact ecs = null;//new Contact("kbs71190@gmail.com", 1, "Kiran", 1, "9740594382");
		enquiryContactRepository.save(ecs);
		return "success";
	}
	
	@GetMapping("/test-contact-list")
	public List<Contact> contactList() {
		return enquiryContactRepository.findAll();
	}
	
	/* Enquiry Contact Ends Here*/
	
	/* Enquiry Course Starts Here*/
	
	@GetMapping("/test-save-enquiry-course")
	public String testSaveEnquiryCourse() {
		EnquiryCourse ecs = null;//new EnquiryCourse(1, 1);
		enquiryCourseRepository.save(ecs);
		return "success";
	}
	
	@GetMapping("/test-enquiry-course-list")
	public List<EnquiryCourse> enquiryCourseList() {
		return enquiryCourseRepository.findAll();
	}
	
	/* Enquiry Course Ends Here*/
	
	/* EnquiryFollowUp Starts Here*/
	
	@GetMapping("/test-save-enquiry-followup")
	public String testSaveEnquiryFollowUp() {
		Contact ecs = null;//new Contact("kbs71190@gmail.com", 1, "Kiran", 1, "9740594382");
		enquiryContactRepository.save(ecs);
		return "success";
	}
	
	@GetMapping("/test-enquiry-followup-list")
	public List<Contact> enquiryFollowUpList() {
		return enquiryContactRepository.findAll();
	}
	
	/* EnquiryFollowUp Ends Here*/
	
	/* Enquiry Source Starts Here*/
	
	@GetMapping("/test-save-source")
	public String testSaveSource() {
		EnquirySource es = new EnquirySource("Test");
		enquirySourceRepository.save(es);
		return "success";
	}
	
	@GetMapping("/test-source-list")
	public List<EnquirySource> enquirySourceList() {
		EnquirySource es = new EnquirySource("Test");
		return enquirySourceRepository.findAll();
	}
	
	/* Enquiry Source Ends Here*/
	
	/* Institue Starts Here*/
	
	@GetMapping("/test-save-institute")
	public String testSaveInstitute() {
		Institute ins = null;//new Institute(1, "BCE");
		instituteRepository.save(ins);
		return "success";
	}
	
	@GetMapping("/test-institute-list")
	public List<Institute> instituteList() {
		return instituteRepository.findAll();
	}
	
	/* Institue Ends Here*/
	
}
