package com.luv2code.enquiryapp.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luv2code.enquiryapp.command.EnquiryCommand;
import com.luv2code.enquiryapp.domain.Course;
import com.luv2code.enquiryapp.domain.Institute;
import com.luv2code.enquiryapp.repo.CourseRepository;
import com.luv2code.enquiryapp.repo.EnquiryRepository;
import com.luv2code.enquiryapp.repo.EnquirySourceRepository;
import com.luv2code.enquiryapp.repo.InstituteRepository;
import com.luv2code.enquiryapp.service.CommonService;
import com.luv2code.enquiryapp.util.StringUtils;

@Controller
public class EnquiryController {
	
	@Autowired
	private InstituteRepository instituteRepository;
	
	@Autowired
	private EnquirySourceRepository enquirySourceRepository;
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private EnquiryRepository enquiryRepository;
	
	@RequestMapping("/")
	public String index(Model model) {
		model.addAttribute("enquiryCmd", new EnquiryCommand());
		return "index";//index.html page
	}
	
	@GetMapping("/get-courses")
	@ResponseBody
	public List<Course> getCoursesByInstituteId(@RequestParam Integer instId) {
		return courseRepository.findCourseListByInstitute_instituteId(instId);
	}
	
	@GetMapping("/test-get-ids")
	@ResponseBody
	public List<String> getAllIds() {
		/*
		 * List<Integer> allIds = enquiryRepository.getAllEnquiryIds(); String value =
		 * StringUtils.toCommaSeperatedString(allIds.stream().mapToInt(Integer::intValue
		 * ).toArray()); return value;
		 */
		return enquiryRepository.getSubstring();
	}
	
	//testing textcat_commacat
	@GetMapping("/test-get-ids-text")
	@ResponseBody
	public String getAllTextCatIds() {
		/*
		 * List<Integer> allIds = enquiryRepository.getAllEnquiryIds(); String value =
		 * StringUtils.toCommaSeperatedString(allIds.stream().mapToInt(Integer::intValue
		 * ).toArray()); return value;
		 */
		return enquiryRepository.getSubstringTextCatCommaCat();
	}
	
	@RequestMapping("/save-enquiry")
	public String save(@ModelAttribute EnquiryCommand command) {
		commonService.saveEnquiry(command);
		return "redirect:/enq-list";
	}
	
	@ModelAttribute("instituteList")
	public List<Institute> getInstituteList() {
		return instituteRepository.getInstitueCustomList();
	}
	
	
	@ModelAttribute("sourceList") 
	public List<Map<Integer,Object>> getEnquirySourceList() { 
		  return enquirySourceRepository.getEnquirySourceList();
	}
	
	@RequestMapping("/enq-list")
	public String enquiryList(@RequestParam(required = false) Integer instId, Model m) {
		
		return "/enquiry-list";
	}
	
	 
}
