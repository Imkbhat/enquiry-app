package com.luv2code.enquiryapp.repo;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.luv2code.enquiryapp.domain.EnquirySource;

public interface EnquirySourceRepository extends JpaRepository<EnquirySource, Integer> {
	
	
	@Query("SELECT e.enquirySourceId AS enquirySourceId, e.name AS name FROM EnquirySource AS e")
	public List<Map<Integer, Object>> getEnquirySourceList();

}
