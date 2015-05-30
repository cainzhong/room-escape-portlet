/**
 *@Project: hc-portlet
 *
 *@Date: 2015年5月27日
 *@Copyright: 2015 sg.nomaka.tk Inc. All rights reserved.
 */
package com.haicai.portlet.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.TreeMap;
import java.util.regex.Pattern;

/**
 * @author Cain
 * 
 */
public class PropertiesUtil {

	public static TreeMap<String, String> getSpecificProperties(String filePath, String regex) {
		regex = regex + ".*";
		Properties properties = new Properties();
		InputStream inputStream = PropertiesUtil.class.getClassLoader().getResourceAsStream(filePath);
		// For test.
		// InputStream inputStream =
		// ClassLoader.class.getResourceAsStream(filePath);

		TreeMap<String, String> propertyMap = new TreeMap<String, String>();

		try {
			properties.load(inputStream);
			Enumeration<Object> propertiesKeyEnumeration = properties.keys();
			while (propertiesKeyEnumeration.hasMoreElements()) {
				String propertyKey = propertiesKeyEnumeration.nextElement().toString();
				if (Pattern.matches(regex, propertyKey)) {
					propertyMap.put(propertyKey, properties.getProperty(propertyKey).trim());
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return propertyMap;
	}

	public static Map<TreeMap<String, String>, TreeMap<String, String>> getCascadeDropDownValsFromProperties(String countryProperties, String cityProperties, String regex) {
		Map<TreeMap<String, String>, TreeMap<String, String>> resultMap = new HashMap<TreeMap<String, String>, TreeMap<String, String>>();

		TreeMap<String, String> allCountries = PropertiesUtil.getSpecificProperties(countryProperties, "T_REGION_COUNTRY_");

		// get a list of key for Map<String, String> allCountries.
		Set<String> keySet = allCountries.keySet();
		Iterator<String> iterator = keySet.iterator();
		List<String> keySetList = new ArrayList<String>();
		while (iterator.hasNext()) {
			keySetList.add(iterator.next().toString());
		}

		for (int i = 0; i < keySetList.size(); i++) {
			TreeMap<String, String> allCitysForSpecificCountry = PropertiesUtil.getSpecificProperties(cityProperties, keySetList.get(i));

			TreeMap<String, String> countryMap = new TreeMap<String, String>();
			countryMap.put(keySetList.get(i), allCountries.get(keySetList.get(i)));
			resultMap.put(countryMap, allCitysForSpecificCountry);
		}

		return resultMap;
	}

	public static void main(String args[]) {
		Map<TreeMap<String, String>, TreeMap<String, String>> resultTreeMap = PropertiesUtil.getCascadeDropDownValsFromProperties("/country.properties", "/city.properties", "T_REGION_COUNTRY_");
		System.out.print("1");
	}
}
