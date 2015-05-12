package com.haicai.portlet.action;

import java.io.Serializable;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;

@Component

public class RegisterAction implements Serializable{

 
     private static final long serialVersionUID = 1141872662934884102L;

     public boolean checkInfoCorrect(HttpServletRequest request){

           if("123@test.com".equals(request.getParameter("cemail")) && ("123").equals(request.getParameter("cname"))){
                 return true;
            }
           return false;
      }

}