package com.jwt.model;

public class LostRlostReportProducts {
	private int shipment_id;
	private int product_lost_quantity;
	private int product_returned_quantity;
	private String t_type;
	public String product_id;
	public int getShipment_id() {
		return shipment_id;
	}
	public void setShipment_id(int shipment_id) {
		this.shipment_id = shipment_id;
	}
	public int getProduct_lost_quantity() {
		return product_lost_quantity;
	}
	public void setProduct_lost_quantity(int product_lost_quantity) {
		this.product_lost_quantity = product_lost_quantity;
	}
	public int getProduct_returned_quantity() {
		return product_returned_quantity;
	}
	public void setProduct_returned_quantity(int product_returned_quantity) {
		this.product_returned_quantity = product_returned_quantity;
	}
	public String getT_type() {
		return t_type;
	}
	public void setT_type(String t_type) {
		this.t_type = t_type;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	  
	

}
