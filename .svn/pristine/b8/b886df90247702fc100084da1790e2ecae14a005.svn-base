package com.jwt.service;

import java.util.List;

import com.jwt.model.Facility;
import com.jwt.model.ModuleSession;
import com.jwt.model.User;
import com.jwt.model.UserData;

public interface UserService {
	public User getUser(String UserName);
	
	public User updateUser(User user);
	public List<User> GetAllUsers();

	public UserData get_user_data(String userName);
	public String get_decrypted_pass(String pass);
	public String Update_user_pass(String userName, String pass);
	public List<Facility> get_all_facilities();
	public String Update_Login_Time(String user_name);
	public String Logout_user(String User_name);
	public ModuleSession get_session_timeout(int module_id);
}
