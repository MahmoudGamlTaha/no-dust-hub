package com.jwt.model;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class CashTrasfers {
private int id;
private String transaction_date;
private String transfer_date;
private String comments;
private String added;
private String deducted;
private String previous_amount;
private String transaction_type;
private String transaction_time;
private String payment_refrence;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getTransaction_date() {
	return transaction_date;
}
public void setTransaction_date(String transaction_date) {
	this.transaction_date = transaction_date;
}
public String getTransfer_date() {
	return transfer_date;
}
public void setTransfer_date(String transfer_date) {
	this.transfer_date = transfer_date;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}
public String getAdded() {
	return added;
}
public void setAdded(double added) {
	String pattern = "####,###.##";
	   // double number = 123456789.123;
	
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	    String x_amount=numberFormat.format(added);
	this.added = x_amount;
}
public String getDeducted() {
	return deducted;
}
public void setDeducted(double deducted) {
	String pattern = "####,###.##";
	   // double number = 123456789.123;
	
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	    String x_amount=numberFormat.format(deducted);
	this.deducted = x_amount;
}
public String getPrevious_amount() {
	return previous_amount;
}
public void setPrevious_amount(double previous_amount) {
	String pattern = "####,###.##";
	   // double number = 123456789.123;
	   
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	   
	    double x= Double.parseDouble(this.added.replace(",",""));
	    double y=Double.parseDouble(this.deducted.replace(",",""));
	   double a=previous_amount+x-y;
	    String x_amount=numberFormat.format(a);

	this.previous_amount = x_amount;
}
public String getTransaction_type() {
	return transaction_type;
}
public void setTransaction_type(String transaction_type) {
	this.transaction_type = transaction_type;
}
public String getTransaction_time() {
	return transaction_time;
}
public void setTransaction_time(String transaction_time) {
	this.transaction_time = transaction_time;
}
public String getPayment_refrence() {
	return payment_refrence;
}
public void setPayment_refrence(String payment_refrence) {
	this.payment_refrence = payment_refrence;
}


}
