package com.jwt.service;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.CashInOutDAO;
import com.jwt.dao.CashOnCoverDAO;
import com.jwt.model.CashTransferForm;
import com.jwt.model.CashTrasfers;
import com.jwt.model.Drivers_Users;
import com.jwt.model.FinancialAccount;
import com.jwt.model.InternalTransfers;
import com.jwt.model.Shipment;
import com.jwt.model.TransferAccounts;

@Service
@Transactional
public class CashInOutServiceImpl implements CashInOutService {

	@Autowired
	private CashInOutDAO cashInOutDAO ;
	
	@Override
	public String submitCashInOut(String financialAcc, String user, double amount, String driver_userName,String Comment) {
		return cashInOutDAO.submitCashInOut(financialAcc, user, amount, driver_userName,Comment);
	}

	@Override
	public List<FinancialAccount> Get_Financial_Accounts(int fac_id) {
		// TODO Auto-generated method stub
		return cashInOutDAO.Get_Financial_Accounts(fac_id);
	}

	@Override
	public String transferInternalCash(int facility_id, String logged_user, String source_account,
			String destination_account, double amount, String comment,int dest_id,String src_type) {
		return cashInOutDAO.transferInternalCash(facility_id, logged_user, source_account, destination_account, amount, comment,dest_id,src_type);
	}

	@Override
	public String Submit_External_Cash(int facility_id, String logged_user, String account_sku, java.util.Date req_date,
			Date transfer_date, double amount, String bank_name, String bank_account_no, String attachment) {
		// TODO Auto-generated method stub
		return cashInOutDAO.Submit_External_Cash(facility_id, logged_user, account_sku, req_date, transfer_date, amount, bank_name, bank_account_no, attachment);
	}

	@Override
	public List<Shipment> Get_Cash_Transfer_Shipments(int facility_id) {
		// TODO Auto-generated method stub
		return cashInOutDAO.Get_Cash_Transfer_Shipments(facility_id);
	}

	@Override
	public String Update_attachment(int shipment_id, String bank_attachment) {
		// TODO Auto-generated method stub
		return cashInOutDAO.Update_attachment(shipment_id, bank_attachment);
	}

	@Override
	public String Get_Agent_Name(int shipment_id) {
		// TODO Auto-generated method stub
		return cashInOutDAO.Get_Agent_Name(shipment_id);
	}

	@Override
	public String Get_Account(int shipment_id) {
		// TODO Auto-generated method stub
		return cashInOutDAO.Get_Account(shipment_id);
	}

	@Override
	public String get_Account_bby_id(String cash_account_id) {
		// TODO Auto-generated method stub
		return cashInOutDAO.get_Account_bby_id(cash_account_id);
	}

	@Override
	public List<Drivers_Users> get_user_names() {
		// TODO Auto-generated method stub
		return cashInOutDAO.get_user_names();
	}

	@Override
	public List<TransferAccounts> Get_Transfer_account_for_external(int fac_id) {
		// TODO Auto-generated method stub
		return cashInOutDAO.Get_Transfer_account_for_external(fac_id);
	}

	@Override
	public List<CashTrasfers> Get_Transfers(int fac_id, String product_id, String from_date, String to_date) {
		// TODO Auto-generated method stub
		return cashInOutDAO.Get_Transfers(fac_id, product_id, from_date, to_date);
	}

	@Override
	public List<TransferAccounts> Get_Accounts_For_Report() {
		// TODO Auto-generated method stub
		return cashInOutDAO.Get_Accounts_For_Report();
	}

	@Override
	public List<CashTransferForm> GetExternalTransfers(int facility_id) {
		// TODO Auto-generated method stub
		return cashInOutDAO.GetExternalTransfers(facility_id);
	}

	@Override
	public List<InternalTransfers> GetInternalTransfers(int facility_id) {
		// TODO Auto-generated method stub
		return cashInOutDAO.GetInternalTransfers(facility_id);
	}

	@Override
	public List<InternalTransfers> GetInternalTransferById(int shipment_id) {
		// TODO Auto-generated method stub
		return cashInOutDAO.GetInternalTransferById(shipment_id);
	}

	@Override
	public String GetAgentDisplayName(int shipment_id) {
		// TODO Auto-generated method stub
		return cashInOutDAO.GetAgentDisplayName(shipment_id);
	}

	@Override
	public String GetRequestedAgentName(int shipment_id) {
		// TODO Auto-generated method stub
		return cashInOutDAO.GetRequestedAgentName(shipment_id);
	}

}
