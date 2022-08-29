package com.jwt.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="drivers_users")
public class Drivers_Users {
@Id
@Column(name="user_name")
private String user_name;
@Column(name="name")
private String name;
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
}
