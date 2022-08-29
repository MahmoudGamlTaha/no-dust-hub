package com.jwt.controller;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.model.ActualCounts;
import com.jwt.model.ActualCountsData;
import com.jwt.model.ActualQuantity;
import com.jwt.model.Actuals;
import com.jwt.model.ActualsForm;
import com.jwt.model.AllShipments;
import com.jwt.model.Consumable;
import com.jwt.model.DriverAuthentication;
import com.jwt.model.Facility;
import com.jwt.model.Lost_RLostProducts;
import com.jwt.model.ProductsType;
import com.jwt.model.ReconciliationNewCancelCounts;
import com.jwt.model.Reconciliation_Data;
import com.jwt.model.Reconciliation_Model;
import com.jwt.model.Reconciliation_Posted;
import com.jwt.model.Shipment;
import com.jwt.model.ShipmentDetailsData;
import com.jwt.model.ShipmentList;
import com.jwt.model.ShipmentListForm;
import com.jwt.model.ShipmentLog;
import com.jwt.model.ShipmentProduct;
import com.jwt.model.User;
import com.jwt.model.UserRole;
import com.jwt.model.ValidateCarProduct;
import com.jwt.model.ValidationData;
import com.jwt.model.drivers;


import com.jwt.service.UserService;
import com.jwt.service.CashOnCoverService;
import com.jwt.service.CreateDirtyShipmentService;
import com.jwt.service.ReceivingProductsService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
public class ReconciliationController {
	
	
	
	@Autowired
	private ReceivingProductsService receivingService;
	@Autowired
	private CashOnCoverService cash_service;
	@Autowired
	private UserService userService;
	@Autowired
	private CreateDirtyShipmentService createDirtyService;
	private static final Logger logger = Logger
			.getLogger(ReconciliationController.class);
	
	
	
