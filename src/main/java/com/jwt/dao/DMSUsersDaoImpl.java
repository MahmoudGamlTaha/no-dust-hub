package com.jwt.dao;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import javax.persistence.ParameterMode;
import javax.websocket.Encoder.Binary;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.engine.jdbc.BinaryStream;
import org.hibernate.procedure.ProcedureCall;
import org.hibernate.procedure.ProcedureOutputs;
import org.hibernate.result.ResultSetOutput;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.DMS_DriversData;
import com.jwt.model.DMS_Users;
import com.mysql.jdbc.PreparedStatement;
@Repository
public class DMSUsersDaoImpl implements DMSUsersDao {
	@Autowired
	private SessionFactory sessionFactory;
	@SuppressWarnings("unchecked")
	@Override
	public List<DMS_Users> GetDriversList() {
		// TODO Auto-generated method stub
		List<DMS_Users> lst=sessionFactory.getCurrentSession().createSQLQuery("select \"USER_NAME\" as user_name , \"FULL_NAME_EN\" as full_name_en from \"USERS\" order by \\\"FULL_NAME_EN\\\"").setResultTransformer(Transformers.aliasToBean(DMS_Users.class)).list();
		return lst;
	}
	@SuppressWarnings("unchecked")
	@Override
	public String Update_User_img(DMS_Users dms_user) throws FileNotFoundException {
		// TODO Auto-generated method stub
		

		ProcedureCall procedurecall=sessionFactory.getCurrentSession().createStoredProcedureCall("update_user_image");
		procedurecall.registerParameter("p_user_name", String.class, ParameterMode.IN);
		procedurecall.registerParameter("p_image", byte[].class, ParameterMode.IN);
		procedurecall.getParameterRegistration("p_user_name").bindValue(dms_user.getUser_name());
		procedurecall.getParameterRegistration("p_image").bindValue(dms_user.getImage());
		
		ProcedureOutputs output=procedurecall.getOutputs();
		ResultSetOutput resultsetoutput=(ResultSetOutput)output.getCurrent();
		@SuppressWarnings("rawtypes")
		List Results=resultsetoutput.getResultList();
		String out=(String)Results.get(0);
		return out;
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public DMS_Users Get_User_image(String user_name) {
		// TODO Auto-generated method stub
		//PreparedStatement ps = sess.prepareStatement("SELECT imgoid FROM imageslo WHERE imgname = ?");

		
		List<DMS_Users>lst=(List<DMS_Users>)sessionFactory.getCurrentSession().createSQLQuery("select \\\"USER_NAME\\\" as user_name , image  from \\\"USERS\\\" where \\\"USER_NAME\\\"='"+user_name+"'").setResultTransformer(Transformers.aliasToBean(DMS_Users.class)).list();
				
		
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
	public List<DMS_DriversData> Check_image_flag() {
		// TODO Auto-generated method stub
		return (List<DMS_DriversData>)sessionFactory.getCurrentSession().createSQLQuery("select CONCAT(\"FULL_NAME_EN\",',',\"USER_NAME\") AS driver_name , (case when image is null then 0 else 1 end) as image_flag from \"USERS\" order by driver_name").setResultTransformer(Transformers.aliasToBean(DMS_DriversData.class)).list();
	}

}
