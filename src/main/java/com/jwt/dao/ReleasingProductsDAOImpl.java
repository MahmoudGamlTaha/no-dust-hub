package com.jwt.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.ParameterMode;

import org.hibernate.SessionFactory;
import org.hibernate.procedure.ProcedureCall;
import org.hibernate.procedure.ProcedureOutputs;
import org.hibernate.result.ResultSetOutput;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.CoverProduct;
import com.jwt.model.DirtyProduct;
import com.jwt.model.DirtyProductInPackage;
import com.jwt.model.DirtyProductsForm;
import com.jwt.model.Cover;
import com.jwt.model.Driver;
import com.jwt.model.Facility;
import com.jwt.model.FinancialAccount;
import com.jwt.model.Shipment;


@Repository
public class ReleasingProductsDAOImpl implements ReleasingProductsDAO {

	
	@Autowired
	private SessionFactory sessionFactory;

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Driver> GetAllDrivers() {
  return (List<Driver>)sessionFactory.getCurrentSession().createQuery("from Driver order by FULL_NAME_EN").list();

	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public String checkAuthentication(String username , String code) {
		
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("validate_releasing_products_user");
		procedureCall.registerParameter("p_user_name", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_verfication_code", String.class, ParameterMode.IN);
		procedureCall.getParameterRegistration("p_user_name").bindValue(username);
		procedureCall.getParameterRegistration("p_verfication_code").bindValue(code);
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		//System.out.println("function response "+ result);
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Cover> getCoversOfDriver(String id){
		  return (List<Cover>)sessionFactory.getCurrentSession().createQuery("from Cover  v where  v.driver_id='"+id+"' order by v.assignment_date").list();

	}


	@SuppressWarnings("unchecked")
	@Override
	public List<CoverProduct> getCoverProducts(String driver_id, String coverDate) {
		return (List<CoverProduct>)sessionFactory.getCurrentSession().createQuery("from CoverProduct v where v.driver_id='"+driver_id+"' and v.assignment_date='"+coverDate+"'").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Driver getDriverById(String id) {
		List<Driver>lst =(List<Driver>)sessionFactory.getCurrentSession().createQuery("from Driver v where v.USER_NAME='"+id+"'").list();
		if (lst != null&&lst.size()>0)
			return lst.get(0);
		else
			return null;
	}


	@SuppressWarnings("unchecked")
	@Override
	public Facility getFacilityById(int id) {
		List< Facility> lst = (List<Facility>)sessionFactory.getCurrentSession().createQuery("from Facility v where v.id="+id).list();
		if(lst.isEmpty())
			return null;
		else
			return lst.get(0);
	}


	@SuppressWarnings("unchecked")
	@Override
	public String submitCover(String driver, String loggenedUser, String jsonObj , String date) {
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("submit_releasing_products");
		procedureCall.registerParameter("p_driver_user_name", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_in_user", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_products", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_assign_date", String.class, ParameterMode.IN);
		procedureCall.getParameterRegistration("p_driver_user_name").bindValue(driver);
		procedureCall.getParameterRegistration("p_logged_in_user").bindValue(loggenedUser);
		procedureCall.getParameterRegistration("p_products").bindValue(jsonObj);
		procedureCall.getParameterRegistration("p_assign_date").bindValue(date);
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}


	@SuppressWarnings("unchecked")
	@Override
	public Cover getCoverOfDriverAndDate(String id, String date_) {
		  
				 List<Cover> covers=(List<Cover>)sessionFactory.getCurrentSession().createQuery("from Cover  v where  v.driver_id='"+id+"' and  v.assignment_date ='"+date_+"'").list();
				 if(covers.isEmpty())
				 {
					 return null;
				 }
				 else {
					 return covers.get(0);
				 }

	}


	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAreas(String driver_id, String coverDate) {
		List<String> lst =sessionFactory.getCurrentSession().createSQLQuery("SELECT DISTINCT \"AREA_NAME\" as areas\r\n" + 
				"FROM public.\"ASSIGNMENTS_WORK_XY\"\r\n" + 
				"where \"ASSIGN_DATE\" ='"+coverDate+"'\r\n" + 
				"AND \"DRIV_ID\" = '"+driver_id+"'").list();
		if(lst.isEmpty())
			return null;
		else
			return lst;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Shipment> Check_Reconcile_Cash(String driver_id) {
		// TODO Auto-generated method stub
		return (List<Shipment>) sessionFactory.getCurrentSession().createQuery("from Shipment where shipment_type_id=2 and  last_status in ('7','8') and shippment_souce_id='"+driver_id+"'").list();
	}




}
