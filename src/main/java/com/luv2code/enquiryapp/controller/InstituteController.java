package com.luv2code.enquiryapp.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luv2code.enquiryapp.domain.Institute;
import com.luv2code.enquiryapp.repo.InstituteRepository;
import com.luv2code.enquiryapp.service.CommonService;

@Controller
public class InstituteController {
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private InstituteRepository instituteRepository; 

	@RequestMapping("/institute-form")
	public String institute(Model model) {
		Institute instituteCmd = new Institute();
		model.addAttribute("instituteCmd", instituteCmd);
		return "institute-form";
	}
	
	@RequestMapping("/save-institute")
	public String save(@ModelAttribute Institute institute) {
		institute.getContact().setName(institute.getName());
		institute.setDoe(new Date());//Exact as DateUtil.getCurrentTimeStamp(new java.sql.Timestamp(new Date().getTime()))
		commonService.saveInstitute(institute);
		return "redirect:/institute-list";
	}
	
	@RequestMapping("/institute-list")
	public String list(Model m) {
		//m.addAttribute("instList", instituteRepository.findAll());
		//Beacuse for every record in institue table, it calls SELECT query for contact and address using institue id.
		m.addAttribute("instList",instituteRepository.getInstitueList());
		return "institute-list";
	}
}
