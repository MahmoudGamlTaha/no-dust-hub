package com.jwt.dao;

import java.sql.Date;
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
import com.jwt.model.CashTransferForm;
import com.jwt.model.DirtyProduct;
import com.jwt.model.DirtyProductsForm;
import com.jwt.model.DirtyShipment;
import com.jwt.model.DirtyShipmentData;
import com.jwt.model.ShipmentLog;

@Repository
public class ViewDirtyShipmentDAOImpl implements ViewDirtyShipmentDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DirtyShipment> getAllDirtyShipments(int id) {
		return sessionFactory.getCurrentSession().createQuery("from DirtyShipment v where v.shippment_destination_id= '"+id+"' and  v.shipment_source_type_id=2 ORDER BY v.shipment_id ")
				.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DirtyShipmentData> getShipmentData(String shipment_id) {
		List<DirtyShipmentData>dirtydata=sessionFactory.getCurrentSession().createSQLQuery("select sh.id AS shipment_id ,  sh.shipment_expected_delivery_date AS shipment_date , driver.user_name , driver.full_name_en , logs.logged_user\r\n" + 
				", sh.last_status , sh.bank_attachement , facility.facility_name, destination.facility_name AS lundry_name\r\n" + 
				"from shippments sh , drivers_data driver , shipments_logs logs , facilities facility , facilities destination\r\n" + 
				"where sh.courrier_id = driver.user_name AND logs.shipment_id = sh.id AND sh.id = "+shipment_id+" AND  CAST( sh.shippment_souce_id AS int)= facility.id AND destination.ID = CAST( sh.shippment_destination_id  AS int)").setResultTransformer(Transformers.aliasToBean(DirtyShipmentData.class)).list();
				return dirtydata;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DirtyProduct> getDirtyShipmentProduct(String Shipment_id) {
		List<DirtyProduct>dirtydata=sessionFactory.getCurrentSession().createSQLQuery("SELECT CAST(details.quantity_shipped AS int)AS quantity,details.actual_reconcilied_quantity received_quantity,CAST(details.sealed AS varchar) AS sealed , details.weight,CAST(details.id AS varchar), CAST(details.washing_program_id AS varchar), details.product_sku , details.product_name, washing.program AS washing_program_name , CAST(details.approved AS varchar)\r\n" + 
				"	FROM shipment_details_with_products_and_treatments details , washing_programs washing\r\n" + 
				"	where details.shipment_id ="+Shipment_id+" AND washing.id = details.washing_program_id \r\n"+
				"    ORDER BY details.product_name , washing.washing_program , details.quantity_shipped ,details.weight").setResultTransformer(Transformers.aliasToBean(DirtyProduct.class)).list();
				return dirtydata;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String appproveDirtyShipment(String ids,String ids2, int shipment_id, String useName) {
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("approve_receiving_dirty_shipment");
		procedureCall.registerParameter("p_ids", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_ids2", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_shipment_id", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_in_user", String.class, ParameterMode.IN);
		procedureCall.getParameterRegistration("p_ids").bindValue(ids);
		procedureCall.getParameterRegistration("p_ids2").bindValue(ids2);
		procedureCall.getParameterRegistration("p_shipment_id").bindValue(shipment_id);
		procedureCall.getParameterRegistration("p_logged_in_user").bindValue(useName);
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String checkStateOfShipment(int id) {
		List<DirtyProductsForm>state=sessionFactory.getCurrentSession().createSQLQuery("SELECT  last_status\r\n" + 
				"FROM shippments\r\n" + 
				"where id = "+id).setResultTransformer(Transformers.aliasToBean(DirtyProductsForm.class)).list();
				return state.get(0).getLast_status();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DirtyShipment> getExternalLundry() {
		return sessionFactory.getCurrentSession().createQuery("from DirtyShipment v where v.shippment_souce_id= '1' AND v.last_status IN( '1' ,'5') AND shippment_destination_id NOT IN ('1') ORDER BY v.shipment_id ")
				.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Get_Approved_by(int id) {
		// TODO Auto-generated method stub
		//List<ShipmentLog> logs=sessionFactory.getCurrentSession().createQuery("from ShipmentLog where shipment_id="+id+"and to_status_id='5'").list();
		List<CashTransferForm>lst=(List<CashTransferForm>)sessionFactory.getCurrentSession().createSQLQuery("select concat(u.display_name,',',log.logged_user) as agent_name from shipments_logs log\r\n" + 
				"left join sc_users u on u.user_name =log.logged_user\r\n" + 
				"where log.log_id=(select max(log_id) from shipments_logs where shipment_id="+id+" and to_status_id='5')").setResultTransformer(Transformers.aliasToBean(CashTransferForm.class)).list();
		if(lst.size()>0)
		{
			return lst.get(0).getAgent_name();
		}
		else
		{
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Get_Requested_By(int id) {
		// TODO Auto-generated method stub
		//List<ShipmentLog> logs=sessionFactory.getCurrentSession().createQuery("from ShipmentLog where shipment_id="+id+"and to_status_id='1'").list();
		List<CashTransferForm>lst=(List<CashTransferForm>)sessionFactory.getCurrentSession().createSQLQuery("select concat(u.display_name,',',log.logged_user) as agent_name from shipments_logs log\r\n" + 
				"left join sc_users u on u.user_name =log.logged_user\r\n" + 
				"where log.log_id=(select min(log_id) from shipments_logs where shipment_id="+id+" and to_status_id='1')").setResultTransformer(Transformers.aliasToBean(CashTransferForm.class)).list();

		if(lst.size()>0)
		{
		return lst.get(0).getAgent_name();
		}
		else
		{
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Get_Approval_Date(int id) {
		// TODO Auto-generated method stub
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("get_approval_date");
		procedureCall.registerParameter("p_shipment_id", Integer.class, ParameterMode.IN);		
		procedureCall.getParameterRegistration("p_shipment_id").bindValue(id);
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
	
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Submit_approve_dirty_shipment(String approved_sealed, String not_approved, int shipment_id,
			String logged_user, String approved_not_sealed, String products) {
		// TODO Auto-generated method stub
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("approve_receiving_dirty_shipment");
		procedureCall.registerParameter("p_ids", String.class, ParameterMode.IN);	
		procedureCall.registerParameter("p_ids2", String.class, ParameterMode.IN);	
		procedureCall.registerParameter("p_shipment_id", Integer.class, ParameterMode.IN);	
		procedureCall.registerParameter("p_logged_in_user", String.class, ParameterMode.IN);	
		procedureCall.registerParameter("p_ids3", String.class, ParameterMode.IN);	
		procedureCall.registerParameter("p_products", String.class, ParameterMode.IN);	

		procedureCall.getParameterRegistration("p_ids").bindValue(approved_sealed);
		procedureCall.getParameterRegistration("p_ids2").bindValue(not_approved);
		procedureCall.getParameterRegistration("p_shipment_id").bindValue(shipment_id);
		procedureCall.getParameterRegistration("p_logged_in_user").bindValue(logged_user);
		procedureCall.getParameterRegistration("p_ids3").bindValue(approved_not_sealed);
		procedureCall.getParameterRegistration("p_products").bindValue(products);
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
	
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Submit_receiving_external_shipment(String approved, String not_approved, int shipment_id,
			String logged_user, String pro_quantity) {
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("approve_receiving_external_dirty_shipment");
		procedureCall.registerParameter("p_ids", String.class, ParameterMode.IN);	
		procedureCall.registerParameter("p_ids2", String.class, ParameterMode.IN);	
		procedureCall.registerParameter("p_shipment_id", Integer.class, ParameterMode.IN);	
		procedureCall.registerParameter("p_logged_in_user", String.class, ParameterMode.IN);	
		procedureCall.registerParameter("p_products", String.class, ParameterMode.IN);	

		procedureCall.getParameterRegistration("p_ids").bindValue(approved);
		procedureCall.getParameterRegistration("p_ids2").bindValue(not_approved);
		procedureCall.getParameterRegistration("p_shipment_id").bindValue(shipment_id);
		procedureCall.getParameterRegistration("p_logged_in_user").bindValue(logged_user);
		procedureCall.getParameterRegistration("p_products").bindValue(pro_quantity);
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
	
		return result;
	}

}
