package com.jwt.model;

import java.util.List;

public class CleanShipmentForm {
	private int shipment_id;
public int getShipment_id() {
		return shipment_id;
	}
	public void setShipment_id(int shipment_id) {
		this.shipment_id = shipment_id;
	}
private String warehouse_name;
private String agent_name;
private String req_date;
private List<Products> prod_lst;
private List<drivers> driver_lst;
private List<Facility> facilities;
private String approved_sealed;
public String getApproved_sealed() {
	return approved_sealed;
}
public void setApproved_sealed(String approved_sealed) {
	this.approved_sealed = approved_sealed;
}
public String getApproved_not_sealed() {
	return approved_not_sealed;
}
public void setApproved_not_sealed(String approved_not_sealed) {
	this.approved_not_sealed = approved_not_sealed;
}
public String getLost() {
	return lost;
}
public void setLost(String lost) {
	this.lost = lost;
}
private String approved_not_sealed;
private String lost;
private String driver_id;
private int dest_id;
private String last_status;
public String getLast_status() {
	return last_status;
}
public void setLast_status(String last_status) {
	this.last_status = last_status;
}
public int getDest_id() {
	return dest_id;
}
public void setDest_id(int dest_id) {
	this.dest_id = dest_id;
}
public String getDriver_id() {
	return driver_id;
}
public void setDriver_id(String driver_id) {
	this.driver_id = driver_id;
}
public List<Facility> getFacilities() {
	return facilities;
}
public void setFacilities(List<Facility> facilities) {
	this.facilities = facilities;
}
public List<Products> getProd_lst() {
	return prod_lst;
}
public void setProd_lst(List<Products> prod_lst) {
	this.prod_lst = prod_lst;
}
public List<drivers> getDriver_lst() {
	return driver_lst;
}
public void setDriver_lst(List<drivers> driver_lst) {
	this.driver_lst = driver_lst;
}
public String getWarehouse_name() {
	return warehouse_name;
}
public void setWarehouse_name(String warehouse_name) {
	this.warehouse_name = warehouse_name;
}
public String getAgent_name() {
	return agent_name;
}
public void setAgent_name(String agent_name_) {
	this.agent_name = agent_name_;
}
public String getReq_date() {
	return req_date;
}
public void setReq_date(String req_date_) {
	this.req_date= req_date_;
}
}
