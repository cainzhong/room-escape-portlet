package com.haicai.portlet.action;
 
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.haicai.domain.Contact;
import com.haicai.domain.User;
import com.haicai.domain.type.ContactType;
import com.haicai.domain.type.Sex;
import com.haicai.domain.type.Status;
import com.haicai.portlet.form.RegisterForm;
import com.haicai.portlet.service.RegisterService;

 

/**
* This class is for register action
*
* @author Jason
*
*/
@Component
public class RegisterAction implements Serializable{

     private static final long serialVersionUID = 1141872662934884102L;
   
     private static final Logger LOGGER = LoggerFactory.getLogger(RegisterAction.class);
     
     private static final String EMAIL = "EMAIL";
   
     private static final String TELEPHONE = "TELEPHONE";
     
     private static final String SUCCESS = "success";
     
     private static final String FAIL = "fail";

   
     @Autowired
     private RegisterService registerService;

     /** 
      * Create User and related contact information
     * @param registerForm
     * @return String success or fail
     */
    public String createUserAndRelatedContact(RegisterForm registerForm){
	       User user = this.CreateUser(registerForm);
	       try{
	             this.registerService.createUser(user);
	       }catch(Exception e){
	    	   	 LOGGER.error("Duplicated UserName!");
	             return FAIL;
	       }
	       Contact contactEmail = this.CreateRelatedContactForUser(registerForm,EMAIL);
	       Contact contactPhone = this.CreateRelatedContactForUser(registerForm,TELEPHONE);
	       this.registerService.createContactForUser(user, contactEmail);
	       this.registerService.createContactForUser(user, contactPhone);
	       return SUCCESS;
      }


	/**
	 * Create User
	 * 
	 * @param RegisterForm registerForm
	 * @return User user
	 */
	private User CreateUser(RegisterForm form) {
			User user = new User();
			user.setUsername(form.getName());
			user.setRealName(form.getActname());
			user.setEnglishName(form.getEngname());
			user.setPassword(form.getPassword_again());
			user.setSex(Sex.valueOf(form.getGender()));
			user.setCreateTime(new Timestamp(new Date().getTime()));
			user.setUpdateTime(new Timestamp(new Date().getTime()));
			return user;
		}
   


	/**
	 * Crate User related contact information
	 * 
	 * @param RegisterForm registerForm
	 * @param String contactType
	 * @return Contact contact
	 */
	private Contact CreateRelatedContactForUser(RegisterForm form, String contactType){
	       Contact contact = new Contact();
	       contact.setType(ContactType.valueOf(contactType));
	       contact.setInfo(EMAIL.equals(contactType)?form.getEmail():form.getPhoneno());
	       contact.setStatus(Status.ACTIVE);
	       contact.setCreateTime(new Timestamp(new Date().getTime()));
	       contact.setUpdateTime(new Timestamp(new Date().getTime()));
	       return contact;
	     }

}