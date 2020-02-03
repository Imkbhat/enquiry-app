package com.luv2code.enquiryapp.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.tomcat.jni.Address;

import com.fasterxml.jackson.annotation.JsonInclude;


/**
 * The persistent class for the enquiry_address database table.
 * 
 */
@Entity
@Table(name="enquiry_address" , schema = "enquiry")
public class EnquiryAddress implements Serializable {
	

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)    
    @Column(name = "enquiry_address_id")
    private Integer addressId;
    
    @Column(name = "detail")
    private String detail;
    @Column(name = "city")
    private String city;
    @Column(name = "country")
    private String country;
    @Column(name = "zip_code")
    private Integer zip;
    
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Transient   
    private List<Contact> contactList;   
   
    public EnquiryAddress() {
    }

    public EnquiryAddress(Integer addressId) {
        this.addressId = addressId;
    }

    public EnquiryAddress(String detail) {
        this.detail = detail;
    }
    

    public EnquiryAddress(String detail, String city, String country, Integer zip) {
        this.detail = detail;
        this.city = city;
        this.country = country;
        this.zip = zip;
    }
    

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Integer getZip() {
        return zip;
    }

    public void setZip(Integer zip) {
        this.zip = zip;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (addressId != null ? addressId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Address)) {
            return false;
        }
        EnquiryAddress other = (EnquiryAddress) object;
        if ((this.addressId == null && other.addressId != null) || (this.addressId != null && !this.addressId.equals(other.addressId))) {
            return false;
        }
        return true;
    }

    @Override
	public String toString() {
		return "EnquiryAddress [addressId=" + addressId + "]";
	}

	public List<Contact> getContactList() {
        return contactList;
    }

    public void setContactList(List<Contact> contactList) {
        this.contactList = contactList;
    }
}