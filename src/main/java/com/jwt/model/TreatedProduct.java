package com.jwt.model;

import java.math.BigDecimal;

public class TreatedProduct {
	private String product_sku;
	public String getProduct_sku() {
		return product_sku;
	}
	public void setProduct_sku(String product_sku) {
		this.product_sku = product_sku;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getTreatment_name() {
		return treatment_name;
	}
	public void setTreatment_name(String treatment_name) {
		this.treatment_name = treatment_name;
	}
	public BigDecimal getTotal_stock_quantity() {
		return total_stock_quantity;
	}
	public void setTotal_stock_quantity(BigDecimal total_stock_quantity) {
		this.total_stock_quantity = total_stock_quantity;
	}
	public String getDms_product_id() {
		return dms_product_id;
	}
	public void setDms_product_id(String dms_product_id) {
		this.dms_product_id = dms_product_id;
	}
	public BigDecimal getQuantity() {
		return quantity;
	}
	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public BigDecimal getTreatment_id() {
		return treatment_id;
	}
	public void setTreatment_id(BigDecimal treatment_id) {
		this.treatment_id = treatment_id;
	}
	public String getMachine_num() {
		return machine_num;
	}
	public void setMachine_num(String machine_num) {
		this.machine_num = machine_num;
	}
	
	private String product_name;
	private String treatment_name;
	private BigDecimal total_stock_quantity;
	private String dms_product_id;
	private BigDecimal quantity;
	private String product_id;
	private BigDecimal treatment_id;
	private String machine_num;
	private String washing_programs_id;
	public String getWashing_programs_id() {
		return washing_programs_id;
	}
	public void setWashing_programs_id(String washing_programs_id) {
		this.washing_programs_id = washing_programs_id;
	}

	private String order_time;
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}
}
