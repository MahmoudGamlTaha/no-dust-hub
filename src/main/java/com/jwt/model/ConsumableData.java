package com.jwt.model;

import java.util.List;

public class ConsumableData {
private String ids;
public String getIds() {
	return ids;
}
public void setIds(String ids) {
	this.ids = ids;
}
public List<Consumable> getConsumable_details() {
	return consumable_details;
}
public void setConsumable_details(List<Consumable> consumable_details) {
	this.consumable_details = consumable_details;
}
public List<Consumable> getTotal_consumables() {
	return total_consumables;
}
public void setTotal_consumables(List<Consumable> total_consumables) {
	this.total_consumables = total_consumables;
}
private List<Consumable> consumable_details;
private List<Consumable> total_consumables;
private List<DirtyProductData> data_for_printing;
private List<DirtyOrderData> order_data_printing;
public List<DirtyOrderData> getOrder_data_printing() {
	return order_data_printing;
}
public void setOrder_data_printing(List<DirtyOrderData> order_data_printing) {
	this.order_data_printing = order_data_printing;
}
public List<DirtyProductData> getData_for_printing() {
	return data_for_printing;
}
public void setData_for_printing(List<DirtyProductData> data_for_printing) {
	this.data_for_printing = data_for_printing;
}
}
