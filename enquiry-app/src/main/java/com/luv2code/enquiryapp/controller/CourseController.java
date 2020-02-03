package com.luv2code.enquiryapp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luv2code.enquiryapp.domain.Course;
import com.luv2code.enquiryapp.domain.Institute;
import com.luv2code.enquiryapp.repo.CourseRepository;
import com.luv2code.enquiryapp.repo.InstituteRepository;

@Controller
public class CourseController {
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private InstituteRepository instituteRepository;
	
 	@GetMapping("/courses")
	public String getCourseForm(Model m) {
 		m.addAttribute("courseCmd", new Course());
 		return "course-form";
	}
 	
 	@GetMapping("/save-course")
	public String getCourseForm(@ModelAttribute Course course) {
 		courseRepository.save(course);
 		return "redirect:/courses";//redirect
	}
 	
 	@ModelAttribute("instituteList")
 	public List<Institute> getInstituteList(){
 		//return instituteRepository.findAll(); expensive method, as it queries all sub tables for individual records.
 		return instituteRepository.getInstitueCustomList();
 	}
 	
 	@ModelAttribute("courseList")
 	public List<Map<String, Object>> getCourseList(){
 		//return instituteRepository.findAll(); expensive method, as it queries all sub tables for individual records.
 		//return courseRepository.findAll();
 		return courseRepository.getCourses();
 	}
 	
 	
 	//If you want to check, weather what data is coming through backend, in JSON Format.
 	@GetMapping("/temp-course")
 	@ResponseBody
 	public List<Map<String, Object>> tempCourseList(){
 		//return instituteRepository.findAll(); expensive method, as it queries all sub tables for individual records.
 		//return courseRepository.findAll();
 		return courseRepository.getCourses();
 	}
 	
 	/**
 	 * 1. Interface projection.
 	 * 2. Class Based Projection (For limited columns, creating class object in Query. ex: getInstitueCustomList() method).
 	 * 3. Map Based Projection.
 	 */
}
