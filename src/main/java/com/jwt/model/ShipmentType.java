package com.jwt.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="shipments_types")
public class ShipmentType {

	@Id
	@Column
	private int shipment_type_id ;
	@Column
	private String shipment_type;
	public int getShipment_type_id() {
		return shipment_type_id;
	}
	public void setShipment_type_id(int shipment_type_id) {
		this.shipment_type_id = shipment_type_id;
	}
	public String getShipment_type() {
		return shipment_type;
	}
	public void setShipment_type(String shipment_type) {
		this.shipment_type = shipment_type;
	}
	
	
}
