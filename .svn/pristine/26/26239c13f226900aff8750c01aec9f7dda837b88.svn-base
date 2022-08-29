package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.jwt.dao.UserRoleDAO;
import com.jwt.model.UserRole;

@Service
@Transactional
public class UserRoleServiceImpl implements UserRoleService{
	@Autowired
	private UserRoleDAO userRoleDAO ;
	
	@Override
	@Transactional
	public List<UserRole> getAllUserRole(String UserName){
		return userRoleDAO.getAllUserRole(UserName);
	}
	

}
