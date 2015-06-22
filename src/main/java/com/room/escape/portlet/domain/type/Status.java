package com.room.escape.portlet.domain.type;

import lombok.ToString;

/**
 * Enum: Status - ACTIVE("ACTIVE",0), OVERDUE("OVERDUE",1), SOLDOUT("SOLDOUT",2);
 *
 * @author Cain
 *
 */
@ToString
public enum Status {
	ACTIVE("ACTIVE", 0), OVERDUE("OVERDUE", 1), SOLDOUT("SOLDOUT", 2);

	private String status;
	private int identify;

	private Status(String status, int identify) {
		this.status = status;
		this.identify = identify;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getIdentify() {
		return this.identify;
	}

	public void setIdentify(int identify) {
		this.identify = identify;
	}

}
