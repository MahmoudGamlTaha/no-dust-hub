package com.jwt.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jwt.model.CashInOutForm;
import com.jwt.model.DirtyFinancialAccount;
import com.jwt.model.Facility;
import com.jwt.model.FinancialAccount;
import com.jwt.model.InventoryFormData;
import com.jwt.model.TransferAccounts;
import com.jwt.model.User;
import com.jwt.service.CashInOutService;
import com.jwt.service.CashOnCoverService;
import com.jwt.service.ReceivingProductsService;
import com.jwt.service.ReleasingProductsService;
import com.jwt.service.UserService;

@Controller
public class InternalCashTransferController{
	
	@Autowired
	private ReleasingProductsService shipmentService;
	@Autowired
	private UserService userService;
	
	@Autowired
	private CashOnCoverService cashcoverService;
	
	@Autowired
	private CashInOutService CashInOutService;
	@Autowired
	private ReceivingProductsService shipmentServiceRecieve;
	
	@RequestMapping(value = "/InternalCashTransfer")
	public ModelAndView InternalCashTransfer(ModelAndView model , HttpServletRequest request) throws IOException {
		User u = new User();
		HttpSession session=request.getSession();
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
		List<FinancialAccount>accounts = cashcoverService.getFinancialAccounts(facility.getId());
		List<TransferAccounts>from_accounts=cashcoverService.Get_From_accounts(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		List<TransferAccounts>to_accounts=cashcoverService.Get_To_Accounts(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		 /*List<DirtyFinancialAccount> dirty_accounts=shipmentServiceRecieve.getdirtyFinancialAccounts(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		 for(int i =0 ;i< dirty_accounts.size();i++)
		 {
			 FinancialAccount fin = new FinancialAccount();
			 fin.setDms_product_id(dirty_accounts.get(i).getDms_product_id());
			 fin.setFacility_id(dirty_accounts.get(i).getFacility_id());
			 fin.setProduct_id(dirty_accounts.get(i).getProduct_id());
			 fin.setProduct_name(dirty_accounts.get(i).getProduct_name());
			 fin.setProduct_sku(dirty_accounts.get(i).getProduct_sku());
			 fin.setTotal_stock_quantity(new BigDecimal( dirty_accounts.get(i).getTotal_stock_quantity()));
			 accounts.add(fin);
		 }*/
		List<Facility> lst_facilites=cashcoverService.Get_Facilites();
		int fac_id=Integer.parseInt(String.valueOf(session.getAttribute("fac_id")));
		model.addObject("accounts", accounts);
		model.addObject("warehouseName", facility.getFacility_name());
		model.addObject("agentName", u.getDisplay_name()+','+u.getUser_name());
		model.addObject("date",  dateFormat.format(date));
		model.addObject("from_accounts", from_accounts);
		model.addObject("to_accounts", to_accounts);
		model.addObject("lst_facilites", lst_facilites);
		model.addObject("fac_id", fac_id);
		model.setViewName("InternalCashTransfer");
		return model;
	}

	@RequestMapping(value = "/submitInternalCashTransfer", method = RequestMethod.POST,consumes ="application/json")
	public ResponseEntity<String> submitInternalCashTransfer(@RequestBody CashInOutForm cashForm ,HttpServletRequest request)throws ServletException, IOException {

		HttpSession session=request.getSession();
		//Gson gson = new Gson();
		//String json = gson.toJson(inventoryForm.getProducts());
		//	System.out.println("json : "+ cashForm.getSource() +"-"+ cashForm.getDestination()+"-"+cashForm.getRecievedCash()+"-"+cashForm.getComment());
		   User u = new User();
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (!(auth instanceof AnonymousAuthenticationToken)) {
				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				System.out.println(userDetail);
			String user="";
			user=userDetail.getUsername();
		    u=userService.getUser(user);

			}
			String submited = new String();
			if(u.getUSER_NAME() != null)
			{
				
				//System.out.println("json : "+u.getOrg_unit_id()+"-"+ u.getUser_name()+"-"+ cashForm.getSource() +"-"+ cashForm.getDestination()+"-"+cashForm.getRecievedCash()+"-"+cashForm.getComment());

				submited= CashInOutService.transferInternalCash(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))), u.getUser_name(), cashForm.getSource(), cashForm.getDestination(), cashForm.getRecievedCash(), cashForm.getComment(),cashForm.getDes_id(),cashForm.getSrc_type());

			}
			else {
				return new ResponseEntity<String>("no session", HttpStatus.OK);
			}
			System.out.println("submited : "+submited);
			if(submited.equals("true"))
			{
				return new ResponseEntity<String>("success", HttpStatus.OK);

			}
			else {
				return new ResponseEntity<String>(submited, HttpStatus.OK);

			}
	}


}
