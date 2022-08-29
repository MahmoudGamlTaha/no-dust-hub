package com.jwt.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="shipments_logs")
public class ShipmentLog implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column
	private int log_id;
	
	@Column
	private Date log_date;
	
	@Column
	private String logged_user_type;
	
	@Column
	private String from_status_id;
	
	@Column
	private String to_status_id;
	
	@Column
	private int shipment_id;
	
	@Column
	private String logged_user;

	public int getLog_id() {
		return log_id;
	}

	public void setLog_id(int log_id) {
		this.log_id = log_id;
	}

	public Date getLog_date() {
		return log_date;
	}

	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}

	public String getLogged_user_type() {
		return logged_user_type;
	}

	public void setLogged_user_type(String logged_user_type) {
		this.logged_user_type = logged_user_type;
	}

	public String getFrom_status_id() {
		return from_status_id;
	}

	public void setFrom_status_id(String from_status_id) {
		this.from_status_id = from_status_id;
	}

	public String getTo_status_id() {
		return to_status_id;
	}

	public void setTo_status_id(String to_status_id) {
		this.to_status_id = to_status_id;
	}

	public int getShipment_id() {
		return shipment_id;
	}

	public void setShipment_id(int shipment_id) {
		this.shipment_id = shipment_id;
	}

	public String getLogged_user() {
		return logged_user;
	}

	public void setLogged_user(String logged_user) {
		this.logged_user = logged_user;
	} 
	
}
