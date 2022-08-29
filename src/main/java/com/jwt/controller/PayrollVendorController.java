package com.jwt.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.jwt.model.AccountBalance;
import com.jwt.model.CashInOutForm;
import com.jwt.model.DirtyProductsForm;
import com.jwt.model.Driver;
import com.jwt.model.Facility;
import com.jwt.model.FinancialAccount;
import com.jwt.model.InventoryProduct;
import com.jwt.model.Payment;
import com.jwt.model.PaymentAccount;
import com.jwt.model.PaymentEmployee;
import com.jwt.model.PaymentReport;
import com.jwt.model.PaymentReportData;
import com.jwt.model.Payment_submit;
import com.jwt.model.Payment_type;
import com.jwt.model.User;
import com.jwt.model.drivers;
import com.jwt.model.PayrollPayment;
import com.jwt.model.ProductTransaction;
import com.jwt.service.CreateDirtyShipmentService;
import com.jwt.service.PayrollVendorService;
import com.jwt.service.ReleasingProductsService;
import com.jwt.service.UserService;

@Controller
public class PayrollVendorController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	PayrollVendorService payrollVendorService;
	@Autowired
	
	private ReleasingProductsService shipmentService;
	
	@Autowired
	private CreateDirtyShipmentService createDirtyService;
	
	@RequestMapping(value="/CreatePayment")
	public ModelAndView CreatePayment(ModelAndView model,HttpServletRequest request , HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		User u = new User();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
		String user="";
		user=userDetail.getUsername();
		u=userService.getUser(user);
		
		}
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		Facility facility = shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
List<PaymentAccount>lst_payment_account=payrollVendorService.get_account_list(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
List<Facility>lst_payment_loc=payrollVendorService.get_payment_location();
List<Payment_type>lst_payment_types=payrollVendorService.get_payment_type();
		CashInOutForm cashInOutForm = new CashInOutForm();
		cashInOutForm.setLst_payment_loc(lst_payment_loc);
		cashInOutForm.setLst_payment_accounts(lst_payment_account);
		cashInOutForm.setAssignDate(dateFormat.format(date));
		cashInOutForm.setAgentName(u.getDisplay_name()+','+u.getUSER_NAME());
		cashInOutForm.setWareHouseName(facility.getFacility_name());
		cashInOutForm.setLst_payment_type(lst_payment_types);
		model.addObject("formData", cashInOutForm);
		model.setViewName("CreatePayment");

		return model;
		
	}
	
	@RequestMapping(value="/PayrollPayment")
	public ModelAndView PayrollPayment(ModelAndView model,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		User u = new User();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
		String user="";
		user=userDetail.getUsername();
		u=userService.getUser(user);
		
		}
		List<PaymentAccount>lst_payment_account=payrollVendorService.get_account_list(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
//List<Payment> lst_payments_first=payrollVendorService.Get_Payment_List_First_Load(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		List<Payment_type>lst_types=payrollVendorService.get_types_for_payment();
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		Facility facility = shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	    FinancialAccount account = payrollVendorService.GetPayrollAccount(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		CashInOutForm cashInOutForm = new CashInOutForm();
		List<drivers> drivers_lst = payrollVendorService.Get_Drivers_For_Payments();
		List<PaymentEmployee>drivers_lst_1=payrollVendorService.GetEmployees();
		//List<Driver> lst_drivers = shipmentService.GetAllDrivers();
		List<FinancialAccount> accounts = new ArrayList<FinancialAccount>();
		accounts.add(account);
		//
		//List<PayrollPayment> pays = payrollVendorService.getPayrollPayment();
		List<Facility>lst_payment_loc=payrollVendorService.get_payment_location();
//cashInOutForm.setLst_payment(lst_payments_first);
		//System.out.println("pays are "+pays.size());
		cashInOutForm.setLst_payment_accounts(lst_payment_account);
		cashInOutForm.setLst_payment_type(lst_types);
		cashInOutForm.setAccounts(accounts);
		cashInOutForm.setLst_emp(drivers_lst_1);
		cashInOutForm.setLst_payment_loc(lst_payment_loc);
		cashInOutForm.setDrivers_lst(drivers_lst);
		cashInOutForm.setAssignDate(dateFormat.format(date));
		cashInOutForm.setAgentName(u.getDisplay_name()+','+u.getUSER_NAME());
		cashInOutForm.setWareHouseName(facility.getFacility_name());
		model.addObject("formData", cashInOutForm);
	//	model.addObject("lst_payments", lst_payments_first);
		//model.addObject("pays", pays);
		model.setViewName("PayrollPayment");
		return model;
	}
	
	@RequestMapping(value="GetTodayPayment",method=RequestMethod.POST,consumes = "application/json" , produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> GetTodayPayment(@RequestBody Payment payment, HttpServletRequest request) throws JsonProcessingException
	{
		HttpSession session=request.getSession();
		List<Payment>lst_payment=payrollVendorService.Get_Payment_List_First_Load(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))), payment.getPayment_type());
		ObjectMapper mapper=new ObjectMapper();
		String data=mapper.writeValueAsString(lst_payment);
		return new ResponseEntity<String>(data,HttpStatus.OK);
		
	}
	@RequestMapping(value = "/submitPayrollPayments", method = RequestMethod.POST,consumes ="application/json")
	public ResponseEntity<String> submitPayrollPayments(@RequestBody  Payment_submit pays  , HttpServletRequest request)throws ServletException, IOException {
		HttpSession session=request.getSession();
		System.out.println("driver "+ pays.getTotalPayed());
		//System.out.println("date"+coverForm.getCoverProducts().size());
		Gson gson = new Gson();
		String json = gson.toJson(pays.getLst_payments());
		  
		System.out.println("json "+json);
			System.out.println(json);
		   User u = new User();
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (!(auth instanceof AnonymousAuthenticationToken)) {
				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				System.out.println(userDetail);
			String user="";
			user=userDetail.getUsername();
		    u=userService.getUser(user);
		    System.out.println("user"+u.getUSER_NAME());
			}
			String submit = new String();
			if(u.getUSER_NAME() == null)
			{
				return new ResponseEntity<String>("no session", HttpStatus.OK);
				

			}
			else {
				Facility facility = shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));

				submit=payrollVendorService.submitPayroll(facility.getId(), u.getUser_name(),pays.getTotalPayed(), json,pays.getCollected_by_self(),pays.getCollected_by())	;

			}
			
		////	System.out.println("submited1 : "+dirtyForm.getSelectedDriver()+" "+ u.getUSER_NAME()+" "+ dirtyForm.getSelectedLundry()+" "+json);
			System.out.println("submited : "+submit);
			Double x=Double.parseDouble(submit);
			System.out.println(x);
			String pattern = "####,###.##";
			   // double number = 123456789.123;
			
			    DecimalFormat numberFormat = new DecimalFormat(pattern);
			    String d=numberFormat.toString();
			    String x_amount=numberFormat.format(x);
			    System.out.println(x_amount);
			return new ResponseEntity<String>(x_amount, HttpStatus.OK);

			/*if(submit.equals("true"))
			{
				return new ResponseEntity<String>("success", HttpStatus.OK);

			}
			else {				
				return new ResponseEntity<String>("not success", HttpStatus.OK);

			}*/

	}
	
