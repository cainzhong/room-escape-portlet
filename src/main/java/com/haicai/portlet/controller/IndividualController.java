package com.haicai.portlet.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
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
import com.haicai.portlet.service.IndividualService;
import com.haicai.portlet.service.PortletService;
import com.haicai.portlet.util.PropertiesUtil;

/**
 * @author Cain
 *
 */
@Controller
@RequestMapping("/individual")
public class IndividualController {

	@Autowired
	private IndividualService individualService;

	@Autowired
	private PortletService portletService;

	/**
	 * Render to individual profile page.
	 *
	 * @param username
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "profile")
	public String renderToIndividualProfile(@RequestParam(value = "username", required = false) String username, Model model) {
		username = "email@email.com";

		Map<String, Object> map = this.individualService.findIndividualProfileInfoForUser(username);

		List<Contact> contactList = (List<Contact>) map.get("contacts");
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
		model.addAttribute("awards", map.get("awards"));

		Map<String, String> countryMap = PropertiesUtil.getSpecificProperties("/country.properties", "T_REGION_COUNTRY_");
		model.addAttribute("countries", countryMap);

		// get a list of country key.
		Set<String> countryKeySet = countryMap.keySet();
		Iterator<String> countryIterator = countryKeySet.iterator();
		List<String> countryKeyList = new ArrayList<String>();
		while (countryIterator.hasNext()) {
			countryKeyList.add(countryIterator.next());
		}

		// structure a map, key is country and value is the corresponding
		// cities.
		Map<String, Map<String, String>> cityCountryMap = new TreeMap<String, Map<String, String>>();
		for (String countryKey : countryKeyList) {
			Map<String, String> cityMap = PropertiesUtil.getSpecificProperties("/city.properties", countryKey);
			cityCountryMap.put(countryKey, cityMap);
		}

		model.addAttribute("citiesCountry", cityCountryMap);

		return "individual/profile";
	}

	/*
	 * @RequestMapping(value = "editIndProfile", method = RequestMethod.POST,
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

	/**
	 * Edit basic info through ajax call.
	 *
	 * @param username
	 * @param realName
	 * @param englishName
	 * @param currentCountry
	 * @param email
	 * @param telephone
	 * @param qq
	 * @param webchat
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	@RequestMapping(value = "editBasicInfo", method = RequestMethod.POST)
	public @ResponseBody
	String editBasicInfoTable(@RequestParam(value = "username", required = false) String username, @RequestParam(value = "realName", required = false) String realName, @RequestParam(value = "englishName", required = false) String englishName, @RequestParam(value = "currentCountry", required = false) String currentCountry, @RequestParam(value = "currentCity", required = false) String currentCity, @RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "telephone", required = false) String telephone, @RequestParam(value = "qq", required = false) String qq, @RequestParam(value = "webchat", required = false) String webchat) {
		User user = this.portletService.findUserByUserName(username);
		this.portletService.updateUser(username, realName, englishName, user.getPassword(), user.getSex(), user.getIdNumber(), user.getIdNumberType(), currentCountry, currentCity, null);

		Contact originEmailcontact = this.portletService.findSpecificActiveContact(user, ContactType.EMAIL, null);
		if (originEmailcontact == null && !email.isEmpty()) {
			this.portletService.createContact(user, email, ContactType.EMAIL, null);
		} else if (originEmailcontact != null && !originEmailcontact.getInfo().equals(email)) {
			this.individualService.disableContact(originEmailcontact);
			this.portletService.createContact(user, email, ContactType.EMAIL, null);
		}

		Contact originTelcontact = this.portletService.findSpecificActiveContact(user, ContactType.TELEPHONE, null);
		if (originTelcontact == null && !telephone.isEmpty()) {
			this.portletService.createContact(user, telephone, ContactType.TELEPHONE, null);
		} else if (originTelcontact != null && !originTelcontact.getInfo().equals(telephone)) {
			this.individualService.disableContact(originTelcontact);
			this.portletService.createContact(user, telephone, ContactType.TELEPHONE, null);
		}

		Contact originQQcontact = this.portletService.findSpecificActiveContact(user, ContactType.OTHER, "qq");
		if (originQQcontact == null && !qq.isEmpty()) {
			this.portletService.createContact(user, qq, ContactType.OTHER, "qq");
		} else if (originQQcontact != null && !originQQcontact.getInfo().equalsIgnoreCase(qq)) {
			this.individualService.disableContact(originQQcontact);
			this.portletService.createContact(user, qq, ContactType.OTHER, "qq");
		}

		Contact originWebchatcontact = this.portletService.findSpecificActiveContact(user, ContactType.OTHER, "webchat");
		if (originWebchatcontact == null && !webchat.isEmpty()) {
			this.portletService.createContact(user, webchat, ContactType.OTHER, "webchat");
		} else if (originWebchatcontact != null && !originWebchatcontact.getInfo().equalsIgnoreCase(webchat)) {
			this.individualService.disableContact(originWebchatcontact);
			this.portletService.createContact(user, webchat, ContactType.OTHER, "webchat");
		}

		return "success";
	}

	/**
	 * Edit personal history through ajax call.
	 *
	 * @param personalHistoryId
	 * @param university
	 * @param major
	 * @param universityDegree
	 * @param graduationYear
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	@RequestMapping(value = "editPerHistory", method = RequestMethod.POST)
	public @ResponseBody
	String editPerHistoryTable(@RequestParam(value = "personalHistoryId", required = true) int personalHistoryId, @RequestParam(value = "university", required = false) String university, @RequestParam(value = "major", required = false) String major, @RequestParam(value = "universityDegree", required = false) String universityDegree, @RequestParam(value = "graduationYear", required = false) String graduationYear) {
		PersonalHistory personalHistory = this.individualService.findPersonalHistory(personalHistoryId);
		if (!personalHistory.getUniversity().equals(university) || !personalHistory.getMajor().equals(major) || !personalHistory.getUniversityDegree().getDegree().equals(universityDegree) || !personalHistory.getGraduationYear().equals(graduationYear)) {
			this.portletService.updatePersonalHistory(personalHistoryId, university, universityDegree, major, graduationYear.substring(7));
		}
		return "success";
	}

	/**
	 * Edit award through ajax call.
	 *
	 * @param awardId
	 * @param awardType
	 * @param awardDescription
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	@RequestMapping(value = "editAward", method = RequestMethod.POST)
	public @ResponseBody
	String editAwardTable(@RequestParam(value = "awardId", required = false) int awardId, @RequestParam(value = "awardType", required = false) String awardType, @RequestParam(value = "awardDescription", required = false) String awardDescription) {
		Award award = this.individualService.findAward(awardId);
		if (!award.getType().getType().equals(awardType) || !award.getDescription().equals(awardDescription)) {
			this.portletService.updateAward(award.getId(), awardType, awardDescription, award.getReferrer(), award.getOther());
		}
		return "success";
	}

	/**
	 * Get single drop down values from property file.
	 *
	 * @param regex
	 * @return
	 */
	@RequestMapping(value = "getDropDownValsFromProperties", method = RequestMethod.POST)
	public @ResponseBody
	String getDropDownValsFromProperties(String regex) {
		Map<String, String> map = PropertiesUtil.getSpecificProperties("/messages.properties", regex);

		// get a set of key of Map<String, String> map, and add them to
		// List<String>.
		Set<String> keySet = map.keySet();
		Iterator<String> iterator = keySet.iterator();
		List<String> keyList = new ArrayList<String>();
		while (iterator.hasNext()) {
			keyList.add(iterator.next().toString());
		}

		// add the key of map and the value of map to JSONArray.
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < map.size(); i++) {
			JSONObject jsonItem = new JSONObject();
			jsonItem.put("key", keyList.get(i));
			jsonItem.put("value", map.get(keyList.get(i)));
			jsonArray.put(jsonItem);
		}

