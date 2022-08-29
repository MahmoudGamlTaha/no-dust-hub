package com.jwt.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.ParameterMode;

import org.hibernate.SessionFactory;
import org.hibernate.procedure.ProcedureCall;
import org.hibernate.procedure.ProcedureOutputs;
import org.hibernate.result.ResultSetOutput;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.AccountBalance;
import com.jwt.model.ActualCounts;
import com.jwt.model.DailyInventoryCheck;
import com.jwt.model.DailyInventoryCheckDetails;
import com.jwt.model.DailyShipments;
import com.jwt.model.DashBoardData;
import com.jwt.model.DirtyShipmentData;
import com.jwt.model.ExpectedProductsIN;
import com.jwt.model.ExpectedProductsOut;
import com.jwt.model.ExpectedQuantityOfProducts;
import com.jwt.model.Facility;
import com.jwt.model.InventoryProduct;
import com.jwt.model.NewProduct;
import com.jwt.model.ProductComponentDetails;
import com.jwt.model.ProductRawMaterial;
import com.jwt.model.ProductTransaction;
import com.jwt.model.Products;
import com.jwt.model.ProductsType;
import com.jwt.model.Treatment;
import com.mysql.jdbc.Connection;

import javassist.convert.Transformer;


@Repository
public class StockManagmentDAOImpl implements StockManagmentDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<InventoryProduct> getAllProducts(int facility_id) {
		List<InventoryProduct>products=sessionFactory.getCurrentSession().createSQLQuery("SELECT facilty_info.facility_id,CAST( facilty_info.total_stock_quantity AS varchar)AS quantity, products_.product_name ,trt.\"TRE_NAME\" AS treatment ,facilty_info.product_id \r\n" + 
				"	FROM facility_product_info facilty_info , facilities facility  ,products products_ , \"TREATMENT_TYPES\" trt \r\n" + 
				"	where facilty_info.facility_id = facility.id AND trt.\"TRE_ID\" = products_.treatment_id AND facilty_info.product_id = products_.product_sku\r\n" + 
				"	AND facilty_info.facility_id = "+facility_id+"AND products_.product_category =1 And products_.type =1 AND facilty_info.total_stock_quantity >0 ORDER BY products_.product_name").setResultTransformer(Transformers.aliasToBean(InventoryProduct.class)).list();
				return products;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String submitConvetProducts(int facility_id, String products, String username) {

		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("submit_convert_product");
		procedureCall.registerParameter("p_facility_id", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_products_data", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_user", String.class, ParameterMode.IN);

		procedureCall.getParameterRegistration("p_facility_id").bindValue(facility_id);
		procedureCall.getParameterRegistration("p_products_data").bindValue(products);
		procedureCall.getParameterRegistration("p_logged_user").bindValue(username);

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
	public List<DirtyShipmentData> getConvertRequests(int facility_id) {
		List<DirtyShipmentData>shipments=sessionFactory.getCurrentSession().createSQLQuery(" select\r\n" + 
				"        orders.id AS shipment_id ,\r\n" + 
				"        orders.order_time AS shipment_date ,\r\n" + 
				"        sc_users.display_name as logged_user,\r\n" + 
				"        orders_status.status_name AS last_status   \r\n" + 
				"    from\r\n" + 
				"        orders  ,\r\n" + 
				"        orders_status   ,\r\n" + 
				"		sc_users\r\n" + 
				"    where\r\n" + 
				"        orders_status.status_id=orders.order_status_id \r\n" + 
				"		and sc_users.user_name=orders.logged_user\r\n" + 
				"        and orders.order_status_id in (\r\n" + 
				"            2,3,4\r\n" + 
				"        ) \r\n" + 
				"        and orders.order_type='2' \r\n" + 
				"        and orders.order_source_id="+facility_id+" \r\n" + 
				"    order by\r\n" + 
				"        orders.id desc  ").setResultTransformer(Transformers.aliasToBean(DirtyShipmentData.class)).list();
				return shipments;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InventoryProduct> getConvertReqProducts(int convert_id) {
		List<InventoryProduct>products=sessionFactory.getCurrentSession().createSQLQuery("select  pro.product_name , treatment.\"TRE_NAME\" as treatment , CAST(details.quantity_requested AS VARCHAR)as quantity,details.comment \r\n" + 
				"from orders_details details , products pro , \"TREATMENT_TYPES\" treatment\r\n" + 
				"where details.product_id = pro.product_sku  and treatment.\"TRE_ID\" = pro.treatment_id\r\n" + 
				"and details.order_id= "+convert_id+"order by pro.product_name").setResultTransformer(Transformers.aliasToBean(InventoryProduct.class)).list();
				return products;
	}

	@SuppressWarnings("unchecked")
	@Override
	public DirtyShipmentData getConvertReqWith(int id) {
		List<DirtyShipmentData>shipments=sessionFactory.getCurrentSession().createSQLQuery("select ship.id AS shipment_id , ship.order_time AS shipment_date, ship.logged_user , os.status_name AS last_status , ship.approved_by AS approved_by , ship.approval_time AS approval_time \r\n" + 
				"from orders ship , orders_status os \r\n" + 
				"where order_type='2' and os.status_id=ship.order_status_id and ship.id="+id).setResultTransformer(Transformers.aliasToBean(DirtyShipmentData.class)).list();
				if(shipments.size()>0)
		          return shipments.get(0);
				else 
					return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String approveRejectConvertRequest(long shipment_id, int facility_id, String logged_user,
			String approval_val) {
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("approve_convert_product");
		procedureCall.registerParameter("p_shipment_id", Long.class, ParameterMode.IN);
		procedureCall.registerParameter("p_facility_id", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_user", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_approval_val", String.class, ParameterMode.IN);

		procedureCall.getParameterRegistration("p_shipment_id").bindValue(shipment_id);
		procedureCall.getParameterRegistration("p_facility_id").bindValue(facility_id);
		procedureCall.getParameterRegistration("p_logged_user").bindValue(logged_user);
		procedureCall.getParameterRegistration("p_approval_val").bindValue(approval_val);

		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Products> get_product_list(int type,int fac_id) {
		// TODO Auto-generated method stub
		return (List<Products>)sessionFactory.getCurrentSession().createSQLQuery(" select pr.product_sku,pr.treatment_id ,pr.dms_product_id,pr.product_name, tt.\"TRE_NAME\" as treatment_name , fi.total_stock_quantity from facility_product_info fi , products pr,\"TREATMENT_TYPES\" tt where pr.product_sku=fi.product_id and tt.\"TRE_ID\"=pr.treatment_id and  fi.facility_id="+fac_id+"and fi.total_stock_quantity>0  and pr.type="+type+" and product_category=1 order by product_name").setResultTransformer(Transformers.aliasToBean(Products.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Submit_Conversion(int fac_id, String logged_user, String from_type, String to_type,
			String prod_data) {
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("submit_product_conversion");
		procedureCall.registerParameter("p_facility_id", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_user", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_from_type", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_to_type", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_products", String.class, ParameterMode.IN);

		procedureCall.getParameterRegistration("p_facility_id").bindValue(fac_id);
		procedureCall.getParameterRegistration("p_logged_user").bindValue(logged_user);
		procedureCall.getParameterRegistration("p_from_type").bindValue(from_type);
		procedureCall.getParameterRegistration("p_to_type").bindValue(to_type);
		procedureCall.getParameterRegistration("p_products").bindValue(prod_data);
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
		// TODO Auto-generated method stub
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Treatment> Get_treatment_List() {
		// TODO Auto-generated method stub
		return (List<Treatment>)sessionFactory.getCurrentSession().createSQLQuery("select \"TRE_ID\" as treatment_id , \"TRE_NAME\" as treatment_name from \"TREATMENT_TYPES\" order by treatment_name").setResultTransformer(Transformers.aliasToBean(Treatment.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<NewProduct> Get_New_Product_List() {
		// TODO Auto-generated method stub
		return (List<NewProduct>)sessionFactory.getCurrentSession().createSQLQuery("   select\r\n" + 
				"        pr.product_name ,\r\n" + 
				"        pr.product_sku  \r\n" + 
				"    from\r\n" + 
				"        products pr \r\n" + 
				"    where\r\n" + 
				"        pr.product_sku in (\r\n" + 
				"            select\r\n" + 
				"                distinct(pc.product_sku) from product_component pc \r\n" + 
				"        ) order by pr.product_name").setResultTransformer(Transformers.aliasToBean(NewProduct.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Submit_Create_New_Product(String products, String logged_user, int facility) {
		// TODO Auto-generated method stub
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("submit_create_new_product");

		procedureCall.registerParameter("p_facility_id", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_products", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_user", String.class, ParameterMode.IN);

		procedureCall.getParameterRegistration("p_facility_id").bindValue(facility);
		procedureCall.getParameterRegistration("p_products").bindValue(products);
		procedureCall.getParameterRegistration("p_logged_user").bindValue(logged_user);
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductComponentDetails> Get_Component_Details(String product_sku, int fac) {
		// TODO Auto-generated method stub
		return (List<ProductComponentDetails>)sessionFactory.getCurrentSession().createSQLQuery("select pr.product_name , CAST(fc.total_stock_quantity AS numeric),CAST(pc.quantity AS numeric)\r\n" + 
				"from products pr, facility_product_info fc, product_component pc\r\n" + 
				"where pr.product_sku=pc.component_sku and fc.facility_id= "+fac+" and fc.product_id=pc.component_sku and pc.product_sku='"+product_sku+"' order by pr.product_name").setResultTransformer(Transformers.aliasToBean(ProductComponentDetails.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductRawMaterial> Get_Raw_Materials(int order_id) {
		// TODO Auto-generated method stub
		return (List<ProductRawMaterial>)sessionFactory.getCurrentSession().createSQLQuery("select products.product_name , CAST(products.quantity as numeric), mu.unit\r\n" + 
				"from\r\n" + 
				"(select pr.product_name , CAST(sum(op.product_quantity) AS numeric)as quantity , pr.first_measurment_unit\r\n" + 
				"from products pr , operations op\r\n" + 
				"where op.transaction_id="+order_id+" and transaction_type_id='3' and transaction_movement_type='-1' and pr.product_sku=op.product_id\r\n" + 
				"group by pr.product_name , pr.first_measurment_unit\r\n" + 
				"order by pr.product_name) products\r\n" + 
				"LEFT JOIN measurment_unit mu ON CAST(mu.id AS TEXT)=CAST(products.first_measurment_unit AS text)").setResultTransformer(Transformers.aliasToBean(ProductRawMaterial.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductsType> lst_shipment_type() {
		// TODO Auto-generated method stub
		return (List<ProductsType>)sessionFactory.getCurrentSession().createSQLQuery("select pt.id as type_id , pt.type as type_name from products_type pt where transition_flag = 1 order by pt.type").setResultTransformer(Transformers.aliasToBean(ProductsType.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public int Get_Dispatch_Count(int facility) {
		// TODO Auto-generated method stub
		List<DashBoardData>lst=(List<DashBoardData>)sessionFactory.getCurrentSession().createSQLQuery("select CAST(count(id) AS integer)AS dispatch_count from shippments where shipment_type_id=1 and  to_date(to_char(shipment_actual_delivery_date,'yyyy-mm-dd'),'yyyy-mm-dd') >current_date -1 and shippment_souce_id='"+facility+"'").setResultTransformer(Transformers.aliasToBean(DashBoardData.class)).list();
	return lst.get(0).getDispatch_count();
		//return Integer.parseInt(String.valueOf(lst.get(0)));
	}

	@SuppressWarnings("unchecked")
	@Override
	public int Get_Reconciliation_Count(int facility) {
		// TODO Auto-generated method stub
		
	
		List<DashBoardData>lst=(List<DashBoardData>)sessionFactory.getCurrentSession().createSQLQuery("select CAST(count(id) AS integer) As reconciliation_count from shippments where shipment_type_id=2 and  to_date(to_char(shipment_actual_delivery_date,'yyyy-mm-dd'),'yyyy-mm-dd') >current_date -1 and shippment_destination_id='"+facility+"'").setResultTransformer(Transformers.aliasToBean(DashBoardData.class)).list();
		return lst.get(0).getReconciliation_count();
	}

	@SuppressWarnings("unchecked")
	@Override
	public DashBoardData Get_data(int facility) {
		// TODO Auto-generated method stub
		List<DashBoardData>lst_data=(List<DashBoardData>)sessionFactory.getCurrentSession().createSQLQuery("select CAST(count(sh1.id) AS integer) as dispatch_count,CAST(count(sh2.id) AS integer) as reconciliation_count , sum(expected.expected_money) as expected_money\r\n" + 
				"		from shippments sh1 , shippments sh2 , expected_drivers_money_to_reconciliate expected \r\n" + 
				"		where sh1.shipment_type_id=1 and to_date(to_char(sh1.shipment_actual_delivery_date,'yyyy-mm-dd'),'yyyy-mm-dd') >current_date -1 and sh1.shippment_souce_id='"+facility+"'\r\n" + 
				"		and sh2.shipment_type_id=1 and to_date(to_char(sh2.shipment_actual_delivery_date,'yyyy-mm-dd'),'yyyy-mm-dd') >current_date -1 and sh1.shippment_destination_id='"+facility+"'").setResultTransformer(Transformers.aliasToBean(DashBoardData.class)).list();
		if(lst_data!=null)
		{
		return lst_data.get(0);
		}
		else
		{
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public double Get_Expected_Cash() {
		// TODO Auto-generated method stub
		List<DashBoardData>lst=(List<DashBoardData>)sessionFactory.getCurrentSession().createSQLQuery("select CAST(sum(expected_money) AS TEXT) as expected_money from  expected_drivers_money_to_reconciliate ").setResultTransformer(Transformers.aliasToBean(DashBoardData.class)).list();
		
		return lst.get(0).getExpected_money();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InventoryProduct> Get_Clean_Dirty_Products(int facility) {
		// TODO Auto-generated method stub
		return (List<InventoryProduct>)sessionFactory.getCurrentSession().createSQLQuery("select pr.product_name , pt.type , CAST(fc.total_stock_quantity  AS TEXT)as system_quantity \r\n" + 
				"from products pr , products_type pt , facility_product_info fc \r\n" + 
				"where fc.facility_id="+facility+" and pr.product_sku=fc.product_id and pt.id=pr.type and pr.type in (1,2) and product_category=1 order by product_name").setResultTransformer(Transformers.aliasToBean(InventoryProduct.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ExpectedProductsOut> Get_Expected_Out(int facility) {
		// TODO Auto-generated method stub
		return (List<ExpectedProductsOut>)sessionFactory.getCurrentSession().createSQLQuery("select dms_cover_products.product_id, CAST(treatment_id AS integer), product_name , treatment_name , CAST(sum(quantity) AS integer) as quantity , CAST(fc.total_stock_quantity AS Text) as available_quantity \r\n" + 
				"from dms_cover_products \r\n" + 
				"LEFT JOIN facility_product_info fc \r\n" + 
				"ON fc.facility_id="+facility+" and fc.product_id=(CASE WHEN treatment_name!=' ' THEN  (select concat(dms_cover_products.product_id,treatment_name)) ELSE   dms_cover_products.product_id END)\r\n" + 
				"group by dms_cover_products.product_id, treatment_id,product_name , treatment_name,fc.total_stock_quantity\r\n" + 
				"order by product_name , treatment_name").setResultTransformer(Transformers.aliasToBean(ExpectedProductsOut.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DailyShipments> Get_Daily_Shipments_Data(int facility_id) {
		// TODO Auto-generated method stub
		return (List<DailyShipments>)sessionFactory.getCurrentSession().createSQLQuery("select CAST(count(sh.id) AS integer)as total_num, CAST(sht.shipment_type_id AS integer),sht.shipment_type from shippments sh , shipments_types sht\r\n" + 
				"where to_date(to_char(sh.shipment_expected_delivery_date,'yyyy-mm-dd'),'yyyy-mm-dd') > current_date -1\r\n" + 
				"and sht.shipment_type_id=sh.shipment_type_id\r\n" + 
				"and (sh.shippment_destination_id='"+facility_id+"' or sh.shippment_souce_id='"+facility_id+"')\r\n" + 
				"group by sht.shipment_type , sht.shipment_type_id").setResultTransformer(Transformers.aliasToBean(DailyShipments.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ExpectedProductsIN> Get_Expcted_IN(int facility_id) {
		// TODO Auto-generated method stub
		return (List<ExpectedProductsIN>)sessionFactory.getCurrentSession().createSQLQuery("select rp.product_name,rp.treatment_name ,rp.product_sku , pt.type,CAST(rp.product_type AS integer) ,sum(rp.dms_quantity) AS expected ,fc.total_stock_quantity \r\n" + 
				"from reconciliation_products rp \r\n" + 
				"LEFT JOIN facility_product_info fc ON facility_id="+facility_id+" and  fc.product_id=rp.product_sku \r\n" + 
				"LEFT JOIN products_type pt ON pt.id=rp.product_type\r\n" + 
				"group by product_name, product_sku,product_type , treatment_name ,  fc.total_stock_quantity ,pt.type\r\n" + 
				"order by  product_name,treatment_name \r\n" + 
				"").setResultTransformer(Transformers.aliasToBean(ExpectedProductsIN.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ExpectedQuantityOfProducts> Get_Total_Expected_Dirty(int facility_id) {
		// TODO Auto-generated method stub
		return (List<ExpectedQuantityOfProducts>)sessionFactory.getCurrentSession().createSQLQuery("select rp1.product_name , rp1.dms_product_id , fac_info.available_quantity as available_quantity  \r\n" + 
				"				from reconciliation_products rp1 \r\n" + 
				"				LEFT JOIN \r\n" + 
				"				(\r\n" + 
				"					select sum(fc.total_stock_quantity) as available_quantity , pr.dms_product_id\r\n" + 
				"				from facility_product_info fc , products pr where \r\n" + 
				"				pr.product_sku = fc.product_id and fc.facility_id= "+facility_id+" and pr.dms_product_id in (select distinct(dms_product_id) from reconciliation_products ) \r\n" + 
				"				group by pr.dms_product_id  \r\n" + 
				"				) fac_info ON fac_info.dms_product_id = rp1.dms_product_id\r\n" + 
				"				where rp1.product_type=1\r\n" + 
				"				 group by rp1.dms_product_id ,  fac_info.available_quantity , rp1.product_name order by rp1.product_name").setResultTransformer(Transformers.aliasToBean(ExpectedQuantityOfProducts.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Treatment> lst_treatment_for_dispatch() {
		// TODO Auto-generated method stub
		return (List<Treatment>)sessionFactory.getCurrentSession().createSQLQuery("select \"TRE_ID\" as treatment_id , \"TRE_NAME\" as treatment_name  from \"TREATMENT_TYPES\" where \"TRE_ID\" in (select distinct(treatment_id) from dms_cover_products)\r\n" + 
				"").setResultTransformer(Transformers.aliasToBean(Treatment.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ExpectedQuantityOfProducts> Get_Clean_Products(int facility_id) {
		// TODO Auto-generated method stub
		return (List<ExpectedQuantityOfProducts>)sessionFactory.getCurrentSession().createSQLQuery("select rp1.product_name , rp1.product_id , fac_info.available_quantity as available_quantity  \r\n" + 
				"				from dms_cover_products rp1 \r\n" + 
				"				LEFT JOIN \r\n" + 
				"				(\r\n" + 
				"					select sum(fc.total_stock_quantity) as available_quantity , pr.dms_product_id\r\n" + 
				"				from facility_product_info fc , products pr where \r\n" + 
				"				pr.product_sku = fc.product_id and fc.facility_id= "+facility_id+" and pr.dms_product_id in (select product_id from dms_cover_products ) \r\n" + 
				"				group by pr.dms_product_id  \r\n" + 
				"				) fac_info ON fac_info.dms_product_id = rp1.product_id\r\n" + 
				"				 group by rp1.product_id ,  fac_info.available_quantity , rp1.product_name order by rp1.product_name").setResultTransformer(Transformers.aliasToBean(ExpectedQuantityOfProducts.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ExpectedQuantityOfProducts> Get_Clean_Products_treatments(int facility_id) {
		// TODO Auto-generated method stub
		return (List<ExpectedQuantityOfProducts>)sessionFactory.getCurrentSession().createSQLQuery("select dcp.product_id , dcp.treatment_id,sum(dcp.quantity) as clean_quantity ,fc.total_stock_quantity as available_quantity\r\n" + 
				"				from dms_cover_products dcp, products pr, facility_product_info fc\r\n" + 
				"				where pr.dms_product_id=dcp.product_id and pr.treatment_id=dcp.treatment_id and pr.type=1\r\n" + 
				"				and fc.product_id=pr.product_sku  and fc.facility_id="+facility_id+"\r\n" + 
				"				group by dcp.product_id , dcp.treatment_id,fc.total_stock_quantity").setResultTransformer(Transformers.aliasToBean(ExpectedQuantityOfProducts.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Treatment> lst_treatment_for_reconciliation() {
		// TODO Auto-generated method stub
		return (List<Treatment>)sessionFactory.getCurrentSession().createSQLQuery("select \"TRE_ID\" as treatment_id , \"TRE_NAME\" as treatment_name from \"TREATMENT_TYPES\" where \"TRE_ID\" in (select distinct(treatment_id) from reconciliation_products) order by \\\"TRE_NAME\\\"").setResultTransformer(Transformers.aliasToBean(Treatment.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ExpectedQuantityOfProducts> Get_Reconciliation_Products(int facility_id) {
		// TODO Auto-generated method stub
		return (List<ExpectedQuantityOfProducts>)sessionFactory.getCurrentSession().createSQLQuery("select rp.dms_product_id ,(CASE WHEN product_type=2 THEN 0 ELSE rp.treatment_id END) , rp.product_type , sum(rp.dms_quantity) as clean_quantity ,fc.total_stock_quantity as available_quantity\r\n" + 
				"                from reconciliation_products	rp , products pr , facility_product_info fc\r\n" + 
				"				where pr.dms_product_id=rp.dms_product_id and pr.type=rp.product_type and pr.treatment_id=(CASE WHEN product_type=2 THEN 0 ELSE rp.treatment_id END)\r\n" + 
				"				and fc.product_id=pr.product_sku and fc.facility_id="+facility_id+"\r\n" + 
				"				group by rp.dms_product_id,rp.treatment_id,rp.product_type , fc.total_stock_quantity").setResultTransformer(Transformers.aliasToBean(ExpectedQuantityOfProducts.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Automatic_Inventory_Check(int facility_id) {
		// TODO Auto-generated method stub
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("create_daily_inventory_check");

		procedureCall.registerParameter("p_facility_id", Integer.class, ParameterMode.IN);
		
		procedureCall.getParameterRegistration("p_facility_id").bindValue(facility_id);
		
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DailyInventoryCheck> Get_Daily_Inventory_Check_List(int facility_id) {
		// TODO Auto-generated method stub
		return (List<DailyInventoryCheck>)sessionFactory.getCurrentSession().createQuery("from DailyInventoryCheck where facility_id="+facility_id).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DailyInventoryCheckDetails> Get_Inventory_Details_ById(int inventory_id) {
		// TODO Auto-generated method stub
		return (List<DailyInventoryCheckDetails>)sessionFactory.getCurrentSession().createSQLQuery("select pr.product_name,pt.type,pr.product_sku,pr.dms_product_id , \"TRE_NAME\" as treatment_name,(CASE \r\n" + 
				" WHEN pr.type=1 and pr.treatment_id=0 THEN dc.not_treated_quantity \r\n" + 
				" WHEN pr.type=1 and pr.treatment_id=1 THEN dc.p_quantity\r\n" + 
				" WHEN pr.type=1 and pr.treatment_id=2 THEN dc.s_quantity\r\n" + 
				" WHEN pr.type=1 and pr.treatment_id=3 THEN dc.hdf_quantity\r\n" + 
				" WHEN pr.type=1 and pr.treatment_id=4 THEN dc.ovt_quantity\r\n" + 
				" WHEN pr.type=1 and pr.treatment_id=5 THEN dc.pws_quantity\r\n" + 
				" WHEN pr.type=1 and pr.treatment_id=6 THEN dc.rws_quantity\r\n" + 
				" WHEN pr.type=1 and pr.treatment_id=7 THEN dc.sws_quantity\r\n" + 
				" WHEN pr.type=1 and pr.treatment_id=8 THEN dc.ovtws_quantity\r\n" + 
				" WHEN pr.type=1 and pr.treatment_id=9 THEN dc.hdfws_quantity\r\n" + 
				" WHEN pr.type=2 THEN dc.dirty_quantity\r\n" + 
				" WHEN pr.type=4 THEN dc.untreated_quantity\r\n" + 
				" WHEN pr.type=5 THEN dc.out_of_odrer_quantity\r\n" + 
				" WHEN pr.type=6 THEN dc.repaired_quantity\r\n" + 
				" WHEN pr.type=8 THEN dc.not_treated_quantity\r\n" + 
				" WHEN pr.type=9 THEN dc.not_treated_quantity\r\n" + 
				" WHEN pr.type=10 THEN dc.scrap_quantity\r\n" + 
				" WHEN pr.type=11 THEN dc.undyed_quantity\r\n" + 
				" WHEN pr.type=12 THEN dc.need_refresh_quantity\r\n" + 
				" END)as total_quantity\r\n" + 
				"from products pr , daily_inventory_check_details dc , products_type pt , \"TREATMENT_TYPES\"\r\n" + 
				"where (pr.product_sku=dc.product_id or pr.dms_product_id=dc.product_id) and dc.inventory_check_id="+inventory_id+" and pt.id=pr.type \r\n" + 
				"and \"TREATMENT_TYPES\".\"TRE_ID\"=pr.treatment_id\r\n" + 
				"order by  pr.product_name ,pr.type ,\"TRE_NAME\" ").setResultTransformer(Transformers.aliasToBean(DailyInventoryCheckDetails.class)).list();
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public DailyInventoryCheck GetDailyInventoryCheckById(int id) {
		// TODO Auto-generated method stub
		List<DailyInventoryCheck>lst=(List<DailyInventoryCheck>)sessionFactory.getCurrentSession().createQuery("from DailyInventoryCheck where inventory_check_id="+id).list();
		if(lst.size()>0)
		{
		return lst.get(0);
		}
		else
		{
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductsType> getsimpleconversionfromtype(int facility) {
		// TODO Auto-generated method stub
		return (List<ProductsType>)sessionFactory.getCurrentSession().createSQLQuery("select pt.id as type_id , pt.type as type_name\r\n" + 
				"from products_type pt   where pt.id in (select distinct(from_type) from simple_conversion_configuration where active=1 and facility_id="+facility+") order by type_name").setResultTransformer(Transformers.aliasToBean(ProductsType.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductsType> getsimpleconversiontotype(int facility, int from_type) {
		// TODO Auto-generated method stub
		return (List<ProductsType>)sessionFactory.getCurrentSession().createSQLQuery("select pt.id as type_id , pt.type as type_name \r\n" + 
				"from products_type pt where pt.id in (select distinct(to_type) from simple_conversion_configuration where active=1 and facility_id="+facility+" and from_type="+from_type+") order by type_name").setResultTransformer(Transformers.aliasToBean(ProductsType.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InventoryProduct> get_component_list(int facility_id) {
		// TODO Auto-generated method stub
		return (List<InventoryProduct>)sessionFactory.getCurrentSession().createSQLQuery("select (concat(pr.product_name,',',pt.type)) product_name,pr.product_sku product_id  ,CAST(fac.total_stock_quantity AS TEXT) quantity \r\n" + 
				"			   \r\n" + 
				"			   from products pr , products_type pt , facility_product_info fac\r\n" + 
				"			   where fac.product_id=pr.product_sku and fac.facility_id="+facility_id+" \r\n" + 
				"			   and pt.id=pr.type\r\n" + 
				"			   and pr.product_sku in (select distinct(component_sku) from product_component)\r\n" + 
				"			   order by product_name").setResultTransformer(Transformers.aliasToBean(InventoryProduct.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String SubmitProductDeduction(int facility_id, String user_name, String Products) {
		// TODO Auto-generated method stub
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("submit_product_deduction");
		procedureCall.registerParameter("p_facility_id", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_user_name", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_products", String.class, ParameterMode.IN);

		procedureCall.getParameterRegistration("p_facility_id").bindValue(facility_id);
		procedureCall.getParameterRegistration("p_user_name").bindValue(user_name);
		procedureCall.getParameterRegistration("p_products").bindValue(Products);
		
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Facility> get_facility_list() {
		// TODO Auto-generated method stub
		return (List<Facility>)sessionFactory.getCurrentSession().createQuery("from Facility order by facility_name").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Products> getProductList() {
		// TODO Auto-generated method stub
		return (List<Products>)sessionFactory.getCurrentSession().createSQLQuery("select product_name , dms_product_id as product_id from products where dms_product_id in (select distinct(dms_product_id) from products where product_category=1)\r\n" + 
				"and type=4 \r\n" + 
				"union \r\n" + 
				"select product_name , product_sku as product_id from products where product_sku in (select distinct(product_sku) from products  where product_category in (2,6,7))\r\n" + 
				"order by product_name").setResultTransformer(Transformers.aliasToBean(Products.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductTransaction> gettransactiondata(int facility_id, String dms_product_id, String date_from,
			String date_to) {
		// TODO Auto-generated method stub
		return (List<ProductTransaction>)sessionFactory.getCurrentSession().createSQLQuery(" select product_name,dms_product_id,date,sum(positive) as added ,sum(negative) as deducted\r\n" + 
				" from (\r\n" + 
				"select pr.product_name,pot.dms_product_id,CAST(pot.date AS TEXT),pot.transaction_movement_type,CASE when pot.transaction_movement_type='Negative' then  sum(pot.quantity) END as Negative \r\n" + 
				",CASE when pot.transaction_movement_type='Positive' then sum(pot.quantity) END as  positive \r\n" + 
				"from products pr , product_operation_transaction pot\r\n" + 
				"where ((pr.product_sku=pot.dms_product_id and pot.product_category in (6,7,2))\r\n" + 
				"or\r\n" + 
				"(pr.dms_product_id=pot.dms_product_id and pot.product_category not in (6,7,2) and pr.type=4))\r\n" + 
				" and pot.facility_id="+facility_id+" and pot.date>='"+date_from+"' and pot.date<='"+date_to+"' and pot.dms_product_id='"+dms_product_id+"'\r\n" + 
				" group by pr.product_name , pot.transaction_movement_type, pot.date , pot.dms_product_id) x\r\n" + 
				"																	   group by date, product_name , dms_product_id").setResultTransformer(Transformers.aliasToBean(ProductTransaction.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductTransaction> getProductsWithTypes(int facility_id, String dms_product_id, String date_from,
			String date_to) {
		// TODO Auto-generated method stub
		return (List<ProductTransaction>)sessionFactory.getCurrentSession().createSQLQuery("select x.product_name,x.type,trt.\"TRE_NAME\" as treatment,x.product_id,date,sum(positive) as added ,sum(negative) as deducted\r\n" + 
				"				 from (\r\n" + 
				"				select pr.product_name,pot.type,pot.product_id,CAST(pot.date AS TEXT),pot.transaction_movement_type,CASE when pot.transaction_movement_type='Negative' then  sum(pot.quantity) END as Negative  \r\n" + 
				"				,CASE when pot.transaction_movement_type='Positive' then sum(pot.quantity) END as  positive \r\n" + 
				"				from products pr , product_operation_transaction pot\r\n" + 
				"				where ((pr.product_sku=pot.dms_product_id and pot.product_category in (6,7,2)) \r\n" + 
				"			or\r\n" + 
				"				(pr.dms_product_id=pot.dms_product_id and pot.product_category not in (6,7,2) and pr.type=4)) \r\n" + 
				"				and pot.facility_id="+facility_id+" and pot.date>='"+date_from+"' and pot.date<='"+date_to+"' and pot.dms_product_id='"+dms_product_id+"' \r\n" + 
				"				 group by pr.product_name , pot.transaction_movement_type, pot.date , pot.type,pot.product_id) x , products pr , \"TREATMENT_TYPES\" trt\r\n" + 
				"																					   where pr.product_sku = x.product_id and trt.\"TRE_ID\"=pr.treatment_id\r\n" + 
				"																					   group by date, x.product_name ,x.type, x.product_id , treatment\r\n" + 
				"																					   order by date, x.product_name ,x.type,treatment").setResultTransformer(Transformers.aliasToBean(ProductTransaction.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductTransaction> getDataWithDate(int facility_id, String dms_product_id, String date_transaction) {
		// TODO Auto-generated method stub
		List<ProductTransaction> lst_products=new ArrayList<ProductTransaction>();
		lst_products=sessionFactory.getCurrentSession().createSQLQuery("select to_char(x.transaction_date,\r\n" + 
				"        'DD-MM-YYYY hh:mi:ss') as date , x.transaction_id as transaction_id,x.transaction_type_id, x.product_name , x.dms_product_id , x.transaction_type as transaction_type , sum(x.added) added, sum(x.deducted )deducted\r\n" + 
				"from ((select sh.shipment_expected_delivery_date transaction_date , op.transaction_id , case when op.transaction_movement_type='1' then  sum(op.product_quantity) end as added , case when op.transaction_movement_type='-1' then sum(op.product_quantity) end as deducted,pr2.product_name ,pr.dms_product_id ,op.transaction_type_id, sht.shipment_type as transaction_type , op.transaction_movement_type\r\n" + 
				"\r\n" + 
				"from shippments sh , operations op , products pr, products pr2 , shipments_types sht\r\n" + 
				"where op.facility_id="+facility_id+" and op.transaction_id=sh.id and sht.shipment_type_id=sh.shipment_type_id and to_date(to_char(sh.shipment_expected_delivery_date,'yyyy-mm-dd'),'yyyy-mm-dd')='"+date_transaction+"' and op.transaction_type_id='1'\r\n" + 
				"and pr.product_sku= op.product_id and pr.dms_product_id='"+dms_product_id+"' and pr2.dms_product_id=pr.dms_product_id and pr2.type=4\r\n" + 
				"group by sh.shipment_expected_delivery_date , op.transaction_id , pr.dms_product_id , op.transaction_movement_type , pr2.product_name ,op.transaction_type_id ,  transaction_type)\r\n" + 
				"union \r\n" + 
				"(select order_.order_time transaction_date , op.transaction_id ,   case when op.transaction_movement_type='1' then sum(op.product_quantity) end as added , case when op.transaction_movement_type='-1' then sum(op.product_quantity) end as deducted,pr2.product_name ,pr.dms_product_id , op.transaction_type_id ,ot.order_type as transaction_type  , op.transaction_movement_type\r\n" + 
				"\r\n" + 
				"from orders order_ , operations op , products pr, products pr2 , orders_types ot\r\n" + 
				"where op.facility_id="+facility_id+" and  op.transaction_id=order_.id and cast(ot.id as text)=order_.order_type and to_date(to_char(order_.order_time,'yyyy-mm-dd'),'yyyy-mm-dd')='"+date_transaction+"' and op.transaction_type_id in ('3','5')\r\n" + 
				"and pr.product_sku= op.product_id and pr.dms_product_id='"+dms_product_id+"' and pr2.dms_product_id=pr.dms_product_id and pr2.type=4\r\n" + 
				"group by order_.order_time , op.transaction_id , pr.dms_product_id , op.transaction_movement_type , pr2.product_name,op.transaction_type_id ,  transaction_type)\r\n" + 
				")x\r\n" + 
				"group by x.transaction_date , x.transaction_id , x.product_name , x.dms_product_id , x.transaction_type , x.transaction_type_id ").setResultTransformer(Transformers.aliasToBean(ProductTransaction.class)).list();
	if(lst_products.size()==0)
	{
		lst_products=sessionFactory.getCurrentSession().createSQLQuery("select to_char(x.transaction_date,\r\n" + 
				"        'DD-MM-YYYY hh:mi:ss') as date , x.transaction_id as transaction_id,x.transaction_type_id, x.product_name , x.dms_product_id , x.transaction_type as transaction_type , sum(x.added) added, sum(x.deducted )deducted\r\n" + 
				"from ((select sh.shipment_expected_delivery_date transaction_date , op.transaction_id , case when op.transaction_movement_type='1' then  sum(op.product_quantity) end as added , case when op.transaction_movement_type='-1' then sum(op.product_quantity) end as deducted,pr2.product_name ,pr.dms_product_id ,op.transaction_type_id, sht.shipment_type as transaction_type , op.transaction_movement_type\r\n" + 
				"\r\n" + 
				"from shippments sh , operations op , products pr, products pr2 , shipments_types sht\r\n" + 
				"where op.facility_id="+facility_id+" and op.transaction_id=sh.id and sht.shipment_type_id=sh.shipment_type_id and to_date(to_char(sh.shipment_expected_delivery_date,'yyyy-mm-dd'),'yyyy-mm-dd')='"+date_transaction+"' and op.transaction_type_id='1'\r\n" + 
				"and pr.product_sku= op.product_id and pr.product_sku='"+dms_product_id+"' and pr2.product_sku=pr.product_sku \r\n" + 
				"group by sh.shipment_expected_delivery_date , op.transaction_id , pr.dms_product_id , op.transaction_movement_type , pr2.product_name ,op.transaction_type_id ,  transaction_type)\r\n" + 
				"union \r\n" + 
				"(select order_.order_time transaction_date , op.transaction_id ,   case when op.transaction_movement_type='1' then sum(op.product_quantity) end as added , case when op.transaction_movement_type='-1' then sum(op.product_quantity) end as deducted,pr2.product_name ,pr.dms_product_id , op.transaction_type_id ,ot.order_type as transaction_type  , op.transaction_movement_type\r\n" + 
				"\r\n" + 
				"from orders order_ , operations op , products pr, products pr2 , orders_types ot\r\n" + 
				"where op.facility_id="+facility_id+" and  op.transaction_id=order_.id and cast(ot.id as text)=order_.order_type and to_date(to_char(order_.order_time,'yyyy-mm-dd'),'yyyy-mm-dd')='"+date_transaction+"' and op.transaction_type_id in ('3','5')\r\n" + 
				"and pr.product_sku= op.product_id and pr.product_sku='"+dms_product_id+"' and pr2.product_sku=pr.product_sku \r\n" + 
				"group by order_.order_time , op.transaction_id , pr.dms_product_id , op.transaction_movement_type , pr2.product_name,op.transaction_type_id ,  transaction_type)\r\n" + 
				")x\r\n" + 
				"group by x.transaction_date , x.transaction_id , x.product_name , x.dms_product_id , x.transaction_type , x.transaction_type_id ").setResultTransformer(Transformers.aliasToBean(ProductTransaction.class)).list();

	}
	return lst_products;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductTransaction> getDetailsWithDate(int facility_id, String dms_product_id,
			String date_transaction) {
		// TODO Auto-generated method stub
		List<ProductTransaction> lst_products=new ArrayList<ProductTransaction>();
		lst_products=sessionFactory.getCurrentSession().createSQLQuery("select to_char(x.transaction_date,'DD-MM-YYYY hh:mi:ss') as date, x.transaction_id as transaction_id, x.product_name,pt.type,trt.\"TRE_NAME\" as treatment , x.product_sku as product_id , x.transaction_type as transaction_type , sum(x.added) added, sum(x.deducted )deducted , x.dms_product_id \r\n" + 
				"from ((select sh.shipment_expected_delivery_date transaction_date , op.transaction_id , case when op.transaction_movement_type='1' then  sum(op.product_quantity) end as added , case when op.transaction_movement_type='-1' then sum(op.product_quantity) end as deducted,pr2.product_name ,pr.product_sku,pr.dms_product_id , sht.shipment_type as transaction_type , op.transaction_movement_type\r\n" + 
				"\r\n" + 
				"from shippments sh , operations op , products pr, products pr2 , shipments_types sht\r\n" + 
				"where op.facility_id="+facility_id+" and op.transaction_id=sh.id and sht.shipment_type_id=sh.shipment_type_id and to_date(to_char(sh.shipment_expected_delivery_date,'yyyy-mm-dd'),'yyyy-mm-dd')='"+date_transaction+"' and op.transaction_type_id='1'\r\n" + 
				"and pr.product_sku= op.product_id and pr.dms_product_id='"+dms_product_id+"' and pr2.dms_product_id=pr.dms_product_id and pr2.type=4\r\n" + 
				"group by sh.shipment_expected_delivery_date , op.transaction_id ,pr.dms_product_id, pr.product_sku , op.transaction_movement_type , pr2.product_name ,  transaction_type)\r\n" + 
				"union \r\n" + 
				"(select order_.order_time transaction_date , op.transaction_id ,   case when op.transaction_movement_type='1' then sum(op.product_quantity) end as added , case when op.transaction_movement_type='-1' then sum(op.product_quantity) end as deducted,pr2.product_name ,pr.product_sku,pr.dms_product_id , ot.order_type as transaction_type , op.transaction_movement_type\r\n" + 
				"\r\n" + 
				"from orders order_ , operations op , products pr, products pr2 , orders_types ot\r\n" + 
				"where op.facility_id="+facility_id+" and  op.transaction_id=order_.id and cast(ot.id as text)=order_.order_type and to_date(to_char(order_.order_time,'yyyy-mm-dd'),'yyyy-mm-dd')='"+date_transaction+"' and op.transaction_type_id in ('3','5')\r\n" + 
				"and pr.product_sku= op.product_id and pr.dms_product_id='"+dms_product_id+"' and pr2.dms_product_id=pr.dms_product_id and pr2.type=4\r\n" + 
				"group by order_.order_time , op.transaction_id , pr.product_sku,pr.dms_product_id , op.transaction_movement_type , pr2.product_name ,  transaction_type)\r\n" + 
				")x , products_type pt , products p , \"TREATMENT_TYPES\" trt\r\n" + 
				"where pt.id=p.type and trt.\"TRE_ID\"=p.treatment_id and p.product_sku=x.product_sku\r\n" + 
				"group by x.transaction_date , x.transaction_id , x.product_name , product_id , x.transaction_type , pt.type , treatment , x.product_sku , x.dms_product_id order by x.transaction_date , pt.type , treatment").setResultTransformer(Transformers.aliasToBean(ProductTransaction.class)).list();

		if(lst_products.size()==0)
		{
			lst_products=sessionFactory.getCurrentSession().createSQLQuery("select to_char(x.transaction_date,'DD-MM-YYYY hh:mi:ss') as date, x.transaction_id as transaction_id, x.product_name,pt.type,trt.\"TRE_NAME\" as treatment , x.product_sku as product_id , x.transaction_type as transaction_type , sum(x.added) added, sum(x.deducted )deducted , x.dms_product_id \r\n" + 
					"from ((select sh.shipment_expected_delivery_date transaction_date , op.transaction_id , case when op.transaction_movement_type='1' then  sum(op.product_quantity) end as added , case when op.transaction_movement_type='-1' then sum(op.product_quantity) end as deducted,pr2.product_name ,pr.product_sku,pr.dms_product_id , sht.shipment_type as transaction_type , op.transaction_movement_type\r\n" + 
					"\r\n" + 
					"from shippments sh , operations op , products pr, products pr2 , shipments_types sht\r\n" + 
					"where op.facility_id="+facility_id+" and op.transaction_id=sh.id and sht.shipment_type_id=sh.shipment_type_id and to_date(to_char(sh.shipment_expected_delivery_date,'yyyy-mm-dd'),'yyyy-mm-dd')='"+date_transaction+"' and op.transaction_type_id='1'\r\n" + 
					"and pr.product_sku= op.product_id and pr.product_sku='"+dms_product_id+"' and pr2.product_sku=pr.product_sku\r\n" + 
					"group by sh.shipment_expected_delivery_date , op.transaction_id ,pr.dms_product_id, pr.product_sku , op.transaction_movement_type , pr2.product_name ,  transaction_type)\r\n" + 
					"union \r\n" + 
					"(select order_.order_time transaction_date , op.transaction_id ,   case when op.transaction_movement_type='1' then sum(op.product_quantity) end as added , case when op.transaction_movement_type='-1' then sum(op.product_quantity) end as deducted,pr2.product_name ,pr.product_sku,pr.dms_product_id , ot.order_type as transaction_type , op.transaction_movement_type\r\n" + 
					"\r\n" + 
					"from orders order_ , operations op , products pr, products pr2 , orders_types ot\r\n" + 
					"where op.facility_id="+facility_id+" and  op.transaction_id=order_.id and cast(ot.id as text)=order_.order_type and to_date(to_char(order_.order_time,'yyyy-mm-dd'),'yyyy-mm-dd')='"+date_transaction+"' and op.transaction_type_id in ('3','5')\r\n" + 
					"and pr.product_sku= op.product_id and pr.product_sku='"+dms_product_id+"' and pr2.product_sku=pr.product_sku \r\n" + 
					"group by order_.order_time , op.transaction_id , pr.product_sku,pr.dms_product_id , op.transaction_movement_type , pr2.product_name ,  transaction_type)\r\n" + 
					")x , products_type pt , products p , \"TREATMENT_TYPES\" trt\r\n" + 
					"where pt.id=p.type and trt.\"TRE_ID\"=p.treatment_id and p.product_sku=x.product_sku\r\n" + 
					"group by x.transaction_date , x.transaction_id , x.product_name , product_id , x.transaction_type , pt.type , treatment , x.product_sku , x.dms_product_id order by x.transaction_date , pt.type , treatment").setResultTransformer(Transformers.aliasToBean(ProductTransaction.class)).list();

		}
		return lst_products;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductTransaction> get_productsbydms(String dms_product_id) {
		// TODO Auto-generated method stub
		List<ProductTransaction> lst_products=new ArrayList<ProductTransaction>();
				lst_products=sessionFactory.getCurrentSession().createSQLQuery("select product_name from products where dms_product_id='"+dms_product_id+"' and type!=2").setResultTransformer(Transformers.aliasToBean(ProductTransaction.class)).list();
	if(lst_products.size()==0)
	{
		lst_products=sessionFactory.getCurrentSession().createSQLQuery("select product_name from products where product_sku='"+dms_product_id+"'").setResultTransformer(Transformers.aliasToBean(ProductTransaction.class)).list();

	}
				
				return lst_products;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AccountBalance> get_account_balance(int facility_id) {
		// TODO Auto-generated method stub
		return (List<AccountBalance>)sessionFactory.getCurrentSession().createSQLQuery("select pr.product_name account_name , cast((case when fc.total_stock_quantity is null then 0 else fc.total_stock_quantity end) as double precision ) as balance\r\n" + 
				"from products pr\r\n" + 
				"left join facility_product_info fc on fc.product_id=pr.product_sku and fc.facility_id="+facility_id+"\r\n" + 
				"where pr.product_category=4").setResultTransformer(Transformers.aliasToBean(AccountBalance.class)).list();
	}

}
