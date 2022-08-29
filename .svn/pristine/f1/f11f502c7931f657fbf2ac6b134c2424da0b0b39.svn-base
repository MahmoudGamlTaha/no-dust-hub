package com.jwt.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table (name="dms_cover_products")
public class CoverProduct implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@Column
	private String product_id;
	
	@Column
	private String product_name;
	
	@Id
	@Column
	private long treatment_id;
	
	@Column
	private String treatment_name;
	
	@Column
	private long quantity;
	
	@Id
	@Column
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
	private Date assignment_date;

	@Id
	@Column
	private String driver_id;
	
	@Column
	private int kind;
	
	@Column
	private int type;
	
	@Column
	private String handle;
	
	
	
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
	
}
