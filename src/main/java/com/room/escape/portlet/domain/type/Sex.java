package com.room.escape.portlet.domain.type;

import lombok.ToString;

/**
 * Enum: SEX - FEMALE("FEMALE",0), MALE("MALE",1)
 *
 * @author Cain
 *
 */
@ToString
public enum Sex {
	FEMALE("FEMALE",0), MALE("MALE",1);

	private String sex;
	private int identify;

	private Sex(String sex,int identify) {
		this.sex = sex;
		this.identify=identify;
	}

	public String getSex() {
		return this.sex;
	}

	public int getIdentify() {
		return this.identify;
	}
}
