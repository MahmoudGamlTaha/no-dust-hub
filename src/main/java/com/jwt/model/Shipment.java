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
@Table (name="shippments")
public class Shipment implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column
	@Id
	private int id;
	
	@Column
	private int shipment_source_type_id;
	
	@Column
	private int shipment_destination_type_id;
	
	@Column
	private String order_id;
	
	@Column 
	private String courrier_id;
	
	@Column
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
	private Date shipment_expected_delivery_date;
	
	@Column
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
	private Date shipment_actual_delivery_date;
	@Column
	private String shipment_actual_money_out;
	@Column
	private String bank_account_num;
	public String getBank_account_num() {
		return bank_account_num;
	}

	public void setBank_account_num(String bank_account_num) {
		this.bank_account_num = bank_account_num;
	}

	public String getShipment_actual_money_out() {
		return shipment_actual_money_out;
	}

	public void setShipment_actual_money_out(String shipment_actual_money_out) {
		
		
		this.shipment_actual_money_out =shipment_actual_money_out;
		
	}

	@Column
	private String related_shipments;
	
	@Column
	private String bank_attachement;
	
	@Column 
	private int shipment_type_id;
	
	@Column 
	private String last_status;
	
	@Column 
	private String shippment_souce_id;
	
	@Column
	private String shippment_destination_id;
	

	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getShipment_source_type_id() {
		return shipment_source_type_id;
	}

	public void setShipment_source_type_id(int shipment_source_type_id) {
		this.shipment_source_type_id = shipment_source_type_id;
	}

	public int getShipment_destination_type_id() {
		return shipment_destination_type_id;
	}

	public void setShipment_destination_type_id(int shipment_destination_type_id) {
		this.shipment_destination_type_id = shipment_destination_type_id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getCourrier_id() {
		return courrier_id;
	}

	public void setCourrier_id(String courrier_id) {
		this.courrier_id = courrier_id;
	}

	public Date getShipment_expected_delivery_date() {
		return shipment_expected_delivery_date;
	}

	public void setShipment_expected_delivery_date(Date shipment_expected_delivery_date) {
		this.shipment_expected_delivery_date = shipment_expected_delivery_date;
	}

	public Date getShipment_actual_delivery_date() {
		return shipment_actual_delivery_date;
	}

	public void setShipment_actual_delivery_date(Date shipment_actual_delivery_date) {
		this.shipment_actual_delivery_date = shipment_actual_delivery_date;
	}

	public String getRelated_shipments() {
		return related_shipments;
	}

	public void setRelated_shipments(String related_shipments) {
		this.related_shipments = related_shipments;
	}

	public String getBank_attachement() {
		return bank_attachement;
	}

	public void setBank_attachement(String bank_attachement) {
		this.bank_attachement = bank_attachement;
	}

	public int getShipment_type_id() {
		return shipment_type_id;
	}

	public void setShipment_type_id(int shipment_type_id) {
		this.shipment_type_id = shipment_type_id;
	}

	public String getLast_status() {
		return last_status;
	}

	public void setLast_status(String last_status) {
		this.last_status = last_status;
	}

	public String getShippment_source_id() {
		return shippment_souce_id;
	}

	public void setShippment_source_id(String shippment_source_id) {
		this.shippment_souce_id = shippment_source_id;
	}

	public String getShippment_destination_id() {
		return shippment_destination_id;
	}

	public void setShippment_destination_id(String shippment_destination_id) {
		this.shippment_destination_id = shippment_destination_id;
	}

	public String getShippment_souce_id() {
		return shippment_souce_id;
	}

	public void setShippment_souce_id(String shippment_souce_id) {
		this.shippment_souce_id = shippment_souce_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}