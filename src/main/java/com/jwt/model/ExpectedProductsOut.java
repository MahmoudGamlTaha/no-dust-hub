package com.jwt.model;

public class ExpectedProductsOut {
 private String product_id;
 public String getProduct_id() {
	return product_id;
}
public void setProduct_id(String product_id) {
	this.product_id = product_id;
}
public int getTreatment_id() {
	return treatment_id;
}
public void setTreatment_id(int treatment_id) {
	this.treatment_id = treatment_id;
}
public String getProduct_name() {
	return product_name;
}
public void setProduct_name(String product_name) {
	this.product_name = product_name;
}
public String getTreatment_name() {
	return treatment_name;
}
public void setTreatment_name(String treatment_name) {
	this.treatment_name = treatment_name;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
private int treatment_id;
 private String product_name;
 private String treatment_name;
 private int quantity;
 private int available_quantity;
public int getAvailable_quantity() {
	return available_quantity;
}
public void setAvailable_quantity(String available_quantity) {
	if(available_quantity==null)
	{
		this.available_quantity=0;
	}
	else
	{
	this.available_quantity = Integer.parseInt(available_quantity);
	}
}
 
}
