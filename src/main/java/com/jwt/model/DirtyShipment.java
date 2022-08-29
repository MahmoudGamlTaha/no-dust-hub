package com.jwt.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table (name="dirty_shippments_list")
public class DirtyShipment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column
	private String shipment_id;
	
	@Column
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
	private Date shipment_expected_delivery_date;
	
	
	@Column
	private String shippment_destination_id;
	
	@Column 
	private String shippment_souce_id;
	
	@Column 
	private String facility_name;
	
	@Column 
	private String last_status;
	

	@Column
	private String bank_attachement;

	public String getShipment_id() {
		return shipment_id;
	}


	public void setShipment_id(String shipment_id) {
		this.shipment_id = shipment_id;
	}


	public Date getShipment_expected_delivery_date() {
		return shipment_expected_delivery_date;
	}


	public void setShipment_expected_delivery_date(Date shipment_expected_delivery_date) {
		this.shipment_expected_delivery_date = shipment_expected_delivery_date;
	}


	public String getFacility_name() {
		return facility_name;
	}


	public void setFacility_name(String facility_name) {
		this.facility_name = facility_name;
	}


	public String getShippment_destination_id() {
		return shippment_destination_id;
	}


	public void setShippment_destination_id(String shippment_destination_id) {
		this.shippment_destination_id = shippment_destination_id;
	}


	public String getLast_status() {
		return last_status;
	}


	public void setLast_status(String last_status) {
		this.last_status = last_status;
	}


	public String getShippment_souce_id() {
		return shippment_souce_id;
	}


	public void setShippment_souce_id(String shippment_souce_id) {
		this.shippment_souce_id = shippment_souce_id;
	}


	public String getBank_attachement() {
		return bank_attachement;
	}


	public void setBank_attachement(String bank_attachement) {
		this.bank_attachement = bank_attachement;
	}
	
	private int shipment_source_type_id;

	public int getShipment_source_type_id() {
		return shipment_source_type_id;
	}


	public void setShipment_source_type_id(int shipment_source_type_id) {
		this.shipment_source_type_id = shipment_source_type_id;
	}
	

}
