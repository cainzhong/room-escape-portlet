package com.haicai.portlet.validator;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.binding.validation.ValidationContext;
import org.springframework.stereotype.Component;
import com.haicai.portlet.form.IdentityForm;
import com.haicai.portlet.service.PortletService;


/**
* This class is used for identity form submit validate
*
* @author Jason
*
*/
@Component
public class IdentityFormValidator{

	private static final Logger LOGGER = LoggerFactory.getLogger(IdentityFormValidator.class);

	@Autowired
	private PortletService portletService;

	public void validateIdentityConfirm(IdentityForm identityForm, ValidationContext context) {

		MessageContext messages = context.getMessageContext();

		String errorMsg = null;

		if (identityForm.getFile() == null) {
			LOGGER.error("User's profile file is empty!");
			errorMsg = "T_ERROR";
			messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
		}
		if (StringUtils.isEmpty(identityForm.getCurrentCountry())) {
			LOGGER.error("User's current country is empty!");
			errorMsg = "T_ERROR";
			messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
		}
		if (StringUtils.isEmpty(identityForm.getCurrentCity())) {
			LOGGER.error("User's current city is empty!");
			errorMsg = "T_ERROR";
			messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
		}
		if (StringUtils.isEmpty(identityForm.getIdType())) {
			LOGGER.error("User's id type is empty!");
			errorMsg = "T_ERROR";
			messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
		}
		if (StringUtils.isEmpty(identityForm.getIdNumber())) {
			LOGGER.error("User's id number is empty!");
			errorMsg = "T_ERROR";
			messages.addMessage(new MessageBuilder().error().code(errorMsg).build());
		}

	}

}