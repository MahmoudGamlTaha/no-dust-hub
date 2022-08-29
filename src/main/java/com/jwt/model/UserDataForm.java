package com.jwt.model;

import java.io.File;

public class UserDataForm {
private String user_name;
private byte[] img_file;
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public byte[] getImg_file() {
	return img_file;
}
public void setImg_file(byte[] img_file) {
	this.img_file = img_file;
}


}
