package com.room.escape.portlet.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import com.room.escape.portlet.domain.Ticket;
import com.room.escape.portlet.domain.User;
import com.room.escape.portlet.domain.UserRole;
import com.room.escape.portlet.domain.type.Sex;
import com.room.escape.portlet.repository.PortletRepository;
import com.room.escape.portlet.service.PortletService;

/**
 * @author Cain
 *
 */
@Repository
public class PortletServiceImpl implements PortletService, UserDetailsService {

	@Autowired
	private PortletRepository portletRepository;

	/*
	 * (non-Javadoc)
	 *
	 * @see org.springframework.security.core.userdetails.UserDetailsService#
	 * loadUserByUsername(java.lang.String)
	 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
		User user = this.portletRepository.getUserByUserName(username);
		if (user == null) {
			return null;
		}
		UserDetails userDetails = new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), true, true, true, true, this.getAuthorities(user));
		return userDetails;
	}

	private Collection<GrantedAuthority> getAuthorities(User user) {
		List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
		List<UserRole> userRoles = this.portletRepository.getUserRolesByUser(user);
		for (UserRole userRole : userRoles) {
			authList.add(new GrantedAuthorityImpl(userRole.getRole()));
		}
		return authList;
	}

	@Override
	public boolean createUser(String username, String realName, String password, Sex sex, String idNumber) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateUser(String username, String realName, String password, Sex sex, String idNumber, byte[] portrait) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User findUserByUserName(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.room.escape.portlet.service.PortletService#findTickets(java.lang.String)
	 */
	@Override
	public List<Ticket> findTickets(String date) {
		String dateArray[] = date.split("-");
		List<Ticket> tickets = this.portletRepository.getTickets(dateArray[0],dateArray[1]+dateArray[2]);
		return tickets;
	}

}
