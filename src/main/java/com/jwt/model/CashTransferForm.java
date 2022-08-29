package com.jwt.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.List;

public class CashTransferForm {
private String request_date;
private Date transfer_date;
private String account_sku;
private String cash_amount;
private double amount;
private String bank_name;
private String bank_account_no;
private String attachment;
private String file_path;
private String t_date;
private List<TransferAccounts>lst_accounts;
public String getT_date() {
	return t_date;
}
public void setT_date(String t_date) {
	this.t_date = t_date;
}
private int shipment_id;
public int getShipment_id() {
	return shipment_id;
}
public void setShipment_id(int shipment_id) {
	this.shipment_id = shipment_id;
}
public String getFile_path() {
	return file_path;
}
public void setFile_path(String file_path) {
	this.file_path = file_path;
}
public String getAttachment() {
	return attachment;
}
public void setAttachment(String attachment) {
	this.attachment = attachment;
}
public String getBank_account_no() {
	return bank_account_no;
}
public void setBank_account_no(String bank_account_no) {
	this.bank_account_no = bank_account_no;
}
public String getBank_name() {
	return bank_name;
}
public void setBank_name(String bank_name) {
	this.bank_name = bank_name;
}
public double getAmount() {
	return amount;
}
public void setAmount(double amount) {
	this.amount = amount;
}
public String getAccount_sku() {
	return account_sku;
}
public void setAccount_sku(String account_sku) {
	this.account_sku = account_sku;
}
public Date getTransfer_date() {
	return transfer_date;
}
public void setTransfer_date(Date transfer_date) {
	this.transfer_date = transfer_date;
}
public String getRequest_date() {
	return request_date;
}
public void setRequest_date(String request_date) {
	this.request_date = request_date;
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
private String warehouse_name;
private String agent_name;
private List<FinancialAccount> financial_accounts;
private double account_amout;
public double getAccount_amout() {
	return account_amout;
}
public void setAccount_amout(double account_amout) {
	this.account_amout = account_amout;
}
public List<FinancialAccount> getFinancial_accounts() {
	return financial_accounts;
}
public void setFinancial_accounts(List<FinancialAccount> financial_accounts) {
	this.financial_accounts = financial_accounts;
}
public List<TransferAccounts> getLst_accounts() {
	return lst_accounts;
}
public void setLst_accounts(List<TransferAccounts> lst_accounts) {
	this.lst_accounts = lst_accounts;
}
public String getCash_amount() {
	return cash_amount;
}
public void setCash_amount(double cash_amount) {
	String pattern = "####,###.##";
	   // double number = 123456789.123;
	    
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	    String x_amount=numberFormat.format(cash_amount);
	this.cash_amount = x_amount;
}
}
