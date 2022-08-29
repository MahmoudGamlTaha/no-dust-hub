package com.jwt.dao;

import java.math.BigInteger;
import java.util.List;

import javax.persistence.ParameterMode;

import org.hibernate.SessionFactory;
import org.hibernate.procedure.ProcedureCall;
import org.hibernate.procedure.ProcedureOutputs;
import org.hibernate.result.ResultSetOutput;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.ActualCounts;
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

@Repository
public class CashOnCoverDAOImpl implements CashOnCoverDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Shipment> getAllShipment(int source_Id , String today_date ) {
		return (List<Shipment>)sessionFactory.getCurrentSession().createQuery("from Shipment sh where sh.last_status = '1' "
				+ "and sh.shipment_destination_type_id = '1' "
				+ "and sh.shipment_source_type_id = 2 "
				+ "and sh.shippment_souce_id = '"+source_Id+"' "
				+"and sh.shipment_type_id = 1 "
						+ "and to_char(sh.shipment_expected_delivery_date,'dd-mm-yyyy')=to_char(current_date,'dd-mm-yyyy')").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShipmentProduct> getShipmentProducts(int Shipment_id) {
		return (List<ShipmentProduct>)sessionFactory.getCurrentSession().createQuery("from ShipmentProduct product where product.shipment_id ='"+Shipment_id+"'").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public ShipmentLog getShipmentLog(int Shipment_id) {
		List<ShipmentLog> logs= (List<ShipmentLog>)sessionFactory.getCurrentSession().createQuery("from ShipmentLog log where log.shipment_id ='"+Shipment_id+"'").list();
		// TODO Auto-generated method stub
		return logs.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<FinancialAccount> getFinancialAccounts(int id) {
		return (List<FinancialAccount>)sessionFactory.getCurrentSession().createQuery("from FinancialAccount v where v.facility_id='"+id+"'").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String submitCashOnCover(long shipmentID, String financialAccount, String user, double actualMoney,
			double plannedMoney) {
		// TODO Auto-generated method stub
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("submit_releasing_cash_on_cover");
		procedureCall.registerParameter("p_shippment_id", Long.class, ParameterMode.IN);
		procedureCall.registerParameter("p_financial_account", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_in_user", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_amount_money_released", Double.class, ParameterMode.IN);
		procedureCall.registerParameter("p_planned_money", Double.class, ParameterMode.IN);
		procedureCall.getParameterRegistration("p_shippment_id").bindValue(shipmentID);
		procedureCall.getParameterRegistration("p_financial_account").bindValue(financialAccount);
		procedureCall.getParameterRegistration("p_logged_in_user").bindValue(user);
		procedureCall.getParameterRegistration("p_amount_money_released").bindValue(actualMoney);
		procedureCall.getParameterRegistration("p_planned_money").bindValue(plannedMoney);

		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		//System.out.println("function response "+ result);
		return result;
			}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@SuppressWarnings("unchecked")
	@Override
	public List<Shipment> get_Received_shipments(int destination_id) {
		return (List<Shipment>)sessionFactory.getCurrentSession().createQuery("from Shipment sh where sh.last_status in ('5','7','8') "
				+ "and sh.shipment_destination_type_id = '2' "
				+ "and sh.shipment_source_type_id = 1 "
				+ "and sh.shippment_destination_id  = '"+destination_id+"' ").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DirtyFinancialAccount> getdirtyFinancialAccounts(int fac_id) {
		// TODO Auto-generated method stub
		return (List<DirtyFinancialAccount>)sessionFactory.getCurrentSession().createQuery("from DirtyFinancialAccount where facility_id='"+fac_id+"'").list() ;
	}

	@SuppressWarnings("unchecked")
	@Override
	public double getExpected_Cash(String driver_id) {
		// TODO Auto-generated method stub
		List<ExpectedCashOnCover> lst_expected=sessionFactory.getCurrentSession().createQuery("from ExpectedCashOnCover where driver_id='"+driver_id+"'").list();
		double val = 0;
		if(lst_expected.size()!=0)
		{
			val=lst_expected.get(0).getExpected_money();
		}
	
	return val;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Submit_ReceivingCashOnCover(long Shipment_id, String Financial_Account, String U,
			double actual_amount, double planned_money) {
		
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("submit_receiving_cash_on_cover");
		procedureCall.registerParameter("p_shippment_id", Long.class, ParameterMode.IN);
		procedureCall.registerParameter("p_financial_account", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_in_user", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_amount_money_recieved", Double.class, ParameterMode.IN);
		procedureCall.registerParameter("p_planned_money", Double.class, ParameterMode.IN);
		procedureCall.getParameterRegistration("p_shippment_id").bindValue(Shipment_id);
		procedureCall.getParameterRegistration("p_financial_account").bindValue(Financial_Account);
		procedureCall.getParameterRegistration("p_logged_in_user").bindValue(U);
		procedureCall.getParameterRegistration("p_amount_money_recieved").bindValue(actual_amount);
		procedureCall.getParameterRegistration("p_planned_money").bindValue(planned_money);

		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		//System.out.println("function response "+ result);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Submit_Cash_OnCover(String Ship_id,String driver_id, String account_sku, String logged_in_user, double actual_amount,
			double planned_money,double reconciled_cash) {
		// TODO Auto-generated method stub
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("submit_receiving_cash_on_cover");
		procedureCall.registerParameter("p_shipment_id", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_driver_user_name", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_financial_account", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_in_user", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_amount_money_recieved", Double.class, ParameterMode.IN);
		procedureCall.registerParameter("p_planned_money", Double.class, ParameterMode.IN);
		procedureCall.registerParameter("p_reconciled_cash", Double.class, ParameterMode.IN);
		procedureCall.getParameterRegistration("p_shipment_id").bindValue(Ship_id);
		procedureCall.getParameterRegistration("p_driver_user_name").bindValue(driver_id);
		procedureCall.getParameterRegistration("p_financial_account").bindValue(account_sku);
		procedureCall.getParameterRegistration("p_logged_in_user").bindValue(logged_in_user);
		procedureCall.getParameterRegistration("p_amount_money_recieved").bindValue(actual_amount);
		procedureCall.getParameterRegistration("p_planned_money").bindValue(planned_money);
		procedureCall.getParameterRegistration("p_reconciled_cash").bindValue(reconciled_cash);
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ExpectedCashOnCover> Get_expected_Cash(String driver_id) {
		// TODO Auto-generated method stub
		
		return (List<ExpectedCashOnCover>)sessionFactory.getCurrentSession().createQuery("from ExpectedCashOnCover where driver_id='"+driver_id+"'").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Shipment> get_driver_shipment(String driver_id) {
		// TODO Auto-generated method stub
		return (List<Shipment>)sessionFactory.getCurrentSession().createQuery("from Shipment where shipment_type_id=2 and shippment_souce_id='"+driver_id+"' and shipment_actual_money_out=null and last_status in('7','8')").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Shipment> Check_reconcation_cash_shipment(String driver_id) {
		// TODO Auto-generated method stub
		return (List<Shipment>)sessionFactory.getCurrentSession().createQuery("from Shipment where shipment_type_id=2 and shippment_souce_id='"+driver_id+"' and last_status='14' and to_date(to_char(shipment_expected_delivery_date,'yyyy-mm-dd') , 'yyyy-mm-dd')=current_date").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Shipment> Get_ShipmentListOfDriver(int fac_id, String driver_id) {
		return (List<Shipment>)sessionFactory.getCurrentSession().createQuery("from Shipment where shipment_type_id=2 shippment_souce_id='"+driver_id+"' and shipment_actual_money_out=null").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Shipment get_shipment_data(int Ship_id) {
		// TODO Auto-generated method stub
		List<Shipment> ship_list=(List<Shipment>)sessionFactory.getCurrentSession().createQuery("from Shipment where id="+Ship_id).list();
		return ship_list.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Shipment> Check_Recon_In_Progress(String driver_id) {
		// TODO Auto-generated method stub
		return (List<Shipment>)sessionFactory.getCurrentSession().createQuery("from Shipment where shipment_type_id=2 and shippment_souce_id='"+driver_id+"' and shipment_actual_money_out=null and last_status not in ('7','8','6')").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ExpectedCashOnShipment> Get_Cash_On_Shipment(int ship_id) {
		// TODO Auto-generated method stub
		List<ExpectedCashOnShipment>expected=sessionFactory.getCurrentSession().createSQLQuery("SELECT expected_date.shippment_destination_id AS driver_id,\r\n" + 
				"				    expected_date.actual_paid AS expected_money, \r\n" + 
				"				        CASE\r\n" + 
				"				            WHEN sum(recon_master.\"APPROVED_MONEY\") IS NULL THEN 0 \r\n" + 
				"				            ELSE sum(recon_master.\"APPROVED_MONEY\")\r\n" + 
				"				        END AS reconciliated_money\r\n" + 
				"				   FROM ( SELECT qq.shippment_destination_id,\r\n" + 
				"				                CASE \r\n" + 
				"				                    WHEN sum(ee.actual_paid) IS NULL THEN 0  \r\n" + 
				"				                    ELSE sum(ee.actual_paid)\r\n" + 
				"				                END AS actual_paid,\r\n" + 
				"				            min(qq.min_date) AS min_date,\r\n" + 
				"				            min(qq.max_date) AS max_date\r\n" + 
				"				           FROM ( SELECT released_date.shippment_destination_id,\r\n" + 
				"				                    max(cast(cov.\"ASSIGNMENT_DATE\" as date)) AS max_date, \r\n" + 
				"				                    min(cast(cov.\"ASSIGNMENT_DATE\" as date)) AS min_date\r\n" + 
				"				                   FROM (SELECT shipment_id sh_id_rel, driver shippment_destination_id,\r\n" + 
				"				 to_date(shipment_actual_delivery_date,'yyyy-mm-dd') shipment_actual_delivery_date \r\n" + 
				"				 FROM related_shippments  \r\n" + 
				"				 where master_shipment_id = "+ship_id+") released_date,\r\n" + 
				"				                    \"COVER_PRODUCT\" cov\r\n" + 
				"				                  WHERE released_date.shipment_actual_delivery_date = cast(cov.\"RELEASING_DATE\" as date)  \r\n" + 
				"								 AND released_date.shippment_destination_id = cov.\"DRIVER_ID\"\r\n" + 
				"				                  GROUP BY released_date.shippment_destination_id) qq\r\n" + 
				"				             LEFT JOIN ( SELECT sum(\"ASSIGNED_CONTRACT_D\".\"ACTUAL_PAID\") AS actual_paid,\r\n" + 
				"				                    \"ASSIGNMENTS_WORK_XY\".\"DRIV_ID\",\r\n" + 
				"				                    \"ASSIGNMENTS_WORK_XY\".\"ASSIGN_DATE\" \r\n" + 
				"				                   FROM \"ASSIGNED_CONTRACT_D\", \r\n" + 
				"				                    \"ASSIGNMENTS_WORK_XY\"\r\n" + 
				"				                 WHERE \"ASSIGNED_CONTRACT_D\".\"AID\" = \"ASSIGNMENTS_WORK_XY\".\"AID\"\r\n" + 
				"				                  GROUP BY \"ASSIGNMENTS_WORK_XY\".\"DRIV_ID\", \"ASSIGNMENTS_WORK_XY\".\"ASSIGN_DATE\") ee \r\n" + 
				"						 ON ee.\"DRIV_ID\" = qq.shippment_destination_id \r\n" + 
				"						 AND ee.\"ASSIGN_DATE\" >= qq.min_date AND ee.\"ASSIGN_DATE\" <= qq.max_date \r\n" + 
				"				          GROUP BY qq.shippment_destination_id) expected_date LEFT JOIN\r\n" + 
				"						  (SELECT \"DRIVER\" , \"DATE\" ,SUM(\"APPROVED_MONEY\") \"APPROVED_MONEY\"\r\n" + 
				"				FROM \"RECONCILIATION_MASTER\"\r\n" + 
				"				WHERE \"ACCEPT\" = true\r\n" + 
				"				GROUP BY \"DRIVER\" , \"DATE\")recon_master\r\n" + 
				//"				     --LEFT JOIN \"RECONCILIATION_MASTER\" recon_master ON \\r\\n\" + \r\n" + 
				"					 ON  recon_master.\"DRIVER\" =expected_date.shippment_destination_id\r\n" + 
				"					 AND recon_master.\"DATE\" >= expected_date.min_date \r\n" + 
				"					 AND recon_master.\"DATE\" <= expected_date.max_date \r\n" + 
				"				  GROUP BY expected_date.shippment_destination_id,  expected_date.actual_paid ;").setResultTransformer(Transformers.aliasToBean(ExpectedCashOnShipment.class)).list();
		
		System.out.println("Size : "+expected.size());
		return expected;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAreasOfCash(String driver_id, String ship_id) {
		List<String> lst =sessionFactory.getCurrentSession().createSQLQuery(" SELECT\r\n" + 
				"       DISTINCT assign.\"AREA_NAME\"\r\n" + 
				"    FROM\r\n" + 
				"        \"ASSIGNMENTS_WORK_XY\"  assign ,\r\n" + 
				"        \"COVER_PRODUCT\" cover  ,\r\n" + 
				"		shippments sh\r\n" + 
				"    where\r\n" + 
				"        cover.\"RELEASING_DATE\" = to_date(to_char(sh.shipment_actual_delivery_date,'yyyy-mm-dd'),'yyyy-mm-dd')\r\n" + 
				"        AND cover.\"DRIVER_ID\" = assign.\"DRIV_ID\"  \r\n" + 
				"        AND cover.\"DRIVER_ID\" ='"+driver_id+"'\r\n" + 
				"		AND sh.id="+ship_id).list();
		if(lst.isEmpty())
			return null;
		else
			return lst;
	}

	@SuppressWarnings("unchecked")
	@Override
	public double get_total_rent_val(String Driver_id) {
		// TODO Auto-generated method stub
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("get_total_rent");
		procedureCall.registerParameter("p_driver_id", String.class, ParameterMode.IN);
		procedureCall.getParameterRegistration("p_driver_id").bindValue(Driver_id);
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		//System.out.println(result);
		if(result==null)
			return 0;
		else
		return Double.parseDouble(result);
			
	}

	@SuppressWarnings("unchecked")
	@Override
	public double get_sales_promos_val(String Driver_id) {
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("get_sales_promos");
		procedureCall.registerParameter("p_driver_id", String.class, ParameterMode.IN);
		procedureCall.getParameterRegistration("p_driver_id").bindValue(Driver_id);
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		System.out.println(result);
		if(result==null)
		{
			return 0;
		}
		else
		{
		return Double.parseDouble(result);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public double get_corprate_invoice(String Driver_id) {
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("get_corporate_invoice");
		procedureCall.registerParameter("p_driver_id", String.class, ParameterMode.IN);
		procedureCall.getParameterRegistration("p_driver_id").bindValue(Driver_id);
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		System.out.println(result);
		if(result==null)
			return 0;
		else
		return Double.parseDouble(result);
	}

	@SuppressWarnings("unchecked")
	@Override
	public String get_corporate_due_credit(String Driver_id) {
		// TODO Auto-generated method stub
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("get_corporate_due_credit");
		procedureCall.registerParameter("p_driver_id", String.class, ParameterMode.IN);
		procedureCall.getParameterRegistration("p_driver_id").bindValue(Driver_id);
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		System.out.println(result);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ExpectedCashOnShipment> Get_Expected_ForCollections(String driver_id) {
		// TODO Auto-generated method stub
		return (List<ExpectedCashOnShipment>)sessionFactory.getCurrentSession().createSQLQuery(" SELECT expected_date.driver_id AS driver_id,\r\n" + 
				"    expected_date.actual_paid AS expected_money,\r\n" + 
				"        CASE\r\n" + 
				"            WHEN sum(recon_master.\"APPROVED_MONEY\") IS NULL THEN CAST(0 AS numeric)\r\n" + 
				"            ELSE sum(recon_master.\"APPROVED_MONEY\")\r\n" + 
				"        END AS reconciliated_money , TO_CHAR(expected_date.min_date,'yyyy-MM-dd')as assign_date\r\n" + 
				"   FROM ( \r\n" + 
				"   SELECT '"+driver_id+"' as driver_id ,SUM(\"ACTUAL_PAID\") AS actual_paid  , to_date(to_char(\"ACTION_DATE\",'yyyy-MM-dd'),'yyyy-MM-dd') min_date FROM \r\n" + 
				"	   \"ASSIGNED_CONTRACT_D\" WHERE \"AID\" IN (SELECT \"AID\" FROM \"ASSIGNMENTS_WORK_XY\" WHERE \"ASSIGNMENT_TYPE\"=4 AND \"DRIV_ID\"='"+driver_id+"' AND  \"ASSIGN_DATE\">=\r\n" + 
				"		(SELECT to_date(to_char(sh.shipment_expected_delivery_date,'yyyy-MM-dd'),'yyyy-MM-dd') from shippments sh where id=(select max(id) from shippments where shipment_type_id=2 and shippment_souce_id='"+driver_id+"'))									)\r\n" + 
				"   group by to_date(to_char(\"ACTION_DATE\",'yyyy-MM-dd'),'yyyy-MM-dd')\r\n" + 
				"		) expected_date\r\n" + 
				"     LEFT JOIN ( SELECT \"RECONCILIATION_MASTER\".\"DRIVER\",\r\n" + 
				"            \"RECONCILIATION_MASTER\".\"DATE\",\r\n" + 
				"            sum(\"RECONCILIATION_MASTER\".\"APPROVED_MONEY\") AS \"APPROVED_MONEY\"\r\n" + 
				"           FROM \"RECONCILIATION_MASTER\"\r\n" + 
				"          WHERE \"RECONCILIATION_MASTER\".\"ACCEPT\" = true\r\n" + 
				"          GROUP BY \"RECONCILIATION_MASTER\".\"DRIVER\", \"RECONCILIATION_MASTER\".\"DATE\") recon_master ON CAST(expected_date.driver_id AS TEXT) = CAST(recon_master.\"DRIVER\" AS TEXT) AND recon_master.\"DATE\" >= expected_date.min_date \r\n" + 
				"  GROUP BY expected_date.driver_id, expected_date.actual_paid , assign_date order by assign_date desc;").setResultTransformer(Transformers.aliasToBean(ExpectedCashOnShipment.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TransferAccounts> Get_From_accounts(int fac_id) {
		// TODO Auto-generated method stub
		return (List<TransferAccounts>)sessionFactory.getCurrentSession().createSQLQuery("select pr.product_name , pr.product_sku ,  p_info.total_stock_quantity\r\n" + 
				"from facility_product_info p_info , products pr ,cash_account_transfer cash_account\r\n" + 
				"where pr.product_sku=cash_account.cash_account and p_info.product_id=cash_account.cash_account  and p_info.facility_id="+fac_id+"\r\n" + 
				"and cash_account.transfer_from=1 order by pr.product_name").setResultTransformer(Transformers.aliasToBean(TransferAccounts.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TransferAccounts> Get_To_Accounts(int fac_id) {
		// TODO Auto-generated method stub
		return (List<TransferAccounts>)sessionFactory.getCurrentSession().createSQLQuery("select pr.product_name , pr.product_sku ,  p_info.total_stock_quantity\r\n" + 
				"from facility_product_info p_info , products pr ,cash_account_transfer cash_account\r\n" + 
				"where pr.product_sku=cash_account.cash_account and p_info.product_id=cash_account.cash_account  and p_info.facility_id="+fac_id+"\r\n" + 
				"and cash_account.transfer_to=1 order by pr.product_name").setResultTransformer(Transformers.aliasToBean(TransferAccounts.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Facility> Get_Facilites() {
		// TODO Auto-generated method stub
		return (List<Facility>)sessionFactory.getCurrentSession().createQuery("from Facility order by facility_name").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Shipment> CheckLastShipmentHasCash(String driver_id) {
		// TODO Auto-generated method stub
		return (List<Shipment>)sessionFactory.getCurrentSession().createQuery("from Shipment where id=(select max(id) from Shipment where shipment_type_id=2 and shippment_souce_id='"+driver_id+"')").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShipmentDetailsData> GetLastReconDetails(int shipment_id) {
		// TODO Auto-generated method stub
		return (List<ShipmentDetailsData>)sessionFactory.getCurrentSession().createQuery("from ShipmentDetailsData where product_sku='SALES' and shipment_id="+shipment_id ).list();
	}

	
	
	



}