	@RequestMapping(value="/ReceivingProduct")
	public ModelAndView receivingProducts (HttpServletRequest request,ModelAndView model) throws IOException
	{
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("cred : "+auth.getCredentials());
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
		String user="";
		List<drivers> lst_drivers = receivingService.GetAllDrivers();
		
		DriverAuthentication selected_driver = new DriverAuthentication();
		model.addObject("selected_driver", selected_driver);
		System.out.println("drivers count = "+lst_drivers.get(0).getUser_name());
		model.addObject("lst_drivers", lst_drivers);
		user=userDetail.getUsername();
		System.out.println("user : "+user);
		//System.out.println("auth :"+userDetail.getAuthorities());
		
		User u=userService.getUser(user);
		System.out.println("user State :"+u.getActive());
	    u.setActive(1);
	    userService.updateUser(u);
		 
		  
		    request.getSession().setAttribute("active", u.getActive());
		    request.getSession().setAttribute("user",u);
		    
		    String teams="";

		}
		
		
		model.setViewName("ReceivingProduct");
		return model;
	}
	@RequestMapping(value="/Actuals")
	public ModelAndView getactuals(ModelAndView model,@RequestParam(value = "driver_id", required = true) String driver_id,HttpServletRequest request, HttpServletResponse response)
	{

		
		String username="";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user=new User();
		Facility fac=new Facility();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		username=userDetail.getUsername();
		user=userService.getUser(username);
		fac=receivingService.Get_Facility_Info(user.getOrg_unit_id());
		}
		List<Shipment>lst_ship_exist=receivingService.Check_Shipment_Exist(driver_id, user.getOrg_unit_id());
		Date rec_date;
		int status;
		if(lst_ship_exist.size()!=0)
		{
			String check_date=String.valueOf(lst_ship_exist.get(0).getShipment_actual_delivery_date());
			String [] date_arr=check_date.split(" ");
			String ship_date_check=date_arr[0];
			LocalDate date=LocalDate.now();
			rec_date=java.sql.Date.valueOf(date);
			String check_current=String.valueOf(rec_date);
			if(ship_date_check.equals(check_current))
			{
				int status_x=Integer.parseInt(lst_ship_exist.get(0).getLast_status());
				if(status_x==14||status_x==7||status_x==8||status_x==9||status_x==10)
				{
					
				}
				else
				{
				ModelAndView newMod=new ModelAndView();
				List<drivers> lst_drivers = receivingService.GetAllDrivers();
				DriverAuthentication selected_driver = new DriverAuthentication();
				newMod.addObject("selected_driver", selected_driver);
				newMod.addObject("lst_drivers", lst_drivers);
				newMod.setViewName("ReceivingProduct");
				return newMod;
				}
			}
			if(lst_ship_exist.get(0).getLast_status()!=null||lst_ship_exist.get(0).getLast_status()!="")
			{
				status=Integer.parseInt(lst_ship_exist.get(0).getLast_status());
				
				if(status==12||status==13)
				{
					ModelAndView newMod=new ModelAndView();
					List<drivers> lst_drivers = receivingService.GetAllDrivers();
					DriverAuthentication selected_driver = new DriverAuthentication();
					newMod.addObject("selected_driver", selected_driver);
					newMod.addObject("lst_drivers", lst_drivers);
					newMod.setViewName("ReceivingProduct");
					return newMod;
				}
			}
		}
		ActualsForm rec_form=new ActualsForm();
		LocalDate date=LocalDate.now();
		rec_date=java.sql.Date.valueOf(date);
		List<drivers>lst_driver=receivingService.Get_Driver_by_UserName(driver_id);
		String area_name=receivingService.Get_Area_Name(driver_id);
		rec_form.setArea_name(area_name);
		rec_form.setDriver_name(lst_driver.get(0).getFull_name_en());
    	 rec_date=java.sql.Date.valueOf(date);
    	 DateFormat format=new SimpleDateFormat("dd-MM-yyyy");
		rec_form.setDriver_id(driver_id);
		rec_form.setRec_date(rec_date);
		//rec_form.setShip_id(shipment_id);
		rec_form.setAgent_name(user.getDisplay_name()+','+username);
		rec_form.setWarehouse_name(fac.getFacility_name());
		List<ReconciliationNewCancelCounts>rec_data=receivingService.Get_Actuals(driver_id);
		List<Actuals>actual_data=new ArrayList<Actuals>();
		
		for(int i=0;i<rec_data.size();i++)
		{
			Actuals act=new Actuals();
			act.setProduct_id(rec_data.get(i).getProduct_id());
			act.setTreatment_id(rec_data.get(i).getTreatment_id());
			act.setDriver_id(rec_data.get(i).getDriver_id());
			
			act.setDms_cancel(rec_data.get(i).getDms_cancel());
			act.setDms_new(rec_data.get(i).getDms_new());
			act.setProduct_type(rec_data.get(i).getProduct_type());
			act.setProduct_sku(rec_data.get(i).getProduct_sku());
			act.setProduct_name(rec_data.get(i).getProduct_name());
			//act.setRlost(1);
			System.out.println(act.getProduct_name());
			actual_data.add(act);
		}
		
		List<drivers> accountable=receivingService.GetAllDrivers();
		rec_form.setActual_data(actual_data);
		model.addObject("Date", format.format(rec_date));
		model.addObject("Rec_data", rec_form);
		return model;
	}
	@RequestMapping(value = "/submitactuals", method =RequestMethod.POST,consumes="application/json")
	public ResponseEntity<String>submitactuals(@RequestBody ActualsForm rec_form)throws ServletException, IOException {
	Shipment ship_data=cash_service.get_shipment_data(rec_form.getShip_id());
	int status=0;
	String check_ship_date="";
	String check_ship_date2="";
	if(ship_data!=null)
	{
		status=Integer.valueOf(ship_data.getLast_status());
		String[] date_arr=String.valueOf(ship_data.getShipment_actual_delivery_date()).split(" ");
		LocalDate date=LocalDate.now();

    	Date rec_date=java.sql.Date.valueOf(date);
    	check_ship_date2=String.valueOf(rec_date);
		check_ship_date=date_arr[0];
		System.out.println(check_ship_date2);
		System.out.println(check_ship_date);
System.out.println("Status:"+status);
		
	}
	if(status==12||status==13||((check_ship_date.equals(check_ship_date2))&&(status==7||status==8||status==9||status==10)))
	{
	
		List<ActualQuantity> quantity=new ArrayList<ActualQuantity>();
	for(int i=0;i<rec_form.getActual_counts().size();i++) {
		ActualQuantity act_quan=new ActualQuantity();
		act_quan.setActual_calculated(rec_form.getActual_counts().get(i).getActual_calculated());
		act_quan.setActual_Quantity(rec_form.getActual_counts().get(i).getActual_Quantity());
		act_quan.setDms_product_id(rec_form.getActual_counts().get(i).getDms_product_id());
		act_quan.setDriver_id(rec_form.getActual_counts().get(i).getDriver_id());
		act_quan.setExpected_clean(rec_form.getActual_counts().get(i).getExpected_clean());
		act_quan.setExpected_dirty(rec_form.getActual_counts().get(i).getExpected_dirty());
		act_quan.setProduct_sku(rec_form.getActual_counts().get(i).getProduct_sku());
		act_quan.setProduct_type(rec_form.getActual_counts().get(i).getProduct_type());
		act_quan.setProudct_name(rec_form.getActual_counts().get(i).getProudct_name());
		act_quan.setQuantity(rec_form.getActual_counts().get(i).getQuantity());
		act_quan.setRecon_clean(rec_form.getActual_counts().get(i).getRecon_clean());
		act_quan.setRecon_dirty(rec_form.getActual_counts().get(i).getRecon_dirty());
		act_quan.setTreatment_id(rec_form.getActual_counts().get(i).getTreatment_id());
		quantity.add(act_quan);
	}
		Gson gson_products=new Gson();
		String json_data=gson_products.toJson(quantity);
		
		
		System.out.println(rec_form.getAgent_name());
		System.out.println(rec_form.getDriver_id());
		System.out.println(rec_form.getShip_id());
		System.out.println("Data"+json_data);
		String out_save="";
		String username="";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user=new User();
		
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		username=userDetail.getUsername();
		user=userService.getUser(username);
		}
		out_save=receivingService.save_reconciliation_clean_dirty_counts(rec_form.getDriver_id(), username, json_data, rec_form.getShip_id());
		System.out.println(out_save);
		if (out_save.equals("true"))
		{
			return new ResponseEntity<String>("done",HttpStatus.OK);
		}
	}
	else
	{
		
		return new ResponseEntity<String>("alreadysubmitted",HttpStatus.OK);
	}
	return new ResponseEntity<String>("notdone",HttpStatus.OK);
		/*List<ValidateCarProduct>validation_data=receivingService.ValidatedQuan(rec_form.getShip_id());
		System.out.println(validation_data.size());
		rec_form.setValidation_data(validation_data);
        model.addObject("Rec_data", rec_form);

		model.setViewName("redirect:/ReconciliationValidate?param1="+rec_form.getShip_id()+"&param2="+rec_form.getDriver_id()+"&param3="+rec_form.getRec_date());
		
		return model;*/
	}
	@RequestMapping(value = "/ReconciliationValidate")
	public ModelAndView validation(@ModelAttribute("Rec_data")ActualsForm rec_form,ModelAndView model,@RequestParam(value = "driver_id", required = true) String driver_id,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	ModelAndView newMod=new ModelAndView();
	System.out.println("Size"+rec_form.getAgent_name());
	
	
	String username="";
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	User user=new User();
	Facility fac=new Facility();
	if (!(auth instanceof AnonymousAuthenticationToken)) {
	UserDetails userDetail = (UserDetails) auth.getPrincipal();
	username=userDetail.getUsername();
	user=userService.getUser(username);
	fac=receivingService.Get_Facility_Info(user.getOrg_unit_id());
	}
	List<Shipment>lst_ship=receivingService.Check_Shipment_Exist(driver_id,user.getOrg_unit_id());
	if(lst_ship.size()!=0)
	{
		int status=Integer.parseInt(lst_ship.get(0).getLast_status());
		if(status==15||status==16||status==7||status==8||status==9||status==10)
		{
	String Area_name=receivingService.Get_Area_Name(driver_id);
	rec_form.setArea_name(Area_name);
	List<ValidateCarProduct>validation_data=receivingService.ValidatedQuan(lst_ship.get(0).getId());
	if(validation_data.size()==0)
	{
		String Rel_sh=receivingService.Get_Related_Shipments(lst_ship.get(0).getId());
		String [] rel_arr=Rel_sh.split(",");
		if(rel_arr.length!=0)
		{
			
			for(int i=0;i<rel_arr.length;i++)
			{
				String area_x=receivingService.Get_Area_Name_By_Shipment(Integer.parseInt(rel_arr[i]));
				if(area_x!=""||area_x!=null)
				{
					Area_name=Area_name+area_x;
					if(rel_arr.length-i>1)
					{
						Area_name=Area_name+',';
					}
				}
			}
			rec_form.setArea_name(Area_name);
		}
		List<ValidationData> Data_after_submission=receivingService.Get_validation_submitted(lst_ship.get(0).getId());
		List<ValidateCarProduct>lst_data=new ArrayList<ValidateCarProduct>();
		System.out.println(Data_after_submission.size());
		for(int i=0;i<Data_after_submission.size();i++)
		{
			ValidationData vd=Data_after_submission.get(i);
			ValidateCarProduct cp=new ValidateCarProduct();
			cp.setActual_calculated(vd.getActual_calculated());
			cp.setActual_clean(vd.getActual_clean());
			cp.setActual_dirty(vd.getActual_dirty());
			cp.setClean_actual_new(vd.getClean_actual_new());
			cp.setClean_dms(vd.getClean_dms());
			cp.setClean_expected_new(vd.getClean_expected_new());
			cp.setClean_manual_new(vd.getClean_manual_new());
			cp.setDirty_cancel(vd.getDirty_cancel());
			cp.setDirty_dms(vd.getDirty_dms());
			cp.setDirty_lost(vd.getDirty_lost());
			cp.setDirty_manual_cancel(vd.getDirty_manual_cancel());
			cp.setDirty_rlost(vd.getDirty_rlost());
			cp.setDms_product_id(vd.getDms_product_id());
			cp.setLost(vd.getLost());
			cp.setPass_fail(vd.getPass_fail());
			cp.setProduct_name(vd.getProduct_name());
			cp.setShipment_id(vd.getShipment_id());
			lst_data.add(cp);
		}
		System.out.println(lst_data.size());
		rec_form.setValidation_data(lst_data);
		model.addObject("request_state", "done");
		String Name=receivingService.Get_Driver_by_UserName(driver_id).get(0).getFull_name_en();
		rec_form.setDriver_name(Name);
		rec_form.setAgent_name(user.getDisplay_name()+','+username);
		rec_form.setWarehouse_name(fac.getFacility_name());
		rec_form.setDriver_id(driver_id);
		String date_txt=String.valueOf(lst_ship.get(0).getShipment_actual_delivery_date());
		String [] date_arr=date_txt.split(" ");
		LocalDate date=LocalDate.now();

		DateFormat format=new SimpleDateFormat("dd-MM-yyyy");
		Date rec_date=java.sql.Date.valueOf(date);
		rec_form.setRec_date(rec_date);
		
		rec_form.setShip_id(lst_ship.get(0).getId());
		model.addObject("Rec_data",rec_form);
		model.addObject("date", format.format(lst_ship.get(0).getShipment_actual_delivery_date()));
		model.setViewName("ValidateReconciliation");
		return model;
		/*
List<drivers> lst_drivers = receivingService.GetAllDrivers();
		
		DriverAuthentication selected_driver = new DriverAuthentication();
		model.addObject("selected_driver", selected_driver);
		System.out.println("drivers count = "+lst_drivers.get(0).getUser_name());
		model.addObject("lst_drivers", lst_drivers);
		model.setViewName("ReceivingProduct");*/
	}
	String Name=receivingService.Get_Driver_by_UserName(driver_id).get(0).getFull_name_en();
	rec_form.setDriver_name(Name);
	rec_form.setAgent_name(user.getDisplay_name()+','+username);
	rec_form.setWarehouse_name(fac.getFacility_name());
	rec_form.setDriver_id(driver_id);
	String date_txt=String.valueOf(lst_ship.get(0).getShipment_actual_delivery_date());
	String [] date_arr=date_txt.split(" ");
	LocalDate date=LocalDate.now();

	Date rec_date=java.sql.Date.valueOf(date);
	DateFormat format2=new SimpleDateFormat("dd-MM-yyyy");
	rec_form.setRec_date(rec_date);
	rec_form.setValidation_data(validation_data);
	rec_form.setShip_id(lst_ship.get(0).getId());
	model.addObject("Rec_data",rec_form);
	model.addObject("date", format2.format(lst_ship.get(0).getShipment_actual_delivery_date()));
	model.setViewName("ValidateReconciliation");
	return model;
	}
		else
		{
	List<drivers> lst_drivers = receivingService.GetAllDrivers();
			
			DriverAuthentication selected_driver = new DriverAuthentication();
			model.addObject("selected_driver", selected_driver);
			model.addObject("lst_drivers", lst_drivers);
			model.setViewName("ReceivingProduct");
			return model;
		}
	}
	
	return model;
	}
	@RequestMapping(value="/CheckDriverAuth",method=RequestMethod.POST,consumes = "application/json")
	public ResponseEntity<String> Check_Driver_Code(@RequestBody DriverAuthentication selected_driver)
	{
		String Auth = receivingService.checkAuthentication(selected_driver.getSelectedDriver(), selected_driver.getCode());

		if (Auth.equals("Not Auth"))
		{			
			return new ResponseEntity<String>("not autheticate",HttpStatus.OK);
		}
		else
		{
			return new ResponseEntity<String>("Auth",HttpStatus.OK);

		}
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/submitReceivingProduct", method = RequestMethod.POST,consumes ="application/json")
	public ResponseEntity<String> checkAuth(@RequestBody DriverAuthentication selected_driver,ModelAndView model)throws ServletException, IOException {
		User user=new User();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		String username="";
		username=userDetail.getUsername();
		user=userService.getUser(username);
		Facility fac=receivingService.Get_Facility_Info(user.getOrg_unit_id());
		
		//	DriverAuthentication selected=(DriverAuthentication) model.getModel().get("selected_driver");
	//	System.out.println("Driver is "+ selected_driver.getSelectedDriver());
		String Auth = receivingService.checkAuthentication(selected_driver.getSelectedDriver(), selected_driver.getCode());
		ModelAndView newMod = new ModelAndView();		

		if (Auth.equals("Not Auth"))
		{
			model.addObject("error","not autheticate");
			List<drivers> lst_drivers = receivingService.Get_Drivers_Pilots();
			model.addObject("selected_driver", selected_driver);
			System.out.println(selected_driver.getSelectedDriver());

			model.addObject("lst_drivers", lst_drivers);

			model.setViewName("ReceivingProduct");
			return new ResponseEntity<String>("not autheticate",HttpStatus.OK);
		}
		List<Shipment>lst_shipmentsrec=receivingService.Check_Shipment_Exist(selected_driver.getSelectedDriver(),user.getOrg_unit_id());
		if(lst_shipmentsrec.size()!=0)
		{
			System.out.println("x");
			String check_date=String.valueOf(lst_shipmentsrec.get(0).getShipment_actual_delivery_date());
			String [] date_arr=check_date.split(" ");
			String ship_date_check=date_arr[0];
			LocalDate date1=LocalDate.now();
			Date rec_date1=java.sql.Date.valueOf(date1);
			String check_current=String.valueOf(rec_date1);
			if(ship_date_check.equals(check_current))
			{
				System.out.println("status:"+lst_shipmentsrec.get(0).getLast_status());
				int statusOfShipment=Integer.parseInt(lst_shipmentsrec.get(0).getLast_status());
				/*if(statusOfShipment==12||statusOfShipment==13||statusOfShipment==15||statusOfShipment==16)
				{
					return new ResponseEntity<String>("notworecon",HttpStatus.OK);
				}*/
			}
		}
		System.out.println(selected_driver.getSelectedDriver());
		List<ReconciliationNewCancelCounts>rec_data=receivingService.Get_Actuals(selected_driver.getSelectedDriver());
		List<Actuals>actual_data=new ArrayList<Actuals>();
		
		for(int i=0;i<rec_data.size();i++)
		{
			Actuals act=new Actuals();
			act.setProduct_id(rec_data.get(i).getProduct_id());
			act.setTreatment_id(rec_data.get(i).getTreatment_id());
			act.setDriver_id(rec_data.get(i).getDriver_id());
			
			act.setDms_cancel(rec_data.get(i).getDms_cancel());
			act.setDms_new(rec_data.get(i).getDms_new());
			act.setProduct_type(rec_data.get(i).getProduct_type());
			act.setProduct_sku(rec_data.get(i).getProduct_sku());
			act.setProduct_name(rec_data.get(i).getProduct_name());
			//act.setRlost(1);
			System.out.println(act.getProduct_name());
			actual_data.add(act);
		}
		System.out.println(rec_data.size());
		newMod.addObject("lst_pro", actual_data );
		List<drivers>drivers=receivingService.Get_Driver_by_UserName(selected_driver.getSelectedDriver());
		
		LocalDate date=LocalDate.now();

    	Date rec_date=java.sql.Date.valueOf(date);
    	newMod.addObject("rec_date", rec_date);
	String driver_name=drivers.get(0).getFull_name_en();
		
		ActualsForm act_form=new ActualsForm();
		
		
		List<Shipment>lst_ship_exist=receivingService.Check_Shipment_Exist(selected_driver.getSelectedDriver(), user.getOrg_unit_id());
		String status="";
		if(lst_ship_exist.size()==1)
		{
			status=lst_ship_exist.get(0).getLast_status();
		System.out.println(status);
		}

		int check_status=0;
		if(lst_ship_exist.size()==1)
		{
			System.out.println("ID:"+lst_ship_exist.get(0).getId());
			act_form.setShip_id(lst_ship_exist.get(0).getId());
			check_status=Integer.parseInt(status);
		}
		if(check_status==14||lst_ship_exist.size()==0||check_status==7||check_status==8||check_status==9||check_status==10)
		{
			if(rec_data.size()==0)
			{
				return new ResponseEntity<String>("NoRecon",HttpStatus.OK);
			}
		
		return new ResponseEntity<String>("Actuals",HttpStatus.OK);
		}
		else if(check_status==12||check_status==13)
		{
			List<ActualCounts>actual_counts=receivingService.Get_actual_count(selected_driver.getSelectedDriver(), lst_ship_exist.get(0).getId());
	    	
			List<ActualCountsData>actual_counts_data=new ArrayList<ActualCountsData>();
			/*	for(int i=0;i<actual_counts.size();i++)
			{
				
				ActualCountsData act_data=new ActualCountsData();
				act_data.setActual_calculated(actual_counts.get(i).getActual_calculated());
				act_data.setActual_cancel(actual_counts.get(i).getActual_cancel());
				act_data.setActual_new(actual_counts.get(i).getActual_new());
				act_data.setCancel(actual_counts.get(i).getCancel());
				act_data.setDms_product_id(actual_counts.get(i).getDms_product_id());
				act_data.setDriver_id(actual_counts.get(i).getDriver_id());
				act_data.setExpected_clean(actual_counts.get(i).getExpected_clean());
				act_data.setExpected_dirty(actual_counts.get(i).getExpected_dirty());
				act_data.setExpected_new(actual_counts.get(i).getExpected_new());
				act_data.setProduct_sku(actual_counts.get(i).getProduct_sku());
				act_data.setProduct_type(actual_counts.get(i).getProduct_type());
				act_data.setProudct_name(actual_counts.get(i).getProudct_name());
				act_data.setQuantity(actual_counts.get(i).getQuantity());
				act_data.setRecon_clean(actual_counts.get(i).getRecon_clean());
				act_data.setRecon_dirty(actual_counts.get(i).getRecon_dirty());
				act_data.setReturned_lost(actual_counts.get(i).getReturned_lost());
				act_data.setTreatment_id(actual_counts.get(i).getTreatment_id());
				actual_counts_data.add(act_data);
			}
			List<drivers> accountable=receivingService.GetAllDrivers();
			act_form.setActual_counts(actual_counts_data);
	    	act_form.setAgent_name(username);
			act_form.setDriver_name(driver_name);
			act_form.setWarehouse_name(fac.getFacility_name());
			act_form.setRec_date(rec_date);
			act_form.setDriver_id(selected_driver.getSelectedDriver());
			act_form.setActual_data(actual_data);
			newMod.addObject("Rec_data", act_form);
			newMod.addObject("lst_drivers",accountable);
			newMod.addObject("selected_driver", selected_driver);
			newMod.addObject("actuals", actual_counts);
	newMod.setViewName("ProductReconciliation");*/
	return new ResponseEntity<String>("ActualQuantities",HttpStatus.OK);
		}
		else if(check_status==15||check_status==16)
		{
			/*
			List<ValidateCarProduct>validation_data=receivingService.ValidatedQuan(lst_ship_exist.get(0).getId());
			act_form.setAgent_name(username);
			act_form.setDriver_name(driver_name);
			act_form.setWarehouse_name(fac.getFacility_name());
			act_form.setRec_date(rec_date);
			act_form.setDriver_id(selected_driver.getSelectedDriver());
			act_form.setValidation_data(validation_data);
			newMod.addObject("Rec_data", act_form);
			//newMod.setViewName("redirect:/ReconciliationValidate?param1="+act_form.getShip_id()+"&param2="+act_form.getDriver_id()+"&param3="+act_form.getRec_date());

			String Shipment_id_str=String.valueOf(act_form.getShip_id());*/
			return new ResponseEntity<String>("validation",HttpStatus.OK);
			
		}
		return new ResponseEntity<String>("",HttpStatus.OK);
	//return newMod;
		/*
		model.addObject("error", null);
		System.out.println("Driver is "+Auth);
		//List<Cover> covers_lst = shipmentService.getCoversOfDriver(selected_driver.getSelectedDriver());
		System.out.println(selected_driver.getSelectedDriver());
		String[]driver_val=selected_driver.getSelectedDriver().split("");
		
		
		List<drivers> reconcilated_driver=receivingService.Get_Driver_by_UserName(selected_driver.getSelectedDriver());
    	String x=reconcilated_driver.get(0).getUser_name();
		
    	List<Reconciliation_Posted> exist_rec=receivingService.Check_Recon_Exist(x);
    
    	if(exist_rec.size()==0)
		{
			List<Lost_RLostProducts> lost_vals=new ArrayList<Lost_RLostProducts>();
			
			List<Lost_RLostProducts> rlost_vals=new ArrayList<Lost_RLostProducts>();
		List<Reconciliation_Data> RecData= receivingService.Get_Reconciliation_Data(selected_driver.getSelectedDriver());
		for(int i=0;i<RecData.size();i++)
		{
			List<Lost_RLostProducts> lst_lost=new ArrayList<Lost_RLostProducts>();
			List<Lost_RLostProducts> lst_rlost=new ArrayList<Lost_RLostProducts>();
			RecData.get(i).setLost_lst(lst_lost);
			RecData.get(i).setRlost_lst(lst_rlost);
		}
		Reconciliation_Model rec_Model=new Reconciliation_Model();
		
		List<Lost_RLostProducts>lost_products=new ArrayList<Lost_RLostProducts>();
    	List<Lost_RLostProducts>Rlost_products=new ArrayList<Lost_RLostProducts>();
    	List<drivers> accountable=receivingService.GetAllDrivers();
    	List<drivers> reconcilated_driver1=receivingService.Get_Driver_by_UserName(selected_driver.getSelectedDriver());
    	String x1=reconcilated_driver.get(0).getFull_name_en()+","+reconcilated_driver.get(0).getUser_name();
    	LocalDate date=LocalDate.now();

    	Date rec_date=java.sql.Date.valueOf(date);
    	
User user=new User();
Authentication auth = SecurityContextHolder.getContext().getAuthentication();
if (!(auth instanceof AnonymousAuthenticationToken)) {
	UserDetails userDetail = (UserDetails) auth.getPrincipal();
	System.out.println(userDetail);
String username="";
	username=userDetail.getUsername();
	user=userService.getUser(username);
	Facility fac=receivingService.Get_Facility_Info(user.getOrg_unit_id());
	rec_Model.setAgent_name(username);
	rec_Model.setWarehouse_name(fac.getFacility_name());
	
}
rec_Model.setReconciliation_date(rec_date);


		rec_Model.setProducts(RecData);
		rec_Model.setLost_products(lost_products);
		rec_Model.setType("Create");
		rec_Model.setRlost_products(Rlost_products);
		//rec_Model.setAccountable(accountable);
		rec_Model.setSelected_driver(x1);
		rec_Model.setReconciliation_date(rec_date);
		String d=selected_driver.getSelectedDriver();
		String[] val=d.split(",");
		drivers d_data=new drivers();
    	newMod.addObject("Rec_data", rec_Model);
    	newMod.addObject("DName",receivingService.Get_Driver_by_UserName(d));
    	newMod.addObject("Shipment_id", "0");
    	newMod.addObject("Type", "Create");
    	
    	newMod.setViewName("ProductReconciliation");

		}
		else
		{
			System.out.println(exist_rec.get(0).getId());
			
			int ship_id=exist_rec.get(0).getId();
			List<ShipmentProduct>shipment_details=receivingService.reconciliated_Shipment(ship_id);
			List<Reconciliation_Data> saved_data=new ArrayList<Reconciliation_Data>(shipment_details.size());
			newMod.addObject("Shipment_id",ship_id);
	    	newMod.addObject("Type", "Update");
			for(int i=0;i<shipment_details.size();i++)
			{
				Reconciliation_Data rec_obj=new Reconciliation_Data();
				rec_obj.setDms_product_id(shipment_details.get(i).getDms_product_id());
				rec_obj.setProduct_sku(shipment_details.get(i).getProduct_sku());
				rec_obj.setProduct_name(shipment_details.get(i).getProduct_name());
				rec_obj.setTreatment_id(shipment_details.get(i).getTreatment_id());
				rec_obj.setTreatment_name(shipment_details.get(i).getTreatment_name());
				if(shipment_details.get(i).getOut()==null)
				{
					rec_obj.setOut_quantity(0);
				}
				else
				{
				rec_obj.setOut_quantity(Integer.parseInt(shipment_details.get(i).getOut()));
				}
				rec_obj.setDms_quantity(shipment_details.get(i).getDms_planned_quantity());
				rec_obj.setQuantity(shipment_details.get(i).getQuantity_shipped());
				if(shipment_details.get(i).getLost()==null)
				{
					rec_obj.setLost(0);
				}
				else
				{
				rec_obj.setLost(shipment_details.get(i).getLost().intValue());
				}
				if(shipment_details.get(i).getReturned_lost()==null)
				{
					rec_obj.setRlost(0);
				}
				else
				{
				rec_obj.setRlost(Integer.parseInt(shipment_details.get(i).getReturned_lost()));
				}
				if(shipment_details.get(i).getCancel()==null)
				{
					rec_obj.setCancel_quantity(0);
				}
				else
				{
				rec_obj.setCancel_quantity(Integer.parseInt(shipment_details.get(i).getCancel()));
				}
				if(shipment_details.get(i).getManual_cancel()==null)
				{
					rec_obj.setManual_cancel(0);
				}
				else
				{
				rec_obj.setManual_cancel(shipment_details.get(i).getManual_cancel().intValue());
				}
				if(shipment_details.get(i).getActual_new()==null)
				{
					rec_obj.setActual_new(0);
				}
				else
				{
				rec_obj.setActual_new(shipment_details.get(i).getActual_new().intValue());
				}
				if(shipment_details.get(i).getExpected_new()==null)
				{
					rec_obj.setExpected_new(0);
				}
				else
				{
					rec_obj.setExpected_new(shipment_details.get(i).getExpected_new().intValue());
				}
				if(shipment_details.get(i).getManual_new()==null)
				{
					rec_obj.setManual_new(0);
				}
				else
				{
					rec_obj.setManual_new(shipment_details.get(i).getManual_new().intValue());
				}
				
				rec_obj.setProduct_type(Integer.parseInt(shipment_details.get(i).getType()));
				saved_data.add(rec_obj);
			}
			List<drivers> accountable=receivingService.GetAllDrivers();
	    	List<drivers> reconcilated_driv=receivingService.Get_Driver_by_UserName(selected_driver.getSelectedDriver());
	    	String x2=reconcilated_driv.get(0).getFull_name_en()+","+reconcilated_driv.get(0).getUser_name();
	    	LocalDate date=LocalDate.now();

	    	Date rec_date=java.sql.Date.valueOf(date);
	    	Reconciliation_Model rec_model=new Reconciliation_Model();
	User user=new User();
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	String username="";
	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		System.out.println(userDetail);
	
		username=userDetail.getUsername();
		user=userService.getUser(username);
		Facility fac=receivingService.Get_Facility_Info(user.getOrg_unit_id());
		
		rec_model.setWarehouse_name(fac.getFacility_name());

	}
	rec_model.setAgent_name(username);
			rec_model.setProducts(saved_data);
			rec_model.setShip_id(ship_id);
			rec_model.setType("Update");
			rec_model.setSelected_driver(x2);
			rec_model.setReconciliation_date(rec_date);
			newMod.setViewName("ProductReconciliation");
	    	newMod.addObject("Rec_data", rec_model);
	    	newMod.addObject("state", state);
		}
    	*/
		
	}
	@RequestMapping(value="ProductReconcilaitionData")
	public ModelAndView Get_Reconciliation_Quan(@ModelAttribute("Rec_data")ActualsForm rec_form,ModelAndView model,@RequestParam(value="driver_id",required=true)String driver_id)
	{
		//ModelAndView model=new ModelAndView();
		String username="";
		Date rec_date;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user=new User();
		Facility fac=new Facility();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		username=userDetail.getUsername();
		user=userService.getUser(username);
		fac=receivingService.Get_Facility_Info(user.getOrg_unit_id());
		}
		List<Shipment>lst_ship_exist=receivingService.Check_Shipment_Exist(driver_id, user.getOrg_unit_id());
		String Area_name=receivingService.Get_Area_Name(driver_id);
		System.out.println("Area:"+Area_name);
		if(lst_ship_exist.size()!=0)
		{
			if(lst_ship_exist.get(0).getLast_status()!=null||lst_ship_exist.get(0).getLast_status()!="")
			{
				int status=Integer.parseInt(lst_ship_exist.get(0).getLast_status());
				if(status==12||status==13)
				{
					System.out.println("Check_status"+status);
					LocalDate date=LocalDate.now();
					rec_date=java.sql.Date.valueOf(date);
					List<drivers>lst_driver=receivingService.Get_Driver_by_UserName(driver_id);
					rec_form=new ActualsForm();
					rec_form.setDriver_id(driver_id);
					rec_form.setDriver_name(lst_driver.get(0).getFull_name_en());
					rec_form.setAgent_name(user.getDisplay_name()+','+username);
					
					rec_form.setRec_date(rec_date);
					rec_form.setShip_id(lst_ship_exist.get(0).getId());
					rec_form.setWarehouse_name(fac.getFacility_name());
					List<ActualCounts>actual_counts=receivingService.Get_actual_count(driver_id,lst_ship_exist.get(0).getId());
			    //	List<ShipmentProduct>shipment_details=receivingService.reconciliated_Shipment(lst_ship_exist.get(0).getId());
					List<ActualCountsData>actual_counts_data=new ArrayList<ActualCountsData>();

					List<ShipmentDetailsData>ship_data=receivingService.Get_Back_Data(lst_ship_exist.get(0).getId());
					String check_state="";
					int x_count=0;
					/*for(int i=0;i<ship_data.size();i++)
					{
						if(ship_data.get(i).getDms_planned_quantity()==null)
						{
							
						}
						else
						{
							check_state="Back";
							x_count=x_count+1;
						}
					}*/
					List<ShipmentLog> shipment_logs_lst=receivingService.Check_Back_To_Recon(lst_ship_exist.get(0).getId());
					for(int i=0;i<shipment_logs_lst.size();i++)
					{
						String x_to_status=shipment_logs_lst.get(i).getTo_status_id();
						int S_to=Integer.parseInt(x_to_status);
						if(S_to==15||S_to==16)
						{
							check_state="Back";
						}
					}
					System.out.println("Recon_state:"+check_state);
					System.out.println("Count : "+x_count);
					if(check_state.equals("Back"))
					{
						for(int i=0;i<ship_data.size();i++)
						{
						ActualCountsData act_data=new ActualCountsData();
						if(ship_data.get(i).getQuantity_shipped()==null)
						{
							act_data.setActual_Quantity(new BigDecimal("0"));

						}
						else
						{
							act_data.setActual_Quantity(ship_data.get(i).getQuantity_shipped());

						}
						if(ship_data.get(i).getActual_calculated_qty()==null)
						{
							act_data.setActual_calculated(new BigDecimal("0"));

						}
						else
						{
						act_data.setActual_calculated(ship_data.get(i).getActual_calculated_qty());
						}
						act_data.setActual_cancel(ship_data.get(i).getActual_cancel());
						act_data.setActual_new(ship_data.get(i).getActual_new());
						act_data.setCancel(ship_data.get(i).getCancel());
						act_data.setDms_product_id(ship_data.get(i).getDms_product_id());
						act_data.setDriver_id(lst_ship_exist.get(0).getShippment_souce_id());
						if(ship_data.get(i).getDms_planned_quantity()==null)
						{
							act_data.setExpected_clean(new BigDecimal("0"));
							act_data.setExpected_dirty(new BigDecimal("0"));
						}
						else
						{
						act_data.setExpected_clean(ship_data.get(i).getDms_planned_quantity());
						act_data.setExpected_dirty(ship_data.get(i).getDms_planned_quantity());
						}
						act_data.setExpected_new(ship_data.get(i).getExpected_new());
						act_data.setProduct_sku(ship_data.get(i).getProduct_sku());
						act_data.setProduct_type(ship_data.get(i).getType());
						if(ship_data.get(i).getType()==1)
						{
							String product_name=ship_data.get(i).getProduct_name()+' '+ship_data.get(i).getTreatment_name();
							act_data.setProudct_name(product_name);
						}
						else
						{
							act_data.setProudct_name(ship_data.get(i).getProduct_name());
						}
						act_data.setQuantity(ship_data.get(i).getQuantity());
						if(ship_data.get(i).getExpected_reconciliation_qty()==null)
						{
							act_data.setRecon_clean(new BigDecimal("0"));
							act_data.setRecon_dirty(new BigDecimal("0"));

						}
						else
						{
						act_data.setRecon_clean(ship_data.get(i).getExpected_reconciliation_qty());
						act_data.setRecon_dirty(ship_data.get(i).getExpected_reconciliation_qty());

						}
						if(ship_data.get(i).getReturned_lost()==null)
						{
							act_data.setReturned_lost(new BigDecimal("0"));
						}
						else
						{
						act_data.setReturned_lost(ship_data.get(i).getReturned_lost());
						}
						act_data.setTreatment_id(BigDecimal.valueOf(ship_data.get(i).getTreatment_id()));
					//	act_data.setActual_Quantity(actual_counts.get(i).);
						actual_counts_data.add(act_data);
						}
					}
					else
					{
						for(int i=0;i<actual_counts.size();i++)
						{
							ActualCountsData act_data=new ActualCountsData();
							act_data.setActual_calculated(actual_counts.get(i).getActual_calculated());
							act_data.setActual_cancel(actual_counts.get(i).getActual_cancel());
							act_data.setActual_new(actual_counts.get(i).getActual_new());
							act_data.setCancel(BigDecimal.valueOf(actual_counts.get(i).getCancel().intValue()));
							act_data.setDms_product_id(actual_counts.get(i).getDms_product_id());
							act_data.setDriver_id(actual_counts.get(i).getDriver_id());
							act_data.setExpected_clean(actual_counts.get(i).getExpected_clean());
							act_data.setExpected_dirty(actual_counts.get(i).getExpected_dirty());
							act_data.setExpected_new(actual_counts.get(i).getExpected_new());
							act_data.setProduct_sku(actual_counts.get(i).getProduct_sku());
							act_data.setProduct_type(actual_counts.get(i).getProduct_type());
							act_data.setProudct_name(actual_counts.get(i).getProudct_name());
							 System.out.println(actual_counts.get(i).getQuantity());
							act_data.setQuantity(actual_counts.get(i).getQuantity());
							act_data.setRecon_clean(actual_counts.get(i).getRecon_clean());
							act_data.setRecon_dirty(actual_counts.get(i).getRecon_dirty());
							act_data.setReturned_lost(BigDecimal.valueOf(actual_counts.get(i).getReturned_lost().intValue()));
							act_data.setTreatment_id(actual_counts.get(i).getTreatment_id());
						//	act_data.setActual_Quantity(actual_counts.get(i).);
							actual_counts_data.add(act_data);
						}
					}
					rec_form.setActual_counts(actual_counts_data);
					rec_form.setArea_name(Area_name);

					DateFormat format=new SimpleDateFormat("dd-MM-yyyy");
					model.addObject("date", format.format(rec_date));
					model.addObject("Rec_data", rec_form);
					model.setViewName("ProductReconciliation");
					return model;
				}
				else 
				{
					List<drivers> lst_drivers = receivingService.GetAllDrivers();
					
					DriverAuthentication selected_driver = new DriverAuthentication();
					model.addObject("selected_driver", selected_driver);
					model.addObject("lst_drivers", lst_drivers);
					model.setViewName("ReceivingProduct");
					return model;
				}
			}
			model.setViewName("ProductReconciliation");
			return model;
		}
		model.setViewName("ProductReconciliation");
		return model;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/submitProductReconciliation", method = RequestMethod.POST,consumes ="application/json")
	public ResponseEntity<String> ProductReconciliation(@RequestBody ActualsForm rec_form)throws ServletException, IOException {
		ModelAndView model=new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		LocalDate date=LocalDate.now();
User user=new User();
    	
  	String username="";
		username=userDetail.getUsername();
		user=userService.getUser(username);
		List<Shipment>lst_ship_exist=receivingService.Check_Shipment_Exist(rec_form.getDriver_id(), user.getOrg_unit_id());
		if(lst_ship_exist.size()!=0)
		{
			int status_rec=Integer.parseInt(lst_ship_exist.get(0).getLast_status());
			String check_date=String.valueOf(lst_ship_exist.get(0).getShipment_actual_delivery_date());
			String [] date_arr=check_date.split(" ");
			String ship_date_check=date_arr[0];
			date=LocalDate.now();
			Date rec_date=java.sql.Date.valueOf(date);
			String check_current=String.valueOf(rec_date);
			if(ship_date_check.equals(check_current)&&status_rec!=14)
			{
				if(status_rec==7||status_rec==8||status_rec==9||status_rec==10)
				{
					
				}
				else
				{
				System.out.println(status_rec);
				System.out.println(ship_date_check);
				return new ResponseEntity<String>("alreadysubmitted",HttpStatus.OK);

				}

			}
			if(lst_ship_exist.get(0).getLast_status()!=null||lst_ship_exist.get(0).getLast_status()=="")
			{
				int status=Integer.parseInt(lst_ship_exist.get(0).getLast_status());
				if(status==12||status==13)
				{
					return new ResponseEntity<String>("alreadysubmitted",HttpStatus.OK);
				}
			}
		}
		
		Gson gson_products=new Gson();
		List<Actuals>act=rec_form.getActual_data();
		String json_data=gson_products.toJson(act);
		System.out.println(rec_form.getAgent_name());
	System.out.println(rec_form.getDriver_id());
		System.out.println(json_data);
		int ship_id=0;
		ship_id=receivingService.save_reconciliation_new_cancel_counts(rec_form.getDriver_id(), username, json_data);
		String check_out=String.valueOf(ship_id);
		if(ship_id!=0||check_out!="0"||check_out!=null)
		{
			return new ResponseEntity<String>("done",HttpStatus.OK);
		}
		else
		{
			return new ResponseEntity<String>("notdone",HttpStatus.OK);
		}
		/*System.out.println(ship_id);
		rec_form.setShip_id(ship_id);
		List<ActualCounts>actual_counts=receivingService.Get_actual_count(rec_form.getDriver_id(),ship_id);
    	
		List<ActualCountsData>actual_counts_data=new ArrayList<ActualCountsData>();
		for(int i=0;i<actual_counts.size();i++)
		{
			ActualCountsData act_data=new ActualCountsData();
			act_data.setActual_calculated(actual_counts.get(i).getActual_calculated());
			act_data.setActual_cancel(actual_counts.get(i).getActual_cancel());
			act_data.setActual_new(actual_counts.get(i).getActual_new());
			act_data.setCancel(actual_counts.get(i).getCancel());
			act_data.setDms_product_id(actual_counts.get(i).getDms_product_id());
			act_data.setDriver_id(actual_counts.get(i).getDriver_id());
			act_data.setExpected_clean(actual_counts.get(i).getExpected_clean());
			act_data.setExpected_dirty(actual_counts.get(i).getExpected_dirty());
			act_data.setExpected_new(actual_counts.get(i).getExpected_new());
			act_data.setProduct_sku(actual_counts.get(i).getProduct_sku());
			act_data.setProduct_type(actual_counts.get(i).getProduct_type());
			act_data.setProudct_name(actual_counts.get(i).getProudct_name());
			act_data.setQuantity(actual_counts.get(i).getQuantity());
			act_data.setRecon_clean(actual_counts.get(i).getRecon_clean());
			act_data.setRecon_dirty(actual_counts.get(i).getRecon_dirty());
			act_data.setReturned_lost(actual_counts.get(i).getReturned_lost());
			act_data.setTreatment_id(actual_counts.get(i).getTreatment_id());
			actual_counts_data.add(act_data);
		}
		List<drivers> accountable=receivingService.GetAllDrivers();
		rec_form.setActual_counts(actual_counts_data);
		model.addObject("Rec_data", rec_form);
		
		Gson gson_products=new Gson();
		String json_products=gson_products.toJson(rec_form.getProducts());
		List<Lost_RLostProducts>lost_data=new ArrayList<Lost_RLostProducts>(rec_form.getProducts().size());
		List<Lost_RLostProducts>rlost_data=new ArrayList<Lost_RLostProducts>(rec_form.getProducts().size());
		String rec_driver=rec_form.getSelected_driver();
		
		String[] driver_data=rec_driver.split(",");
		System.out.println(rec_driver);
		String driver_id=driver_data[1];
		for(int x=0;x<rec_form.getProducts().size();x++)
		{
			
			Lost_RLostProducts lost_prod=new Lost_RLostProducts();
			Lost_RLostProducts rlost_prod=new Lost_RLostProducts();
			lost_prod.setProduct_sku(rec_form.getProducts().get(x).getProduct_sku());
			lost_prod.setproduct_type(rec_form.getProducts().get(x).getProduct_type());
			lost_prod.setQuantity(rec_form.getProducts().get(x).getLost());
			lost_prod.setSource(driver_id);
			lost_prod.setAccountable(driver_id);
			rlost_prod.setProduct_sku(rec_form.getProducts().get(x).getProduct_sku());
			rlost_prod.setproduct_type(rec_form.getProducts().get(x).getProduct_type());
			rlost_prod.setQuantity(rec_form.getProducts().get(x).getRlost());
			rlost_prod.setSource(driver_id);
			rlost_prod.setAccountable(driver_id);
			lost_data.add(lost_prod);
			rlost_data.add(rlost_prod);
		}
		Gson gson_lost=new Gson();
		String json_lost=gson_lost.toJson(lost_data);
		Gson gson_rlost=new Gson();
		String json_rlost=gson_rlost.toJson(rlost_data);
		 User u = new User();
			String user="";

			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (!(auth instanceof AnonymousAuthenticationToken)) {
				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				System.out.println(userDetail);
			user=userDetail.getUsername();
		
		    u=userService.getUser(user);
			}
		String x=rec_form.getAgent_name();
		System.out.println(x);
		String []d=driver_id.split(" ");
		System.out.println(json_products);
	System.out.println(rec_form.getShip_id());
	System.out.println(rec_form.getType());
		String out_recon=receivingService.Submit_reconciliation(driver_id, x ,json_products , json_lost, json_rlost,rec_form.getType(),rec_form.getShip_id());
		System.out.println(out_recon);
		System.out.println(rec_form.getType());
		ModelAndView model=new ModelAndView();
		
	
		if(out_recon.equals("true"))
		{
			
			String[] vals=rec_form.getSelected_driver().split(",");
			System.out.println(vals[1]);
			List<Reconciliation_Posted> exist_rec=receivingService.Check_Recon_Exist(vals[1]);
			System.out.println(exist_rec.size());
			int ship_id=exist_rec.get(0).getId();
	List<ValidateCarProduct> Quan_validate=receivingService.ValidatedQuan(ship_id);
	Reconciliation_Model rec_model=new Reconciliation_Model();
	List<Reconciliation_Data>rec_data=new ArrayList<Reconciliation_Data>(Quan_validate.size());
	for(int i=0;i<Quan_validate.size();i++)
	{
		Reconciliation_Data rec_obj=new Reconciliation_Data();
		rec_obj.setExpected_new(Quan_validate.get(i).getClean_expected_new().intValue());
		rec_obj.setCancel(Quan_validate.get(i).getDirty_cancel().intValue());
		rec_obj.setDms_product_id(Quan_validate.get(i).getDms_product_id());
		rec_obj.setManual_cancel(Quan_validate.get(i).getDirty_manual_cancel().intValue());
		rec_obj.setpass_fail(Quan_validate.get(i).getPass_fail().intValue());
		rec_obj.setLost(Quan_validate.get(i).getDirty_lost().intValue());
		rec_obj.setRlost(Quan_validate.get(i).getDirty_rlost().intValue());
		rec_obj.setManual_new(Quan_validate.get(i).getClean_manual_new().intValue());
rec_obj.setProduct_name(Quan_validate.get(i).getProduct_name());
rec_obj.setActual_new(Quan_validate.get(i).getClean_actual_new().intValue());
rec_obj.setClean_dms(Quan_validate.get(i).getClean_dms().intValue());
rec_obj.setDirty_dms(Quan_validate.get(i).getDirty_dms().intValue());
rec_obj.setClean_quan(Quan_validate.get(i).getClean_shipped().intValue());
rec_obj.setDirty_quan(Quan_validate.get(i).getDirty_shipped().intValue());
rec_obj.setpass_fail(Quan_validate.get(i).getPass_fail().intValue()); 
rec_data.add(rec_obj);
		
	}
	LocalDate date=LocalDate.now();
	UserDetails userDetail = (UserDetails) auth.getPrincipal();
	System.out.println(userDetail);
String username="";
	username=userDetail.getUsername();
	u=userService.getUser(username);
	Facility fac=receivingService.Get_Facility_Info(u.getOrg_unit_id());
	Date rec_date=java.sql.Date.valueOf(date);
	rec_model.setProducts(rec_data);
	rec_model.setReconciliation_date(rec_date);
	rec_model.setAgent_name(x);
	rec_model.setShip_id(ship_id);
	rec_model.setSelected_driver(rec_driver);
	rec_model.setWarehouse_name(fac.getFacility_name());
			model.addObject("Rec_data", rec_model);
			System.out.println(Quan_validate.get(0).getProduct_name());
			model.setViewName("ValidateReconciliation");
		}
		*/
		
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/ValidateReconciliationdata",method=RequestMethod.POST,consumes ="application/json")
	public ResponseEntity<String> Validate_Recon (@RequestBody ActualsForm rec_form ) throws IOException
	{
		String username="";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user=new User();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		username=userDetail.getUsername();
		user=userService.getUser(username);
		}
		String out_submit="";
		System.out.println(rec_form.getDriver_id());
		System.out.println(rec_form.getShip_id());
		Shipment shipment_data=cash_service.get_shipment_data(rec_form.getShip_id());
		if(shipment_data.getLast_status()!=null||shipment_data.getLast_status()!="")
		{
			int status=Integer.parseInt(shipment_data.getLast_status());
			if(status==16||status==15)
			{
				String x_out_save=receivingService.Copy_Validation_data(rec_form.getShip_id(), rec_form.getDriver_id());
				out_submit=receivingService.Close_Recon_pass_fail(rec_form.getDriver_id(),username,rec_form.getShip_id());

			}
			else
			{
				out_submit="already_submit";
			}
		}
		System.out.println(out_submit);
//String out_submit=receivingService.Close_Reconciliation(d[1],rec_form.getAgent_name(), "", rec_form.getShip_id());
//System.out.println(out_submit);	
if(out_submit.equals("true"))
{
	return new ResponseEntity<String>("SubmitedSucessfully",HttpStatus.OK);
}
else
{
	return new ResponseEntity<String>(out_submit,HttpStatus.OK);

}

	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/BackToRecon",method=RequestMethod.POST,consumes="application/json")
	public ResponseEntity<String> Back_to_recon (@RequestBody ActualsForm rec_form) throws IOException
	{
		int ship_id=rec_form.getShip_id();
		String logged_in_user=rec_form.getAgent_name();
		Shipment shipment_data=cash_service.get_shipment_data(ship_id);
		String Check_status=shipment_data.getLast_status();
		int status=Integer.parseInt(Check_status);
		int status15=15;
		int status16=16;
		System.out.println(status);
		String username="";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user=new User();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		username=userDetail.getUsername();
		user=userService.getUser(username);
		}
		if(status==15||status==16)
		{
			String out_back_recon=receivingService.Back_TO_recon_data(ship_id,username,shipment_data.getLast_status());
			System.out.println(out_back_recon);
			if(out_back_recon.equals("true"))
			{
				return new ResponseEntity<String>("done_back",HttpStatus.OK);
			}
			else
			{
				return new ResponseEntity<String>("notdone",HttpStatus.OK);
			}
			
		}
		else
		{
			System.out.println("alreeadysubmitted");
			return new ResponseEntity<String>("alreadysubmitted",HttpStatus.OK);
		}
	}
		/*
		List<ShipmentProduct>shipment_details=receivingService.reconciliated_Shipment(ship_id);
		List<Reconciliation_Data> saved_data=new ArrayList<Reconciliation_Data>(shipment_details.size());
		new_Mod.addObject("Shipment_id",ship_id);
		new_Mod.addObject("Type", "Update");
		for(int i=0;i<shipment_details.size();i++)
		{
			Reconciliation_Data rec_obj=new Reconciliation_Data();
			rec_obj.setDms_product_id(shipment_details.get(i).getDms_product_id());
			rec_obj.setProduct_sku(shipment_details.get(i).getProduct_sku());
			rec_obj.setProduct_name(shipment_details.get(i).getProduct_name());
			rec_obj.setTreatment_id(shipment_details.get(i).getTreatment_id());
			rec_obj.setTreatment_name(shipment_details.get(i).getTreatment_name());
			if(shipment_details.get(i).getOut()==null)
			{
				rec_obj.setOut_quantity(0);
			}
			else
			{
			rec_obj.setOut_quantity(Integer.parseInt(shipment_details.get(i).getOut()));
			}
			
			rec_obj.setDms_quantity(shipment_details.get(i).getDms_planned_quantity());
			rec_obj.setQuantity(shipment_details.get(i).getQuantity_shipped());
			if(shipment_details.get(i).getLost()==null)
			{
			rec_obj.setLost(0);
			}
			else {
				rec_obj.setLost(shipment_details.get(i).getLost().intValue());
			}
			if(shipment_details.get(i).getReturned_lost()==null)
			{
				rec_obj.setRlost(0);
			}
			else
			{
				rec_obj.setRlost(Integer.parseInt(shipment_details.get(i).getReturned_lost()));
			}
			if(shipment_details.get(i).getCancel()==null)
			{
				rec_obj.setCancel_quantity(0);
			}
			else
			{
			rec_obj.setCancel_quantity(Integer.parseInt(shipment_details.get(i).getCancel()));
			}
			if(shipment_details.get(i).getManual_cancel()==null)
			{
				rec_obj.setManual_cancel(0);
			}
			else
			{
			rec_obj.setManual_cancel(shipment_details.get(i).getManual_cancel().intValue());
			}
			if(shipment_details.get(i).getActual_new()==null)
			{
				rec_obj.setActual_new(0);
			}
			else
			{
			rec_obj.setActual_new(shipment_details.get(i).getActual_new().intValue());
			}
			if(shipment_details.get(i).getExpected_new()==null)
			{
				rec_obj.setExpected_new(0);
			}
			else
			{
			rec_obj.setExpected_new(shipment_details.get(i).getExpected_new().intValue());
			}
			if(shipment_details.get(i).getManual_new()==null)
			{
				rec_obj.setManual_new(0);
			}
			else
			{
			rec_obj.setManual_new(shipment_details.get(i).getManual_new().intValue());
			}
			rec_obj.setProduct_type(Integer.parseInt(shipment_details.get(i).getType()));
		//	rec_obj.setpass_fail(shipment_details.get(i).getPass_Fail().intValue());
			saved_data.add(rec_obj);
		}
		String driver=rec_form.getSelected_driver();
		System.out.println(driver);
		String[]d=driver.split(",");
		List<drivers> accountable=receivingService.GetAllDrivers();
		String []data_driver=driver.split(",");
		
    	List<drivers> reconcilated_driver=receivingService.Get_Driver_by_UserName(d[1]);
    	//String x=reconcilated_driver.get(0).getFull_name_en()+","+reconcilated_driver.get(0).getUser_name();
    	LocalDate date=LocalDate.now();
    	User user=new User();
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	String username="";
    	Reconciliation_Model rec_model=new Reconciliation_Model();
    	if (!(auth instanceof AnonymousAuthenticationToken)) {
    		UserDetails userDetail = (UserDetails) auth.getPrincipal();
    		System.out.println(userDetail);
    	
    		username=userDetail.getUsername();
    		user=userService.getUser(username);
    		Facility fac=receivingService.Get_Facility_Info(user.getOrg_unit_id());
    		rec_model.setWarehouse_name(fac.getFacility_name());
    	}
    	System.out.println(saved_data.size());
    	Date rec_date=java.sql.Date.valueOf(date);
    	rec_model.setProducts(saved_data);
    	rec_model.setAgent_name(rec_form.getAgent_name());
    	rec_model.setSelected_driver(rec_form.getSelected_driver());
    	rec_model.setReconciliation_date(rec_date);
    	rec_model.setType("Update");
    	rec_model.setShip_id(rec_form.getShip_id());
    	new_Mod.addObject("Rec_data", rec_model);
		new_Mod.setViewName("ProductReconciliation");
		return new_Mod; 
	}
*/
	@RequestMapping(value = "/ViewShipmentList")
	public ModelAndView ViewShipmentList(ModelAndView model ,HttpServletRequest request)throws  IOException {

        HttpSession session = request.getSession();
      
		ModelAndView rec_model=new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	String username="";
    	User u=new User();
    	Facility fac=new Facility();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
    		UserDetails userDetail = (UserDetails) auth.getPrincipal();
    		
    	
    		username=userDetail.getUsername();
    		u=userService.getUser(username);
    		fac=receivingService.Get_Facility_Info(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
    		
    	}
		
		List<ShipmentList> Shipment_list=receivingService.get_ShipmentList(String.valueOf(session.getAttribute("fac_id")));
	List<AllShipments>lst_shipment=receivingService.Get_all_shipments(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		List<ShipmentListForm>shipments_Of_Fac=new ArrayList<ShipmentListForm>();
		for(int i=0;i<Shipment_list.size();i++)
		{
			ShipmentListForm ship_data=new ShipmentListForm();
			ship_data.setDriver_Name(Shipment_list.get(i).getDriver_name_en());
			String ship_date=String.valueOf(Shipment_list.get(i).getShipment_date());
			String [] date_arr=ship_date.split(" ");
			ship_data.setShipment_date(date_arr[0]);
			ship_data.setShipment_Status(Shipment_list.get(i).getStatus_name());
			ship_data.setShipment_Type(Shipment_list.get(i).getShipment_type());
			ship_data.setShipment_id(Shipment_list.get(i).getShipment_id().intValue());
			shipments_Of_Fac.add(ship_data);
		}
		System.out.println("Size"+Shipment_list.size());
		
		rec_model.addObject("lst_shipment",lst_shipment);
		rec_model.setViewName("viewshipmentlist");
		return rec_model;
	}
	@RequestMapping(value = "/ViewShipmentListDetails", method = RequestMethod.GET)
	public ModelAndView ViewShipmentDetails(ModelAndView model,@RequestParam(value = "shipment_id", required = true) int shipment_id,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	HttpSession session=request.getSession();
		ShipmentListForm shipment_details_obj=new ShipmentListForm();
	ModelAndView ret_model=new ModelAndView();	
	List<ShipmentProduct>shipment_details=receivingService.reconciliated_Shipment(shipment_id);
		//ShipmentList shipment=receivingService.get_shipment_By_Id(shipment_id);
	AllShipments shipment=receivingService.Get_Details(shipment_id);
	String new_fac=String.valueOf(session.getAttribute("fac"));
	Shipment check_source_dest=receivingService.get_ship_data_by_id(shipment_id);
	System.out.println("Source:"+check_source_dest.getShippment_destination_id());
	System.out.println("Destination:"+check_source_dest.getShippment_souce_id());
	/*if(!(new_fac.equals(check_source_dest.getShippment_destination_id()))&&!(new_fac.equals(check_source_dest.getShippment_souce_id())))
	{
		return new ModelAndView("redirect:/DashboardNoDust");
	}*/
		String shipment_date=String.valueOf(shipment.getShipment_date());
		String[] ship_date_arr=shipment_date.split(" ");
		String shipment_type=shipment.getShipment_type();
		System.out.println("Shipment_type"+shipment_type);
		String driver_name=shipment.getCourrier();
		String pr_type="";
		if((shipment.getType_id()==9||shipment.getType_id()==5)&&shipment_details.size()>0)
		{
			List<ProductsType> lst=receivingService.get_shipment_products_types(shipment_details.get(0).getProduct_sku());
			pr_type=lst.get(0).getType_name();
		System.out.println("pr_type");
		}
		String shipment_status=shipment.getStatus_name();
		System.out.println("Product_Size : "+shipment_details.size());
		System.out.println(shipment_status);
		System.out.println(ship_date_arr[0]);
		shipment_details_obj.setShipment_id(shipment_id);
		shipment_details_obj.setStatus(shipment.getStatus());
		shipment_details_obj.setType_id(shipment.getType_id());
		shipment_details_obj.setDest(shipment.getDest());
		shipment_details_obj.setSource(shipment.getSource());
	shipment_details_obj.setDriver_Name(shipment.getCourrier());
	shipment_details_obj.setBank_account_num(shipment.getBank_account_num());
	shipment_details_obj.setBank_attachment(shipment.getBank_attachment());
	shipment_details_obj.setTransfer_date(shipment.getTransfer_date());
	shipment_details_obj.setShipment_date(ship_date_arr[0]);
	shipment_details_obj.setShipment_Status(shipment_status);
	shipment_details_obj.setShipment_Type(shipment_type);
	shipment_details_obj.setComment(shipment.getComments());
	System.out.println("Comment : "+shipment.getComment());
	shipment_details_obj.setShip_details(shipment_details);
	int Dest_type=createDirtyService.Check_Destination_type_id(shipment_id);
	int source_type=createDirtyService.Check_Source_type_id(shipment_id);
	String Check_Type="";
	String check_receive_ex="";
	if(Dest_type==4)
		 Check_Type="External";
	if(source_type==4)
		check_receive_ex="Rec_External";
	String related_shipments=receivingService.get_ship_data_by_id(shipment_id).getRelated_shipments();
	shipment_details_obj.setRelated_shipments(related_shipments);
	for(int i=0;i<shipment_details.size();i++)
	{
		String Product_name_traetment_name=shipment_details.get(i).getProduct_name()+' '+shipment_details.get(i).getTreatment_name();
		shipment_details_obj.getShip_details().get(i).setProduct_name(Product_name_traetment_name);
		if(shipment_details_obj.getShip_details().get(i).getLost()==null)
		{
			shipment_details_obj.getShip_details().get(i).setLost(new BigDecimal("0"));	
		}
		String dms_val=String.valueOf(shipment_details_obj.getShip_details().get(i).getDms_planned_quantity());
		System.out.println(dms_val);
		if(dms_val==null||dms_val=="0"||dms_val=="null")
		{
			shipment_details_obj.getShip_details().get(i).setDms_planned_quantity(0);
		}
	}
	String x=shipment.getComments();
	System.out.println(x);
	/*if(x==null)
	{
		x="xyComment";
	}*/
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	String username="";
	User u=new User();
	Facility fac=new Facility();
	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		
	
		username=userDetail.getUsername();
		u=userService.getUser(username);
		fac=receivingService.Get_Facility_Info(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		
	}
	List<UserRole> lst_roles=receivingService.check_user_roles(username);
	String logged_role="";
	for(int i=0;i<lst_roles.size();i++)
	{
		System.out.println(lst_roles.get(i).getRole_name());
		String x_role=lst_roles.get(i).getRole_name();
		if(x_role.equals("Admin Team Role"))
		{
			logged_role="Manager";
			System.out.println("Role"+logged_role);
		}
	}
	
	List<Consumable>lst_consumables=createDirtyService.Get_Program_Consumables(shipment_id);

	AllShipments shipment_data=receivingService.Get_Details(shipment_id);
	String[] x_related;
	List<AllShipments>lst_related=new ArrayList<AllShipments>();
	if(shipment_details_obj.getType_id()==2)
	{
		if(related_shipments!=null)
		{
			x_related=related_shipments.split(",");
			if(x_related.length>0)
			{
				for(int i=0;i<x_related.length;i++)
				{
					AllShipments related_shipment_var=new AllShipments();
					related_shipment_var.setShipment_id(Integer.parseInt(x_related[i]));
					lst_related.add(related_shipment_var);
				}
			}
		}
	}
	System.out.println("SizeRelated"+lst_related.size());
	ret_model.addObject("Agent", logged_role);
	ret_model.addObject("shipment_date", shipment.getShipment_date());
	ret_model.addObject("comment", shipment.getComment());
	ret_model.addObject("shipment_details_data", shipment_details_obj);
	ret_model.addObject("type",shipment_type);
	ret_model.addObject("shipment_status_val", shipment_details_obj.getShipment_Status());
	ret_model.addObject("consumables", lst_consumables);
	ret_model.addObject("shipment_type", Check_Type);
	ret_model.addObject("lst_related", lst_related);
	System.out.println(pr_type);
	ret_model.addObject("pr_type", pr_type);
	System.out.println(shipment_details_obj.getShipment_Status());
	ret_model.addObject("rec_ext", check_receive_ex);
	ret_model.setViewName("shipmentdetails");
	return ret_model;
		
	}
	@RequestMapping(value = "/Close_Recon", method = RequestMethod.POST,consumes="application/json")
	public ResponseEntity<String> Close_Recon(@RequestBody ShipmentListForm shipment_data , HttpServletRequest request)throws ServletException, IOException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	String username="";
    	HttpSession session=request.getSession();
    	User u=new User();
    	Facility fac=new Facility();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
    		UserDetails userDetail = (UserDetails) auth.getPrincipal();
    		
    	
    		username=userDetail.getUsername();
    		u=userService.getUser(username);
    		fac=receivingService.Get_Facility_Info(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
    		
    	}
		System.out.println(shipment_data.getShipment_id());
	System.out.println(shipment_data.getClosure_comment());
	System.out.println(username);
	String Check_last_status=receivingService.get_ship_data_by_id(shipment_data.getShipment_id()).getLast_status();
	if(Check_last_status.equals("7")||Check_last_status.equals("9"))
	{
		return new ResponseEntity<String>("already_Closed",HttpStatus.OK);
	}
	String out_Close=receivingService.Close_Recon_Shipment(shipment_data.getShipment_id(), shipment_data.getClosure_comment(), username);
	if(out_Close.equals("true"))
	{
	return new ResponseEntity<String>("done",HttpStatus.OK);
	}
	else
	{
	return new ResponseEntity<String>("notdone",HttpStatus.OK);	
	}
	}
}
