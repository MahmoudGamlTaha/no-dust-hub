package com.jwt.model;

import java.math.BigDecimal;

public class ExpectedCashOnShipment {
private String driver_id;
private String assign_date;
public String getDriver_id() {
	return driver_id;
}
public void setDriver_id(String driver_id) {
	this.driver_id = driver_id;
}
public BigDecimal getExpected_money() {
	return expected_money;
}
public void setExpected_money(BigDecimal expected_money) {
	this.expected_money = expected_money;
}
public BigDecimal getReconciliated_money() {
	return reconciliated_money;
}
public void setReconciliated_money(BigDecimal reconciliated_money) {
	this.reconciliated_money = reconciliated_money;
}
private BigDecimal expected_money;
private BigDecimal reconciliated_money;
public String getAssign_date() {
	return assign_date;
}
public void setAssign_date(String assign_date) {
	this.assign_date = assign_date;
}

}
