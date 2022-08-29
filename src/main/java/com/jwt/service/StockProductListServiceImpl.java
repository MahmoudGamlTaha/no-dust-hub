package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.StockProductListDAO;
import com.jwt.model.Facility;
import com.jwt.model.InventoryCheck;
import com.jwt.model.InventoryProduct;

import oracle.net.aso.d;


@Service
@Transactional
public class StockProductListServiceImpl implements StockProductListService {
	@Autowired
	private StockProductListDAO dao;

	@Override
	public List<Facility> getWareHouses() {
		return dao.getWareHouses();
	}

	@Override
	public List<InventoryProduct> getProductOfFacility(int id) {
		return dao.getProductOfFacility(id);
	}

	@Override
	public String getUserRole(int id) {
		return dao.getUserRole(id);
	}

	@Override
	public List<InventoryProduct> getFinancialProducts(int id) {
		return dao.getFinancialProducts(id);
	}

	@Override
	public String submitInventoryCheck(String user, String products, int warehouse_id,String comment) {
		return dao.submitInventoryCheck(user, products,warehouse_id,comment);
	}

	@Override
	public List<InventoryCheck> getInventoryCheckOfFacility(int facility_id) {
		return dao.getInventoryCheckOfFacility(facility_id);
	}

	@Override
	public InventoryCheck getInventoryCheckDataByID(int id) {
		return dao.getInventoryCheckDataByID(id) ;
	}

	@Override
	public List<InventoryProduct> getInventoryProductsByCheckID(int id) {
		return dao.getInventoryProductsByCheckID(id);
	}

	@Override
	public String approveRejectInvenoryCheck(int checkID, String approveValue, String manager) {
		return dao.approveRejectInvenoryCheck(checkID, approveValue, manager);
	}

}
