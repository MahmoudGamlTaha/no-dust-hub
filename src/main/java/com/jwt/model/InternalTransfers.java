package com.jwt.model;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class InternalTransfers {
private int shipment_id;
private String from_facility;
private String to_facility;
private String from_account;
private String to_account;
private String amount;
private String shipment_date;
public int getShipment_id() {
	return shipment_id;
}
public void setShipment_id(int shipment_id) {
	this.shipment_id = shipment_id;
}
public String getFrom_facility() {
	return from_facility;
}
public void setFrom_facility(String from_facility) {
	this.from_facility = from_facility;
}
public String getTo_facility() {
	return to_facility;
}
public void setTo_facility(String to_facility) {
	this.to_facility = to_facility;
}
public String getFrom_account() {
	return from_account;
}
public void setFrom_account(String from_account) {
	this.from_account = from_account;
}
public String getTo_account() {
	return to_account;
}
public void setTo_account(String to_account) {
	this.to_account = to_account;
}
public String getAmount() {
	return amount;
}
public void setAmount(double amount) {
	String pattern = "####,###.##";
	   // double number = 123456789.123;
	    
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	    String x_amount=numberFormat.format(amount);
	this.amount = x_amount;
}
public String getShipment_date() {
	return shipment_date;
}
public void setShipment_date(String shipment_date) {
	this.shipment_date = shipment_date;
}

}
