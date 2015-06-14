package com.room.escape.portlet.service.impl;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

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

}
