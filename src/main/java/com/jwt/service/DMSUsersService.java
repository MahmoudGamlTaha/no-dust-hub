package com.jwt.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;

import com.jwt.model.DMS_DriversData;
import com.jwt.model.DMS_Users;

public interface DMSUsersService {

	public List<DMS_Users> get_list_users();
	public String Update_img(DMS_Users dms_user) throws FileNotFoundException;
	public DMS_Users Get_user_image(String user_name);
	public List<DMS_DriversData> Check_image_flag();
}
