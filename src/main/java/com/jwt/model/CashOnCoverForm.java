package com.jwt.model;

import java.util.List;

public class CashOnCoverForm {
	
	private List<ShipmentProduct> productslst;
	private String area_name;
	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	private int shipment_id;
	private double reconciledCash;
	private String date_Recon;
	private String related_shipments;
	private String state_req;
	private String areaName ;
	
	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getState_req() {
		return state_req;
	}

	public void setState_req(String state_req) {
		this.state_req = state_req;
	}

	public String getRelated_shipments() {
		return related_shipments;
	}

	public void setRelated_shipments(String related_shipments) {
		this.related_shipments = related_shipments;
	}

//private String actual_date;
public String getDate_Recon() {
		return date_Recon;
	}

	public void setDate_Recon(String date_Recon) {
		this.date_Recon = date_Recon;
	}



	public double getReconciledCash() {
		return reconciledCash;
	}

	public void setReconciledCash(double reconciledCash) {
		this.reconciledCash = reconciledCash;
	}

	private String assignDate ;
	
	private String agentName;
	
	private String wareHouseName;
	
	private Driver driver;
	private String sku_selected;
	public String getSku_selected() {
		return sku_selected;
	}

	public void setSku_selected(String sku_selected) {
		this.sku_selected = sku_selected;
	}

	private List<FinancialAccount> accounts;
	private List<DirtyFinancialAccount> dirty_accounts;
	private float actualCash;
	private String Account_SKU;
	public String getAccount_SKU() {
		return Account_SKU;
	}

	public void setAccount_SKU(String account_SKU) {
		Account_SKU = account_SKU;
	}

	private String selected_product_id;
	
	private double expectedCash;

	public List<FinancialAccount> getAccounts() {
		return accounts;
	}

	public void setAccounts(List<FinancialAccount> accounts) {
		this.accounts = accounts;
	}

	public List<ShipmentProduct> getProductslst() {
		return productslst;
	}

	public void setProductslst(List<ShipmentProduct> productslst) {
		this.productslst = productslst;
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

	public Driver getDriver() {
		return driver;
	}

	public void setDriver(Driver driver) {
		this.driver = driver;
	}

	public float getActualCash() {
		return actualCash;
	}

	public void setActualCash(float actualCash) {
		this.actualCash = actualCash;
	}

	public double getExpectedCash() {
		return expectedCash;
	}

	public void setExpectedCash(double expectedCash) {
		this.expectedCash = expectedCash;
	}

	public String getSelected_product_id() {
		return selected_product_id;
	}

	public void setSelected_product_id(String selected_product_id) {
		this.selected_product_id = selected_product_id;
	}

	public int getShipment_id() {
		return shipment_id;
	}

	public void setShipment_id(int shipment_id) {
		this.shipment_id = shipment_id;
	}

	public List<DirtyFinancialAccount> getDirty_accounts() {
		return dirty_accounts;
	}

	public void setDirty_accounts(List<DirtyFinancialAccount> dirty_accounts) {
		this.dirty_accounts = dirty_accounts;
	}
private String driver_id;
public String getDriver_id() {
	return driver_id;
}

public void setDriver_id(String driver_id) {
	this.driver_id = driver_id;
}



	

}
