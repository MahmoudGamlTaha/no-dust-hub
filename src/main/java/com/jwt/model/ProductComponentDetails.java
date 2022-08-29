package com.jwt.model;

import java.math.BigDecimal;

public class ProductComponentDetails {
private String product_name;
public String getProduct_name() {
	return product_name;
}
public void setProduct_name(String product_name) {
	this.product_name = product_name;
}

private BigDecimal total_stock_quantity;
public BigDecimal getTotal_stock_quantity() {
	return total_stock_quantity;
}
public void setTotal_stock_quantity(BigDecimal total_stock_quantity) {
	this.total_stock_quantity = total_stock_quantity;
}
public BigDecimal getQuantity() {
	return quantity;
}
public void setQuantity(BigDecimal quantity) {
	this.quantity = quantity;
}

private BigDecimal quantity;
}
