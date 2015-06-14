package com.room.escape.portlet.repository.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.room.escape.portlet.domain.User;
import com.room.escape.portlet.domain.UserRole;
import com.room.escape.portlet.repository.PortletRepository;


/**
 * @author Cain
 *
 */
@Repository
public class PortletRepositoryImpl implements PortletRepository,Serializable {

	private static final long serialVersionUID = 7424047476958283440L;

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public boolean createUser(User user) {
		try {
			this.sessionFactory.getCurrentSession().save(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	@Transactional
	public boolean updateUser(User user) {
		try {
			this.sessionFactory.getCurrentSession().update(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}


	@Override
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public User getUserByUserName(String username) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from User as u where u.username= ?");
		query.setParameter(0, username);
		User user = (User) query.uniqueResult();
		return user;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED,readOnly=true)
	public List<UserRole> getUserRolesByUser(User user){
		Query query = this.sessionFactory.getCurrentSession().createQuery("from UserRole as ur where ur.user= :user");
		query.setParameter("user", user);
		List<UserRole> userRoles = query.list();
		return userRoles;
	}



}
