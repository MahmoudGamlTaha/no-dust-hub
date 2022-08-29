package com.jwt.model;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class PaymentReport {
private String due_date;
private String total_amount;
private String approved_amount;
private String paid_amount;
private String unpaid_amount;
private String cash_account;
private String approved;
private String paid;
private String payment_date;
private String payment_name;
private String payment_type;
private String emp_name;
public String getDue_date() {
	return due_date;
}
public void setDue_date(String due_date) {
	this.due_date = due_date;
}

public String getCash_account() {
	return cash_account;
}
public void setCash_account(String cash_account) {
	this.cash_account = cash_account;
}
public String getTotal_amount() {
	return total_amount;
}
public void setTotal_amount(double total_amount) {
	String pattern = "####,###.##";
	   // double number = 123456789.123;
	    
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	    String x_amount=numberFormat.format(total_amount);
	this.total_amount = x_amount;
}
public String getApproved_amount() {
	return approved_amount;
}
public void setApproved_amount(double approved_amount) {
	String pattern = "####,###.##";
	   // double number = 123456789.123;
	    
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	    String x_amount=numberFormat.format(approved_amount);
	this.approved_amount = x_amount;
}
public String getPaid_amount() {
	return paid_amount;
}
public void setPaid_amount(double paid_amount) {
	String pattern = "####,###.##";
	   // double number = 123456789.123;
	    
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	    String x_amount=numberFormat.format(paid_amount);
	this.paid_amount = x_amount;
}
public String getUnpaid_amount() {
	return unpaid_amount;
}
public void setUnpaid_amount(double unpaid_amount) {
	String pattern = "####,###.##";
	   // double number = 123456789.123;
	    
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	    String x_amount=numberFormat.format(unpaid_amount);
	this.unpaid_amount = x_amount;
}
public String getApproved() {
	return approved;
}
public void setApproved(String approved) {
	this.approved = approved;
}
public String getPaid() {
	return paid;
}
public void setPaid(String paid) {
	this.paid = paid;
}
public String getPayment_date() {
	return payment_date;
}
public void setPayment_date(String payment_date) {
	this.payment_date = payment_date;
}
public String getPayment_name() {
	return payment_name;
}
public void setPayment_name(String payment_name) {
	this.payment_name = payment_name;
}
public String getPayment_type() {
	return payment_type;
}
public void setPayment_type(String payment_type) {
	this.payment_type = payment_type;
}
public String getEmp_name() {
	return emp_name;
}
public void setEmp_name(String emp_name) {
	this.emp_name = emp_name;
}
}
