package com.jwt.model;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Column;

public class Reconciliation_Data {
private String dms_product_id;
private String product_sku;
private String product_name;
private BigDecimal treatment_id;
private String treatment_name;
private int product_type;
private String driver_id;
private int out_quantity;
private int dms_quantity;
private int quantity;
private int new_quantity;
private int lost;
private int rlost;

private int expected_new;
private  int actual_new;
private int manual_new;
private int cancel;
private int manual_cancel;
private int pass_fail;
public int getpass_fail() {
	return pass_fail;
}
public void setpass_fail(int pass_fail) {
	this.pass_fail = pass_fail;
}
private int clean_dms;
private int dirty_dms;
private int clean_quan;
 private int dirty_quan;
 
public int getClean_dms() {
	return clean_dms;
}
public void setClean_dms(int clean_dms) {
	this.clean_dms = clean_dms;
}
public int getDirty_dms() {
	return dirty_dms;
}
public void setDirty_dms(int dirty_dms) {
	this.dirty_dms = dirty_dms;
}
public int getClean_quan() {
	return clean_quan;
}
public void setClean_quan(int clean_quan) {
	this.clean_quan = clean_quan;
}
public int getDirty_quan() {
	return dirty_quan;
}
public void setDirty_quan(int dirty_quan) {
	this.dirty_quan = dirty_quan;
}
public int getManual_new() {
	return manual_new;
}
public void setManual_new(int manual_new) {
	this.manual_new = manual_new;
}
public int getCancel() {
	return cancel;
}
public void setCancel(int cancel) {
	this.cancel = cancel;
}
public int getManual_cancel() {
	return manual_cancel;
}
public void setManual_cancel(int manual_cancel) {
	this.manual_cancel = manual_cancel;
}
public int getActual_new() {
	return actual_new;
}
public void setActual_new(int actual_new) {
	this.actual_new = actual_new;
}
public int getCancel_quantity() {
	return cancel_quantity;
}
public void setCancel_quantity(int cancel_quantity) {
	this.cancel_quantity = cancel_quantity;
}
private int cancel_quantity;
private List<Lost_RLostProducts> lost_lst;
private List<Lost_RLostProducts> rlost_lst;
public String getDms_product_id() {
	return dms_product_id;
}
public void setDms_product_id(String dms_product_id) {
	this.dms_product_id = dms_product_id;
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
public BigDecimal getTreatment_id() {
	return treatment_id;
}
public void setTreatment_id(BigDecimal treatment_id) {
	this.treatment_id = treatment_id;
}
public String getTreatment_name() {
	return treatment_name;
}
public void setTreatment_name(String treatment_name) {
	this.treatment_name = treatment_name;
}
public int getProduct_type() {
	return product_type;
}
public void setProduct_type(int product_type) {
	this.product_type = product_type;
}
public String getDriver_id() {
	return driver_id;
}
public void setDriver_id(String driver_id) {
	this.driver_id = driver_id;
}
public int getOut_quantity() {
	return out_quantity;
}
public void setOut_quantity(int out_quantity) {
	this.out_quantity = out_quantity;
}
public int getDms_quantity() {
	return dms_quantity;
}
public void setDms_quantity(int dms_quantity) {
	this.dms_quantity = dms_quantity;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public int getNew_quantity() {
	return new_quantity;
}
public void setNew_quantity(int new_quantity) {
	this.new_quantity = new_quantity;
}
public int getLost() {
	return lost;
}
public void setLost(int lost) {
	this.lost = lost;
}
public int getRlost() {
	return rlost;
}
public void setRlost(int rlost) {
	this.rlost = rlost;
}
public List<Lost_RLostProducts> getLost_lst() {
	return lost_lst;
}
public void setLost_lst(List<Lost_RLostProducts> lost_lst) {
	this.lost_lst = lost_lst;
}
public List<Lost_RLostProducts> getRlost_lst() {
	return rlost_lst;
}
public void setRlost_lst(List<Lost_RLostProducts> rlost_lst) {
	this.rlost_lst = rlost_lst;
}

public int getExpected_new() {
	return expected_new;
}
public void setExpected_new(int expected_new) {
	this.expected_new = expected_new;
}





}