@RequestMapping(value="SubmitCreatePayment",method=RequestMethod.POST,consumes="application/json")
public ResponseEntity<String> Submit_createPayment(@RequestBody CashInOutForm cash) throws JsonProcessingException
{
	String out_submit="";
	 User u = new User();
	 String user="";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
		
		user=userDetail.getUsername();
	    u=userService.getUser(user);
	    System.out.println("user"+u.getUSER_NAME());
	    ObjectMapper mapper=new ObjectMapper();
	    String data=mapper.writeValueAsString(cash.getPayments());
	    System.out.println("File_Name:"+cash.getFile_name());
	    out_submit=payrollVendorService.Submit_Create_Payment(user, data,cash.getFile_name());
		}
	return new ResponseEntity<String>(out_submit,HttpStatus.OK);
}
@RequestMapping(value="ApprovePayment")
public ModelAndView Approve_Payments(ModelAndView model,HttpServletRequest request)
{
	HttpSession session=request.getSession();
	User u = new User();
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		System.out.println(userDetail);
	String user="";
	user=userDetail.getUsername();
	u=userService.getUser(user);
	
	}
	List<PaymentAccount>lst_payment_account=payrollVendorService.get_account_list(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
List<Payment>not_approved=payrollVendorService.Load_payments_for_approve_();
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	Date date = new Date();
	List<Payment_type>lst_types=payrollVendorService.get_types_for_approve();
	CashInOutForm cashInOutForm = new CashInOutForm();
	cashInOutForm.setAssignDate(dateFormat.format(date));
	cashInOutForm.setAgentName(u.getDisplay_name()+','+u.getUSER_NAME());
	cashInOutForm.setLst_payment_type(lst_types);
	Facility facility = shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	List<Facility>lst_payment_loc=payrollVendorService.get_payment_location();

	cashInOutForm.setWareHouseName(facility.getFacility_name());
	cashInOutForm.setLst_payment_loc(lst_payment_loc);
	cashInOutForm.setLst_payment_accounts(lst_payment_account);
	model.addObject("formData", cashInOutForm);
	model.addObject("not_approved", not_approved);
	model.setViewName("ApprovePayment");
	return model;
}
	
