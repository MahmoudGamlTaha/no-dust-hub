package com.jwt.model;

import java.math.BigDecimal;

public class TransferAccounts {
	private String product_sku;
	private BigDecimal total_stock_quantity;
	private String product_name;
	public String getProduct_sku() {
		return product_sku;
	}
	public void setProduct_sku(String product_sku) {
		this.product_sku = product_sku;
	}
	public BigDecimal getTotal_stock_quantity() {
		return total_stock_quantity;
	}
	public void setTotal_stock_quantity(BigDecimal total_stock_quantity) {
		this.total_stock_quantity = total_stock_quantity;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

}
