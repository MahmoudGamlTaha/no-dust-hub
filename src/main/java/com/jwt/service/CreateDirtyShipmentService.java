package com.jwt.service;

import java.math.BigDecimal;
import java.util.List;

import com.jwt.model.Category_For_Dirty_Shipments;
import com.jwt.model.Consumable;
import com.jwt.model.DirtyOrderData;
import com.jwt.model.DirtyProductData;
import com.jwt.model.DirtyProductInPackage;
import com.jwt.model.Facility;
import com.jwt.model.ProductsType;
import com.jwt.model.ProgramsData;
import com.jwt.model.WashingPrograms;
import com.jwt.model.drivers;

public interface CreateDirtyShipmentService {

	public List<DirtyProductInPackage> getProductsList(int facility_id);
	public List<DirtyProductInPackage> getProductsListNotPack(int facility_id);
	public List<WashingPrograms> getWashingPrograms(int type);
	public List<drivers> getAllDrivers();
	public List<Facility> getAllLundryies();
	public List<Facility> getExternalLundries();
	public Facility getAbuRawashData();
	public String submitDirtyShipment(String driver, String user , String Lundry , String Products,int cat);
	public String submitExternalShipment(String driver, String user , String Lundry , String Products,int cat);

	public String submitInternalLundry(String products, String user, String source , String destination , int facility_id , int from_type,int to_type);
	public List<ProductsType> Get_Products_Type_By_Category(int Cat_id);
	public List<ProductsType> Get_To_Types(BigDecimal from_type);
	List<ProgramsData> Get_Programs(BigDecimal from,BigDecimal to);
	public String Submit_Dying_Programs(int from_type,int to_type,int facility_id,String logged_user,String proudcts);
	public String Submit_Treatment_Programs(int from_type,int to_type,int facility_id, String products, String logged_user);
	public List<ProgramsData> Get_Programs_by_Category(int category_id) ;
	public List<Consumable> Get_Program_Consumables(String ids);
	public List<Consumable> Get_Total_Consumables(String ids);
	public List<Consumable> Get_Program_Consumables(int shipment_id);
	public List<Consumable> Get_Total_Consumables_Details(int shipment_id);
	public List<DirtyProductData>Get_Data_For_Printing(int shipment_id);
	public List<DirtyOrderData> Get_Order_DataFor_Printing(int order_id);
	public List<Category_For_Dirty_Shipments>Get_Category_For_dirty_shipment();
	public List<DirtyProductData> Get_Untreated_Product(int shipment_id);
	public List<Consumable> GetTreatmentConsumables(int order_id);
	public int Check_Destination_type_id(int shipment_id);
	public String submitExternalShipment_(String driver, String user , String Lundry , String Products,int cat, String Source);
	public int Check_Source_type_id(int shipment_id);

}
