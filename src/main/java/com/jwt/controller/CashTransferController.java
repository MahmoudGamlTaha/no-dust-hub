package com.jwt.controller;

import java.io.IOException;
import java.util.Date;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jwt.model.CashTransferForm;
import com.jwt.model.CashTrasfers;
import com.jwt.model.Facility;
import com.jwt.model.FinancialAccount;
import com.jwt.model.InternalTransfers;
import com.jwt.model.Shipment;
import com.jwt.model.TransactionReport;
import com.jwt.model.TransferAccounts;
import com.jwt.model.User;
import com.jwt.model.UserData;
import com.jwt.service.CashInOutService;
import com.jwt.service.CashOnCoverService;
import com.jwt.service.ReceivingProductsService;
import com.jwt.service.UserService;

@Controller
public class CashTransferController {
	@Autowired
	UserService userservice;
	@Autowired
	ReceivingProductsService rec_service;
	@Autowired
	CashInOutService cashservice;
	@Autowired
	CashOnCoverService cash_oncover_service;
@RequestMapping(value="/CreateCashTransfer")
public ModelAndView CreateCashTransfer(ModelAndView model,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
{
	String display_name="";
	String warehouse_name="";
	User u = new User();
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	UserData user_data=new UserData();
	Facility fac=new Facility();

	HttpSession session=request.getSession();
	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();	
		String user_name=userDetail.getUsername();
		display_name=auth.getName();
		u=userservice.getUser(user_name);
		display_name=u.getDisplay_name();
		fac=rec_service.Get_Facility_Info(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		warehouse_name=fac.getFacility_name();
	}
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	Date date = new Date();
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
	LocalDateTime now = LocalDateTime.now();
	String date_txt=now.toString();
	String[] arr_date=date_txt.split("T");
	List<FinancialAccount> financial_accounts=cashservice.Get_Financial_Accounts(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	List<TransferAccounts>lst_accounts=cashservice.Get_Transfer_account_for_external(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	System.out.println("Account Length = "+financial_accounts.size());
	ModelAndView newMod=new ModelAndView();
	CashTransferForm cash_form=new CashTransferForm();
	cash_form.setLst_accounts(lst_accounts);
	cash_form.setAgent_name(display_name);
	cash_form.setFinancial_accounts(financial_accounts);
	//java.util.Date x=new SimpleDateFormat("dd/MM/yyyy").parse(arr_date[0]);
	cash_form.setRequest_date(dateFormat.format(date));
	cash_form.setAgent_name(display_name+','+u.getUser_name());
	cash_form.setWarehouse_name(warehouse_name);
	newMod.addObject("cash_form", cash_form);
	newMod.setViewName("CreateCashTransfer");
	return newMod;
}


@RequestMapping(value="/SubmitExternalCashTransfer",method=RequestMethod.POST,consumes="application/json")
public ResponseEntity<String> submit_cash_transfer(@RequestBody CashTransferForm cash_form , HttpServletRequest request) throws ParseException
{
	HttpSession session=request.getSession();
	String display_name="";
	String warehouse_name="";
	User u = new User();
	String user_name="";
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	UserData user_data=new UserData();
	Facility fac=new Facility();

	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();	
		 user_name=userDetail.getUsername();
		display_name=auth.getName();
		u=userservice.getUser(user_name);
		display_name=u.getDisplay_name();
		fac=rec_service.Get_Facility_Info(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		warehouse_name=fac.getFacility_name();
	}
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
	LocalDateTime now = LocalDateTime.now();
	Date req_date=new Date();
	//Date x_req=(Date) new SimpleDateFormat("dd/MM/yyyy").parse(cash_form.getRequest_date()); 
	System.out.println(now);
	//String out_transfer="Test_Attachment";
	String out_transfer=cashservice.Submit_External_Cash(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))), user_name, cash_form.getAccount_sku(), req_date, cash_form.getTransfer_date(), cash_form.getAmount(), cash_form.getBank_name(), cash_form.getBank_account_no(), cash_form.getAttachment());
	System.out.println(out_transfer);
	return new ResponseEntity<String>(out_transfer,HttpStatus.OK);
}



@RequestMapping(value="/updateAttachment",method=RequestMethod.POST,consumes="application/json")
public ResponseEntity<String> upload_file(@RequestBody CashTransferForm cash_form)
{
	System.out.println(cash_form.getFile_path());
	System.out.println(cash_form.getShipment_id());
	String out_update=cashservice.Update_attachment(cash_form.getShipment_id(), cash_form.getFile_path());
	return new ResponseEntity<String>(out_update,HttpStatus.OK);
}

@RequestMapping(value="/ViewCashTransferList")
public ModelAndView get_cash_list(HttpServletRequest request) {
	HttpSession session=request.getSession();
	String display_name="";
	String warehouse_name="";
	User u = new User();
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	UserData user_data=new UserData();
	Facility fac=new Facility();

	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();	
		String user_name=userDetail.getUsername();
		display_name=auth.getName();
		u=userservice.getUser(user_name);
		display_name=u.getDisplay_name();
		fac=rec_service.Get_Facility_Info(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		warehouse_name=fac.getFacility_name();
	}
	List<Shipment> ship_lst=cashservice.Get_Cash_Transfer_Shipments(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	List<CashTransferForm> cash_lst_data=cashservice.GetExternalTransfers(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	/*for(int x=0;x<ship_lst.size();x++)
	{
		
		CashTransferForm cash_obj=new CashTransferForm();
		cash_obj.setBank_account_no(ship_lst.get(x).getBank_account_num());
		cash_obj.setBank_name(ship_lst.get(x).getShippment_destination_id());
		cash_obj.setShipment_id(ship_lst.get(x).getId());
		String []req_date=String.valueOf(ship_lst.get(x).getShipment_expected_delivery_date()).split(" ");
		cash_obj.setRequest_date(dateFormat.format(ship_lst.get(x).getShipment_expected_delivery_date()));
		String [] tran_date=String.valueOf(ship_lst.get(x).getShipment_actual_delivery_date()).split(" ");
		cash_obj.setT_date(dateFormat.format(ship_lst.get(x).getShipment_actual_delivery_date()));
		cash_obj.setAttachment(ship_lst.get(x).getBank_attachement());
		cash_lst_data.add(cash_obj);
	}*/
	for(int i=0;i<cash_lst_data.size();i++)
	{
		System.out.println(cash_lst_data.get(i).getShipment_id());
		System.out.println(cash_lst_data.get(i).getBank_name());
	}
	System.out.println(ship_lst.size());
	ModelAndView newmod=new ModelAndView();
	newmod.addObject("cash_lst", cash_lst_data);
	newmod.setViewName("CashTransferList");
	return newmod;
	
	
}

@RequestMapping(value="/ViewCashTransferDetails")
public ModelAndView get_cash_shipment_data(@RequestParam(value="shipment_id",required=true) int shipment_id)
{
	Shipment sh=rec_service.get_ship_data_by_id(shipment_id);
	String Agent_name=cashservice.GetAgentDisplayName(shipment_id);
	String account_sku=cashservice.Get_Account(shipment_id);
	CashTransferForm cash_form=new CashTransferForm();
	cash_form.setAgent_name(Agent_name);
	cash_form.setAmount(Double.parseDouble(sh.getShipment_actual_money_out()));
	/*String pattern = "####,###.##";
	   // double number = 123456789.123;
	    
	    DecimalFormat numberFormat = new DecimalFormat(pattern);
	    String d=numberFormat.toString();
	    String x_amount=numberFormat.format(Double.parseDouble(sh.getShipment_actual_money_out()));*/
	    cash_form.setCash_amount(Double.parseDouble(sh.getShipment_actual_money_out()));
	cash_form.setAttachment(sh.getBank_attachement());
	System.out.println(sh.getBank_attachement());
	cash_form.setBank_account_no(sh.getBank_account_num());
	System.out.println(sh.getShippment_destination_id());
	cash_form.setBank_name(sh.getShippment_destination_id());
	Facility fac=new Facility();
	fac=rec_service.Get_Facility_Info(Integer.parseInt(sh.getShippment_souce_id()));
	String account_name=cashservice.get_Account_bby_id(account_sku);
			
	cash_form.setAccount_sku(account_name);
	cash_form.setWarehouse_name(fac.getFacility_name());
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

	String []r_d=String.valueOf(sh.getShipment_expected_delivery_date()).split(" ");
	cash_form.setRequest_date(dateFormat.format(sh.getShipment_expected_delivery_date()));
	String [] t_d=String.valueOf(sh.getShipment_actual_delivery_date()).split(" ");
	cash_form.setT_date(dateFormat.format(sh.getShipment_actual_delivery_date()));
	cash_form.setShipment_id(shipment_id);
	ModelAndView newMod=new ModelAndView();
	newMod.addObject("cash_form", cash_form);
	newMod.setViewName("CashTransferDetails");
	return newMod;
}

@RequestMapping(value="InternalCashTransferList")
public ModelAndView InternalListTransfers(ModelAndView model,HttpServletRequest request)
{
	HttpSession session=request.getSession();
	List<InternalTransfers> lst_transfers=cashservice.GetInternalTransfers(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	model.addObject("cash_lst", lst_transfers);

	model.setViewName("InternalTransferList");
return model;	
}

@RequestMapping(value="/ViewInternalCashTransferDetails")
public ModelAndView get_internal_cash_shipment_data(@RequestParam(value="shipment_id",required=true) int shipment_id)
{
	//Shipment sh=rec_service.get_ship_data_by_id(shipment_id);
	String Agent_name=cashservice.GetAgentDisplayName(shipment_id);
	List<InternalTransfers>lst=cashservice.GetInternalTransferById(shipment_id);
	ModelAndView newMod=new ModelAndView();
	newMod.addObject("cash_form", lst.get(0));
	newMod.addObject("agent", Agent_name);
	newMod.setViewName("InternalCashTransferDetails");
	return newMod;
}


@RequestMapping(value="CashTransferReport")
public ModelAndView CashTransferPayments(ModelAndView model , HttpServletRequest request)
{
	List<Facility> lst_facility=cash_oncover_service.Get_Facilites();
	List<TransferAccounts> lst_accounts=cashservice.Get_Accounts_For_Report();
	model.addObject("warehouses", lst_facility);
	model.addObject("lst_accounts", lst_accounts);
	model.setViewName("CashTransferReport");
	return model;
}
@RequestMapping(value="GetTransfers",method=RequestMethod.POST,consumes = "application/json" , produces = "application/json;charset=UTF-8")
public ResponseEntity<String> Get_Transfers(@RequestBody TransactionReport data) throws JsonProcessingException
{
	List<CashTrasfers>lst_transfers=cashservice.Get_Transfers(data.getFacility_id(), data.getProduct_id(), data.getFrom_date(), data.getTo_date());
	ObjectMapper mapper=new ObjectMapper();
	String data_out=mapper.writeValueAsString(lst_transfers);
	if(lst_transfers.size()==0)
	{
		data_out="noprod";
	}
	return new ResponseEntity<String>(data_out,HttpStatus.OK);
}
}
