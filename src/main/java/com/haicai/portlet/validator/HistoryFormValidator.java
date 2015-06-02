package com.haicai.portlet.validator;

 

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.binding.validation.ValidationContext;
import org.springframework.stereotype.Component;
import com.haicai.portlet.form.HistoryForm;
import com.haicai.portlet.service.PortletService;

/**
* This class is used for history form submit validate
*
* @author Jason
*
*/
@Component
public class HistoryFormValidator{

     private static final Logger LOGGER = LoggerFactory.getLogger(HistoryFormValidator.class);

     @Autowired

     private PortletService portletService;
 
     public void validatePersonalHistory(HistoryForm historyForm, ValidationContext context) {

            MessageContext messages = context.getMessageContext();

            String errorMsg = null;

           if (StringUtils.isEmpty(historyForm.getUniversity())) {
                 LOGGER.error("User's current country is empty!");
                 errorMsg = "T_ERROR";
                 messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
            }
           if (StringUtils.isEmpty(historyForm.getDegree())) {
                 LOGGER.error("User's current city is empty!");
                 errorMsg = "T_ERROR";
                 messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
            }
           if (StringUtils.isEmpty(historyForm.getMajor())) {
               LOGGER.error("User's major is empty!");
               errorMsg = "T_ERROR";
               messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
          }
           if (StringUtils.isEmpty(historyForm.getGraduationTime())) {
                 LOGGER.error("User's id type is empty!");
                 errorMsg = "T_ERROR";
                 messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
            }

      }

}

 