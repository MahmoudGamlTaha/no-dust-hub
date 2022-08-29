package com.jwt.model;

import javax.persistence.Table;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Table(name="reconciliation_products")

public class Reconciliatiion_Products  {
	@Column
	private String dms_product_id;
	@Id
	@Column
	private String product_sku;
	@Column
	private String product_name;
	@Column
	private BigDecimal treatment_id;
	@Column
	private String treatment_name;
	@Column
	private int product_type;
	@Column
	private String driver_id;
	@Column
	private int out_quantity;
	@Column
	private int dms_quantity;
	@Column
	private int expected_new;
	@Column
	private int actual_new;
	@Column
	private int cancel_quantity;
	public int getExpected_new() {
		return expected_new;
	}
	public void setExpected_new(int expected_new) {
		this.expected_new = expected_new;
	}
	public int getActual_new() {
		return actual_new;
	}
	public void setActual_new(int actual_new) {
		this.actual_new = actual_new;
	}
	public int getCancel_quantity() {
		return cancel_quantity;
	}
	public void setCancel_quantity(int cancel_quantity) {
		this.cancel_quantity = cancel_quantity;
	}
	public String getDms_product_id() {
		return dms_product_id;
	}
	public void setDms_product_id(String dms_product_id) {
		this.dms_product_id = dms_product_id;
	}
	public String getProduct_sku() {
		return product_sku;
	}
	public void setProduct_sku(String product_sku) {
		this.product_sku = product_sku;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public BigDecimal getTreatment_id() {
		return treatment_id;
	}
	public void setTreatment_id(BigDecimal treatment_id) {
		this.treatment_id = treatment_id;
	}
	public String getTreatment_name() {
		return treatment_name;
	}
	public void setTreatment_name(String treatment_name) {
		this.treatment_name = treatment_name;
	}
	public int getProduct_type() {
		return product_type;
	}
	public void setProduct_type(int product_type) {
		this.product_type = product_type;
	}
	public String getDriver_id() {
		return driver_id;
	}
	public void setDriver_id(String driver_id) {
		this.driver_id = driver_id;
	}
	public int getOut_quantity() {
		return out_quantity;
	}
	public void setOut_quantity(int out_quantity) {
		this.out_quantity = out_quantity;
	}
	public int getDms_quantity() {
		return dms_quantity;
	}
	public void setDms_quantity(int dms_quantity) {
		this.dms_quantity = dms_quantity;
	}
	
	
	
	
}
