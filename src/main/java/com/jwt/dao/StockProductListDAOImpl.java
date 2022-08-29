package com.jwt.dao;

import java.util.List;

import javax.persistence.ParameterMode;

import org.hibernate.SessionFactory;
import org.hibernate.procedure.ProcedureCall;
import org.hibernate.procedure.ProcedureOutputs;
import org.hibernate.result.ResultSetOutput;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Facility;
import com.jwt.model.InventoryCheck;
import com.jwt.model.InventoryProduct;

@Repository
public class StockProductListDAOImpl implements StockProductListDAO {

	@Autowired
	private SessionFactory sessionFactory;
	@SuppressWarnings("unchecked")
	@Override
	public List<Facility> getWareHouses() {
		return sessionFactory.getCurrentSession().createQuery("from Facility v where v.facility_type_id = 1 order by facility_name")
				.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<InventoryProduct> getProductOfFacility(int id) {
		List<InventoryProduct>products=sessionFactory.getCurrentSession().createSQLQuery("SELECT facilty_info.facility_id,pt.type as type_name,CAST( facilty_info.total_stock_quantity AS varchar)AS quantity, products_.product_name ,CAST(products_.type AS varchar),trt.\"TRE_NAME\" AS treatment ,facilty_info.product_id,pt.type AS p_type \r\n" + 
				"	FROM facility_product_info facilty_info , facilities facility  ,products products_ , \"TREATMENT_TYPES\" trt , products_type pt \r\n" + 
				"	where facilty_info.facility_id = facility.id AND trt.\"TRE_ID\" = products_.treatment_id AND facilty_info.product_id = products_.product_sku\r\n" + 
				"	AND pt.id=products_.type AND facilty_info.facility_id = "+id+"AND products_.product_category NOT IN (3,4) order by products_.product_name , trt.\"TRE_NAME\"").setResultTransformer(Transformers.aliasToBean(InventoryProduct.class)).list();
				return products;
	}
	@SuppressWarnings("unchecked")
	@Override
	public String getUserRole(int id) {
		List<InventoryProduct>products=sessionFactory.getCurrentSession().createSQLQuery("SELECT  CAST(role_id AS varchar)\r\n" + 
				"	FROM public.sc_users_roles\r\n" + 
				"	where user_id = "+id).setResultTransformer(Transformers.aliasToBean(InventoryProduct.class)).list();
		if (products != null)
			return products.get(0).getRole_id();
		else 
			return null;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<InventoryProduct> getFinancialProducts(int id) {
		List<InventoryProduct>products=sessionFactory.getCurrentSession().createSQLQuery("SELECT facilty_info.facility_id,CAST( facilty_info.total_stock_quantity AS varchar)AS quantity, products_.product_name ,facilty_info.product_id \r\n" + 
				"					FROM facility_product_info facilty_info , facilities facility  ,products products_ \r\n" + 
				"					where facilty_info.facility_id = facility.id AND facilty_info.product_id = products_.product_sku \r\n" + 
				"					AND facilty_info.facility_id = "+id+" AND products_.product_category = 4").setResultTransformer(Transformers.aliasToBean(InventoryProduct.class)).list();
				return products;
	}
	@SuppressWarnings("unchecked")
	@Override
	public String submitInventoryCheck(String user, String products ,int warehouse_id,String comment) {
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("submit_inventory_check");
		procedureCall.registerParameter("p_logged_in_user", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_products", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_facility_id", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_comment", String.class, ParameterMode.IN);

		procedureCall.getParameterRegistration("p_logged_in_user").bindValue(user);
		procedureCall.getParameterRegistration("p_products").bindValue(products);
		procedureCall.getParameterRegistration("p_facility_id").bindValue(warehouse_id);
		procedureCall.getParameterRegistration("p_comment").bindValue(comment);

		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<InventoryCheck> getInventoryCheckOfFacility(int facility_id) {
		List<InventoryCheck>checks=sessionFactory.getCurrentSession().createSQLQuery(" SELECT\r\n" + 
				"        id,\r\n" + 
				"        check_date,\r\n" + 
				"        sc_users.display_name AS logged_user,\r\n" + 
				"        last_status_id,\r\n" + 
				"        facility_id   \r\n" + 
				"    FROM\r\n" + 
				"        inventory_check   \r\n" + 
				"	LEFT JOIN 	sc_users ON sc_users.user_name=inventory_check.logged_user_id\r\n" + 
				"    WHERE\r\n" + 
				"	\r\n" + 
				"       facility_id =  "+facility_id+"    \r\n" + 
				"    ORDER BY\r\n" + 
				"        id desc").setResultTransformer(Transformers.aliasToBean(InventoryCheck.class)).list();
				return checks;
	}
	@SuppressWarnings("unchecked")
	@Override
	public InventoryCheck getInventoryCheckDataByID(int id) {
		List<InventoryCheck>checks=sessionFactory.getCurrentSession().createSQLQuery("SELECT id, check_date, concat(logged_user_id,',',sc_users.display_name) AS logged_user, last_status_id,facility_id, warehouse_manager\r\n" + 
				"	FROM inventory_check , sc_users \r\n" + 
				"	WHERE id ="+id+"and sc_users.user_name=inventory_check.logged_user_id").setResultTransformer(Transformers.aliasToBean(InventoryCheck.class)).list();
		if(checks != null)
				return checks.get(0);
		else
			return null;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<InventoryProduct> getInventoryProductsByCheckID(int id) {
		List<InventoryProduct>products=sessionFactory.getCurrentSession().createSQLQuery("SELECT pro.product_name,pt.type AS p_type, treatment.\"TRE_NAME\" AS treatment, CAST(inv_details.product_actual_quantity_checked AS VARCHAR)AS actual_quentity, CAST(inv_details.product_system_quantity AS VARCHAR) AS system_quantity\r\n" + 
				"					FROM inventory_check_details inv_details, products pro , \"TREATMENT_TYPES\" treatment , products_type pt\r\n" + 
				"					where inventory_check_id="+id+" and pro.product_sku =  inv_details.product_id and pro.treatment_id = treatment.\"TRE_ID\" and pt.id=pro.type\r\n" + 
				"						ORDER BY pro.product_name , treatment.\"TRE_NAME\"").setResultTransformer(Transformers.aliasToBean(InventoryProduct.class)).list();
				return products;	
				}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public String approveRejectInvenoryCheck(int checkID, String approveValue, String manager) {
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("approve_inventory_check");
		procedureCall.registerParameter("p_inventory_check_id", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_approvment_value", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_warehouse_manager", String.class, ParameterMode.IN);

		procedureCall.getParameterRegistration("p_inventory_check_id").bindValue(checkID);
		procedureCall.getParameterRegistration("p_approvment_value").bindValue(approveValue);
		procedureCall.getParameterRegistration("p_warehouse_manager").bindValue(manager);

		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;	
		}
	
}