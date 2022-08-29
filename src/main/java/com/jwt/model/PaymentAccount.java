package com.jwt.model;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class PaymentAccount {
private String account_id;
private String account_name;
private String account_cash;
public String getAccount_id() {
	return account_id;
}
public void setAccount_id(String account_id) {
	this.account_id = account_id;
}
public String getAccount_cash() {
	return account_cash;
}
public void setAccount_cash(double account_cash) {
	String pattern = "####,###.##";
	   // double number = 123456789.123;
	
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	    String x_amount=numberFormat.format(account_cash);
	this.account_cash = x_amount;
}
public String getAccount_name() {
	return account_name;
}
public void setAccount_name(String account_name) {
	this.account_name = account_name;
}
}
