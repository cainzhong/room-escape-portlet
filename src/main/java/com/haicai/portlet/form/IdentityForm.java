package com.haicai.portlet.form;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

/**
 * Create Identity form for identity confirm page submit
 * 
 * @author Jason
 *
 */
public class IdentityForm implements Serializable{

 
     private static final long serialVersionUID = 1141872662934884102L;

     private String currentCountry;
     
     private String currentCity;
     
     private String idType;
     
     private String idNumber;
     
     private MultipartFile file;


	public String getCurrentCountry() {
		return currentCountry;
	}

	public void setCurrentCountry(String currentCountry) {
		this.currentCountry = currentCountry;
	}

	public String getCurrentCity() {
		return currentCity;
	}

	public void setCurrentCity(String currentCity) {
		this.currentCity = currentCity;
	}

	public String getIdType() {
		return idType;
	}

	public void setIdType(String idType) {
		this.idType = idType;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
     
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

}