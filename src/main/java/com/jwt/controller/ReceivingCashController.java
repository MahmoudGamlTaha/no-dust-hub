package com.jwt.controller;

import java.io.IOException;
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

import com.jwt.model.CashInOutForm;
import com.jwt.model.Employee;
import com.jwt.model.Facility;
import com.jwt.model.ReceiveCashFinancailAccount;
import com.jwt.model.User;
import com.jwt.service.ReceivingCashService;
import com.jwt.service.ReleasingProductsService;
import com.jwt.service.UserService;

@Controller
public class ReceivingCashController {
	
	@Autowired
	private UserService userService;

	
	@Autowired
	private ReleasingProductsService shipmentService;
	
	@Autowired
	private ReceivingCashService receivingCashService;
	
	
	@RequestMapping(value = "ReceivingCash")
	public ModelAndView login(ModelAndView model , HttpServletRequest request) throws IOException {
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
		List<ReceiveCashFinancailAccount>accounts = receivingCashService.getAllAccounts();
		CashInOutForm cashInOutForm = new CashInOutForm();
		List<Employee> lst_employees = receivingCashService.getAllEmployee();
		cashInOutForm.setReceiveCashFinancailAccounts(accounts);
		cashInOutForm.setEmployees(lst_employees);
		cashInOutForm.setAssignDate(dateFormat.format(date));
		cashInOutForm.setAgentName(u.getDisplay_name()+','+u.getUSER_NAME());
		cashInOutForm.setWareHouseName(facility.getFacility_name());
		model.addObject("formData", cashInOutForm);
		model.setViewName("RecievingCash");
		return model;
	}
	
	
	@RequestMapping(value = "/submitCashReceived",  method = RequestMethod.POST,consumes ="application/json")
	public  ResponseEntity<String> submitCashInOut(@RequestBody CashInOutForm cashInOutForm,HttpServletRequest request)throws ServletException, IOException {
		  User u = new User();
		  HttpSession session=request.getSession();
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (!(auth instanceof AnonymousAuthenticationToken)) {
				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				System.out.println(userDetail);
			String user="";
			user=userDetail.getUsername();
		//	System.out.println("user : "+user);
		//	System.out.println("auth :"+userDetail.getAuthorities());
		//	List<UserTeam> listTeam = userTeamService.getAllUserTeam(user);
		    u=userService.getUser(user);
			}
			String submited = new String();
			if(u.getUSER_NAME() != null)
			{
				submited=receivingCashService.submitReceiveCash(cashInOutForm.getSelected_product_id(), u.getUSER_NAME(),cashInOutForm.getRecievedCash(),cashInOutForm.getSelectedDriver(),cashInOutForm.getComment(),Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));

			}
			else {
				return new ResponseEntity<String>("no session", HttpStatus.OK);
			}
			
			System.out.println(cashInOutForm.getSelected_product_id()+" "+ u.getUSER_NAME()+" "+cashInOutForm.getRecievedCash()+" "+cashInOutForm.getSelectedDriver());
			System.out.println("submited "+ submited);
			
			if(submited.equals("true"))
			{
				//request.setAttribute("error","SubmitedSucessfully");
				return new ResponseEntity<String>("success", HttpStatus.OK);

			}
			else {
				//request.setAttribute("error","notDone");
				return new ResponseEntity<String>("not success", HttpStatus.OK);

			//	model.addObject("error","notDone");

			}
	
	}
}
