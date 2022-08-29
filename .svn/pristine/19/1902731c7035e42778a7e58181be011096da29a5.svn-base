package com.jwt.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="DRIVERS_DATA")
public class drivers implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
@Column
private String user_name;
public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getFull_name_ar() {
		return full_name_ar;
	}
	public void setFull_name_ar(String full_name_ar) {
		this.full_name_ar = full_name_ar;
	}
	public String getFull_name_en() {
		return full_name_en;
	}
	public void setFull_name_en(String full_name_en) {
		this.full_name_en = full_name_en;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public long getuser_group()
	{
		return user_group;
	}
	public void setuser_group(long group_id)
	{
		user_group=group_id;
	}
@Column
private String full_name_ar;
@Column
private String full_name_en;
@Column
private long user_group;

}
