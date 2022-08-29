package com.jwt.model;

import java.math.BigDecimal;

public class ProductTransaction {
	private String product_name;
	private BigDecimal added;
	private BigDecimal deducted;
	private String transaction_movement_type;
	private String date;
	private int transaction_id;
	private String transaction_type;
private String dms_product_id;
private String product_id;
private String type;
private String treatment;
private String transaction_type_id;
public String getProduct_name() {
	return product_name;
}

public void setProduct_name(String product_name) {
	this.product_name = product_name;
}



public String getTransaction_movement_type() {
	return transaction_movement_type;
}

public void setTransaction_movement_type(String transaction_movement_type) {
	this.transaction_movement_type = transaction_movement_type;
}

public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}

public String getDms_product_id() {
	return dms_product_id;
}

public void setDms_product_id(String dms_product_id) {
	this.dms_product_id = dms_product_id;
}

public BigDecimal getAdded() {
	return added;
}

public void setAdded(BigDecimal added) {
	this.added = added;
}

public BigDecimal getDeducted() {
	return deducted;
}

public void setDeducted(BigDecimal deducted) {
	this.deducted = deducted;
}

public String getProduct_id() {
	return product_id;
}

public void setProduct_id(String product_id) {
	this.product_id = product_id;
}

public String getType() {
	return type;
}

public void setType(String type) {
	this.type = type;
}

public String getTreatment() {
	return treatment;
}

public void setTreatment(String treatment) {
	this.treatment = treatment;
}

public int getTransaction_id() {
	return transaction_id;
}

public void setTransaction_id(int transaction_id) {
	this.transaction_id = transaction_id;
}

public String getTransaction_type() {
	return transaction_type;
}

public void setTransaction_type(String transaction_type) {
	this.transaction_type = transaction_type;
}

public String getTransaction_type_id() {
	return transaction_type_id;
}

public void setTransaction_type_id(String transaction_type_id) {
	this.transaction_type_id = transaction_type_id;
}





}
