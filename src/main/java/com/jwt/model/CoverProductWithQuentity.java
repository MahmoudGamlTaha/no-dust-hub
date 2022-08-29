package com.jwt.model;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;


public class CoverProductWithQuentity {
	
	private String product_id;
	
	private String product_name;
	
	private long treatment_id;
	
	private String treatment_name;
	
	private long quantity;
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd-MM-yyyy")

	private Date assignment_date;

	
	private String driver_id;
	
	private int kind;
	
	private int type;
	
	private String handle;
		
	private long actual_quantity;
	
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public long getTreatment_id() {
		return treatment_id;
	}
	public void setTreatment_id(long treatment_id) {
		this.treatment_id = treatment_id;
	}
	public String getTreatment_name() {
		return treatment_name;
	}
	public void setTreatment_name(String treatment_name) {
		this.treatment_name = treatment_name;
	}
	public long getQuantity() {
		return quantity;
	}
	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}
	public Date getAssignment_date() {
		return assignment_date;
	}
	public void setAssignment_date(Date assignment_date) {
		this.assignment_date = assignment_date;
	}
	
	public String getDriver_id() {
		return driver_id;
	}
	public void setDriver_id(String driver_id) {
		this.driver_id = driver_id;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getHandle() {
		return handle;
	}
	public void setHandle(String handle) {
		this.handle = handle;
	}
	
	public long getActual_quantity() {
		return actual_quantity;
	}
	public void setActual_quantity(long actual_quantity) {
		this.actual_quantity = actual_quantity;
	}

}
