package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.PayrollVendorDAO;
import com.jwt.model.AccountBalance;
import com.jwt.model.Facility;
import com.jwt.model.FinancialAccount;
import com.jwt.model.Payment;
import com.jwt.model.PaymentAccount;
import com.jwt.model.PaymentEmployee;
import com.jwt.model.PaymentReport;
import com.jwt.model.Payment_type;
import com.jwt.model.PayrollPayment;
import com.jwt.model.drivers;


@Service
@Transactional
public class PayrollVendorServiceImpl implements PayrollVendorService {

	@Autowired
	private PayrollVendorDAO payrollVendordao;
	
	@Override
	public FinancialAccount GetPayrollAccount(int fac_id) {
		return payrollVendordao.GetPayrollAccount(fac_id);
	}

	@Override
	public List<PayrollPayment> getPayrollPayment() {
		return payrollVendordao.getPayrollPayment();
	}

	@Override
	public String submitPayroll(int facility, String user_name, double total, String payments,int collected_by_self,String collected_by) {
		return payrollVendordao.submitPayroll(facility, user_name, total, payments,collected_by_self,collected_by);
	}

	@Override
	public List<PaymentAccount> get_account_list(int fac_id) {
		// TODO Auto-generated method stub
		return payrollVendordao.get_account_list(fac_id);
	}

	@Override
	public List<Facility> get_payment_location() {
		// TODO Auto-generated method stub
		return payrollVendordao.get_payment_location();
	}

	@Override
	public List<Payment_type> get_payment_type() {
		// TODO Auto-generated method stub
		return payrollVendordao.get_payment_type();
	}

	@Override
	public String Submit_Create_Payment(String agent, String payments,String file_name) {
		// TODO Auto-generated method stub
		return payrollVendordao.Submit_Create_Payment(agent, payments,file_name);
	}

	@Override
	public List<Payment_type> get_types_for_approve() {
		// TODO Auto-generated method stub
		return payrollVendordao.get_types_for_approve();
	}

	@Override
	public List<Payment> Get_PAyment_List_To_Approve(int payment_type, int payment_loc, String due_date,
			String cash_account) {
		// TODO Auto-generated method stub
		return payrollVendordao.Get_PAyment_List_To_Approve(payment_type, payment_loc, due_date, cash_account);
	}

	@Override
	public String submit_approve_payment(String agent, String lst, int status) {
		// TODO Auto-generated method stub
		return payrollVendordao.submit_approve_payment(agent, lst,status);
	}

	@Override
	public List<Payment_type> Get_Payments_types_forpay() {
		// TODO Auto-generated method stub
		return payrollVendordao.Get_Payments_types_forpay();
	}

	@Override
	public List<Payment> Get_PAyment_List_To_Pay(int payment_type, int payment_loc,String emp_id) {
		// TODO Auto-generated method stub
		return payrollVendordao.Get_PAyment_List_To_Pay(payment_type, payment_loc,emp_id);
	}

	@Override
	public List<Payment> Load_payments_for_approve_() {
		// TODO Auto-generated method stub
		return payrollVendordao.Load_payments_for_approve_();
	}

	@Override
	public List<Payment_type> get_types_for_payment() {
		// TODO Auto-generated method stub
		return payrollVendordao.get_types_for_payment();
	}

	@Override
	public List<PaymentReport> Get_Payment_Summary(int fac_id, String from_date, String to_date) {
		// TODO Auto-generated method stub
		return payrollVendordao.Get_Payment_Summary(fac_id, from_date, to_date);
	}

	@Override
	public List<PaymentReport> Get_PaymentReportDetails(int fac_id, String from_date, String to_date) {
		// TODO Auto-generated method stub
		return payrollVendordao.Get_PaymentReportDetails(fac_id, from_date, to_date);
	}

	@Override
	public List<PaymentReport> Get_PaymentTotalsOnDate(int fac_id, String from_date) {
		// TODO Auto-generated method stub
		return payrollVendordao.Get_PaymentTotalsOnDate(fac_id, from_date);
	}

	@Override
	public List<PaymentReport> GetPaymentDetailsOnDate(int fac_id, String date) {
		// TODO Auto-generated method stub
		return payrollVendordao.GetPaymentDetailsOnDate(fac_id, date);
	}

	@Override
	public List<drivers> Get_Drivers_For_Payments() {
		// TODO Auto-generated method stub
		return payrollVendordao.Get_Drivers_For_Payments();
	}

	@Override
	public List<PaymentEmployee> GetEmployees() {
		// TODO Auto-generated method stub
		return payrollVendordao.GetEmployees();
	}

	@Override
	public List<Payment> Get_Payment_List_First_Load(int payment_loc,int payment_type) {
		// TODO Auto-generated method stub
		return payrollVendordao.Get_Payment_List_First_Load(payment_loc,payment_type);
	}

	@Override
	public List<AccountBalance> get_account_balance(int facility_id,String from_date,String to_date) {
		// TODO Auto-generated method stub
		return payrollVendordao.get_account_balance(facility_id,from_date,to_date);
	}

	@Override
	public List<PaymentReport> GetAllTotals(int fac_id, String from_date, String to_date) {
		// TODO Auto-generated method stub
		return payrollVendordao.GetAllTotals(fac_id, from_date, to_date);
	}

}
