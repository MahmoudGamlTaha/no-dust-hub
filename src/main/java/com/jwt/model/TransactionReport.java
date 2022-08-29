package com.jwt.model;

import java.util.List;

import javax.swing.ListModel;

public class TransactionReport {
private String from_date;
private String to_date;
private int facility_id;
private String product_id;
private List<ProductTransaction>lst_products;
private List<ProductTransaction>lst_products_types;
public String getFrom_date() {
	return from_date;
}
public void setFrom_date(String from_date) {
	this.from_date = from_date;
}
public String getTo_date() {
	return to_date;
}
public void setTo_date(String to_date) {
	this.to_date = to_date;
}
public int getFacility_id() {
	return facility_id;
}
public void setFacility_id(int facility_id) {
	this.facility_id = facility_id;
}
public String getProduct_id() {
	return product_id;
}
public void setProduct_id(String product_id) {
	this.product_id = product_id;
}
public List<ProductTransaction> getLst_products() {
	return lst_products;
}
public void setLst_products(List<ProductTransaction> lst_products) {
	this.lst_products = lst_products;
}
public List<ProductTransaction> getLst_products_types() {
	return lst_products_types;
}
public void setLst_products_types(List<ProductTransaction> lst_products_types) {
	this.lst_products_types = lst_products_types;
}
}
