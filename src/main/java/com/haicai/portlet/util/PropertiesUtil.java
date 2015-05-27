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
import java.util.regex.Pattern;

/**
 * @author Cain
 *
 */
public class PropertiesUtil {

	public static Map<String, String> getSpecificProperties(String filePath,String regex) {
		Properties properties = new Properties();
		InputStream inputStream = PropertiesUtil.class.getClassLoader().getResourceAsStream(filePath);

		HashMap<String,String> propertyMap=new HashMap<String,String>();

		try {
			properties.load(inputStream);
			Enumeration<Object> propertiesKeyEnumeration = properties.keys();
			while(propertiesKeyEnumeration.hasMoreElements()){
				String propertyKey=propertiesKeyEnumeration.nextElement().toString();
				if(Pattern.matches(regex,propertyKey )){
					propertyMap.put(propertyKey, properties.getProperty(propertyKey).trim());
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return propertyMap;
	}

	public static void main(String args[]) {
		Map<String, String> aMap=PropertiesUtil.getSpecificProperties("/messages.properties","T_REGION_.*");
		Set<String> keySet = aMap.keySet();
		Iterator<String> iterator=keySet.iterator();
		List<String> list=new ArrayList<String>();
		while(iterator.hasNext()){
			list.add(iterator.next().toString());
		}

		for(int i=0;i<aMap.size();i++){
			System.out.println(list.get(i));
		}
	}
}
