package com.jwt.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="facilities")
public class Facility implements Serializable{
	
	
	private static final long serialVersionUID = 1L;

	@Column
	@Id
	private int id;
	
	
	@Column
	private String facility_name ;	
	
	@Column
	private int facility_type_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFacility_name() {
		return facility_name;
	}

	public void setFacility_name(String facility_name) {
		this.facility_name = facility_name;
	}

	public int getFacility_type_id() {
		return facility_type_id;
	}

	public void setFacility_type_id(int facility_type_id) {
		this.facility_type_id = facility_type_id;
	}

	
}
