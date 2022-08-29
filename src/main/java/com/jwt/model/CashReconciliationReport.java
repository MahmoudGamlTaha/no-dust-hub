package com.jwt.model;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class CashReconciliationReport {
private String transaction_date;
private String driver_name;
private String agent_name;
private String expected_money;
private String reconciled_money;
private String actual_money;
private String from_status;
private String to_status;
public String getTransaction_date() {
	return transaction_date;
}
public void setTransaction_date(String transaction_date) {
	this.transaction_date = transaction_date;
}
public String getDriver_name() {
	return driver_name;
}
public void setDriver_name(String driver_name) {
	this.driver_name = driver_name;
}
public String getAgent_name() {
	return agent_name;
}
public void setAgent_name(String agent_name) {
	this.agent_name = agent_name;
}

public String getFrom_status() {
	return from_status;
}
public void setFrom_status(String from_status) {
	this.from_status = from_status;
}
public String getTo_status() {
	return to_status;
}
public void setTo_status(String to_status) {
	this.to_status = to_status;
}
public String getExpected_money() {
	return expected_money;
}
public void setExpected_money(double expected_money) {
	String pattern = "####,###.##";
	   // double number = 123456789.123;
	    
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	    String x_amount=numberFormat.format(expected_money);
	this.expected_money = x_amount;
}

public String getActual_money() {
	return actual_money;
}
public void setActual_money(double actual_money) {
	String pattern = "####,###.##";
	   // double number = 123456789.123;
	    
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	    String x_amount=numberFormat.format(actual_money);
	this.actual_money = x_amount;
}
public String getReconciled_money() {
	return reconciled_money;
}
public void setReconciled_money(double reconciled_money) {
	String pattern = "####,###.##";
	   // double number = 123456789.123;
	    
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	    String x_amount=numberFormat.format(reconciled_money);
	this.reconciled_money = x_amount;
}
}
