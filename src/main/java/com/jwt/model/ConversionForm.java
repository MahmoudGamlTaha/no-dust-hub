package com.jwt.model;

import java.util.List;

public class ConversionForm {
private String warehouse_name;
private String agent_name;
private String conv_date;
private String from_type;
private String to_type;
private String fac_id;
private List<Products> prod_lst;
private List<DirtyProduct> dirty_product_lst;
private List<TreatedProduct> treated_product_lst;
public List<TreatedProduct> getTreated_product_lst() {
	return treated_product_lst;
}
public void setTreated_product_lst(List<TreatedProduct> treated_product_lst) {
	this.treated_product_lst = treated_product_lst;
}
public List<DirtyProduct> getDirty_product_lst() {
	return dirty_product_lst;
}
public void setDirty_product_lst(List<DirtyProduct> dirty_product_lst) {
	this.dirty_product_lst = dirty_product_lst;
}
public String getFac_id() {
	return fac_id;
}
public void setFac_id(String fac_id) {
	this.fac_id = fac_id;
}
public String getWarehouse_name() {
	return warehouse_name;
}
public void setWarehouse_name(String warehouse_name) {
	this.warehouse_name = warehouse_name;
}
public String getAgent_name() {
	return agent_name;
}
public void setAgent_name(String agent_name) {
	this.agent_name = agent_name;
}
public String getConv_date() {
	return conv_date;
}
public void setConv_date(String conv_date) {
	this.conv_date = conv_date;
}
public String getFrom_type() {
	return from_type;
}
public void setFrom_type(String from_type) {
	this.from_type = from_type;
}
public String getTo_type() {
	return to_type;
}
public void setTo_type(String to_type) {
	this.to_type = to_type;
}
public List<Products> getProd_lst() {
	return prod_lst;
}
public void setProd_lst(List<Products> prod_lst) {
	this.prod_lst = prod_lst;
}
}
