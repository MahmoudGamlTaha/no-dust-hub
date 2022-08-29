package com.jwt.dao;

import java.util.List;

import com.jwt.model.DirtyFinancialAccount;
import com.jwt.model.ExpectedCashOnCover;
import com.jwt.model.ExpectedCashOnShipment;
import com.jwt.model.Facility;
import com.jwt.model.FinancialAccount;
import com.jwt.model.Shipment;
import com.jwt.model.ShipmentDetailsData;
import com.jwt.model.ShipmentLog;
import com.jwt.model.ShipmentProduct;
import com.jwt.model.TransferAccounts;

public interface CashOnCoverDAO {
	
	public List<Shipment> getAllShipment (int source_Id , String today_date );

	public List<ShipmentProduct> getShipmentProducts (int Shipment_id);
	
	public ShipmentLog getShipmentLog(int Shipment_id);
    public List<FinancialAccount> getFinancialAccounts(int id);
    public List<String> getAreasOfCash(String driver_id ,String ship_id);

    
    public String submitCashOnCover(long shipmentID , String financialAccount, String user, double actualMoney ,double plannedMoney);
/*     Receiving Cash On Cover Function */
    ////////////////////////////////////////////////////////////////////////////////////
    public List<Shipment> get_Received_shipments(int destination_id);
    public List<DirtyFinancialAccount> getdirtyFinancialAccounts(int fac_id);
    public double getExpected_Cash(String driver_id);
    public String Submit_ReceivingCashOnCover(long Shipment_id,String Financial_Account,String U,double actual_amount,double planned_money);
    public String Submit_Cash_OnCover(String Ship_id,String driver_id,String account_sku,String logged_in_user,double actual_amount,double planned_money,double reconciled_money);

    public List<ExpectedCashOnCover>Get_expected_Cash(String driver_id);
    public List<Shipment> get_driver_shipment(String driver_id);
    public List<Shipment>Check_reconcation_cash_shipment(String driver_id);
    public List<Shipment>Get_ShipmentListOfDriver(int fac_id,String driver_id);
    public Shipment get_shipment_data(int Ship_id);
    public List<Shipment>Check_Recon_In_Progress(String driver_id);
    public List<ExpectedCashOnShipment> Get_Cash_On_Shipment(int ship_id);
    public double get_total_rent_val(String Driver_id);
    public double get_sales_promos_val(String Driver_id);
    public double get_corprate_invoice(String Driver_id);
    public String get_corporate_due_credit(String Driver_id);
    public List<ExpectedCashOnShipment>Get_Expected_ForCollections(String driver_id);
    
    /////////////////////////////////////////////////////////////////////
    //Update Cash Transfer 
    ////////////////////////////////////////////////////////////////////
    public List<TransferAccounts> Get_From_accounts(int fac_id);
    public List<TransferAccounts> Get_To_Accounts(int fac_id);
    public List<Facility>Get_Facilites();
    
    ////////////////////////////////////////////////////////////////////////
    // Solve Issue Of Cash Reconciliation Shipment 
    /////////////////////////////////////////////////////////////////////////
    public List<Shipment>CheckLastShipmentHasCash(String driver_id);
    public List<ShipmentDetailsData>GetLastReconDetails(int shipment_id);
}
