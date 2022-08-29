package com.jwt.model;

import java.math.BigDecimal;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="shipments_list")
public class ShipmentList {
	@Id
private BigDecimal shipment_id;
	public BigDecimal getShipment_id() {
		return shipment_id;
	}
	public void setShipment_id(BigDecimal shipment_id) {
		this.shipment_id = shipment_id;
	}
	public String getShipment_date() {
		return shipment_date;
	}
	public void setShipment_date(String shipment_date) {
		this.shipment_date = shipment_date;
	}
	public String getShipment_type() {
		return shipment_type;
	}
	public void setShipment_type(String shipment_type) {
		this.shipment_type = shipment_type;
	}
	public String getStatus_name() {
		return status_name;
	}
	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}
	public String getDriver_id() {
		return driver_id;
	}
	public void setDriver_id(String driver_id) {
		this.driver_id = driver_id;
	}
	public String getDriver_name_en() {
		return driver_name_en;
	}
	public void setDriver_name_en(String driver_name_en) {
		this.driver_name_en = driver_name_en;
	}
	public String getDriver_name_ar() {
		return driver_name_ar;
	}
	public void setDriver_name_ar(String driver_name_ar) {
		this.driver_name_ar = driver_name_ar;
	}
	public String getFacility_id() {
		return facility_id;
	}
	public void setFacility_id(String facility_id) {
		this.facility_id = facility_id;
	}
	public String getFacility_name() {
		return facility_name;
	}
	public void setFacility_name(String facility_name) {
		this.facility_name = facility_name;
	}
	public BigDecimal getShipment_actual_money_out() {
		return shipment_actual_money_out;
	}
	public void setShipment_actual_money_out(BigDecimal shipment_actual_money_out) {
		this.shipment_actual_money_out = shipment_actual_money_out;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	@Column
private String shipment_date;
@Column
private String shipment_type;
@Column
private String status_name;
@Column
private String driver_id;
@Column
private String driver_name_en;
@Column
private String driver_name_ar;
@Column
private String facility_id;
@Column
private String facility_name;
@Column
private BigDecimal shipment_actual_money_out;
@Column
private String comments;
}
