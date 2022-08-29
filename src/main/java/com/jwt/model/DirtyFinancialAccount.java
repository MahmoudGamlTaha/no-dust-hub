package com.jwt.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="dirty_financial_accounts")
public class DirtyFinancialAccount {
	@Id
	@Column
private String product_id;
	@Column
private int facility_id;
	@Column
private long total_stock_quantity;
	@Column
private String product_name;
	@Column
private String product_sku;
	@Column
private String dms_product_id;
public String getProduct_id() {
	return product_id;
}
public void setProduct_id(String product_id) {
	this.product_id = product_id;
}
public int getFacility_id() {
	return facility_id;
}
public void setFacility_id(int facility_id) {
	this.facility_id = facility_id;
}
public long getTotal_stock_quantity() {
	return total_stock_quantity;
}
public void setTotal_stock_quantity(long total_stock_quantity) {
	this.total_stock_quantity = total_stock_quantity;
}
public String getProduct_name() {
	return product_name;
}
public void setProduct_name(String product_name) {
	this.product_name = product_name;
}
public String getProduct_sku() {
	return product_sku;
}
public void setProduct_sku(String product_sku) {
	this.product_sku = product_sku;
}
public String getDms_product_id() {
	return dms_product_id;
}
public void setDms_product_id(String dms_product_id) {
	this.dms_product_id = dms_product_id;
}

}
