package com.jwt.model;

import java.util.List;

public class CashInOutForm {
	
private String assignDate ;
	
	private String agentName;
	private String src_type;
	private String wareHouseName;
	private List<PaymentEmployee> lst_emp;
	private String selectedDriver;
	private List<PaymentAccount>lst_payment_accounts;
	private List<Facility> lst_payment_loc;
	private List<FinancialAccount> accounts;
	private List<ReceiveCashFinancailAccount> receiveCashFinancailAccounts;
	private List<Driver> drivers;
	private List<drivers> drivers_lst;
	private List<Employee> employees;
	private List<Drivers_Users> lst_drivers_users;
	private List<Payment_type>lst_payment_type;
	private List<Payment>lst_payment;
	private List<PaymentSubmit>payments;
	private double recievedCash;
	private int des_id;
	private String selected_product_id;
	private int approved_status;
	private String comment;
	
	private String destination;
	private String source;
	private String file_name;

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public List<ReceiveCashFinancailAccount> getReceiveCashFinancailAccounts() {
		return receiveCashFinancailAccounts;
	}

	public void setReceiveCashFinancailAccounts(List<ReceiveCashFinancailAccount> receiveCashFinancailAccounts) {
		this.receiveCashFinancailAccounts = receiveCashFinancailAccounts;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public String getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(String assignDate) {
		this.assignDate = assignDate;
	}

	public String getAgentName() {
		return agentName;
	}

	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}

	public String getWareHouseName() {
		return wareHouseName;
	}

	public void setWareHouseName(String wareHouseName) {
		this.wareHouseName = wareHouseName;
	}

	public String getSelectedDriver() {
		return selectedDriver;
	}

	public void setSelectedDriver(String selectedDriver) {
		this.selectedDriver = selectedDriver;
	}

	public List<FinancialAccount> getAccounts() {
		return accounts;
	}

	public void setAccounts(List<FinancialAccount> accounts) {
		this.accounts = accounts;
	}

	public List<Driver> getDrivers() {
		return drivers;
	}

	public void setDrivers(List<Driver> drivers) {
		this.drivers = drivers;
	}

	public double getRecievedCash() {
		return recievedCash;
	}

	public void setRecievedCash(double recievedCash) {
		this.recievedCash = recievedCash;
	}

	public String getSelected_product_id() {
		return selected_product_id;
	}

	public void setSelected_product_id(String selected_product_id) {
		this.selected_product_id = selected_product_id;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public List<drivers> getDrivers_lst() {
		return drivers_lst;
	}

	public void setDrivers_lst(List<drivers> drivers_lst) {
		this.drivers_lst = drivers_lst;
	}

	public List<Drivers_Users> getLst_drivers_users() {
		return lst_drivers_users;
	}

	public void setLst_drivers_users(List<Drivers_Users> lst_drivers_users) {
		this.lst_drivers_users = lst_drivers_users;
	}

	public List<PaymentAccount> getLst_payment_accounts() {
		return lst_payment_accounts;
	}

	public void setLst_payment_accounts(List<PaymentAccount> lst_payment_accounts) {
		this.lst_payment_accounts = lst_payment_accounts;
	}

	public List<Facility> getLst_payment_loc() {
		return lst_payment_loc;
	}

	public void setLst_payment_loc(List<Facility> lst_payment_loc) {
		this.lst_payment_loc = lst_payment_loc;
	}

	public List<Payment_type> getLst_payment_type() {
		return lst_payment_type;
	}

	public void setLst_payment_type(List<Payment_type> lst_payment_type) {
		this.lst_payment_type = lst_payment_type;
	}

	public List<Payment> getLst_payment() {
		return lst_payment;
	}

	public void setLst_payment(List<Payment> lst_payment) {
		this.lst_payment = lst_payment;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public List<PaymentEmployee> getLst_emp() {
		return lst_emp;
	}

	public void setLst_emp(List<PaymentEmployee> lst_emp) {
		this.lst_emp = lst_emp;
	}

	public int getDes_id() {
		return des_id;
	}

	public void setDes_id(int des_id) {
		this.des_id = des_id;
	}

	public String getSrc_type() {
		return src_type;
	}

	public void setSrc_type(String src_type) {
		this.src_type = src_type;
	}

	public int getApproved_status() {
		return approved_status;
	}

	public void setApproved_status(int approved_status) {
		this.approved_status = approved_status;
	}

	public List<PaymentSubmit> getPayments() {
		return payments;
	}

	public void setPayments(List<PaymentSubmit> payments) {
		this.payments = payments;
	}
	
	


}
