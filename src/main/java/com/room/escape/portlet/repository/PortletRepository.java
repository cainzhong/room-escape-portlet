package com.room.escape.portlet.repository;

import java.util.List;

import com.room.escape.portlet.domain.Ticket;
import com.room.escape.portlet.domain.User;
import com.room.escape.portlet.domain.UserRole;

/**
 * @author Cain
 *
 */
public interface PortletRepository {

	/**
	 * Create a user in database.
	 *
	 * @param user
	 * @return
	 */
	boolean createUser(User user);

	/**
	 * Update a user.
	 *
	 * @param user
	 * @return
	 */
	boolean updateUser(User user);

	/**
	 * Find a user info through user name.
	 *
	 * @param username
	 * @return
	 */
	User getUserByUserName(String username);

	/**
	 * Find a list of user roles for a user.
	 *
	 * @param user
	 * @return
	 */
	List<UserRole> getUserRolesByUser(User user);

	/**
	 * Find a list of tickets by time.
	 *
	 * @param year
	 * @param day
	 * @return
	 */
	List<Ticket> getTicketsByTime(String year, String day);

	/**
	 * Find a list of tickets by time and ticket name.
	 *
	 * @param year
	 * @param day
	 * @param ticketName
	 * @return
	 */
	List<Ticket> getTicketsByTimeAndTicketName(String ticketName, String year, String day);

}
