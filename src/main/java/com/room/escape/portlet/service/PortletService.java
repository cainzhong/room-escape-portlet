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
	 * @param date
	 * @return
	 */
	List<Ticket> findTickets(String date);

}
