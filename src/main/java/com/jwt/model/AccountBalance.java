package com.jwt.model;

import java.text.DecimalFormat;

public class AccountBalance {
private String account_name;
private String balance;
private String account_id;
public String getAccount_name() {
	return account_name;
}
public void setAccount_name(String account_name) {
	this.account_name = account_name;
}
public String getBalance() {
	return balance;
}
public void setBalance(double balance) {
	String pattern = "####,###.##";
	   // double number = 123456789.123;
	
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	    String x_amount=numberFormat.format(balance);
	this.balance = x_amount;
}
public String getAccount_id() {
	return account_id;
}
public void setAccount_id(String account_id) {
	this.account_id = account_id;
}

}
