package com.haicai.portlet.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.binding.validation.ValidationContext;
import org.springframework.stereotype.Component;

import com.haicai.portlet.form.RegisterForm;

/**
 * This class is used for register form submit validate
 * 
 * @author Jason
 *
 */
@Component
public class RegisterFormValidator {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(RegisterFormValidator.class);
	
	public void validateRegister(RegisterForm registerForm, ValidationContext context){

        MessageContext messages = context.getMessageContext();
        String errorMsg = null;
       if(StringUtils.isEmpty(registerForm.getName())){
    	   	  LOGGER.error("UserName is empty!");
              errorMsg = "T_ERROR";
              messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
        }
       if(StringUtils.isEmpty(registerForm.getActname())){
    	      LOGGER.error("Actual name is empty!");
              errorMsg = "T_ERROR";
              messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
        }
       if(StringUtils.isEmpty(registerForm.getEngname())){
    	      LOGGER.error("English name is empty!");
              errorMsg = "T_ERROR";
              messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
        }
       if(StringUtils.isEmpty(registerForm.getGender())){
    	      LOGGER.error("User's gender is empty!");
              errorMsg = "T_ERROR";
              messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
        }
       if(StringUtils.isEmpty(registerForm.getCpassword())){
    	      LOGGER.error("User's passwrod is empty!");
              errorMsg = "T_ERROR";
              messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
        }
       if(StringUtils.isEmpty(registerForm.getEmail()) && this.isEmail(registerForm.getEmail())){
    	      LOGGER.error("User's Email is empty!");
              errorMsg = "T_ERROR";
              messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
       }
       if(!NumberUtils.isNumber(registerForm.getPhoneno()) && StringUtils.isEmpty(registerForm.getPhoneno())){
	    	   LOGGER.error("User's phone number is empty!");
	           errorMsg = "T_ERROR";
	           messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
    }
}
       
       /**
        * Validate the user input Email pattern
        *
        * @param email
        * @return boolean flag
        */
       private boolean isEmail(String email){
              Pattern emailPattern = Pattern.compile("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*");
              Matcher matcher = emailPattern.matcher(email);
             if(matcher.find()){
                  return true;
              }
             return false;
        }
}
