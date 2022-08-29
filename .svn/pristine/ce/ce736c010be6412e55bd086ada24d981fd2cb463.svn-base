package com.jwt.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table (name="dms_driver__master_covers")
public class Cover implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column
 	private String driver_id ;
	
	@Column
 	private String driver_name_ar ;

	@Column
 	private String driver_name_en ;
	
	@Id
	@Column
 	private String assignment_date ;
	

	public String getDriver_id() {
		return driver_id;
	}

	public void setDriver_id(String driver_id) {
		this.driver_id = driver_id;
	}

	public String getDriver_name_ar() {
		return driver_name_ar;
	}

	public void setDriver_name_ar(String driver_name_ar) {
		this.driver_name_ar = driver_name_ar;
	}

	public String getDriver_name_en() {
		return driver_name_en;
	}

	public void setDriver_name_en(String driver_name_en) {
		this.driver_name_en = driver_name_en;
	}

	public String getAssignment_date() {
		return assignment_date;
	}

	public void setAssignment_date(String assignment_date) {
		this.assignment_date = assignment_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	
}
