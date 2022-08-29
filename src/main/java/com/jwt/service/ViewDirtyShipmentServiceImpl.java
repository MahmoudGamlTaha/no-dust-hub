package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.ViewDirtyShipmentDAO;
import com.jwt.model.DirtyProduct;
import com.jwt.model.DirtyShipment;
import com.jwt.model.DirtyShipmentData;
@Service
@Transactional
public class ViewDirtyShipmentServiceImpl implements ViewDirtyShipmentService {

	@Autowired
	private ViewDirtyShipmentDAO dirtyDAO;
	
	@Override
	public List<DirtyShipment> getAllDirtyShipments(int id) {
		return dirtyDAO.getAllDirtyShipments(id);
	}

	@Override
	public List<DirtyShipmentData> getShipmentData(String shipment_id) {
		return dirtyDAO.getShipmentData(shipment_id);
	}

	@Override
	public List<DirtyProduct> getDirtyShipmentProduct(String Shipment_id) {
		 return dirtyDAO.getDirtyShipmentProduct(Shipment_id);
	}

	@Override
	public String appproveDirtyShipment(String ids, String ids2,int shipment_id, String useName) {
		return dirtyDAO.appproveDirtyShipment(ids, ids2,shipment_id, useName);
	}

	@Override
	public String checkStateOfShipment(int id) {
		return dirtyDAO.checkStateOfShipment(id);
	}

	@Override
	public List<DirtyShipment> getExternalLundry() {
		return dirtyDAO.getExternalLundry();
	}

	@Override
	public String Get_Approved_by(int id) {
		// TODO Auto-generated method stub
		return dirtyDAO.Get_Approved_by(id);
	}

	@Override
	public String Get_Requested_By(int id) {
		// TODO Auto-generated method stub
		return dirtyDAO.Get_Requested_By(id);
	}

	@Override
	public String Get_Approval_Date(int id) {
		// TODO Auto-generated method stub
		return dirtyDAO.Get_Approval_Date(id);
	}

	@Override
	public String Submit_approve_dirty_shipment(String approved_sealed, String not_approved, int shipment_id,
			String logged_user, String approved_not_sealed, String products) {
		// TODO Auto-generated method stub
		return dirtyDAO.Submit_approve_dirty_shipment(approved_sealed, not_approved, shipment_id, logged_user, approved_not_sealed, products);
	}

	@Override
	public String Submit_receiving_external_shipment(String approved, String not_approved, int shipment_id,
			String logged_user, String pro_quantity) {
		// TODO Auto-generated method stub
		return dirtyDAO.Submit_receiving_external_shipment(approved, not_approved, shipment_id, logged_user, pro_quantity);
	}

}
