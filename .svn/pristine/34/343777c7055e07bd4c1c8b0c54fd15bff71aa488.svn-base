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

import com.jwt.model.DirtyProductInPackage;
import com.jwt.model.UntreatedProduct;

@Repository
public class UntreatedProductsDAOImpl implements UntreatedProductsDAO {

	@Autowired
	private SessionFactory sessionFactory; 
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DirtyProductInPackage> getUntreatedProducts() {
		List<DirtyProductInPackage>dirtydata=sessionFactory.getCurrentSession().createSQLQuery("SELECT CAST(pro.product_id AS varchar),CAST( pro.type AS varchar), pro.product_name, pro.product_sku, CAST(pro.product_category AS varchar), pro.dms_product_id \r\n" + 
				"	FROM products pro \r\n" + 
				"	where pro.type =4 ORDER BY pro.product_name").setResultTransformer(Transformers.aliasToBean(DirtyProductInPackage.class)).list();
				return dirtydata;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String submitRecieveUntreatedProducts(String destination, String source_id, String products,
			String logged_user , String driver_id) {
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("submit_receive_untreated_from_external_laundry");
		procedureCall.registerParameter("p_destination_id", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_source_id", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_untreated_products", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_user", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_driver_id", String.class, ParameterMode.IN);
		procedureCall.getParameterRegistration("p_destination_id").bindValue(destination);
		procedureCall.getParameterRegistration("p_source_id").bindValue(source_id);
		procedureCall.getParameterRegistration("p_untreated_products").bindValue(products);
		procedureCall.getParameterRegistration("p_logged_user").bindValue(logged_user);
		procedureCall.getParameterRegistration("p_driver_id").bindValue(driver_id);

		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result=String.valueOf(results.get(0));
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UntreatedProduct> getUntreatedByFac(int facility) {
		// TODO Auto-generated method stub
		return (List<UntreatedProduct>)sessionFactory.getCurrentSession().createSQLQuery("select pr.product_name ,pr.product_sku as product_id ,CAST(0 AS double precision ) as weight,CAST(0 AS numeric)as quantity, sum(data_v.total_quan) as total_stock_quantity, data_v.dms_product_id\r\n" + 
				"FROM\r\n" + 
				"(select pr.product_sku,pr.dms_product_id,sum(fc.total_stock_quantity) as total_quan , fc.facility_id from facility_product_info fc , products pr where \r\n" + 
				"fc.product_id=pr.product_sku and fc.facility_id="+facility+" \r\n" + 
				"group by pr.dms_product_id ,pr.product_sku , fc.facility_id ) data_v\r\n" + 
				", products pr where data_v.dms_product_id=pr.dms_product_id and pr.type=4\r\n" + 
				"group by pr.product_name,data_v.dms_product_id,pr.product_sku order by pr.product_name").setResultTransformer(Transformers.aliasToBean(UntreatedProduct.class)).list();
	}

}
