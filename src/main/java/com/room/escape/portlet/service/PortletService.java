package com.room.escape.portlet.service;

import java.util.List;

import com.room.escape.portlet.domain.Ticket;
import com.room.escape.portlet.domain.User;
import com.room.escape.portlet.domain.type.Sex;

public interface PortletService {

	/**
	 * Create a user in database.
	 *
	 * @param username
	 * @param realName
	 * @param password
	 * @param sex
	 * @param idNumber
	 * @return
	 */
	boolean createUser(String username, String realName, String password, Sex sex, String idNumber);

	/**
	 * Update a user
	 *
	 * @param username
	 * @param realName
	 * @param password
	 * @param sex
	 * @param idNumber
	 * @param portrait
	 * @return
	 */
	boolean updateUser(String username, String realName, String password, Sex sex, String idNumber, byte[] portrait);

	/**
	 * Find a user info through user name.
	 *
	 * @param username
	 * @return
	 */
	User findUserByUserName(String username);

	/**
	 * Find a list of tickets by date.
	 *
	 * @param date pattern "yyyy-MM-dd". eg. 2015-06-22
	 * @return
	 */
	List<Ticket> findTicketsByTime(String date);

	/**
	 * Find a list of tickets by time and ticket name.
	 *
	 * @param ticketName
	 * @param date pattern "yyyy-MM-dd". eg. 2015-06-22
	 * @return
	 */
	List<Ticket> findTicketsByTimeAndTicketName(String ticketName, String date);

}
