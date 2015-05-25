package com.haicai.portlet.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
@RequestMapping("/individual")
public class ProfileController {

	@Autowired
	private ProfileService profileService;

	@Autowired
	private PortletService portletService;

	@RequestMapping(value = "profile.do")
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

		return "individual/profile";
		// return "individualProfile";
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
		if (originEmailcontact == null && !email.isEmpty()) {
			this.portletService.createContact(user, email, ContactType.EMAIL, null);
		} else if (originEmailcontact != null && !originEmailcontact.getInfo().equals(email)) {
			this.profileService.disableContact(originEmailcontact);
			this.portletService.createContact(user, email, ContactType.EMAIL, null);
		}

		Contact originTelcontact = this.portletService.findSpecificActiveContact(user, ContactType.TELEPHONE, null);
		if (originTelcontact == null && !telephone.isEmpty()) {
			this.portletService.createContact(user, telephone, ContactType.TELEPHONE, null);
		} else if (originTelcontact != null && !originTelcontact.getInfo().equals(telephone)) {
			this.profileService.disableContact(originTelcontact);
			this.portletService.createContact(user, telephone, ContactType.TELEPHONE, null);
		}

		Contact originQQcontact = this.portletService.findSpecificActiveContact(user, ContactType.OTHER, "qq");
		if (originQQcontact == null && !qq.isEmpty()) {
			this.portletService.createContact(user, qq, ContactType.OTHER, "qq");
		} else if (originQQcontact != null && !originQQcontact.getInfo().equalsIgnoreCase(qq)) {
			this.profileService.disableContact(originQQcontact);
			this.portletService.createContact(user, qq, ContactType.OTHER, "qq");
		}

		Contact originWebchatcontact = this.portletService.findSpecificActiveContact(user, ContactType.OTHER, "webchat");
		if (originWebchatcontact == null && !webchat.isEmpty()) {
			this.portletService.createContact(user, webchat, ContactType.OTHER, "webchat");
		} else if (originWebchatcontact != null && !originWebchatcontact.getInfo().equalsIgnoreCase(webchat)) {
			this.profileService.disableContact(originWebchatcontact);
			this.portletService.createContact(user, webchat, ContactType.OTHER, "webchat");
		}

		return "success";
	}

	@RequestMapping(value = "editPerHistory.do")
	public @ResponseBody
	String editPerHistoriesTable(@RequestParam(value = "username", required = false) String username, @RequestParam(value = "personalHistoryId", required = false) int personalHistoryId, @RequestParam(value = "university", required = false) String university, @RequestParam(value = "major", required = false) String major, @RequestParam(value = "universityDegree", required = false) String universityDegree, @RequestParam(value = "graduationYear", required = false) String graduationYear) {
		username = "email@email.com";
		User user = this.portletService.findUserByUserName(username);

		PersonalHistory personalHistory = this.profileService.findPersonalHistory(personalHistoryId);
		if (!personalHistory.getUniversity().equals(university) || !personalHistory.getMajor().equals(major) || !personalHistory.getUniversityDegree().getDegree().equals(universityDegree) || !personalHistory.getGraduationYear().equals(graduationYear)) {
			this.portletService.updatePersonalHistory(personalHistoryId, university, UniversityDegree.valueOf(universityDegree), major, graduationYear);
		}
		return "success";
	}

	@RequestMapping(value = "editAward.do", method = RequestMethod.POST)
	public @ResponseBody
	String editAwardsTable(@RequestParam(value = "username", required = false) String username, @RequestParam(value = "awardId", required = false) int awardId, @RequestParam(value = "awardDescription", required = false) String awardDescription, HttpServletResponse response) {

		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE");
		response.addHeader("Access-Control-Allow-Headers", "Content-Type");

		username = "email@email.com";
		User user = this.portletService.findUserByUserName(username);
		Award award = this.profileService.findAward(awardId);
		if (!award.getDescription().equals(awardDescription)) {
			this.portletService.updateAward(award.getId(), award.getType(), awardDescription, award.getReferrer(), award.getOther());
		}
		return "success";
	}
}
