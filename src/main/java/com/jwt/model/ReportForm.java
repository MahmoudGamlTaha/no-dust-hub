package com.jwt.model;

import java.util.List;

public class ReportForm {
	
	private List<ReportShipment> ships;
	private List<Order> orders; 
	private List<InventoryCheck> checks;
	public List<ReportShipment> getShips() {
		return ships;
	}
	public void setShips(List<ReportShipment> ships) {
		this.ships = ships;
	}
	public List<Order> getOrders() {
		return orders;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	public List<InventoryCheck> getChecks() {
		return checks;
	}
	public void setChecks(List<InventoryCheck> checks) {
		this.checks = checks;
	}
	

}
