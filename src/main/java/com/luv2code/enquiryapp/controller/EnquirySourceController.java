package com.luv2code.enquiryapp.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luv2code.enquiryapp.domain.EnquirySource;
import com.luv2code.enquiryapp.repo.EnquirySourceRepository;

@Controller
public class EnquirySourceController {
	
	@Autowired
	private EnquirySourceRepository enquirySourceRepository;

	@RequestMapping("/sources")
	public String enquirySources(Model model) {
		EnquirySource enqSrcCmd = new EnquirySource();
		model.addAttribute("enqSrcCmd", enqSrcCmd);
		return "/sources"; //sources.html
	}
	
	@RequestMapping("/save-enquiry-source")
	public String saveEnquirySources(@ModelAttribute("enqSrcCmd") EnquirySource enqSrc) {
		enquirySourceRepository.save(enqSrc);
		return "redirect:/sources"; //sources.html
	}
	
	@ModelAttribute("enquirySourceList")
	public List<EnquirySource> getEnquirySourceList() {
		return 	enquirySourceRepository.findAll();
	}
	
	@RequestMapping("/enquiry-source-delete/{id}")
	public String delete(@PathVariable Integer id) {
		enquirySourceRepository.deleteById(id);
		return "redirect:/sources"; //sources.html
	}
	
	@RequestMapping("/enquiry-source-edit/{id}")
	public String edit(@PathVariable Integer id, Model model) {
		EnquirySource enqSrcCmd = enquirySourceRepository.findById(id).get();
		model.addAttribute("enqSrcCmd", enqSrcCmd);
		return "/sources"; //sources.html
	}
}