		return jsonArray.toString();
	}

	/**
	 * Add personal history for a user.
	 *
	 * @param username
	 * @param university
	 * @param major
	 * @param universityDegree
	 * @param graduationYear
	 * @return
	 */
	@RequestMapping("/addPersonalHistory")
	public String addPersonalHistory(@RequestParam(value="username") String username, @RequestParam(value = "university") String university, @RequestParam(value = "major") String major, @RequestParam(value = "university_degree") String universityDegree, @RequestParam(value = "graduation_year") String graduationYear) {
		User user = this.portletService.findUserByUserName(username);
		this.portletService.createPersonalHistory(user, university, universityDegree, major, graduationYear.substring(7));
		return "redirect:/individual/profile";
	}

	/**
	 * Add award for a user.
	 *
	 * @param username
	 * @param awardType
	 * @param awardDescription
	 * @return
	 */
	@RequestMapping("/addAward")
	public String addAward(@RequestParam(value="username") String username, @RequestParam(value = "award_type") String awardType, @RequestParam(value = "award_description") String awardDescription) {
		User user = this.portletService.findUserByUserName(username);
		this.portletService.createAward(user, awardType, awardDescription, null, null);
		return "redirect:/individual/profile";
	}

	/**
	 * Get drop down values from property files for country.
	 *
	 * @return
	 */
	@RequestMapping(value = "getCountryDropDownValsFromProperties", method = RequestMethod.POST)
	public @ResponseBody
	String getCountryDropDownValsFromProperties() {
		Map<TreeMap<String, String>, TreeMap<String, String>> resultMap = PropertiesUtil.getCascadeDropDownValsFromProperties("/country.properties", "/city.properties", "T_REGION_COUNTRY_");

		// get a set of key of Map<TreeMap<String, String>, TreeMap<String,
		// String>> resultMap, and add them to List<TreeMap<String, String>>.
		Set<TreeMap<String, String>> countrySet = resultMap.keySet();
		Iterator<TreeMap<String, String>> countryIterator = countrySet.iterator();
		List<TreeMap<String, String>> countryList = new ArrayList<TreeMap<String, String>>();
		while (countryIterator.hasNext()) {
			countryList.add(countryIterator.next());
		}

		// add the key of Map<TreeMap<String, String>, TreeMap<String, String>>
		// resultMap to JSONArray.
		JSONArray countryJSONArray = new JSONArray();
		for (TreeMap<String, String> countryMap : countryList) {
			Set<String> countryKeySet = countryMap.keySet();
			Iterator<String> countryKeyIterator = countryKeySet.iterator();
			while (countryKeyIterator.hasNext()) {
				String countryKeyString = countryKeyIterator.next().toString();
				JSONObject jsonItem = new JSONObject();
				jsonItem.put("key", countryKeyString);
				jsonItem.put("value", countryMap.get(countryKeyString));
				countryJSONArray.put(jsonItem);
			}
		}

		return countryJSONArray.toString();
	}

	/**
	 * Get drop down values from property files for city.
	 *
	 * @return
	 */
	@RequestMapping(value = "getCityDropDownValsFromProperties", method = RequestMethod.POST)
	public @ResponseBody
	String getCityDropDownValsFromProperties() {
		Map<TreeMap<String, String>, TreeMap<String, String>> resultMap = PropertiesUtil.getCascadeDropDownValsFromProperties("/country.properties", "/city.properties", "T_REGION_COUNTRY_");

		// get a set of key of Map<TreeMap<String, String>, TreeMap<String,
		// String>> resultMap, and add them to List<TreeMap<String, String>>.
		Set<TreeMap<String, String>> countrySet = resultMap.keySet();
		Iterator<TreeMap<String, String>> countryIterator = countrySet.iterator();
		List<TreeMap<String, String>> countryList = new ArrayList<TreeMap<String, String>>();
		while (countryIterator.hasNext()) {
			countryList.add(countryIterator.next());
		}

		// get a list of value of Map<TreeMap<String, String>, TreeMap<String,
		// String>> resultMap, and add them to List<TreeMap<String, String>>.
		List<TreeMap<String, String>> cityList = new ArrayList<TreeMap<String, String>>();
		for (int i = 0; i < countryList.size(); i++) {
			cityList.add(resultMap.get(countryList.get(i)));
		}

		// add the value of Map<TreeMap<String, String>, TreeMap<String,
		// String>>
		// resultMap to JSONArray.
		JSONArray cityJSONArray = new JSONArray();
		for (TreeMap<String, String> cityMap : cityList) {
			Set<String> cityKeySet = cityMap.keySet();
			Iterator<String> cityKeyIterator = cityKeySet.iterator();
			while (cityKeyIterator.hasNext()) {
				String cityKeyString = cityKeyIterator.next().toString();
				JSONObject jsonItem = new JSONObject();
				jsonItem.put("key", cityKeyString);
				jsonItem.put("value", cityMap.get(cityKeyString));
				cityJSONArray.put(jsonItem);
			}
		}

		return cityJSONArray.toString();
	}
}
