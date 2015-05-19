package com.haicai.portlet.form;

import java.io.Serializable;

/**
 * Create RegisterForm for register page submit
 * 
 * @author Jason
 *
 */
public class RegisterForm implements Serializable{

 
     private static final long serialVersionUID = 1141872662934884102L;

     private String name;
     
     private String actname;
     
     private String engname;
     
     private String gender;
     
     private String cpassword;
     
     private String password_again;
     
     private String email;
     
     private String phoneno;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getActname() {
		return actname;
	}

	public void setActname(String actname) {
		this.actname = actname;
	}

	public String getEngname() {
		return engname;
	}

	public void setEngname(String engname) {
		this.engname = engname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCpassword() {
		return cpassword;
	}

	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}

	public String getPassword_again() {
		return password_again;
	}

	public void setPassword_again(String password_again) {
		this.password_again = password_again;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
     

}