package com.luv2code.enquiryapp.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.luv2code.enquiryapp.domain.Institute;
import com.luv2code.enquiryapp.dto.InstituteDTO;

public interface InstituteRepository extends JpaRepository<Institute, Integer> {

	@Query("SELECT i.instituteId AS instituteId, i.name AS name, i.contact.phone AS phone, i.contact.email AS email, i.contact.permanentAddress.city AS city FROM Institute AS i")
	public List<InstituteDTO> getInstitueList();

	@Query("SELECT new com.luv2code.enquiryapp.domain.Institute(i.instituteId, i.name) FROM Institute AS i")
	public List<Institute> getInstitueCustomList(); //Gives limited values. This is called Class Based Projection.

}
