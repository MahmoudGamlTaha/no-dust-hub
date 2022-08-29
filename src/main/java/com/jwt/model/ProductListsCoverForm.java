package com.jwt.model;

import java.util.List;

public class ProductListsCoverForm {

	private List<CoverProductWithQuentity> coverProducts;
	private List<Products>lst_prods;
	public List<Products> getLst_prods() {
		return lst_prods;
	}

	public void setLst_prods(List<Products> lst_prods) {
		this.lst_prods = lst_prods;
	}

	private Driver driver;
	private  String assignDate;
	private String wareHouseName;
	private String areaName;
	public List<CoverProductWithQuentity> getCoverProducts() {
		return coverProducts;
	}

	public void setCoverProducts(List<CoverProductWithQuentity> coverProducts) {
		this.coverProducts = coverProducts;
	}

	public Driver getDriver() {
		return driver;
	}

	public void setDriver(Driver driver) {
		this.driver = driver;
	}

	public String getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(String assignDate) {
		this.assignDate = assignDate;
	}

	public String getWareHouseName() {
		return wareHouseName;
	}

	public void setWareHouseName(String wareHouseName) {
		this.wareHouseName = wareHouseName;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	
}
