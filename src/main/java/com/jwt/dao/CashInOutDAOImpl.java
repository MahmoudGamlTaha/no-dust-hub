package com.jwt.dao;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.ParameterMode;

import org.hibernate.SessionFactory;
import org.hibernate.procedure.ProcedureCall;
import org.hibernate.procedure.ProcedureOutputs;
import org.hibernate.result.ResultSetOutput;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.CashTransferForm;
import com.jwt.model.CashTrasfers;
import com.jwt.model.Drivers_Users;
import com.jwt.model.FinancialAccount;
import com.jwt.model.InternalTransfers;
import com.jwt.model.Operation;
import com.jwt.model.Shipment;
import com.jwt.model.ShipmentLog;
import com.jwt.model.TransferAccounts;

@Repository
public class CashInOutDAOImpl implements CashInOutDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public String submitCashInOut(String financialAcc, String user, double amount, String driver_userName,String Comment) {
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("submit_releasing_cash");
		procedureCall.registerParameter("p_financial_account", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_in_user", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_amount_money_released", Double.class, ParameterMode.IN);
		procedureCall.registerParameter("p_driver_user_name", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_comment", String.class, ParameterMode.IN);

		procedureCall.getParameterRegistration("p_financial_account").bindValue(financialAcc);
		procedureCall.getParameterRegistration("p_logged_in_user").bindValue(user);
		procedureCall.getParameterRegistration("p_amount_money_released").bindValue(amount);
		procedureCall.getParameterRegistration("p_driver_user_name").bindValue(driver_userName);
		procedureCall.getParameterRegistration("p_comment").bindValue(Comment);

		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<FinancialAccount> Get_Financial_Accounts(int fac_id) {
		// TODO Auto-generated method stub
		return (List<FinancialAccount>)sessionFactory.getCurrentSession().createQuery("from FinancialAccount where facility_id="+fac_id).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String transferInternalCash(int facility_id, String logged_user, String source_account,
			String destination_account, double amount, String comment,int dest_id,String src_type) {
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("submit_internal_cash_transfer");
		procedureCall.registerParameter("p_facility_id", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_user", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_source_account", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_destination_account", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_amount", Double.class, ParameterMode.IN);
		procedureCall.registerParameter("p_comment", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_dest_facility", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_source_type", String.class, ParameterMode.IN);

		
		procedureCall.getParameterRegistration("p_facility_id").bindValue(facility_id);
		procedureCall.getParameterRegistration("p_logged_user").bindValue(logged_user);
		procedureCall.getParameterRegistration("p_source_account").bindValue(source_account);
		procedureCall.getParameterRegistration("p_destination_account").bindValue(destination_account);
		procedureCall.getParameterRegistration("p_amount").bindValue(amount);
		procedureCall.getParameterRegistration("p_comment").bindValue(comment);
		procedureCall.getParameterRegistration("p_dest_facility").bindValue(dest_id);
		procedureCall.getParameterRegistration("p_source_type").bindValue(src_type);

		
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Submit_External_Cash(int facility_id, String logged_user, String account_sku, java.util.Date req_date,
			Date transfer_date, double amount, String bank_name, String bank_account_no, String attachment) {
		// TODO Auto-generated method stub
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("submit_external_cash_transfer");
		procedureCall.registerParameter("p_facility_id", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_user", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_account_sku", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_request_date", Date.class, ParameterMode.IN);
		procedureCall.registerParameter("p_transfer_date", Date.class, ParameterMode.IN);
		procedureCall.registerParameter("p_amount", Double.class, ParameterMode.IN);
		procedureCall.registerParameter("p_bank_name", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_bank_account_no", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_attachment", String.class, ParameterMode.IN);

		procedureCall.getParameterRegistration("p_facility_id").bindValue(facility_id);
		procedureCall.getParameterRegistration("p_logged_user").bindValue(logged_user);
		procedureCall.getParameterRegistration("p_account_sku").bindValue(account_sku);
		procedureCall.getParameterRegistration("p_request_date").bindValue(req_date);
		procedureCall.getParameterRegistration("p_transfer_date").bindValue(transfer_date);
		procedureCall.getParameterRegistration("p_amount").bindValue(amount);
		procedureCall.getParameterRegistration("p_bank_name").bindValue(bank_name);
		procedureCall.getParameterRegistration("p_bank_account_no").bindValue(bank_account_no);
		procedureCall.getParameterRegistration("p_attachment").bindValue(attachment);


		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Shipment> Get_Cash_Transfer_Shipments(int facility_id) {
		// TODO Auto-generated method stub
		String souurce_id=String.valueOf(facility_id);
		return (List<Shipment>) sessionFactory.getCurrentSession().createQuery("from Shipment where shipment_type_id=8 and shippment_souce_id='"+souurce_id+"' order by id desc").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Update_attachment(int shipment_id, String bank_attachment) {
		// TODO Auto-generated method stub
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("save_bank_attachment");
		procedureCall.registerParameter("p_shipment_id", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_bank_attachment", String.class, ParameterMode.IN);
		procedureCall.getParameterRegistration("p_shipment_id").bindValue(shipment_id);
		procedureCall.getParameterRegistration("p_bank_attachment").bindValue(bank_attachment);
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Get_Agent_Name(int shipment_id) {
		// TODO Auto-generated method stub
		List<ShipmentLog> sh_log=(List<ShipmentLog>)sessionFactory.getCurrentSession().createQuery("from ShipmentLog where shipment_id="+shipment_id).list();
		String agent_name=sh_log.get(0).getLogged_user();
		return agent_name;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Get_Account(int shipment_id) {
		// TODO Auto-generated method stub
		List<String> lst=(List<String>) sessionFactory.getCurrentSession().createSQLQuery("select product_id from operations where transaction_id="+shipment_id).list();
		return lst.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public String get_Account_bby_id(String cash_account_id) {
		// TODO Auto-generated method stub
		List<String>lst=(List<String>)sessionFactory.getCurrentSession().createSQLQuery("select product_name from products where product_sku='"+cash_account_id+"'").list();
		if(lst.size()>0)
		{
				return lst.get(0);
		}
		else
		{
			return "";
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Drivers_Users> get_user_names() {
		// TODO Auto-generated method stub
		return (List<Drivers_Users>)sessionFactory.getCurrentSession().createQuery("from Drivers_Users order by name").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TransferAccounts> Get_Transfer_account_for_external(int fac_id) {
		// TODO Auto-generated method stub
		return (List<TransferAccounts>)sessionFactory.getCurrentSession().createSQLQuery("select pr.product_name , pr.product_sku ,  p_info.total_stock_quantity\r\n" + 
				"from facility_product_info p_info , products pr ,cash_account_transfer cash_account\r\n" + 
				"where pr.product_sku=cash_account.cash_account and p_info.product_id=cash_account.cash_account  and p_info.facility_id="+fac_id+"\r\n" + 
				"and cash_account.external_transfer=1 order by pr.product_name").setResultTransformer(Transformers.aliasToBean(TransferAccounts.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CashTrasfers> Get_Transfers(int fac_id, String product_id, String from_date, String to_date) {
		// TODO Auto-generated method stub
		return (List<CashTrasfers>)sessionFactory.getCurrentSession().createSQLQuery("select CAST(x.id AS integer) id , to_char(x.transaction_date,'dd/MM/yyyy') transaction_date ,   to_char(x.transfer_date,'dd/MM/yyyy') transfer_date , comments , CAST(sum(added) AS double precision )added , CAST(sum(deducted) AS double precision) deducted , CAST((CASE WHEN previous_amount IS NULL THEN 0 ELSE  previous_amount END) AS double precision) previous_amount , transaction_name as transaction_type ,transaction_time , payment_refrence  \r\n" + 
				"				from (select id,facility_id,product_id, transaction_date ,  transfer_date , (case when transaction_name='Shipment Reconciliation' then concat(u.\"FULL_NAME_EN\",',',comments) else comments end) as comments , product_id , (case when transaction_movement_type='1' then product_quantity else 0 end) as added , \r\n" + 
				"				(case when transaction_movement_type='-1' then product_quantity else 0 end) as deducted , previous_amount , transaction_name, CAST(transaction_time AS TEXT) transaction_time , payment_refrence \r\n" + 
				"				from cash_transfer_summary  left join \"USERS\" u on u.\"USER_NAME\"=comments \r\n" + 
				"					  where product_id='"+product_id+"'\r\n" + 
				"				) x \r\n" + 
				"				where x.transaction_date >= '"+from_date+"' and x.transaction_date<='"+to_date+"' and x.facility_id="+fac_id+" \r\n" + 
				"				group by x.id , x.transaction_date , x.transfer_date , x.comments , x.previous_amount , x.transaction_name , x.transaction_time , x.payment_refrence  order by x.transaction_date ,x.transaction_time").setResultTransformer(Transformers.aliasToBean(CashTrasfers.class)).list();
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<TransferAccounts> Get_Accounts_For_Report() {
		// TODO Auto-generated method stub
		return (List<TransferAccounts>)sessionFactory.getCurrentSession().createSQLQuery("select pr.product_name , pr.product_sku \r\n" + 
				"from products pr where product_sku in (select cash_account from cash_account_transfer)\r\n" + 
				"order by pr.product_name").setResultTransformer(Transformers.aliasToBean(TransferAccounts.class)).list();
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<CashTransferForm> GetExternalTransfers(int facility_id) {
		// TODO Auto-generated method stub
		return (List<CashTransferForm>)sessionFactory.getCurrentSession().createSQLQuery("select sh.id shipment_id ,  sh.shippment_destination_id bank_name ,to_char(sh.shipment_expected_delivery_date,'dd-MM-yyyy') request_date,\r\n" + 
				"to_char(shipment_actual_delivery_date,'dd-MM-yyyy') t_date , sh.bank_attachement attachment , pr.product_name account_sku , cast(det.quantity_shipped as double precision) as cash_amount \r\n" + 
				"from shippments sh , shipments_details det, products pr where shipment_type_id=8 and shippment_souce_id='"+facility_id+"' \r\n" + 
				"and  shipment_id=sh.id and pr.product_sku=det.product_id and pr.product_category=4 order by sh.id desc").setResultTransformer(Transformers.aliasToBean(CashTransferForm.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InternalTransfers> GetInternalTransfers(int facility_id) {
		// TODO Auto-generated method stub
		return (List<InternalTransfers>)sessionFactory.getCurrentSession().createSQLQuery("select shipment_id , shipment_date , from_facility , to_facility,from_account , to_account , CAST(amount AS double precision) as amount from internal_cash_transfer_list where source='"+facility_id+"' or dest='"+facility_id+"' order by shipment_id desc").setResultTransformer(Transformers.aliasToBean(InternalTransfers.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InternalTransfers> GetInternalTransferById(int shipment_id) {
		// TODO Auto-generated method stub
		return (List<InternalTransfers>)sessionFactory.getCurrentSession().createSQLQuery("select shipment_id , shipment_date , from_facility , to_facility,from_account , to_account , CAST(amount AS double precision) as amount from internal_cash_transfer_list where  shipment_id="+shipment_id).setResultTransformer(Transformers.aliasToBean(InternalTransfers.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String GetAgentDisplayName(int shipment_id) {
		// TODO Auto-generated method stub
		List<CashTransferForm>lst=(List<CashTransferForm>)sessionFactory.getCurrentSession().createSQLQuery("select concat(u.display_name,',',log.logged_user) as agent_name from shipments_logs log\r\n" + 
				"left join sc_users u on u.user_name =log.logged_user\r\n" + 
				"where log.log_id=(select max(log_id) from shipments_logs where shipment_id="+shipment_id+")").setResultTransformer(Transformers.aliasToBean(CashTransferForm.class)).list();
		return lst.get(0).getAgent_name();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String GetRequestedAgentName(int shipment_id) {
		// TODO Auto-generated method stub
		List<CashTransferForm>lst=(List<CashTransferForm>)sessionFactory.getCurrentSession().createSQLQuery("select concat(u.display_name,',',log.logged_user) as agent_name from shipments_logs log\r\n" + 
				"left join sc_users u on u.user_name =log.logged_user\r\n" + 
				"where log.log_id=(select min(log_id) from shipments_logs where shipment_id="+shipment_id+")").setResultTransformer(Transformers.aliasToBean(CashTransferForm.class)).list();
		return lst.get(0).getAgent_name();
	}

}
