package com.jwt.model;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="sc_users")
public class User {
	private static final long serialVersionUID = 1L;
	//@Id
	//@GeneratedValue(strategy = GenerationType.AUTO)
	//private int USER_ID;
	
	@Column(name = "active")
	private int active;
	@Column
	private String display_name;
	public String getDisplay_name() {
		return display_name;
	}

	public void setDisplay_name(String display_name) {
		this.display_name = display_name;
	}

	@Id
	private String user_name;
	
	@Column 
	private int org_unit_id; 
	
	@Column
	private int user_id;

	
	public int getOrg_unit_id() {
		return org_unit_id;
	}

	public void setOrg_unit_id(int org_unit_id) {
		this.org_unit_id = org_unit_id;
	}

	public String getUSER_NAME() {
		return user_name;
	}

	public void setUSER_NAME(String uSER_NAME) {
		user_name = uSER_NAME;
	}

	
	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	

}
