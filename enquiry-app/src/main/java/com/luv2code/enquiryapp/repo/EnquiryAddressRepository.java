package com.luv2code.enquiryapp.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.luv2code.enquiryapp.domain.EnquiryAddress;

public interface EnquiryAddressRepository extends JpaRepository<EnquiryAddress, Integer> {

}
