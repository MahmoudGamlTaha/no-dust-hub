package com.jwt.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.ReleasingProductsDAO;
import com.jwt.model.CoverProduct;
import com.jwt.model.Cover;
import com.jwt.model.Driver;
import com.jwt.model.Facility;
import com.jwt.model.Shipment;


@Service
@Transactional
public class ReleasingProductsServiceImpl implements ReleasingProductsService {

	
	@Autowired
	private ReleasingProductsDAO shipmentDAO ;
	@Override
	public List<Driver> GetAllDrivers() {
		return shipmentDAO.GetAllDrivers();

	}
	@Override
	public String checkAuthentication(String username, String code) {
		return shipmentDAO.checkAuthentication(username, code);
	}
	@Override
	public List<Cover> getCoversOfDriver(String id) {
		return shipmentDAO.getCoversOfDriver(id);
	}
	@Override
	public List<CoverProduct> getCoverProducts(String driver_id, String coverDate) {
		return shipmentDAO.getCoverProducts(driver_id, coverDate) ;
	}
	@Override
	public Driver getDriverById(String id) {
		return shipmentDAO.getDriverById(id);
	}
	@Override
	public Facility getFacilityById(int id) {
		return shipmentDAO.getFacilityById(id);
	}
	@Override
	public String submitCover(String driver, String loggenedUser, String jsonObj ,String date) {
		return shipmentDAO.submitCover(driver, loggenedUser, jsonObj , date);
	}
	@Override
	public Cover getCoverOfDriverAndDate(String id, String date_) {
		return shipmentDAO.getCoverOfDriverAndDate(id, date_);
	}
	@Override
	public List<String> getAreas(String driver_id, String coverDate) {
		return shipmentDAO.getAreas(driver_id, coverDate);
	}
	@Override
	public List<Shipment> Check_Reconcile_Cash(String driver_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.Check_Reconcile_Cash(driver_id);
	}

}
