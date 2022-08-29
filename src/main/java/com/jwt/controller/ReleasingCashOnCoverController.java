package com.jwt.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jwt.model.CashOnCoverForm;
import com.jwt.model.Driver;
import com.jwt.model.Facility;
import com.jwt.model.FinancialAccount;
import com.jwt.model.ProductListsCoverForm;
import com.jwt.model.Shipment;
import com.jwt.model.ShipmentLog;
import com.jwt.model.ShipmentProduct;
import com.jwt.model.User;
import com.jwt.service.CashOnCoverService;
import com.jwt.service.ReleasingProductsService;
import com.jwt.service.UserService;



@Controller
public class ReleasingCashOnCoverController {

	@Autowired
	private ReleasingProductsService shipmentService;
	
	@Autowired
	private CashOnCoverService cashcoverService;
	
	@Autowired
	private UserService userService;
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    binder.setAutoGrowCollectionLimit(1000);
	}
	
	@RequestMapping(value = "/DispatchingCashOnCover")
	public ModelAndView listEmployee(ModelAndView model , HttpServletRequest request) throws IOException {
		HttpSession session=request.getSession();
		Facility facility = new Facility();
		
		User u = new User();
	//	ProductListsCoverForm actual = (ProductListsCoverForm)model.getModelMap().get("productsLst");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();	
		    u=userService.getUser(userDetail.getUsername());
		   // System.out.println("facility"+u.getOrg_unit_id());
		    facility = shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		
		}
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		List<Shipment> shipments = cashcoverService.getAllShipment(facility.getId(), dateFormat.format(date));
		List<Driver> drivers = shipmentService.GetAllDrivers();
		System.out.println("size = "+drivers.size());
		model.addObject("driverslst", drivers);
		model.addObject("shipmentlst",shipments );
		model.setViewName("ReleasingCashOnCover");
		return model;
	}

	
	@RequestMapping(value = "/DispatchingCashOnCoverDetails", method = RequestMethod.GET)
	public ModelAndView ReleasingCashOnCoverDetails(ModelAndView model,@RequestParam(value = "shipment_id", required = true) int shipment_id,@RequestParam(value = "UserName", required = true) String username,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        Facility facility = new Facility();
		CashOnCoverForm cashOnCoverForm = new CashOnCoverForm();
		User u = new User();
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
	//	ProductListsCoverForm actual = (ProductListsCoverForm)model.getModelMap().get("productsLst");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();	
		    u=userService.getUser(userDetail.getUsername());
		    facility = shipmentService.getFacilityById(u.getOrg_unit_id());
		
		}
		List<ShipmentProduct> shipmentProducts = cashcoverService.getShipmentProducts(shipment_id);
		for(int i =0 ;i<shipmentProducts.size();i++) 
		{
			System.out.println(shipmentProducts.get(i).getQuantity_shipped());
		}
		List<FinancialAccount>accounts = cashcoverService.getFinancialAccounts(facility.getId());
		List<String> areas = cashcoverService.getAreasOfCash(username, Integer.toString(shipment_id));
		String AllAreas = "";
		if(areas!=null)
		{
		if(areas.size()>0)
		{
		for(int i=0;i<areas.size();i++)
		{
			if (i>0)
				AllAreas+=",";
			AllAreas+=areas.get(i);
		}
		}
		}
		Driver driver= shipmentService.getDriverById(username);
		ShipmentLog log = cashcoverService.getShipmentLog(shipment_id);
		//System.out.println("size="+shipmentProducts.size());
		cashOnCoverForm.setProductslst(shipmentProducts);
		cashOnCoverForm.setAccounts(accounts);
		//cashOnCoverForm.setActualCash(26.3);
		cashOnCoverForm.setAreaName(AllAreas);
		cashOnCoverForm.setExpectedCash(0.00);
		cashOnCoverForm.setShipment_id(shipment_id);
		cashOnCoverForm.setWareHouseName(facility.getFacility_name());
		cashOnCoverForm.setDriver(driver);
		cashOnCoverForm.setAgentName(log.getLogged_user());
		cashOnCoverForm.setAssignDate(dateFormat.format(date));
		ModelAndView newMod = new ModelAndView();
		newMod.addObject("data", cashOnCoverForm);
    	newMod.setViewName("ReleasingCashOnCoverDetails");
	
		return newMod;
	}
	//submitCashOnCover
	
	@RequestMapping(value = "/submitCashOnCover", method = RequestMethod.POST,consumes ="application/json")
	public ResponseEntity<String> submitCoverDetails(@RequestBody CashOnCoverForm cashCoverForm)throws ServletException, IOException {
		//System.out.println("size "+prCoverForm.getCoverProducts().size());
		//Gson gson = new Gson();
		  // String json = gson.toJson(prCoverForm.getCoverProducts());
		  System.out.println("expectee"+ cashCoverForm.getExpectedCash());
		  
			//System.out.println("Actual : "+prCoverForm.getCoverProducts().get(0).getActual_quantity());
		   User u = new User();
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
				submited=cashcoverService.submitCashOnCover(cashCoverForm.getShipment_id(), cashCoverForm.getSelected_product_id(), u.getUSER_NAME(), cashCoverForm.getActualCash(), cashCoverForm.getExpectedCash());	

			}
			else {
				return new ResponseEntity<String>("no session", HttpStatus.OK);
			}
			System.out.println(cashCoverForm.getShipment_id()+" "+ cashCoverForm.getSelected_product_id()+" " +u.getUSER_NAME()+" "+ cashCoverForm.getActualCash()+" "+ cashCoverForm.getExpectedCash());
			System.out.println("submited : "+submited);
			if(submited.equals("true"))
			{
				return new ResponseEntity<String>("success", HttpStatus.OK);
				//request.setAttribute("error","SubmitedSucessfully");

			}
			else {
				//request.setAttribute("error","notDone");
				return new ResponseEntity<String>("not success", HttpStatus.OK);
			//	model.addObject("error","notDone");

			}
			//return "ReleasingCashOnCoverDetails";
	}
	

	
	@RequestMapping(value = "/viewshipmentlist")
	public ModelAndView viewshipmentlist(ModelAndView model) throws IOException {
		
		ModelAndView newMod = new ModelAndView();
		newMod.setViewName("viewshipmentlist");
		return newMod;
	}

	
	@RequestMapping(value = "/shipmentdetails")
	public ModelAndView shipmentdetails(ModelAndView model) throws IOException {
		
		ModelAndView newMod = new ModelAndView();
		newMod.setViewName("shipmentdetails");
		return newMod;
	}

	
	
}


