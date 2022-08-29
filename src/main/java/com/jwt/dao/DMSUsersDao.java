package com.jwt.dao;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;

import com.jwt.model.DMS_Users;
import com.jwt.model.DMS_DriversData;

public interface DMSUsersDao {

	public List<DMS_Users> GetDriversList();
	public String Update_User_img(DMS_Users dms_user) throws FileNotFoundException;
	public DMS_Users Get_User_image(String user_name);
	public List<DMS_DriversData> Check_image_flag();
}
