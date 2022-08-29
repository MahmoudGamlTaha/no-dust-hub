package com.jwt.service;

import java.util.List;


import com.jwt.model.UserRole;

public interface UserRoleService {
	public List<UserRole> getAllUserRole(String UserName);
}
