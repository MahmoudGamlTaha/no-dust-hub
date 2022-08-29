package com.jwt.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="sc_users_roles")
public class UserRole implements Serializable {
	/*@Override
	public String toString() {
		return "UserRole [ROLE_ID=" + ROLE_ID + ", USER_NAME=" + USER_NAME + ", ROLE_NAME=" + ROLE_NAME
				+ ", getUSER_NAME()=" + getUSER_NAME() + ", getROLE()=" + getROLE() + "]";
	}*/
	
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int role_id;
	
	@Column
	private String user_name;
	@Column
	private String role_name;
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	
	
	
	/*public String getUSER_NAME() {
		return USER_NAME;
	}
	@Override
	public String toString() {
		return getROLE() ;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public String getROLE() {
		return ROLE_NAME;
	}
	public void setROLE(String rOLE) {
		ROLE_NAME = rOLE;
	}
	public int getROLE_ID() {
		return ROLE_ID;
	}
	public void setROLE_ID(int rOLE_ID) {
		ROLE_ID = rOLE_ID;
	}
	public String getROLE_NAME() {
		return ROLE_NAME;
	}
	public void setROLE_NAME(String rOLE_NAME) {
		ROLE_NAME = rOLE_NAME;
	}*/
	
	
}
