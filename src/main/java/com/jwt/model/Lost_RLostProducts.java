package com.jwt.model;

public class Lost_RLostProducts {
private String product_sku;
private int product_type;
private int quantity;
private String source;

private String accountable;

public String getProduct_sku() {
	return product_sku;
}

public void setProduct_sku(String product_sku) {
	this.product_sku = product_sku;
}

public int getproduct_type() {
	return product_type;
}

public void setproduct_type(int product_type) {
	this.product_type = product_type;
}

public int getQuantity() {
	return quantity;
}

public void setQuantity(int quantity) {
	this.quantity = quantity;
}

public String getSource() {
	return source;
}

public void setSource(String source) {
	this.source = source;
}

public String getAccountable() {
	return accountable;
}

public void setAccountable(String accountable) {
	this.accountable = accountable;
}
}
