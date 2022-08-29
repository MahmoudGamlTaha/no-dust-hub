package com.jwt.model;

import java.sql.Date;
import java.text.DecimalFormat;

import org.springframework.format.annotation.DateTimeFormat;

public class Payment {
	private int id;
private int payment_type;
private String account;
private String payment_name;
private int location;
private String amount;
private String due_date;
private String note;
private String check_;
private String display_name;
private String facility_name;
private String account_name;
@DateTimeFormat(pattern = "dd-MM-yyyy hh:mm")
private Date d1;
public int getPayment_type() {
	return payment_type;
}
public void setPayment_type(int payment_type) {
	this.payment_type = payment_type;
}
public String getAccount() {
	return account;
}
public void setAccount(String account) {
	this.account = account;
}
public String getPayment_name() {
	return payment_name;
}
public void setPayment_name(String payment_name) {
	this.payment_name = payment_name;
}
public int getLocation() {
	return location;
}
public void setLocation(int location) {
	this.location = location;
}
public String getAmount() {
	/*  double x= Double.parseDouble(this.amount.replace(",",""));
	return x;*/
	return this.amount;
}
public void setAmount(double amount) {
	String pattern = "####,###.##";
	   // double number = 123456789.123;
	    
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	    String x_amount=numberFormat.format(amount);
	this.amount = x_amount;
}
public String getDue_date() {
	return due_date;
}
public void setDue_date(String due_date) {
	this.due_date = due_date;
}
public String getNote() {
	return note;
}
public void setNote(String note) {
	this.note = note;
}
private String emp_id;
private String emp_name;
private int emp_type;
public String getEmp_id() {
	return emp_id;
}
public void setEmp_id(String emp_id) {
	this.emp_id = emp_id;
}
public String getEmp_name() {
	return emp_name;
}
public void setEmp_name(String emp_name) {
	this.emp_name = emp_name;
}
public int getEmp_type() {
	return emp_type;
}
public void setEmp_type(int emp_type) {
	this.emp_type = emp_type;
}

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getDisplay_name() {
	return display_name;
}
public void setDisplay_name(String display_name) {
	this.display_name = display_name;
}
public Date getD1() {
	return d1;
}
public void setD1(Date d1) {
	this.d1 = d1;
}
public String getCheck_() {
	return check_;
}
public void setCheck_(String check_) {
	this.check_ = check_;
}
public String getFacility_name() {
	return facility_name;
}
public void setFacility_name(String facility_name) {
	this.facility_name = facility_name;
}
public String getAccount_name() {
	return account_name;
}
public void setAccount_name(String account_name) {
	this.account_name = account_name;
}


}
