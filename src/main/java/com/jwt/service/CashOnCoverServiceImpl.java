package com.jwt.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.CashOnCoverDAO;
import com.jwt.dao.ReleasingProductsDAO;
import com.jwt.model.ExpectedCashOnCover;
import com.jwt.model.ExpectedCashOnShipment;
import com.jwt.model.Facility;
import com.jwt.model.FinancialAccount;
import com.jwt.model.Shipment;
import com.jwt.model.ShipmentDetailsData;
import com.jwt.model.ShipmentLog;
import com.jwt.model.ShipmentProduct;
import com.jwt.model.TransferAccounts;


@Service
@Transactional
public class CashOnCoverServiceImpl implements CashOnCoverService {

	@Autowired
	private CashOnCoverDAO shipmentDAO ;
	
	@Override
	public List<Shipment> getAllShipment(int source_Id, String today_date) {
		return shipmentDAO.getAllShipment(source_Id, today_date);
	}

	@Override
	public List<ShipmentProduct> getShipmentProducts(int Shipment_id) {
		return shipmentDAO.getShipmentProducts(Shipment_id);
	}

	@Override
	public ShipmentLog getShipmentLog(int Shipment_id) {
		return shipmentDAO.getShipmentLog(Shipment_id);
	}
	
	@Override
	public List<FinancialAccount> getFinancialAccounts(int id) {
		return shipmentDAO.getFinancialAccounts(id);
	}

	@Override
	public String submitCashOnCover(long shipmentID, String financialAccount, String user, double actualMoney,
			double plannedMoney) {
		return shipmentDAO.submitCashOnCover(shipmentID, financialAccount, user, actualMoney, plannedMoney);
	}

	@Override
	public String Submit_Cash_OnCover(String Ship_id,String driver_id, String account_sku, String logged_in_user, double actual_amount,
			double planned_money , double reconciled_cash) {
		// TODO Auto-generated method stub
		return shipmentDAO.Submit_Cash_OnCover(Ship_id,driver_id, account_sku, logged_in_user, actual_amount, planned_money,reconciled_cash);
	}

	@Override
	public List<ExpectedCashOnCover> Get_expected_Cash(String driver_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.Get_expected_Cash(driver_id);
	}

	@Override
	public List<Shipment> get_driver_shipment(String driver_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.get_driver_shipment(driver_id);
	}

	@Override
	public List<Shipment> Check_reconcation_cash_shipment(String driver_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.Check_reconcation_cash_shipment(driver_id);
	}

	@Override
	public List<Shipment> Get_ShipmentListOfDriver(int fac_id, String driver_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.Get_ShipmentListOfDriver(fac_id, driver_id);
	}

	@Override
	public Shipment get_shipment_data(int Ship_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.get_shipment_data(Ship_id);
	}

	@Override
	public List<Shipment> Check_Recon_In_Progress(String driver_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.Check_Recon_In_Progress(driver_id);
	}

	@Override
	public List<ExpectedCashOnShipment> Get_Cash_On_Shipment(int ship_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.Get_Cash_On_Shipment(ship_id);
	}

	@Override
	public List<String> getAreasOfCash(String driver_id, String ship_id) {
		return shipmentDAO.getAreasOfCash(driver_id, ship_id);
	}

	@Override
	public double get_total_rent_val(String Driver_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.get_total_rent_val(Driver_id);
	}

	@Override
	public double get_sales_promos_val(String Driver_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.get_sales_promos_val(Driver_id);
	}

	@Override
	public double get_corprate_invoice(String Driver_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.get_corprate_invoice(Driver_id);
	}

	@Override
	public String get_corporate_due_credit(String Driver_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.get_corporate_due_credit(Driver_id);
	}

	@Override
	public List<ExpectedCashOnShipment> Get_Expected_ForCollections(String driver_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.Get_Expected_ForCollections(driver_id);
	}

	@Override
	public List<TransferAccounts> Get_From_accounts(int fac_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.Get_From_accounts(fac_id);
	}

	@Override
	public List<TransferAccounts> Get_To_Accounts(int fac_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.Get_To_Accounts(fac_id);
	}

	@Override
	public List<Facility> Get_Facilites() {
		// TODO Auto-generated method stub
		return shipmentDAO.Get_Facilites();
	}

	@Override
	public List<Shipment> CheckLastShipmentHasCash(String driver_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.CheckLastShipmentHasCash(driver_id);
	}

	@Override
	public List<ShipmentDetailsData> GetLastReconDetails(int shipment_id) {
		// TODO Auto-generated method stub
		return shipmentDAO.GetLastReconDetails(shipment_id);
	}
	
	

}
