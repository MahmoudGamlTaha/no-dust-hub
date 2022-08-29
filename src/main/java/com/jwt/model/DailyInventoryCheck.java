package com.jwt.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="daily_inventory_check")
public class DailyInventoryCheck {
@Id
private int inventory_check_id;
@Column
private int facility_id;
@Column
private Date inventory_check_time;
public int getInventory_check_id() {
	return inventory_check_id;
}
public void setInventory_check_id(int inventory_check_id) {
	this.inventory_check_id = inventory_check_id;
}
public int getFacility_id() {
	return facility_id;
}
public void setFacility_id(int facility_id) {
	this.facility_id = facility_id;
}
public Date getInventory_check_time() {
	return inventory_check_time;
}
public void setInventory_check_time(Date inventory_check_time) {
	this.inventory_check_time = inventory_check_time;
}
}
