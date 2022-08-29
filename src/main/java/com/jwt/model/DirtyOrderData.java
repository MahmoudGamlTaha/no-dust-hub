package com.jwt.model;

import java.math.BigDecimal;

public class DirtyOrderData {
private String product_name;
private String treatment_name;
public String getTreatment_name() {
	return treatment_name;
}
public void setTreatment_name(String treatment_name) {
	this.treatment_name = treatment_name;
}
public String getProduct_name() {
	return product_name;
}
public void setProduct_name(String product_name) {
	this.product_name = product_name;
}
public String getProgram() {
	return program;
}
public void setProgram(String program) {
	this.program = program;
}

public String getUnit() {
	return unit;
}
public void setUnit(String unit) {
	if(unit==null||unit=="null")
	{
		this.unit="";
	}
	else
	{
	this.unit = unit;
	}
}
public String getMachine_no() {
	return machine_no;
}
public void setMachine_no(String machine_no) {
	this.machine_no = machine_no;
}
private String program;
private int quantity_requested;
public int getQuantity_requested() {
	return quantity_requested;
}
public void setQuantity_requested(int quantity_requested) {
	this.quantity_requested = quantity_requested;
}
private String unit;
private String machine_no;
private String order_time;
public String getOrder_time() {
	return order_time;
}
public void setOrder_time(String order_time) {
	this.order_time = order_time;
}
}
