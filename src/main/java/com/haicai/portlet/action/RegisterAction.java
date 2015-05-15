package com.haicai.portlet.action;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.haicai.portlet.form.RegisterForm;

/**
 * This class is for register action
 * 
 * @author Jason
 *
 */
@Component
public class RegisterAction implements Serializable{

 
     private static final long serialVersionUID = 1141872662934884102L;

     public boolean checkInfoCorrect(RegisterForm registerForm){

           if("123@test.com".equals(registerForm.getEmail()) && ("123").equals(registerForm.getName())){
        	   		System.out.println("Success!");
                 return true;
            }
           System.out.println("Fail");
           return false;
      }

}