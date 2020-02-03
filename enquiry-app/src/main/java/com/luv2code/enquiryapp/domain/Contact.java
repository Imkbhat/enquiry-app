package com.luv2code.enquiryapp.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonInclude;


/**
 * The persistent class for the enquiry_contact database table.
 * 
 */
@Entity
@Table(name="enquiry_contact" , schema = "enquiry")
public class Contact implements Serializable {
	


    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "enquiry_contact_id")
    private Integer contactId;
    @Column(name = "name")
    private String name;
    @Column(name = "email")
    private String email;
    @Column(name = "phone")
    private String phone;
    @JoinColumn(name = "local_address", referencedColumnName = "enquiry_address_id")
    @ManyToOne
    private EnquiryAddress localAddress;
    
    @JoinColumn(name = "permanent_address", referencedColumnName = "enquiry_address_id")
    @ManyToOne
    private EnquiryAddress permanentAddress;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Transient
    private List<Enquiry> enquiryList;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Transient
    
    private List<Institute> instituteList;

    public Contact() {
    }

    public Contact(Integer contactId) {
        this.contactId = contactId;
    }

    public Contact(String name, String email, String phone, EnquiryAddress localAddress, EnquiryAddress permanentAddress) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.localAddress = localAddress;
        this.permanentAddress = permanentAddress;
    }

    public Integer getContactId() {
        return contactId;
    }

    public void setContactId(Integer contactId) {
        this.contactId = contactId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public EnquiryAddress getLocalAddress() {
        return localAddress;
    }

    public void setLocalAddress(EnquiryAddress localAddress) {
        this.localAddress = localAddress;
    }

    public EnquiryAddress getPermanentAddress() {
        return permanentAddress;
    }

    public void setPermanentAddress(EnquiryAddress permanentAddress) {
        this.permanentAddress = permanentAddress;
    }

    public List<Enquiry> getEnquiryList() {
        return enquiryList;
    }

    public void setEnquiryList(List<Enquiry> enquiryList) {
        this.enquiryList = enquiryList;
    }

    public List<Institute> getInstituteList() {
        return instituteList;
    }

    public void setInstituteList(List<Institute> instituteList) {
        this.instituteList = instituteList;
    }
    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (contactId != null ? contactId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Contact)) {
            return false;
        }
        Contact other = (Contact) object;
        if ((this.contactId == null && other.contactId != null) || (this.contactId != null && !this.contactId.equals(other.contactId))) {
            return false;
        }
        return true;
    }

	@Override
	public String toString() {
		return "Contact [contactId=" + contactId + "]";
	}
}