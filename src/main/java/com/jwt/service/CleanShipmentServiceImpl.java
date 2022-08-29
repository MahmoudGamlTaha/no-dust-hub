package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.CreateShipmentDAO;
import com.jwt.model.CleanProduct;
import com.jwt.model.CleanShipment;
import com.jwt.model.Facility;
import com.jwt.model.Products;
import com.jwt.model.ShipmentDetails;
import com.jwt.model.ShipmentLog;
import com.jwt.model.drivers;

@Service
@Transactional
public class CleanShipmentServiceImpl implements CleanShipmentService{
	@Autowired
private CreateShipmentDAO clean_Dao;

@Override
public List<drivers> Get_driver_List() {
	// TODO Auto-generated method stub
	return clean_Dao.Get_driver_List();
}

@Override
public List<Facility> Get_detsination_facility(int fac_id) {
	// TODO Auto-generated method stub
	return clean_Dao.Get_detsination_facility(fac_id);
}

@Override
public List<Products> Get_Clean_Packs(int facility_id) {
	// TODO Auto-generated method stub
	return clean_Dao.Get_Clean_Packs(facility_id);
}

@Override
public String Submit_Send_clean_Shipment(int fac_id, int dest_fac, String driver_id, String products,
		String logged_user) {
	// TODO Auto-generated method stub
	return clean_Dao.Submit_Send_clean_Shipment(fac_id, dest_fac, driver_id, products, logged_user);
}

@Override
public List<CleanShipment> Get_Clean_Shipment(int dest_id) {
	// TODO Auto-generated method stub
	return clean_Dao.Get_Clean_Shipment(dest_id);
}

@Override
public List<CleanProduct> Get_Shipment_Details(int shipment_id) {
	// TODO Auto-generated method stub
	return clean_Dao.Get_Shipment_Details(shipment_id);
}

@Override
public CleanShipment Get_Shipment_By_Id(int shipment_id) {
	// TODO Auto-generated method stub
	return clean_Dao.Get_Shipment_By_Id(shipment_id);
}

@Override
public List<Products> Get_Clean_Products(int facility_id) {
	// TODO Auto-generated method stub
	return clean_Dao.Get_Clean_Products(facility_id);
}

@Override
public String Receive_Clean_Shipment(int shipment_id, String Approved_Sealed, String Approved_Not_Sealed, String Lost,
		String logged_user, String prod_data, int fac_id) {
	// TODO Auto-generated method stub
	return clean_Dao.Receive_Clean_Shipment(shipment_id, Approved_Sealed, Approved_Not_Sealed, Lost, logged_user, prod_data, fac_id);
}

@Override
public List<ShipmentLog> shipment_logs(int shipment_id) {
	// TODO Auto-generated method stub
	return clean_Dao.shipment_logs(shipment_id);
}

@Override
public List<Products> Get_Products_By_Type(int type, int fac) {
	// TODO Auto-generated method stub
	return clean_Dao.Get_Products_By_Type(type, fac);
}
}
