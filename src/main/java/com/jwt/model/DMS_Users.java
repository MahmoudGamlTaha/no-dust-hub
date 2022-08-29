package com.jwt.model;

import java.io.File;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.websocket.Encoder.Binary;

import org.hibernate.engine.jdbc.BinaryStream;

import com.mysql.jdbc.Blob;
@Entity
@Table(name="USERS")
public class DMS_Users {

	@Column(name="FULL_NAME_EN")
private String full_name_en;
@Id
@Column(name="USER_NAME")
private String user_name;
@Column(name="image")
private byte[] image;
private File img_file;
private String img;
public String getFull_name_en() {
	return full_name_en;
}
public void setFull_name_en(String full_name_en) {
	this.full_name_en = full_name_en;
}
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}

public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public File getImg_file() {
	return img_file;
}
public void setImg_file(File img_file) {
	this.img_file = img_file;
}
public byte[] getImage() {
	return image;
}
public void setImage(byte[] image) {
	this.image = image;
}




}
