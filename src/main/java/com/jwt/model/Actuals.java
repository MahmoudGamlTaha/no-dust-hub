package com.jwt.model;

import java.math.BigDecimal;

public class Actuals {
private String product_id;
private BigDecimal treatment_id;
private String driver_id;
private BigDecimal dms_new;
private BigDecimal actual_new;
private BigDecimal dms_cancel;
private BigDecimal actual_cancel;
private BigDecimal product_type;
private String product_sku;
private String product_name;
private BigDecimal rlost;
public String getProduct_id() {
	return product_id;
}
public void setProduct_id(String product_id) {
	this.product_id = product_id;
}
public BigDecimal getTreatment_id() {
	return treatment_id;
}
public void setTreatment_id(BigDecimal treatment_id) {
	this.treatment_id = treatment_id;
}
public String getDriver_id() {
	return driver_id;
}
public void setDriver_id(String driver_id) {
	this.driver_id = driver_id;
}
public BigDecimal getDms_new() {
	return dms_new;
}
public void setDms_new(BigDecimal dms_new) {
	this.dms_new = dms_new;
}
public BigDecimal getActual_new() {
	return actual_new;
}
public void setActual_new(BigDecimal actual_new) {
	this.actual_new = actual_new;
}
public BigDecimal getDms_cancel() {
	return dms_cancel;
}
public void setDms_cancel(BigDecimal dms_cancel) {
	this.dms_cancel = dms_cancel;
}
public BigDecimal getActual_cancel() {
	return actual_cancel;
}
public void setActual_cancel(BigDecimal actual_cancel) {
	this.actual_cancel = actual_cancel;
}
public BigDecimal getProduct_type() {
	return product_type;
}
public void setProduct_type(BigDecimal product_type) {
	this.product_type = product_type;
}
public String getProduct_sku() {
	return product_sku;
}
public void setProduct_sku(String product_sku) {
	this.product_sku = product_sku;
}
public String getProduct_name() {
	return product_name;
}
public void setProduct_name(String product_name) {
	this.product_name = product_name;
}
public BigDecimal getRlost() {
	return rlost;
}
public void setRlost(BigDecimal rlost) {
	this.rlost = rlost;
}


}
