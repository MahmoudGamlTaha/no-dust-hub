package com.jwt.model;

import java.math.BigDecimal;
import java.sql.Time;

public class DirtyProduct {
	
	private String product_id;
	
	private String product_sku;
	
	private String washing_programs_id;
	
	private String machine_num;
	
	private int quantity;
	
	private double weight;
	
	private String washing_program_name;
	
	private String product_name;
	
	private String washing_program_id;
	
	private String id;
	
	private String approved;

	private BigDecimal received_quantity;
	private String order_time;
	

	public String getOrder_time() {
		return order_time;
	}

	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}

	public BigDecimal getReceived_quantity() {
		return received_quantity;
	}

	public void setReceived_quantity(BigDecimal received_quantity) {
		this.received_quantity = received_quantity;
	}

	private String sealed;
	public String getSealed() {
		return sealed;
	}

	public void setSealed(String sealed) {
		this.sealed = sealed;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getWashing_programs_id() {
		return washing_programs_id;
	}

	public void setWashing_programs_id(String washing_programs_id) {
		this.washing_programs_id = washing_programs_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getWashing_program_name() {
		return washing_program_name;
	}

	public void setWashing_program_name(String washing_program_name) {
		this.washing_program_name = washing_program_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getWashing_program_id() {
		return washing_program_id;
	}

	public void setWashing_program_id(String washing_program_id) {
		this.washing_program_id = washing_program_id;
	}

	public String getProduct_sku() {
		return product_sku;
	}

	public void setProduct_sku(String product_sku) {
		this.product_sku = product_sku;
	}

	public String getId() {
		return id;
	}
	

	public String getMachine_num() {
		return machine_num;
	}

	public void setMachine_num(String machine_num) {
		this.machine_num = machine_num;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getApproved() {
		return approved;
	}

	public void setApproved(String approved) {
		this.approved = approved;
	}
	

}
