package com.jwt.service;

import java.util.List;

import com.jwt.model.DirtyProductInPackage;
import com.jwt.model.UntreatedProduct;

public interface UntreatedProductsService {
	public List<DirtyProductInPackage> getUntreatedProducts();
	public String submitRecieveUntreatedProducts(String destination ,String  source_id ,String products  , String logged_user ,String driver_id);
	public List<UntreatedProduct> getUntreatedByFac(int facility);
}
