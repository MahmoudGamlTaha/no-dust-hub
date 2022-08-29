package com.jwt.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table (name="payroll_payment")
public class PayrollPayment implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Column
	private int transaction_id;
	@Column
	private String emp_id;
	@Column
	private String emp_name;
	@Column
	private int emp_type;
	@Column
	private double payment_value;
	@Column
	private String payment_refrence;
	@Column
	private String payment_location;
	@Column
	private BigDecimal payment_status ;
	/*@Column
	private Date payment_date_time;*/
	@Column
	private String payment_by_id;
	@Column
	private int cloud_flag;
	
	@Id
	@Column
	private int cloud_transid;
	@Column
	private String cash_account;
	@Column
	private String payment_type;
	@Column
	private String notes;
	
	public int getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(int transaction_id) {
		this.transaction_id = transaction_id;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public int getEmp_type() {
		return emp_type;
	}
	public void setEmp_type(int emp_type) {
		this.emp_type = emp_type;
	}
	public double getPayment_value() {
		return payment_value;
	}
	public void setPayment_value(double payment_value) {
		this.payment_value = payment_value;
	}
	public String getPayment_refrence() {
		return payment_refrence;
	}
	public void setPayment_refrence(String payment_refrence) {
		this.payment_refrence = payment_refrence;
	}
	public String getPayment_location() {
		return payment_location;
	}
	public void setPayment_location(String payment_location) {
		this.payment_location = payment_location;
	}
	
public BigDecimal getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(BigDecimal payment_status) {
		this.payment_status = payment_status;
	}
	/*	public Date getPayment_date_time() {
		return payment_date_time;
	}
	public void setPayment_date_time(Date payment_date_time) {
		this.payment_date_time = payment_date_time;
	}*/
	public String getPayment_by_id() {
		return payment_by_id;
	}
	public void setPayment_by_id(String payment_by_id) {
		this.payment_by_id = payment_by_id;
	}
	public int getCloud_flag() {
		return cloud_flag;
	}
	public void setCloud_flag(int cloud_flag) {
		this.cloud_flag = cloud_flag;
	}
	public int getCloud_transid() {
		return cloud_transid;
	}
	public void setCloud_transid(int cloud_transid) {
		this.cloud_transid = cloud_transid;
	}
	public String getCash_account() {
		return cash_account;
	}
	public void setCash_account(String cash_account) {
		this.cash_account = cash_account;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	
	

}
