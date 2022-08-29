package com.jwt.model;

import java.math.BigDecimal;

public class ProductRawMaterial {
private String product_name;
public String getProduct_name() {
	return product_name;
}
public void setProduct_name(String product_name) {
	this.product_name = product_name;
}

private BigDecimal quantity;
public BigDecimal getQuantity() {
	return quantity;
}
public void setQuantity(BigDecimal quantity) {
	this.quantity = quantity;
}

private String unit;
public String getUnit() {
	return unit;
}
public void setUnit(String unit) {
	if(unit==null||unit=="")
	{
		this.unit = "";

	}
	else
	{
	this.unit = unit;
	}
}
}
