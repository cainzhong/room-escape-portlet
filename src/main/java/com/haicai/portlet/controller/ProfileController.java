package com.haicai.portlet.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haicai.domain.Contact;
import com.haicai.domain.User;
import com.haicai.domain.type.ContactType;
import com.haicai.portlet.service.ProfileService;

/**
 * @author Cain
 * 
 */
@Controller
public class ProfileController {

	@Autowired
	private ProfileService profileService;

	@RequestMapping("individualProfile.do")
	public String renderToIndividualProfile(@RequestParam(value = "username",required=false) String username, Model model) {
		username="email@email.com";
		
		Map<String, Object> map = this.profileService.findIndividualProfileInfoForUser(username);

		List<Contact> contactList= (List<Contact>) map.get("contactList");
		for(Contact contact:contactList){
			if(contact.getType().equals(ContactType.EMAIL)){
				model.addAttribute("email", contact.getInfo());
			}
			if(contact.getType().equals(ContactType.TELEPHONE)){
				model.addAttribute("telephone", contact.getInfo());
			}
			if(contact.getType().equals(ContactType.OTHER) && contact.getOtherDdescription().equalsIgnoreCase("WebChat")){
				model.addAttribute("qq", contact.getInfo());
			}
		}
		
		model.addAttribute("user", map.get("user"));
		model.addAttribute("personalHistories", map.get("personalHistories"));
		model.addAttribute("awardsList", map.get("awardsList"));
		
		return "individualProfile";
	}
	
	@RequestMapping(value="editIndProfile.do", method = RequestMethod.POST)
	public @ResponseBody String editBasicInfoTable(@RequestBody User user,HttpServletRequest request){
		String realName=user.getRealName();
		System.out.println(realName);
		return realName;
	}
	
}