package com.luv2code.enquiryapp.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.luv2code.enquiryapp.domain.Contact;

public interface EnquiryContactRepository extends JpaRepository<Contact, Integer> {

}
