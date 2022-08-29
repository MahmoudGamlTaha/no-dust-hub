package com.jwt.service;

import java.util.Date;
import java.util.List;

import com.jwt.model.CoverProduct;
import com.jwt.model.Cover;
import com.jwt.model.Driver;
import com.jwt.model.Facility;
import com.jwt.model.Shipment;

public interface ReleasingProductsService {
	
	public List<Driver>GetAllDrivers();
	
	public Driver getDriverById(String id);

	public String checkAuthentication(String username , String code);
	
	public List<Cover> getCoversOfDriver(String id);
	public Cover getCoverOfDriverAndDate(String id , String date_);
	
	public List<CoverProduct> getCoverProducts(String driver_id ,String coverDate);
	
	public Facility getFacilityById(int id);

    public String submitCover(String driver, String loggenedUser ,String jsonObj , String date);
    public List<String> getAreas(String driver_id, String coverDate);
    public List<Shipment> Check_Reconcile_Cash(String driver_id);

}
