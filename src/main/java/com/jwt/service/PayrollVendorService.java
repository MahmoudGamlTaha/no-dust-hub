package com.jwt.service;

import java.util.List;

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

public interface PayrollVendorService {
	public FinancialAccount GetPayrollAccount(int fac_id);
	public List<PayrollPayment> getPayrollPayment();
	public String submitPayroll(int facility , String   user_name ,  double total , String  payments,int collected_by_self,String collected_by );
	public List<PaymentAccount> get_account_list(int fac_id);
	public List<Facility> get_payment_location();
	public List<Payment_type> get_payment_type() ;
	public String Submit_Create_Payment(String agent, String payments,String file_name) ;
	public List<Payment_type> get_types_for_approve();
	public List<Payment> Get_PAyment_List_To_Approve(int payment_type, int payment_loc, String due_date,
			String cash_account);
	public String submit_approve_payment(String agent, String lst,int status);
	public List<Payment_type> Get_Payments_types_forpay();
	public List<Payment> Get_PAyment_List_To_Pay(int payment_type, int payment_loc,String emp_id);
	public List<Payment> Load_payments_for_approve_() ;
	public List<Payment_type> get_types_for_payment();
	public List<PaymentReport> Get_Payment_Summary(int fac_id, String from_date, String to_date);
	public List<PaymentReport> Get_PaymentReportDetails(int fac_id, String from_date, String to_date);
	public List<PaymentReport> Get_PaymentTotalsOnDate(int fac_id, String from_date);
	public List<PaymentReport> GetPaymentDetailsOnDate(int fac_id, String date);
	public List<drivers> Get_Drivers_For_Payments();
	public List<PaymentEmployee> GetEmployees();
	public List<Payment> Get_Payment_List_First_Load(int payment_loc,int pyment_type);
	public List<AccountBalance> get_account_balance(int facility_id,String from_date,String to_date);
	public List<PaymentReport> GetAllTotals(int fac_id, String from_date, String to_date) ;
}
