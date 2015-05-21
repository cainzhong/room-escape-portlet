package com.haicai.portlet.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haicai.domain.Award;
import com.haicai.domain.Contact;
import com.haicai.domain.PersonalHistory;
import com.haicai.domain.User;
import com.haicai.domain.type.ContactType;
import com.haicai.domain.type.UniversityDegree;
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
			if (contact.getType().equals(ContactType.OTHER) && contact.getOtherDdescription().equalsIgnoreCase("qq")) {
				model.addAttribute("qq", contact.getInfo());
			}
			if (contact.getType().equals(ContactType.OTHER) && contact.getOtherDdescription().equalsIgnoreCase("webchat")) {
				model.addAttribute("webchat", contact.getInfo());
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
	String editBasicInfoTable(@RequestParam(value = "username", required = false) String username, @RequestParam(value = "realName", required = false) String realName, @RequestParam(value = "englishName", required = false) String englishName, @RequestParam(value = "currentCountry", required = false) String currentCountry, @RequestParam(value = "email", required = false) String email, @RequestParam(value = "telephone", required = false) String telephone,
			@RequestParam(value = "qq", required = false) String qq, @RequestParam(value = "webchat", required = false) String webchat) {
		username = "email@email.com";
		User user = this.portletService.findUserByUserName(username);
		this.portletService.updateUser(username, realName, englishName, user.getPassword(), user.getSex(), user.getIdNumber(), user.getIdNumberType(), currentCountry, currentCountry);

		Contact originEmailcontact = this.portletService.findSpecificActiveContact(user, ContactType.EMAIL, null);
		if (originEmailcontact == null) {
			this.portletService.createContact(user, email, ContactType.EMAIL, null);
		} else if (originEmailcontact != null && !originEmailcontact.getInfo().equals(email)) {
			this.profileService.disableContact(originEmailcontact);
			this.portletService.createContact(user, email, ContactType.EMAIL, null);
		}

		Contact originTelcontact = this.portletService.findSpecificActiveContact(user, ContactType.TELEPHONE, null);
		if (originTelcontact == null) {
			this.portletService.createContact(user, telephone, ContactType.TELEPHONE, null);
		} else if (originTelcontact != null && !originTelcontact.getInfo().equals(telephone)) {
			this.profileService.disableContact(originTelcontact);
			this.portletService.createContact(user, telephone, ContactType.TELEPHONE, null);
		}

		Contact originQQcontact = this.portletService.findSpecificActiveContact(user, ContactType.OTHER, "qq");
		if (originQQcontact == null) {
			this.portletService.createContact(user, qq, ContactType.OTHER, "qq");
		} else if (originQQcontact != null && !originQQcontact.getInfo().equalsIgnoreCase(qq)) {
			this.profileService.disableContact(originQQcontact);
			this.portletService.createContact(user, qq, ContactType.OTHER, "qq");
		}

		Contact originWebchatcontact = this.portletService.findSpecificActiveContact(user, ContactType.OTHER, "webchat");
		if (originWebchatcontact == null) {
			this.portletService.createContact(user, webchat, ContactType.OTHER, "webchat");
		} else if (originWebchatcontact != null && !originWebchatcontact.getInfo().equalsIgnoreCase(webchat)) {
			this.profileService.disableContact(originWebchatcontact);
			this.portletService.createContact(user, webchat, ContactType.OTHER, "webchat");
		}

		return "success";
	}

	@RequestMapping(value = "editPerHistories.do")
	public @ResponseBody
	String editPerHistoriesTable(@RequestParam(value = "university", required = false) String university, @RequestParam(value = "major", required = false) String major, @RequestParam(value = "universityDegree", required = false) String universityDegree, @RequestParam(value = "graduationYear", required = false) String graduationYear) {
		String username = "email@email.com";
		User user = this.portletService.findUserByUserName(username);

		List<PersonalHistory> personalHistories = this.portletService.findPersonalHistories(user);
		PersonalHistory personalHistory = personalHistories.get(0);
		if (!personalHistory.getUniversity().equals(university) || !personalHistory.getMajor().equals(major) || !personalHistory.getUniversityDegree().getDegree().equals(universityDegree) || !personalHistory.getGraduationYear().equals(graduationYear)) {
			this.portletService.updatePersonalHistory(personalHistories.get(0).getId(), university, UniversityDegree.valueOf(universityDegree), major, graduationYear);
		}
		return "success";
	}

	@RequestMapping(value = "editAwards.do")
	public @ResponseBody
	String editAwardsTable(@RequestParam(value = "honoraryTitle", required = false) String honoraryTitle, @RequestParam(value = "thesis", required = false) String thesis) {
		String username = "email@email.com";
		User user = this.portletService.findUserByUserName(username);
		List<Award> awards = this.portletService.findAwards(user);
		Award award = awards.get(0);
		return "success";
	}

}
