package com.jwt.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="reconciliation_employees")
public class Employee {

	@Id
	@Column
 	private String USER_NAME ;

	@Column
 	private String FULL_NAME_EN ;

	@Column
 	private String FULL_NAME_AR ;

	public String getUSER_NAME() {
		return USER_NAME;
	}

	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}

	public String getFULL_NAME_EN() {
		return FULL_NAME_EN;
	}

	public void setFULL_NAME_EN(String fULL_NAME_EN) {
		FULL_NAME_EN = fULL_NAME_EN;
	}

	public String getFULL_NAME_AR() {
		return FULL_NAME_AR;
	}

	public void setFULL_NAME_AR(String fULL_NAME_AR) {
		FULL_NAME_AR = fULL_NAME_AR;
	}

}
