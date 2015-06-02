package com.haicai.portlet.action;
 
import java.io.IOException;
import java.io.Serializable;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.webflow.execution.RequestContextHolder;

import com.haicai.domain.Contact;
import com.haicai.domain.User;
import com.haicai.domain.type.ContactType;
import com.haicai.domain.type.IdNumberType;
import com.haicai.domain.type.Sex;
import com.haicai.domain.type.Status;
import com.haicai.portlet.form.HistoryForm;
import com.haicai.portlet.form.IdentityForm;
import com.haicai.portlet.form.RegisterForm;
import com.haicai.portlet.service.PortletService;
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
     
     private static final String PASSPORT = "0";

     @Autowired
     private PortletService portletService;
   
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
	       //Set user to flowScope
	       RequestContextHolder.getRequestContext().getFlowScope().put("user", user);
	       
	       return SUCCESS;
      }

    
    /**
     * Update user for other information
     *
     * @param form identityForm
     * @param request HttpServletRequest
     * @throws IOException
     */
   public void updateUser(IdentityForm form, HttpServletRequest request) throws IOException{
	   		//Get root path of server
	   		String rootPath = request.getSession().getServletContext().getRealPath("/");
	   		LOGGER.info(rootPath+"WEB-INF/uploadImg/"+form.getFormatedFileName());
	   		//Convert file to byte[]
	   		Path path = Paths.get(rootPath+"WEB-INF/uploadImg/"+form.getFormatedFileName());
	   		byte[] data = Files.readAllBytes(path);
            User user = (User) RequestContextHolder.getRequestContext().getFlowScope().get("user");
            this.portletService.updateUser(user.getUsername(), user.getRealName(),
                  user.getEnglishName(), user.getPassword(), user.getSex(),
                  form.getIdNumber(), PASSPORT.equals(form.getIdType())?IdNumberType.PASSPORT:IdNumberType.IDENTITYCARD,
                  form.getCurrentCountry(), form.getCurrentCity(),data);
    }
   
     public void createPersonalHistoryForUser(HistoryForm form) {
    	 User user = (User) RequestContextHolder.getRequestContext().getFlowScope().get("user");
    	 String graduationYear = this.convertStringToTimestamp(form.getGraduationTime());
    	 this.portletService.createPersonalHistory(user, form.getUniversity(), form.getDegree(), form.getDegree(), graduationYear);
    	 LOGGER.info("User's personal history has been created!!!!!");
     }
   

	   /**
	    * Create award for the user
	    * 
	    * @param request HttpServletRequest
	    */
	public void createAwardForUser(HttpServletRequest request){
	       User user = (User) RequestContextHolder.getRequestContext().getFlowScope().get("user");
	       String rowOrder = request.getParameter("tblAppendGrid_rowOrder");
	       	for (String row : rowOrder.split(",")) {
	             String awardType = request.getParameter("tblAppendGrid_awardType_" + row);
	             String description = request.getParameter("tblAppendGrid_description_" + row);
	             String referrer = request.getParameter("tblAppendGrid_referrer_" + row);
	             String other = request.getParameter("tblAppendGrid_other_" + row);
	            // Save to database or other operations
	           this.portletService.createAward(user, awardType, description, referrer, other);
	         }
	        LOGGER.info("User's award has been created!!!!!");
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
	
    private String convertStringToTimestamp(String graduationYear){
        Date date = null ;
        DateFormat formatter = new SimpleDateFormat("mm/dd/yyyy");
         try {
             date = (Date)formatter.parse(graduationYear);
       } catch (ParseException e) {
            // TODO Auto-generated catch block
             e.printStackTrace();
       }
          java.sql.Timestamp timeStampDate = new Timestamp(date.getTime());
          DateFormat sdf = new SimpleDateFormat("yyyy");
          String tsStr = "";
          tsStr = sdf.format(timeStampDate);
          return tsStr;
 }

}