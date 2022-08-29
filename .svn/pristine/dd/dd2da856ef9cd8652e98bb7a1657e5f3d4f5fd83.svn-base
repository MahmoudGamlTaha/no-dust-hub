package com.jwt.controller;

import java.io.IOException;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.model.User;
import com.jwt.model.UserData;
import com.jwt.service.UserService;

@Controller
public class ChangePasswordController {
	@Autowired
	private UserService userService;
@RequestMapping(value="/ChangePassword")
public ModelAndView change_password(ModelAndView model)throws IOException
{
	User u = new User();
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	UserData user_data=new UserData();
	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();	
		System.out.println("UserName"+userDetail.getUsername());
	    u=userService.getUser(userDetail.getUsername());
	    user_data=userService.get_user_data(userDetail.getUsername());
	    System.out.println(user_data.getUser_password());
	   // user_data.setUser_password("1111");
	    String encrypted_pass=user_data.getUser_password();
	    //String x=userService.get_decrypted_pass(user_data.getUser_password());
	    byte[] b=encrypted_pass.getBytes();
	    String x=userService.get_decrypted_pass(user_data.getUser_password());
	    user_data.setUser_password(x);
	  
	    System.out.println("pass"+x);
	}
	ModelAndView newMod=new ModelAndView();
	
	newMod.addObject("UserData", user_data);
	newMod.setViewName("ChangePassword");
	return newMod;
}
@RequestMapping(value="/submitchangepassword",method=RequestMethod.POST,consumes="application/json")
public ResponseEntity<String> submit_password(@RequestBody UserData user_data)
{
	System.out.println("UserName : "+user_data.getUser_name());
	System.out.println("Password : "+user_data.getUser_password());
	String x=userService.Update_user_pass(user_data.getUser_name(), user_data.getUser_password());
	return new ResponseEntity<String>(x,HttpStatus.OK);
}
}
