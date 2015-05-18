package com.haicai.portlet.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haicai.domain.Contact;
import com.haicai.domain.User;
import com.haicai.domain.type.ContactType;
import com.haicai.domain.type.Status;
import com.haicai.portlet.service.PortletService;
import com.haicai.portlet.service.ProfileService;

/**
 * @author Cain
 *
 */
@Controller
public class ProfileController {

	@Autowired
	private ProfileService profileService;

	@Autowired
	private PortletService portletService;

	@RequestMapping("individualProfile.do")
	public String renderToIndividualProfile(@RequestParam(value = "username", required = false) String username, Model model) {
		username = "email@email.com";

		Map<String, Object> map = this.profileService.findIndividualProfileInfoForUser(username);

		List<Contact> contactList = (List<Contact>) map.get("contactList");
		for (Contact contact : contactList) {
			if (contact.getType().equals(ContactType.EMAIL)) {
				model.addAttribute("email", contact.getInfo());
			}
			if (contact.getType().equals(ContactType.TELEPHONE)) {
				model.addAttribute("telephone", contact.getInfo());
			}
			if (contact.getType().equals(ContactType.OTHER) && contact.getOtherDdescription().equalsIgnoreCase("WebChat")) {
				model.addAttribute("qq", contact.getInfo());
			}
		}

		model.addAttribute("user", map.get("user"));
		model.addAttribute("personalHistories", map.get("personalHistories"));
		model.addAttribute("awardsList", map.get("awardsList"));

		return "individualProfile";
	}

	/*
	 * @RequestMapping(value = "editIndProfile.do", method = RequestMethod.POST,
	 * produces = "application/json;charset=UTF-8") public @ResponseBody String
	 * editBasicInfoTable(@RequestBody User user, HttpServletRequest request) {
	 * String realName = user.getRealName();
	 *
	 * JSONArray jsonArray = new JSONArray(); JSONObject jsonItem1 = new
	 * JSONObject(); jsonItem1.put("id", "1"); jsonItem1.put("name",
	 * "My Test Project"); JSONObject jsonItem2 = new JSONObject();
	 * jsonItem2.put("id", "4"); jsonItem2.put("name", "Another one");
	 *
	 * jsonArray.put(jsonItem1); jsonArray.put(jsonItem2);
	 *
	 * return jsonArray.toString(); }
	 */

	@RequestMapping(value = "editIndProfile.do")
	public @ResponseBody
	String editBasicInfoTable(@RequestParam(value = "realName", required = false) String realName, @RequestParam(value = "englishName", required = false) String englishName, @RequestParam(value = "currentCountry", required = false) String currentCountry, @RequestParam(value = "email", required = false) String email, @RequestParam(value = "telephone", required = false) String telephone, @RequestParam(value = "qq", required = false) String qq,
			@RequestParam(value = "webchat", required = false) String webchat) {
		String username = "email@email.com";
		User user = this.portletService.findUserByUserName(username);
		user.setRealName(realName);
		user.setEnglishName(englishName);
		user.setCurrentCountry(currentCountry);
		this.portletService.updateUser(user);

		List<Contact> contactList = this.portletService.findContactInfoForUser(user, null);

		Contact originEmailcontact = this.portletService.findSpecificActiveContactInfoForUser(user, ContactType.EMAIL, null);
		if (originEmailcontact != null && !originEmailcontact.getInfo().equals(email)) {
			originEmailcontact.setStatus(Status.INACTIVE);
			this.portletService.updateContactForUser(user, originEmailcontact);

			Contact emailContact = new Contact();
			emailContact.setType(ContactType.EMAIL);
			emailContact.setInfo(email);
			emailContact.setStatus(Status.ACTIVE);
			emailContact.setCreateTime(new Timestamp(System.currentTimeMillis()));
			this.portletService.addContactForUser(user, emailContact);
		}

		Contact originTelcontact = this.portletService.findSpecificActiveContactInfoForUser(user, ContactType.TELEPHONE, null);
		if (originTelcontact != null && !originTelcontact.getInfo().equals(telephone)) {
			originTelcontact.setStatus(Status.INACTIVE);
			this.portletService.updateContactForUser(user, originTelcontact);

			Contact telContact = new Contact();
			telContact.setType(ContactType.TELEPHONE);
			telContact.setInfo(telephone);
			telContact.setStatus(Status.ACTIVE);
			telContact.setCreateTime(new Timestamp(System.currentTimeMillis()));
			this.portletService.addContactForUser(user, telContact);
		}

		Contact originQQcontact = this.portletService.findSpecificActiveContactInfoForUser(user, ContactType.OTHER, "qq");
		if (originQQcontact != null && !originQQcontact.getInfo().equals(qq)) {
			originQQcontact.setStatus(Status.INACTIVE);
			this.portletService.updateContactForUser(user, originQQcontact);

			Contact qqContact = new Contact();
			qqContact.setType(ContactType.OTHER);
			qqContact.setOtherDdescription("qq");
			qqContact.setInfo(qq);
			qqContact.setStatus(Status.ACTIVE);
			qqContact.setCreateTime(new Timestamp(System.currentTimeMillis()));
			this.portletService.addContactForUser(user, qqContact);
		}

		Contact originWebchatcontact = this.portletService.findSpecificActiveContactInfoForUser(user, ContactType.OTHER, "webchat");
		if (originWebchatcontact != null && originWebchatcontact.getInfo().equals(webchat)) {
			originWebchatcontact.setStatus(Status.INACTIVE);
			this.portletService.updateContactForUser(user, originWebchatcontact);

			Contact webchatContact = new Contact();
			webchatContact.setType(ContactType.OTHER);
			webchatContact.setOtherDdescription("webchat");
			webchatContact.setInfo(webchat);
			webchatContact.setStatus(Status.ACTIVE);
			webchatContact.setCreateTime(new Timestamp(System.currentTimeMillis()));
			this.portletService.addContactForUser(user, webchatContact);
		}

		return realName;
	}

}
