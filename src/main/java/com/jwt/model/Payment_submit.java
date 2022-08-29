package com.jwt.model;

import java.util.List;

public class Payment_submit {

	private List<PayrollPayment> payments_lst;
	private double totalPayed;
	private int collected_by_self;
	private String collected_by;
	private List<Payment>payments;
	private List<PaymentSubmit> lst_payments;
	public List<PayrollPayment> getPayments_lst() {
		return payments_lst;
	}
	public void setPayments_lst(List<PayrollPayment> payments_lst) {
		this.payments_lst = payments_lst;
	}
	public double getTotalPayed() {
		return totalPayed;
	}
	public void setTotalPayed(double totalPayed) {
		this.totalPayed = totalPayed;
	}
	public List<Payment> getPayments() {
		return payments;
	}
	public void setPayments(List<Payment> payments) {
		this.payments = payments;
	}
	public int getCollected_by_self() {
		return collected_by_self;
	}
	public void setCollected_by_self(int collected_by_self) {
		this.collected_by_self = collected_by_self;
	}
	public String getCollected_by() {
		return collected_by;
	}
	public void setCollected_by(String collected_by) {
		this.collected_by = collected_by;
	}
	public List<PaymentSubmit> getLst_payments() {
		return lst_payments;
	}
	public void setLst_payments(List<PaymentSubmit> lst_payments) {
		this.lst_payments = lst_payments;
	}
	
	
}
