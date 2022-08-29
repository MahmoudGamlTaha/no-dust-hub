package com.jwt.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.DMSUsersDao;
import com.jwt.model.DMS_DriversData;
import com.jwt.model.DMS_Users;

@Service
@Transactional
public class DMSUsersServiceImpl implements DMSUsersService{
@Autowired
private DMSUsersDao dms_users_dao;

@Override
public List<DMS_Users> get_list_users() {
	// TODO Auto-generated method stub
	return dms_users_dao.GetDriversList();
}

@Override
public String Update_img(DMS_Users dms_user) throws FileNotFoundException {
	// TODO Auto-generated method stub
	return dms_users_dao.Update_User_img(dms_user);
}

@Override
public DMS_Users Get_user_image(String user_name) {
	// TODO Auto-generated method stub
	return dms_users_dao.Get_User_image(user_name);
}

@Override
public List<DMS_DriversData> Check_image_flag() {
	// TODO Auto-generated method stub
	return dms_users_dao.Check_image_flag();
}

}
