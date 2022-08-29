package com.jwt.model;

import java.sql.Date;

public class CleanShipment {
private int id;
private String type;
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
private String driver_id;

public String getDriver_id() {
	return driver_id;
}
public void setDriver_id(String driver_id) {
	this.driver_id = driver_id;
}
private String warehouse_name;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getWarehouse_name() {
	return warehouse_name;
}
public void setWarehouse_name(String warehouse_name) {
	this.warehouse_name = warehouse_name;
}
public Date getShipment_date() {
	return shipment_date;
}
public void setShipment_date(Date shipment_date) {
	this.shipment_date = shipment_date;
}
public String getLast_status() {
	return last_status;
}
public void setLast_status(String last_status) {
	this.last_status = last_status;
}
public String getDriver_name() {
	return driver_name;
}
public void setDriver_name(String driver_name) {
	this.driver_name = driver_name;
}
private Date shipment_date;
private String last_status;
private String driver_name;
}
