package com.luv2code.enquiryapp.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.enquiryapp.command.EnquiryCommand;
import com.luv2code.enquiryapp.domain.Contact;
import com.luv2code.enquiryapp.domain.Enquiry;
import com.luv2code.enquiryapp.domain.EnquiryAddress;
import com.luv2code.enquiryapp.domain.EnquiryCourse;
import com.luv2code.enquiryapp.domain.EnquirySource;
import com.luv2code.enquiryapp.domain.Institute;
import com.luv2code.enquiryapp.repo.CourseRepository;
import com.luv2code.enquiryapp.repo.EnquiryAddressRepository;
import com.luv2code.enquiryapp.repo.EnquiryContactRepository;
import com.luv2code.enquiryapp.repo.EnquiryCourseRepository;
import com.luv2code.enquiryapp.repo.EnquiryRepository;
import com.luv2code.enquiryapp.repo.EnquirySourceRepository;
import com.luv2code.enquiryapp.repo.InstituteRepository;

@Service
public class CommonService {
	
	@Autowired
	private EnquiryAddressRepository enquiryAddressRepository;
	
	@Autowired
	private EnquiryContactRepository enquiryContactRepository;
	
	@Autowired
	private InstituteRepository instituteRepository;
	
	@Autowired
	private EnquiryRepository enquiryRepository; 
	
	@Autowired
	private EnquirySourceRepository enquirySourceRepository;
	
	@Autowired
	private EnquiryCourseRepository enquiryCourseRepository;
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Transactional
	public void saveInstitute(Institute inst) {
		//Enquiry Address(CHild most)
		enquiryAddressRepository.save(inst.getContact().getPermanentAddress());
		
		//Contact
		enquiryContactRepository.save(inst.getContact());
		
		//Institute
		instituteRepository.save(inst);
	}
	
	
	@Transactional
	public void saveEnquiry(EnquiryCommand command) {
		//Address child most
		EnquiryAddress a = command.getEnquiry().getContact().getPermanentAddress();
		enquiryAddressRepository.save(a);
		
		//Contact Second child
		Contact c = command.getEnquiry().getContact();
		enquiryContactRepository.save(c);
		
		//Enquiry
		Enquiry e = command.getEnquiry();
		e.setInstitute(instituteRepository.getOne(e.getInstitute().getInstituteId()));//will not hit the database
		//not recommond to call findById, will hit the database and return the record.
		//If we are showing data somewhere and do we need to process, then we need to fetch.
		e.setEnquirySource(enquirySourceRepository.getOne(e.getEnquirySource().getEnquirySourceId()));
		 
		Date d = new Date();
		e.setDoe(d);
		
		enquiryRepository.save(e);
		
		//for checkboxes.
		Integer[] courseIds = command.getCourses();
		for(Integer courseId : courseIds) {
			EnquiryCourse enqCrs = new EnquiryCourse();
			enqCrs.setEnquiry(e);
			enqCrs.setCourse(courseRepository.getOne(courseId));
			enquiryCourseRepository.save(enqCrs);
		}
		
	}
}
