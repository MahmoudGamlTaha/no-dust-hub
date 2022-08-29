package com.jwt.model;

import java.util.List;

public class InventoryFormData {
	private List<InventoryProduct> products ;
	public List<InventoryProduct> getProducts() {
		return products;
	}

	public void setProducts(List<InventoryProduct> products) {
		this.products = products;
	}

	private String type_filter;
	private String name_filter;
	public String getName_filter() {
		return name_filter;
	}

	public void setName_filter(String name_filter) {
		this.name_filter = name_filter;
	}

	public String getTreatment_filter() {
		return treatment_filter;
	}

	public void setTreatment_filter(String treatment_filter) {
		this.treatment_filter = treatment_filter;
	}

	

	private String treatment_filter;
	private String quantity_filter;
	public String getQuantity_filter() {
		return quantity_filter;
	}

	public void setQuantity_filter(String quantity_filter) {
		this.quantity_filter = quantity_filter;
	}

	public String getType_filter() {
		return type_filter;
	}

	public void setType_filter(String type_filter) {
		this.type_filter = type_filter;
	}

	private String warehouse;
	private String date;
	private String agent;
private String comment;
	public String getComment() {
	return comment;
}

public void setComment(String comment) {
	this.comment = comment;
}

	

	public String getWarehouse() {
		return warehouse;
	}

	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}
	
	

}
