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

import com.jwt.model.ActualCounts;
import com.jwt.model.CleanProduct;
import com.jwt.model.CleanShipment;
import com.jwt.model.Facility;
import com.jwt.model.Products;
import com.jwt.model.Shipment;
import com.jwt.model.ShipmentDetails;
import com.jwt.model.ShipmentLog;
import com.jwt.model.drivers;
@Repository
public class CreateShipmentDAOImpl implements CreateShipmentDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<drivers> Get_driver_List() {
		// TODO Auto-generated method stub
		return (List<drivers>) sessionFactory.getCurrentSession().createQuery("from drivers where user_group in (1,3) order by full_name_en").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Facility> Get_detsination_facility(int fac_id) {
		// TODO Auto-generated method stub
		return (List<Facility>)sessionFactory.getCurrentSession().createQuery("from Facility where facility_type_id=1 and id !="+fac_id+"order by facility_name").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Products> Get_Clean_Packs(int facility_id) {
		// TODO Auto-generated method stub
		return (List<Products>)sessionFactory.getCurrentSession().createSQLQuery(" select pr.product_sku,pr.treatment_id ,pr.dms_product_id,pr.product_name, tt.\"TRE_NAME\" as treatment_name , fi.total_stock_quantity from facility_product_info fi , products pr,\"TREATMENT_TYPES\" tt where fi.product_id =(select substr(pr.product_sku,2)) and tt.\"TRE_ID\"=pr.treatment_id and  fi.facility_id="+facility_id+"and fi.total_stock_quantity>0  and pr.type=7 order by product_name").setResultTransformer(Transformers.aliasToBean(Products.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Submit_Send_clean_Shipment(int fac_id, int dest_fac, String driver_id, String products,
			String logged_user) {
		// TODO Auto-generated method stub
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("create_new_clean_shipment");
		procedureCall.registerParameter("p_facility_id", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_user", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_products", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_driver_id", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_dest_id", Integer.class, ParameterMode.IN);

		procedureCall.getParameterRegistration("p_facility_id").bindValue(fac_id);
		procedureCall.getParameterRegistration("p_logged_user").bindValue(logged_user);
		procedureCall.getParameterRegistration("p_products").bindValue(products);
		procedureCall.getParameterRegistration("p_driver_id").bindValue(driver_id);
		procedureCall.getParameterRegistration("p_dest_id").bindValue(dest_fac);

		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CleanShipment> Get_Clean_Shipment(int dest_id) {
		// TODO Auto-generated method stub
		return (List<CleanShipment>)sessionFactory.getCurrentSession().createSQLQuery("   select\r\n" + 
				"        sh.id ,\r\n" + 
				"		pt.type,\r\n" + 
				"        fac.facility_name as warehouse_name ,\r\n" + 
				"        to_date(to_char(sh.shipment_actual_delivery_date,\r\n" + 
				"        'yyyy-mm-dd'),\r\n" + 
				"        'yyyy-mm-dd') as shipment_date ,\r\n" + 
				"        sh.last_status ,\r\n" + 
				"        (select\r\n" + 
				"            concat(\"USERS\".\"USER_NAME\",\r\n" + 
				"            ',',\r\n" + 
				"            \"USERS\".\"FULL_NAME_EN\")) as driver_name  \r\n" + 
				"    from\r\n" + 
				"        shippments sh ,\r\n" + 
				"        facilities fac ,\r\n" + 
				"		products_type pt,\r\n" + 
				"		\r\n" + 
				"        \"USERS\"  \r\n" + 
				"    where\r\n" + 
				"	pt.id= (select pr.type from products pr , shipments_details sd where pr.product_sku=sd.product_id and sd.shipment_id=sh.id limit 1) \r\n" + 
				"   and      fac.id=CAST(coalesce(sh.shippment_souce_id, '0') AS integer) \r\n" + 
				"        AND sh.shippment_destination_id='"+dest_id+"'  \r\n" + 
				"        AND sh.shipment_type_id=9 \r\n" + 
				"        and sh.last_status in (\r\n" + 
				"            '1','5'\r\n" + 
				"        ) \r\n" + 
				"        AND DATE_TRUNC('month',sh.shipment_actual_delivery_date) > CURRENT_DATE - interval '2 month'  \r\n" + 
				"        AND \"USERS\".\"USER_NAME\"=sh.courrier_id \r\n" + 
				"    order by\r\n" + 
				"        sh.shipment_expected_delivery_date desc").setResultTransformer(Transformers.aliasToBean(CleanShipment.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CleanProduct> Get_Shipment_Details(int shipment_id) {
		// TODO Auto-generated method stub
		return (List<CleanProduct>)sessionFactory.getCurrentSession().createSQLQuery("SELECT CAST(details.quantity_shipped AS int)AS quantity_shipped,details.actual_reconcilied_quantity AS reconciled_money_amount ,CAST(details.sealed AS varchar) AS sealed , CAST(details.id AS varchar), details.product_sku ,( select concat(details.product_name ,',' ,details.treatment_name) )AS product_name,  CAST(details.approved AS varchar)\r\n" + 
				"					FROM shipment_details_with_products_and_treatments details \r\n" + 
				"					where details.shipment_id ="+shipment_id+" \r\n" + 
				"				    ORDER BY details.product_name ").setResultTransformer(Transformers.aliasToBean(CleanProduct.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public CleanShipment Get_Shipment_By_Id(int shipment_id) {
		// TODO Auto-generated method stub
		List<CleanShipment> x_lst=(List<CleanShipment>)sessionFactory.getCurrentSession().createSQLQuery(" select\r\n" + 
				"        fc.facility_name as warehouse_name,\r\n" + 
				"		pt.type,\r\n" + 
				"        sh.courrier_id as driver_id ,\r\n" + 
				"        us.\"FULL_NAME_EN\" as driver_name ,\r\n" + 
				"        to_date(to_char(sh.shipment_expected_delivery_date,\r\n" + 
				"        'yyyy-mm-dd'),\r\n" + 
				"        'yyyy-mm-dd') as shipment_date,\r\n" + 
				"        sh.last_status ,\r\n" + 
				"        sh.id   \r\n" + 
				"    from\r\n" + 
				"        shippments sh,\r\n" + 
				"		products_type pt,\r\n" + 
				"        facilities fc ,\r\n" + 
				"        \"USERS\" us  \r\n" + 
				"    where\r\n" + 
				"        fc.id=CAST(coalesce(sh.shippment_souce_id,'0') as integer)  \r\n" + 
				"        and us.\"USER_NAME\" =sh.courrier_id      \r\n" + 
				"        and  sh.id="+shipment_id+"\r\n" + 
				"		and pt.id=(select pr.type from products pr ,shipments_details sd where pr.product_sku=sd.product_id and sd.shipment_id="+shipment_id+" limit 1)").setResultTransformer(Transformers.aliasToBean(CleanShipment.class)).list();
		return x_lst.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Products> Get_Clean_Products(int facility_id) {
		// TODO Auto-generated method stub
		return (List<Products>)sessionFactory.getCurrentSession().createSQLQuery("select pr.product_sku,pr.treatment_id ,pr.dms_product_id,pr.product_name, tt.\"TRE_NAME\" as treatment_name , fi.total_stock_quantity from facility_product_info fi , products pr,\"TREATMENT_TYPES\" tt where fi.product_id =pr.product_sku and tt.\"TRE_ID\"=pr.treatment_id and  fi.facility_id="+facility_id+"and fi.total_stock_quantity>0  and pr.type=1 and product_category=1 order by product_name\r\n").setResultTransformer(Transformers.aliasToBean(Products.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Receive_Clean_Shipment(int shipment_id, String Approved_Sealed, String Approved_Not_Sealed,
			String Lost, String logged_user, String prod_data, int fac_id) {
		// TODO Auto-generated method stub
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("approve_receiving_clean_shippment");
		procedureCall.registerParameter("p_shipment_id", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_approved_sealed", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_approved_notsealed", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_lost", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_user", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_products", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_facility_id", Integer.class, ParameterMode.IN);

		procedureCall.getParameterRegistration("p_shipment_id").bindValue(shipment_id);
		procedureCall.getParameterRegistration("p_approved_sealed").bindValue(Approved_Sealed);
		procedureCall.getParameterRegistration("p_approved_notsealed").bindValue(Approved_Not_Sealed);
		procedureCall.getParameterRegistration("p_lost").bindValue(Lost);
		procedureCall.getParameterRegistration("p_logged_user").bindValue(logged_user);
		procedureCall.getParameterRegistration("p_products").bindValue(prod_data);
		procedureCall.getParameterRegistration("p_facility_id").bindValue(fac_id);

		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShipmentLog> shipment_logs(int shipment_id) {
		// TODO Auto-generated method stub
		return (List<ShipmentLog>)sessionFactory.getCurrentSession().createQuery("from ShipmentLog where shipment_id="+shipment_id+"order by log_id asc").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Products> Get_Products_By_Type(int type, int fac) {
		// TODO Auto-generated method stub
		return (List<Products>)sessionFactory.getCurrentSession().createSQLQuery("select pr.product_sku,pr.treatment_id ,pr.dms_product_id,pr.product_name, tt.\"TRE_NAME\" as treatment_name , fi.total_stock_quantity from facility_product_info fi , products pr,\"TREATMENT_TYPES\" tt where fi.product_id =pr.product_sku and tt.\"TRE_ID\"=pr.treatment_id and  fi.facility_id="+fac+"  and fi.total_stock_quantity>0  and pr.type="+type+" and pr.product_category not in (3,4) order by product_name").setResultTransformer(Transformers.aliasToBean(Products.class)).list();
	}

	@Override
	public int Get_destination_of_shipment(int shipment_id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
