package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.jwt.model.UserRole;

@Repository
public class UserRoleDAOImpl  implements UserRoleDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<UserRole> getAllUserRole(String UserName) {
		
		return sessionFactory.getCurrentSession().createQuery("from UserRole c where c.user_name='"+UserName+"'").list();
		
		
	}

}
