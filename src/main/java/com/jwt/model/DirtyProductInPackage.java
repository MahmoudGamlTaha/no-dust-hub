package com.jwt.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

public class DirtyProductInPackage {
	
	@Column
	private String product_id;
	
	@Column
	private String product_name;
	
	@Column
	@Id
	private String product_sku;
	
	@Column
	private String product_category;
	
	@Column
	private String type;
	
	@Column
	private String dms_product_id;
	
	@Column
	private int quantity;

	public String getProduct_id() {
		return product_id;
	}
	

	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_sku() {
		return product_sku;
	}

	public void setProduct_sku(String product_sku) {
		this.product_sku = product_sku;
	}

	public String getDms_product_id() {
		return dms_product_id;
	}

	public void setDms_product_id(String dms_product_id) {
		this.dms_product_id = dms_product_id;
	}

	public String getProduct_category() {
		return product_category;
	}

	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	

}
