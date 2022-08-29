package com.jwt.dao;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import com.jwt.model.CashTransferForm;
import com.jwt.model.CashTrasfers;
import com.jwt.model.Drivers_Users;
import com.jwt.model.FinancialAccount;
import com.jwt.model.InternalTransfers;
import com.jwt.model.Shipment;
import com.jwt.model.TransferAccounts;

public interface CashInOutDAO {
	
	public String submitCashInOut(String financialAcc, String user , double amount , String driver_userName,String Comment );
////////////////////////////////////////////////////////////////////////////////////////////
	public List<FinancialAccount> Get_Financial_Accounts(int fac_id);
	public String Submit_External_Cash(int facility_id,String logged_user,String account_sku,java.util.Date req_date,Date transfer_date,double amount,String bank_name,String bank_account_no,String attachment);
	public List<Shipment>Get_Cash_Transfer_Shipments(int facility_id);
	public String Update_attachment(int shipment_id,String bank_attachment);
	public String Get_Agent_Name(int shipment_id);
	public String Get_Account(int shipment_id);
	///////////////////////////////////////////////
    public String transferInternalCash(int facility_id , String logged_user ,String source_account, String destination_account, double amount , String comment,int dest_id,String src_type);

    public String get_Account_bby_id(String cash_account_id);
    public List<Drivers_Users> get_user_names();
    public String GetAgentDisplayName(int shipment_id);
    public String GetRequestedAgentName(int shipment_id);
    //////////////////////////////////////////////////////////////////
   // Updates On Create Cash Transfer 
   ///////////////////////////////////////////////////////////////////
    
    public List<TransferAccounts> Get_Transfer_account_for_external(int fac_id);
    public List<CashTrasfers> Get_Transfers(int fac_id , String product_id , String from_date , String to_date);
    public List<TransferAccounts>Get_Accounts_For_Report();
    ////////////////////////////////////////////////////////////////
    // Update in External Cash Transfer List
    ////////////////////////////////////////////////////////////////
    List<CashTransferForm>GetExternalTransfers(int facility_id);
    List<InternalTransfers>GetInternalTransfers(int facility_id);
    List<InternalTransfers>GetInternalTransferById(int shipment_id);
}
