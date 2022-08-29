package com.jwt.dao;

import java.util.List;

import com.jwt.model.Facility;
import com.jwt.model.InventoryCheck;
import com.jwt.model.InventoryProduct;

public interface StockProductListDAO {

	public List<Facility> getWareHouses ();
	public List<InventoryProduct> getProductOfFacility(int id);
	public List<InventoryProduct> getFinancialProducts(int id);
	public String getUserRole(int id);
	public String submitInventoryCheck(String user, String products ,int warehouse_id,String comment);
	public List<InventoryCheck> getInventoryCheckOfFacility(int facility_id);
	public InventoryCheck getInventoryCheckDataByID(int id);
	public List<InventoryProduct> getInventoryProductsByCheckID(int id);
	public String approveRejectInvenoryCheck(int checkID , String approveValue , String manager);

}
