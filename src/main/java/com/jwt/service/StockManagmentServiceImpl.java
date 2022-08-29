package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.StockManagmentDAO;
import com.jwt.model.AccountBalance;
import com.jwt.model.DailyInventoryCheck;
import com.jwt.model.DailyInventoryCheckDetails;
import com.jwt.model.DailyShipments;
import com.jwt.model.DashBoardData;
import com.jwt.model.DirtyShipmentData;
import com.jwt.model.ExpectedProductsIN;
import com.jwt.model.ExpectedProductsOut;
import com.jwt.model.ExpectedQuantityOfProducts;
import com.jwt.model.Facility;
import com.jwt.model.InventoryProduct;
import com.jwt.model.NewProduct;
import com.jwt.model.ProductComponentDetails;
import com.jwt.model.ProductRawMaterial;
import com.jwt.model.ProductTransaction;
import com.jwt.model.Products;
import com.jwt.model.ProductsType;
import com.jwt.model.Treatment;

@Service
@Transactional
public class StockManagmentServiceImpl implements StockManagmentService {

	@Autowired
	private  StockManagmentDAO stockDoa;
	
	@Override
	public List<InventoryProduct> getAllProducts(int facility_id) {
		return stockDoa.getAllProducts(facility_id);
	}

	@Override
	public String submitConvetProducts(int facility_id, String products, String username) {
		return stockDoa.submitConvetProducts(facility_id, products, username);
	}

	@Override
	public List<DirtyShipmentData> getConvertRequests(int facility_id) {
		return stockDoa.getConvertRequests(facility_id);
	}

	@Override
	public List<InventoryProduct> getConvertReqProducts(int convert_id) {
		return stockDoa.getConvertReqProducts(convert_id);
	}

	@Override
	public DirtyShipmentData getConvertReqWith(int id) {
		return stockDoa.getConvertReqWith(id);
	}

	@Override
	public String approveRejectConvertRequest(long shipment_id, int facility_id, String logged_user,
			String approval_val) {
		return stockDoa.approveRejectConvertRequest(shipment_id, facility_id, logged_user, approval_val);
	}

	@Override
	public List<Products> get_product_list(int type,int fac_id) {
		// TODO Auto-generated method stub
		return stockDoa.get_product_list(type,fac_id);
	}

	@Override
	public String Submit_Conversion(int fac_id, String logged_user, String from_type, String to_type,
			String prod_data) {
		// TODO Auto-generated method stub
		return stockDoa.Submit_Conversion(fac_id, logged_user, from_type, to_type, prod_data);
	}

	@Override
	public List<Treatment> Get_treatment_List() {
		// TODO Auto-generated method stub
		return stockDoa.Get_treatment_List();
	}

	@Override
	public List<NewProduct> Get_New_Product_List() {
		// TODO Auto-generated method stub
		return stockDoa.Get_New_Product_List();
	}

	@Override
	public String Submit_Create_New_Product(String products, String logged_user, int facility) {
		// TODO Auto-generated method stub
		return stockDoa.Submit_Create_New_Product(products, logged_user, facility);
	}

	@Override
	public List<ProductComponentDetails> Get_Component_Details(String product_sku,int fac) {
		// TODO Auto-generated method stub
		return stockDoa.Get_Component_Details(product_sku,fac);
	}

	@Override
	public List<ProductRawMaterial> Get_Raw_Materials(int order_id) {
		// TODO Auto-generated method stub
		return stockDoa.Get_Raw_Materials(order_id);
	}

	@Override
	public List<ProductsType> lst_shipment_type() {
		// TODO Auto-generated method stub
		return stockDoa.lst_shipment_type();
	}

	@Override
	public int Get_Reconciliation_Count(int facility) {
		// TODO Auto-generated method stub
		return stockDoa.Get_Reconciliation_Count(facility);
	}

	@Override
	public int Get_Dispatch_Count(int facility) {
		// TODO Auto-generated method stub
		return stockDoa.Get_Dispatch_Count(facility);
	}

	@Override
	public DashBoardData Get_data(int facility) {
		// TODO Auto-generated method stub
		return stockDoa.Get_data(facility);
	}

	@Override
	public double Get_Expected_Cash() {
		// TODO Auto-generated method stub
		return stockDoa.Get_Expected_Cash();
	}

	@Override
	public List<InventoryProduct> Get_Clean_Dirty_Products(int facility) {
		// TODO Auto-generated method stub
		return stockDoa.Get_Clean_Dirty_Products(facility);
	}

	@Override
	public List<ExpectedProductsOut> Get_Expected_Out(int facility) {
		// TODO Auto-generated method stub
		return stockDoa.Get_Expected_Out(facility);
	}

	@Override
	public List<DailyShipments> Get_Daily_Shipments_Data(int facility_id) {
		// TODO Auto-generated method stub
		return stockDoa.Get_Daily_Shipments_Data(facility_id);
	}

