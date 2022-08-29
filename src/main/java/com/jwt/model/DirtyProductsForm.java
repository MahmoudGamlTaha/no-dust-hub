package com.jwt.model;

import java.util.List;

public class DirtyProductsForm {
	private int from_type;
	public int getFrom_type() {
		return from_type;
	}
	public void setFrom_type(int from_type) {
		this.from_type = from_type;
	}
	public int getTo_type() {
		return to_type;
	}
	public void setTo_type(int to_type) {
		this.to_type = to_type;
	}
	private int to_type;
	private String assignDate;
	private String wareHouseName;
	private String agentName;
	private String shipment_id;
	private List<DirtyProduct> dirty_list;
	private List<WashingPrograms> washing_list;
	private List<Facility> lundries_list;
	private String selectedLundry;
	private List<DirtyProductInPackage> product_list;
	private List<drivers> driversList;
	private List<UntreatedProduct> untreated_list;
	public List<UntreatedProduct> getUntreated_list() {
		return untreated_list;
	}
	public void setUntreated_list(List<UntreatedProduct> untreated_list) {
		this.untreated_list = untreated_list;
	}
	private String selectedDriver ;
	private String productsIds;
	private String productsIds2;
	private String productsIds3;
	public String getProductsIds3() {
		return productsIds3;
	}
	public void setProductsIds3(String productsIds3) {
		this.productsIds3 = productsIds3;
	}
	private String last_status;
	private List<String> areas;
	private String externalFlag ;
	public List<DirtyProduct> getDirty_list() {
		return dirty_list;
	}
	public void setDirty_list(List<DirtyProduct> dirty_list) {
		this.dirty_list = dirty_list;
	}
	public List<WashingPrograms> getWashing_list() {
		return washing_list;
	}
	public void setWashing_list(List<WashingPrograms> washing_list) {
		this.washing_list = washing_list;
	}
	public List<DirtyProductInPackage> getProduct_list() {
		return product_list;
	}
	public void setProduct_list(List<DirtyProductInPackage> product_list) {
		this.product_list = product_list;
	}
	public String getAssignDate() {
		return assignDate;
	}
	public void setAssignDate(String assignDate) {
		this.assignDate = assignDate;
	}
	public String getWareHouseName() {
		return wareHouseName;
	}
	public void setWareHouseName(String wareHouseName) {
		this.wareHouseName = wareHouseName;
	}
	public String getAgentName() {
		return agentName;
	}
	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}
	public List<drivers> getDriversList() {
		return driversList;
	}
	public void setDriversList(List<drivers> driversList) {
		this.driversList = driversList;
	}
	public String getSelectedDriver() {
		return selectedDriver;
	}
	public void setSelectedDriver(String selectedDriver) {
		this.selectedDriver = selectedDriver;
	}
	public List<Facility> getLundries_list() {
		return lundries_list;
	}
	public void setLundries_list(List<Facility> lundries_list) {
		this.lundries_list = lundries_list;
	}
	public String getSelectedLundry() {
		return selectedLundry;
	}
	public void setSelectedLundry(String selectedLundry) {
		this.selectedLundry = selectedLundry;
	}

	public String getShipment_id() {
		return shipment_id;
	}
	public void setShipment_id(String shipment_id) {
		this.shipment_id = shipment_id;
	}
	public String getProductsIds() {
		return productsIds;
	}
	public void setProductsIds(String productsIds) {
		this.productsIds = productsIds;
	}
	public String getLast_status() {
		return last_status;
	}
	public void setLast_status(String last_status) {
		this.last_status = last_status;
	}
	public String getProductsIds2() {
		return productsIds2;
	}
	public void setProductsIds2(String productsIds2) {
		this.productsIds2 = productsIds2;
	}
	public List<String> getAreas() {
		return areas;
	}
	public void setAreas(List<String> areas) {
		this.areas = areas;
	}
	public String getExternalFlag() {
		return externalFlag;
	}
	public void setExternalFlag(String externalFlag) {
		this.externalFlag = externalFlag;
	}
	private List<ProgramsData> programs_lst;
	public List<ProgramsData> getPrograms_lst() {
		return programs_lst;
	}
	public void setPrograms_lst(List<ProgramsData> programs_lst) {
		this.programs_lst = programs_lst;
	}
	
}