@RequestMapping(value="GetApprovePayments",method=RequestMethod.POST,consumes = "application/json" , produces = "application/json;charset=UTF-8")
public ResponseEntity<String> ApprovePayments(@RequestBody Payment cash,HttpServletRequest request) throws JsonProcessingException
{
	String out_submit="";
	User u = new User();
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		System.out.println(userDetail);
	String user="";
	user=userDetail.getUsername();
	u=userService.getUser(user);
	
	}
	List<Payment>lst_payment=payrollVendorService.Get_PAyment_List_To_Approve(cash.getPayment_type(), cash.getLocation(), cash.getDue_date(), cash.getAccount());
	if(lst_payment.size()>0)
	{
		ObjectMapper mapper=new ObjectMapper();
		out_submit=mapper.writeValueAsString(lst_payment);
	}
	else
	{
		out_submit="no_data";
	}
	return new ResponseEntity<String>(out_submit,HttpStatus.OK);
}
@RequestMapping(value="SubmitApprovePayment",method=RequestMethod.POST,consumes = "application/json")
public ResponseEntity<String> approve_payment(@RequestBody CashInOutForm cash) throws JsonProcessingException
{
	String out_submit="";
	User u = new User();
	String user="";

	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		System.out.println(userDetail);
	user=userDetail.getUsername();
	u=userService.getUser(user);
	ObjectMapper mapper=new ObjectMapper();
	String data=mapper.writeValueAsString(cash.getPayments());
	out_submit=payrollVendorService.submit_approve_payment(user, data,cash.getApproved_status());
	}
	return new ResponseEntity<String>(out_submit,HttpStatus.OK);
}
@RequestMapping(value="GetPayments",method=RequestMethod.POST,consumes = "application/json",produces = "application/json;charset=UTF-8")
public ResponseEntity<String>get_payments(@RequestBody Payment acc,HttpServletRequest request) throws JsonProcessingException
{
	HttpSession session=request.getSession();
	String out_submit="";
	User u = new User();
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		System.out.println(userDetail);
	String user="";
	user=userDetail.getUsername();
	u=userService.getUser(user);
	
	}
	List<Payment>lst_payment=payrollVendorService.Get_PAyment_List_To_Pay(acc.getPayment_type(), Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))),acc.getEmp_id());
	if(lst_payment.size()>0)
	{
		ObjectMapper mapper=new ObjectMapper();
		out_submit=mapper.writeValueAsString(lst_payment);
	}
	else
	{
		out_submit="no_data";
	}
	return new ResponseEntity<String>(out_submit,HttpStatus.OK);
}

@RequestMapping(value="PaymentReport")
public ModelAndView PaymentRequest(ModelAndView model,HttpServletRequest request)
{
	List<Facility>lst_payment_loc=payrollVendorService.get_payment_location();

	model.addObject("warehouses", lst_payment_loc);
	model.setViewName("Payments_Report");
	return model;
}
@RequestMapping(value="GetPaymentData",method=RequestMethod.POST,consumes = "application/json",produces = "application/json;charset=UTF-8")
public ResponseEntity<String>GetPaymentData(@RequestBody PaymentReportData data,HttpServletRequest request) throws JsonProcessingException
{
	HttpSession session =request.getSession();
	List<PaymentReport> lst_payments=payrollVendorService.Get_Payment_Summary(data.getFacility_id(), data.getFrom_date(), data.getTo_date());
	List<PaymentReport> lst_payment_details=payrollVendorService.Get_PaymentReportDetails(data.getFacility_id(), data.getFrom_date(), data.getTo_date());
	List<AccountBalance>lst_accounts=payrollVendorService.get_account_balance(data.getFacility_id(),data.getFrom_date(),data.getTo_date());
	List<PaymentReport> lst_all_totals=payrollVendorService.GetAllTotals(data.getFacility_id(), data.getFrom_date(), data.getTo_date());
	data.setLst_payments(lst_payments);
	data.setLst_payments_details(lst_payment_details);
	data.setLst_totals(lst_all_totals);
	data.setLst_accounts(lst_accounts);
	System.out.println(lst_payments.size());
	System.out.println(lst_payment_details.size());
	ObjectMapper mapper=new ObjectMapper();
	String all_data=mapper.writeValueAsString(data);
	System.out.println(all_data);
	if(lst_payments.size()==0)
	{
		
	all_data="no_data";
	}
	return new ResponseEntity<String>(all_data,HttpStatus.OK);
}

@RequestMapping(value="PaymentTransactionOnDate")
public ModelAndView GetDataByDate(ModelAndView model,@RequestParam(value = "facility_id", required = true) int facility_id , @RequestParam(value="date",required = true) String date ) throws ParseException
{
	SimpleDateFormat  formatter = new SimpleDateFormat("dd/MM/yyyy");
	Date date_1=formatter.parse(date);
	String str = new SimpleDateFormat("yyyy-MM-dd").format(date_1);

	Facility fac=shipmentService.getFacilityById(facility_id);
	List<PaymentReport>lst_payments=payrollVendorService.Get_PaymentTotalsOnDate(facility_id, str);
	String product_name="";
	List<PaymentReport>lst_details=payrollVendorService.GetPaymentDetailsOnDate(facility_id, str);
	model.addObject("payments",lst_payments);
	model.addObject("details", lst_details);
	model.addObject("warehouse", fac.getFacility_name());
	/*String ds1 = date;
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
	String ds2 = sdf2.format(sdf1.parse(ds1));
	*/
	model.addObject("date", date);
	model.addObject("productName", product_name);
	model.setViewName("PaymentDetailsOnDate");
	return model;
}
}
