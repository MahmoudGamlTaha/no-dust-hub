package com.jwt.model;

public class DashBoardData {
private int dispatch_count;
public int getDispatch_count() {
	return dispatch_count;
}
public void setDispatch_count(int dispatch_count) {
	this.dispatch_count = dispatch_count;
}
public int getReconciliation_count() {
	return reconciliation_count;
}
public void setReconciliation_count(int reconciliation_count) {
	this.reconciliation_count = reconciliation_count;
}
public double getExpected_money() {
	return expected_money;
}
public void setExpected_money(String expected_money) {
	if(expected_money==null)
	{
		this.expected_money=0;
	}
	else
	{
	this.expected_money = Double.parseDouble(expected_money);
	}
}
private int reconciliation_count;
private double expected_money;
}
