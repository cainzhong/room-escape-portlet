package com.haicai.portlet.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.binding.validation.ValidationContext;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.haicai.portlet.form.RegisterForm;

/**
 * This class is used for register form submit validate
 * 
 * @author Jason
 *
 */
@Component
public class RegisterFormValidator {
	
	public void validateRegister(RegisterForm registerForm, ValidationContext context){

        MessageContext messages = context.getMessageContext();
        String errorMsg = null;
       if(StringUtils.isEmpty(registerForm.getName())){
              errorMsg = "T_ERROR";
              messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
        }
       if(StringUtils.isEmpty(registerForm.getActname())){
              errorMsg = "T_ERROR";
              messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
        }
       if(StringUtils.isEmpty(registerForm.getEngname())){
              errorMsg = "T_ERROR";
              messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
        }
       if(StringUtils.isEmpty(registerForm.getGender())){
              errorMsg = "T_ERROR";
              messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
        }
       if(StringUtils.isEmpty(registerForm.getCpassword())){
              errorMsg = "T_ERROR";
              messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
        }
       if(StringUtils.isEmpty(registerForm.getEmail()) && this.isEmail(registerForm.getEmail())){
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