	@Override
	public List<ExpectedProductsIN> Get_Expcted_IN(int facility_id) {
		// TODO Auto-generated method stub
		return stockDoa.Get_Expcted_IN(facility_id);
	}

	@Override
	public List<ExpectedQuantityOfProducts> Get_Total_Expected_Dirty(int facility_id) {
		// TODO Auto-generated method stub
		return stockDoa.Get_Total_Expected_Dirty(facility_id);
	}

	@Override
	public List<Treatment> lst_treatment_for_dispatch() {
		// TODO Auto-generated method stub
		return stockDoa.lst_treatment_for_dispatch();
	}

	@Override
	public List<ExpectedQuantityOfProducts> Get_Clean_Products(int facility_id) {
		// TODO Auto-generated method stub
		return stockDoa.Get_Clean_Products(facility_id);
	}

	@Override
	public List<ExpectedQuantityOfProducts> Get_Clean_Products_treatments(int facility_id) {
		// TODO Auto-generated method stub
		return stockDoa.Get_Clean_Products_treatments(facility_id);
	}

	@Override
	public List<Treatment> lst_treatment_for_reconciliation() {
		// TODO Auto-generated method stub
		return stockDoa.lst_treatment_for_reconciliation();
	}

	@Override
	public List<ExpectedQuantityOfProducts> Get_Reconciliation_Products(int facility_id) {
		// TODO Auto-generated method stub
		return stockDoa.Get_Reconciliation_Products(facility_id);
	}

	@Override
	public String Automatic_Inventory_Check(int facility_id) {
		// TODO Auto-generated method stub
		return stockDoa.Automatic_Inventory_Check(facility_id);
	}

	@Override
	public List<DailyInventoryCheck> Get_Daily_Inventory_Check_List(int facility_id) {
		// TODO Auto-generated method stub
		return stockDoa.Get_Daily_Inventory_Check_List(facility_id);
	}

	@Override
	public List<DailyInventoryCheckDetails> Get_Inventory_Details_ById(int inventory_id) {
		// TODO Auto-generated method stub
		return stockDoa.Get_Inventory_Details_ById(inventory_id);
	}

	@Override
	public DailyInventoryCheck GetDailyInventoryCheckById(int id) {
		// TODO Auto-generated method stub
		return stockDoa.GetDailyInventoryCheckById(id);
	}

	@Override
	public List<ProductsType> getsimpleconversionfromtype(int facility) {
		// TODO Auto-generated method stub
		return stockDoa.getsimpleconversionfromtype(facility);
	}

	@Override
	public List<ProductsType> getsimpleconversiontotype(int facility, int from_type) {
		// TODO Auto-generated method stub
		return stockDoa.getsimpleconversiontotype(facility, from_type);
	}

	@Override
	public List<InventoryProduct> get_component_list(int facility_id) {
		// TODO Auto-generated method stub
		return stockDoa.get_component_list(facility_id);
	}

	@Override
	public String SubmitProductDeduction(int facility_id, String user_name, String Products) {
		// TODO Auto-generated method stub
		return stockDoa.SubmitProductDeduction(facility_id, user_name, Products);
	}

	@Override
	public List<Facility> get_facility_list() {
		// TODO Auto-generated method stub
		return stockDoa.get_facility_list();
	}

	@Override
	public List<Products> getProductList() {
		// TODO Auto-generated method stub
		return stockDoa.getProductList();
	}

	@Override
	public List<ProductTransaction> gettransactiondata(int facility_id, String dms_product_id, String date_from,
			String date_to) {
		// TODO Auto-generated method stub
		return stockDoa.gettransactiondata(facility_id, dms_product_id, date_from, date_to);
	}

	@Override
	public List<ProductTransaction> getProductsWithTypes(int facility_id, String dms_product_id, String date_from,
			String date_to) {
		// TODO Auto-generated method stub
		return stockDoa.getProductsWithTypes(facility_id, dms_product_id, date_from, date_to);
	}

	@Override
	public List<ProductTransaction> getDataWithDate(int facility_id, String dms_product_id, String date_transaction) {
		// TODO Auto-generated method stub
		return stockDoa.getDataWithDate(facility_id, dms_product_id, date_transaction);
	}

	@Override
	public List<ProductTransaction> getDetailsWithDate(int facility_id, String dms_product_id,
			String date_transaction) {
		// TODO Auto-generated method stub
		return stockDoa.getDetailsWithDate(facility_id, dms_product_id, date_transaction);
	}

	@Override
	public List<ProductTransaction> get_productsbydms(String dms_product_id) {
		// TODO Auto-generated method stub
		return stockDoa.get_productsbydms(dms_product_id);
	}

	@Override
	public List<AccountBalance> get_account_balance(int facility_id) {
		// TODO Auto-generated method stub
		return stockDoa.get_account_balance(facility_id);
	}

}
