package com.jwt.service;

import java.math.BigDecimal;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwt.dao.CashOnCoverDAO;
import com.jwt.dao.ReceivingProductDAO;
import com.jwt.model.ActualCounts;
import com.jwt.model.AllShipments;
import com.jwt.model.CoverProduct;
import com.jwt.model.DirtyFinancialAccount;
import com.jwt.model.ExpectedCashOnCover;
import com.jwt.model.Facility;
import com.jwt.model.FinancialAccount;
import com.jwt.model.ProductsType;
import com.jwt.model.ReconciliationNewCancelCounts;
import com.jwt.model.Reconciliation_Data;
import com.jwt.model.Reconciliation_Posted;
import com.jwt.model.Shipment;
import com.jwt.model.ShipmentDetailsData;
import com.jwt.model.ShipmentList;
import com.jwt.model.ShipmentLog;
import com.jwt.model.ShipmentProduct;
import com.jwt.model.UserRole;
import com.jwt.model.ValidateCarProduct;
import com.jwt.model.ValidationData;
import com.jwt.model.drivers;

@Service
@Transactional
public class ReceivingProductsSerciveImpl implements ReceivingProductsService{

	@Autowired
	private ReceivingProductDAO Receivingproductdao;
	@Autowired
	private CashOnCoverDAO cashoncoverdao;
	@Override
	public List<drivers> GetAllDrivers() {
	
		return Receivingproductdao.GetAllDrivers();
	}
	@Override
	public String checkAuthentication(String User_Name, String Code) {
		
		return Receivingproductdao.checkAuthentication(User_Name, Code);
	}
	@Override
	public List<Reconciliation_Data> Get_Reconciliation_Data(String Driver_ID) {
		return Receivingproductdao.Get_Reconciliation_Data(Driver_ID);
	}
	@Override
	public List<drivers> Get_Driver_by_UserName(String User_Name) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Get_Driver_by_UserName(User_Name);
	}
	@Override
	public List<drivers> Get_Drivers_Pilots() {
		// TODO Auto-generated method stub
		return Receivingproductdao.Get_Drivers_Pilots();
	}
	@Override
	public Facility Get_Facility_Info(int Id) {
		return Receivingproductdao.Get_Facility_Info(Id);
	}
	@Override
	public String Submit_reconciliation(String driver_id, String Agent_Name, String Products, String Lost,
			String RLost,String type, int ship_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Submit_reconciliation(driver_id, Agent_Name, Products, Lost, RLost,type,ship_id);
	}
	@Override
	public List<Shipment> get_received_shipment(int fac_id) {
		// TODO Auto-generated method stub
		return cashoncoverdao.get_Received_shipments(fac_id);
	}
	@Override
	public List<DirtyFinancialAccount> getdirtyFinancialAccounts(int fac_id) {
		// TODO Auto-generated method stub
		return cashoncoverdao.getdirtyFinancialAccounts(fac_id);
	}
	@Override
	public double getExpected_Cash(String driver_id) {
		// TODO Auto-generated method stub
		return cashoncoverdao. getExpected_Cash(driver_id);
	}
	@Override
	public String Submit_ReceivingCashOnCover(long Shipment_id, String Financial_Account, String U,
			double actual_amount, double planned_money) {
		// TODO Auto-generated method stub
		return cashoncoverdao.Submit_ReceivingCashOnCover(Shipment_id, Financial_Account, U, actual_amount, planned_money);
	}
	@Override
	public List<Reconciliation_Posted> Check_Recon_Exist(String DriverID) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Check_Recon_Exist(DriverID);
	}
	@Override
	public List<ShipmentProduct> reconciliated_Shipment(int Shipment_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.reconciliated_Shipment(Shipment_id);
	}
	@Override
	public List<ValidateCarProduct> ValidatedQuan(int Shipment_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.ValidatedQuan(Shipment_id);
	}
	@Override
	public String Close_Reconciliation(String user_name, String logged_in_user, String pass_fail, int Shipment_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Close_Reconciliation(user_name, logged_in_user, pass_fail, Shipment_id);
	}
	@Override
	public List<ShipmentList> get_ShipmentList(String Fac_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.get_Shipment_List(Fac_id);
	}
	@Override
	public ShipmentList get_shipment_By_Id(int ship_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.get_shipment_details_by_Id(ship_id);
	}
	@Override
	public List<ReconciliationNewCancelCounts> Get_Actuals(String driver_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Get_Actuals(driver_id);
	}
	@Override
	public int save_reconciliation_new_cancel_counts(String driver_id, String logged_in_user, String actual_data) {
		// TODO Auto-generated method stub
		return Receivingproductdao.save_reconciliation_new_cancel_counts(driver_id, logged_in_user, actual_data);
	}
	@Override
	public List<Shipment> Check_Shipment_Exist(String driver_id, int fac_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Check_Shipment_Exist(driver_id, fac_id);
	}
	@Override
	public List<ActualCounts> Get_actual_count(String driver_id, int ship_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Get_actual_count(driver_id, ship_id);
	}
	@Override
	public String save_reconciliation_clean_dirty_counts(String driver_id, String logged_in_user, String products,int ship_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.save_reconciliation_clean_dirty_counts(driver_id, logged_in_user, products, ship_id);
	}
	@Override
	public String Close_Recon_pass_fail(String driver_id, String logged_in_user, int Ship_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Close_Recon_pass_fail(driver_id, logged_in_user, Ship_id);
	}
	@Override
	public String Back_TO_recon_data(int ship_id, String logged_in_user, String current_status) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Back_TO_recon_data(ship_id, logged_in_user, current_status);
	}
	@Override
	public String Copy_Validation_data(int ship_id, String driver_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Copy_Validation_data(ship_id, driver_id);
	}
	@Override
	public List<ValidationData> Get_validation_submitted(int ship_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Get_validatioin_Submitted(ship_id);
	}
	@Override
	public List<ShipmentDetailsData> Get_Back_Data(int ship_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Get_Back_Data(ship_id);
	}
	@Override
	public String Close_Recon_Shipment(int ship_id, String Comment, String logged_in_user) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Close_Recon_Shipment(ship_id, Comment, logged_in_user);
	}
	@Override
	public Shipment get_ship_data_by_id(int ship_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.get_ship_data_by_id(ship_id);
	}
	@Override
	public String Get_Area_Name(String Driver_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Get_Area_Name(Driver_id);
	}
	@Override
	public String Get_Area_Name_By_Shipment(int ship_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Get_Area_Name_By_Shipment(ship_id);
	}
	@Override
	public String Get_Related_Shipments(int ship_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Get_Related_Shipments(ship_id);
	}
	@Override
	public List<UserRole> check_user_roles(String UserName) {
		// TODO Auto-generated method stub
		return Receivingproductdao.check_user_roles(UserName);
	}
	@Override
	public List<ShipmentLog> Check_Back_To_Recon(int Shipment_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Check_Back_To_Recon(Shipment_id);
	}
	@Override
	public List<AllShipments> Get_all_shipments(int fac_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Get_all_shipments(fac_id);
	}
	@Override
	public AllShipments Get_Details(int shipment_id) {
		// TODO Auto-generated method stub
		return Receivingproductdao.Get_Details(shipment_id);
	}
	@Override
	public List<ProductsType> get_shipment_products_types(String sku) {
		// TODO Auto-generated method stub
		return Receivingproductdao.get_shipment_products_types(sku);
	}
	 

}
