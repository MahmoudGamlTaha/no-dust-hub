package com.jwt.service;

import java.util.List;

import com.jwt.model.DirtyProduct;
import com.jwt.model.DirtyShipment;
import com.jwt.model.DirtyShipmentData;

public interface ViewDirtyShipmentService {
	public List<DirtyShipment> getAllDirtyShipments(int id);
	public List<DirtyShipment> getExternalLundry();
	public List<DirtyShipmentData> getShipmentData(String shipment_id);
	public List<DirtyProduct> getDirtyShipmentProduct(String Shipment_id);
	public String appproveDirtyShipment(String ids , String ids2 , int shipment_id , String useName  );
	public String checkStateOfShipment(int id);
	public String Get_Approved_by(int id);
	public String Get_Requested_By(int id);
	public String Get_Approval_Date(int id);
	public String Submit_approve_dirty_shipment(String approved_sealed,String not_approved , int shipment_id,String logged_user,String approved_not_sealed,String products);
	public String Submit_receiving_external_shipment(String approved,String not_approved,int shipment_id,String logged_user,String pro_quantity);


}
