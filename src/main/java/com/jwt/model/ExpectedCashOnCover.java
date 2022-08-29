package com.jwt.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="expected_drivers_money_to_reconciliate")
public class ExpectedCashOnCover {
	@Id
	@Column
	
private String driver_id;
	@Column
private double expected_money;
	@Column
	private double reconciliated_money;
public double getReconciliated_money() {
		return reconciliated_money;
	}
	public void setReconciliated_money(double reconciliated_money) {
		this.reconciliated_money = reconciliated_money;
	}
public String getDriver_id() {
	return driver_id;
}
public void setDriver_id(String driver_id) {
	this.driver_id = driver_id;
}
public double getExpected_money() {
	return expected_money;
}
public void setExpected_money(double expected_money) {
	this.expected_money = expected_money;
}

}
