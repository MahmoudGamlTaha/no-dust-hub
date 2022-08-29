package com.jwt.model;

import java.util.List;

public class PaymentReportData {
private int facility_id;
private String from_date;
private String to_date;
private List<PaymentReport> lst_payments;
private List<PaymentReport> lst_payments_details;
private List<AccountBalance> lst_accounts;
private List<PaymentReport> lst_totals;
public int getFacility_id() {
	return facility_id;
}
public void setFacility_id(int facility_id) {
	this.facility_id = facility_id;
}
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
public List<PaymentReport> getLst_payments() {
	return lst_payments;
}
public void setLst_payments(List<PaymentReport> lst_payments) {
	this.lst_payments = lst_payments;
}
public List<PaymentReport> getLst_payments_details() {
	return lst_payments_details;
}
public void setLst_payments_details(List<PaymentReport> lst_payments_details) {
	this.lst_payments_details = lst_payments_details;
}
public List<AccountBalance> getLst_accounts() {
	return lst_accounts;
}
public void setLst_accounts(List<AccountBalance> lst_accounts) {
	this.lst_accounts = lst_accounts;
}
public List<PaymentReport> getLst_totals() {
	return lst_totals;
}
public void setLst_totals(List<PaymentReport> lst_totals) {
	this.lst_totals = lst_totals;
}


}
