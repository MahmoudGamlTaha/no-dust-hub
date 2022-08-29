package com.jwt.model;

import java.math.BigDecimal;

public class ShipmentDetails  {
private BigDecimal id;
private int shipment_id;
private BigDecimal approved;
private BigDecimal sealed;
private BigDecimal quantity_shipped;
private BigDecimal reconciled_money_amount;
private String product_id;
private String product_name;
public BigDecimal getId() {
	return id;
}
public void setId(BigDecimal id) {
	this.id = id;
}
public int getShipment_id() {
	return shipment_id;
}
public void setShipment_id(int shipment_id) {
	this.shipment_id = shipment_id;
}
public BigDecimal getApproved() {
	return approved;
}
public void setApproved(BigDecimal approved) {
	this.approved = approved;
}
public BigDecimal getSealed() {
	return sealed;
}
public void setSealed(BigDecimal sealed) {
	this.sealed = sealed;
}
public BigDecimal getQuantity_shipped() {
	return quantity_shipped;
}
public void setQuantity_shipped(BigDecimal quantity_shipped) {
	this.quantity_shipped = quantity_shipped;
}
public BigDecimal getReconciled_money_amount() {
	return reconciled_money_amount;
}
public void setReconciled_money_amount(BigDecimal reconciled_money_amount) {
	this.reconciled_money_amount = reconciled_money_amount;
}
public String getProduct_id() {
	return product_id;
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
}
