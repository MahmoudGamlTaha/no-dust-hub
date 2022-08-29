package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.UserDAO;
import com.jwt.dao.UserRoleDAO;
import com.jwt.model.Facility;
import com.jwt.model.ModuleSession;
import com.jwt.model.User;
import com.jwt.model.UserData;
import com.jwt.model.UserRole;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO ;
	
	@Override
	@Transactional
	public User getUser(String UserName){
		return userDAO.getUser(UserName);
	}
	@Override
	@Transactional
	public User updateUser(User user) {
		return userDAO.updateUser(user);
	}
	@Override
	public List<User> GetAllUsers() {
		// TODO Auto-generated method stub
		return userDAO.GetAllUsers();
	}
	@Override
	public UserData get_user_data(String userName) {
		// TODO Auto-generated method stub
		return userDAO.get_user_data(userName);
	}
	@Override
	public String get_decrypted_pass(String pass) {
		// TODO Auto-generated method stub
		return userDAO.get_decrypted_pass(pass);
	}
	@Override
	public String Update_user_pass(String userName, String pass) {
		// TODO Auto-generated method stub
		return userDAO.Update_user_pass(userName, pass);
	}
	@Override
	public List<Facility> get_all_facilities() {
		// TODO Auto-generated method stub
		return userDAO.get_all_facilities();
	}
	@Override
	public String Update_Login_Time(String user_name) {
		// TODO Auto-generated method stub
		return userDAO.Update_Login_Time(user_name);
	}
	@Override
	public String Logout_user(String User_name) {
		// TODO Auto-generated method stub
		return userDAO.Logout_user(User_name);
	}
	@Override
	public ModuleSession get_session_timeout(int module_id) {
		// TODO Auto-generated method stub
		return userDAO.get_session_timeout(module_id);
	}
}
