package com.jwt.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.jwt.model.AllShipments;
import com.jwt.model.CleanProduct;
import com.jwt.model.CleanShipment;
import com.jwt.model.CleanShipmentForm;
import com.jwt.model.DirtyProduct;
import com.jwt.model.DirtyProductsForm;
import com.jwt.model.Facility;
import com.jwt.model.Products;
import com.jwt.model.ProductsType;
import com.jwt.model.ShipmentDetails;
import com.jwt.model.ShipmentLog;
import com.jwt.model.User;
import com.jwt.model.drivers;
import com.jwt.service.CashInOutService;
import com.jwt.service.CleanShipmentService;
import com.jwt.service.CreateDirtyShipmentService;
import com.jwt.service.ReceivingProductsService;
import com.jwt.service.StockManagmentService;
import com.jwt.service.UserService;
import com.jwt.service.ViewDirtyShipmentService;

@Controller
public class CleanShipmentController {
	@Autowired
	UserService user_service;
	@Autowired
	ReceivingProductsService receiving_service;
@Autowired
CashInOutService cash_ser;
	@Autowired
	CleanShipmentService clean_service;

	@Autowired
	StockManagmentService stock_service;
	@Autowired
	ViewDirtyShipmentService dirty_service;
	@Autowired
	CreateDirtyShipmentService create_dirty_service;
	@RequestMapping(value="/GetProductByType",method = RequestMethod.POST,consumes = "application/json")
	public ResponseEntity<String>Get_Facility_ProductsByType(@RequestBody CleanShipmentForm clean_form , HttpServletRequest request) throws JsonProcessingException
	{
		HttpSession session=request.getSession();
		User u=new User();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();	
			System.out.println("UserName"+userDetail.getUsername());
		    u=user_service.getUser(userDetail.getUsername());
		}
		int type=clean_form.getDest_id();
		List<Products>lst_products=clean_service.Get_Products_By_Type(type, Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		ObjectMapper mapper=new ObjectMapper();
		String str_prod=mapper.writeValueAsString(lst_products);
		System.out.println(lst_products.size());
		if(lst_products.size()==0)
		{
			return new ResponseEntity<String>("No_Pro",HttpStatus.OK);
		}
		else {
		return new ResponseEntity<String>(str_prod,HttpStatus.OK);
		}
	}
@RequestMapping(value="/CreateCleanShipment")
public ModelAndView Create_Clean_Shipment(HttpServletRequest request)
{	ModelAndView new_Mod=new ModelAndView();
HttpSession session=request.getSession();
	User u=new User();
	CleanShipmentForm clean_form=new CleanShipmentForm();
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    List<ProductsType>lst_types=stock_service.lst_shipment_type();

	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();	
		System.out.println("UserName"+userDetail.getUsername());
	    u=user_service.getUser(userDetail.getUsername());
	    clean_form.setAgent_name(u.getDisplay_name()+','+u.getUser_name());
	    Facility fac=receiving_service.Get_Facility_Info(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	    clean_form.setWarehouse_name(fac.getFacility_name());
	    LocalDate date1=LocalDate.now();
		Date rec_date1=java.sql.Date.valueOf(date1);
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		String check_current=String.valueOf(dateFormat.format(date));
		String [] split_date=check_current.split(" ");
		clean_form.setReq_date(split_date[0]);
		List<drivers>lst_drivers=clean_service.Get_driver_List();
		List<Facility> dest_warehouses=clean_service.Get_detsination_facility(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		System.out.println("Dest_size"+dest_warehouses.size());
		clean_form.setDriver_lst(lst_drivers);
		clean_form.setFacilities(dest_warehouses);
	//	System.out.println("Size"+lst_drivers.size());
		List<Products> lst_prod=clean_service.Get_Clean_Products(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));

		clean_form.setProd_lst(lst_prod);
}
	new_Mod.addObject("clean_form", clean_form);
	new_Mod.addObject("types", lst_types);
	new_Mod.setViewName("CreateCleanShipment");
	

	return new_Mod;
}
@RequestMapping(value="/SubmitSendCleanShipment",method = RequestMethod.POST,consumes = "application/json")
public ResponseEntity<String> Submit_Clean_Shipment(@RequestBody CleanShipmentForm clean_form , HttpServletRequest request)
{
	HttpSession session=request.getSession();
	String resp="";
	String pro="";
	User u=new User();
	String user_name="";
	Gson gson_products=new Gson();
	List<Products> prod_lst=clean_form.getProd_lst();
	String json_str=gson_products.toJson(prod_lst);
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();	
		System.out.println("UserName"+userDetail.getUsername());
	    u=user_service.getUser(userDetail.getUsername());
	    user_name=u.getUser_name();
	}
	List<String> sku=new ArrayList<String>();
	String unique_skus="";
	
for(int i=0;i<prod_lst.size();i++)
{
	if(unique_skus.contains(prod_lst.get(i).getProduct_id()))
	{
		
	}
	else
	{
		if(unique_skus=="")
		{
			unique_skus+=prod_lst.get(i).getProduct_id();

		}
		else
		{
		unique_skus+=','+prod_lst.get(i).getProduct_id();
		}
	}
}
String [] sku_arr=unique_skus.split(",");
int [] quantity;
for(int x=0;x<sku_arr.length;x++)
{
	BigDecimal total_quan;
	int sum_quan=0;
int quan;
for(int i=0;i<prod_lst.size();i++)
{
	if(prod_lst.get(i).getProduct_id().equals(sku_arr[x]))
	{

		total_quan=prod_lst.get(i).getTotal_stock_quantity();
		quan=Integer.parseInt(String.valueOf(prod_lst.get(i).getQuantity()));
		sum_quan+=quan;
		BigDecimal check_quan=new BigDecimal(sum_quan);
		if(check_quan.compareTo(total_quan)>=1)
		{
			String x_product_name=prod_lst.get(i).getProduct_name()+" Has Wrong Quantities , you Should Enter Value Less than "+prod_lst.get(i).getTotal_stock_quantity();
			System.out.println(x_product_name);
			return new ResponseEntity<String>(x_product_name,HttpStatus.OK);
		}
	}
	
}
}
System.out.println("UniqueSKUS:"+unique_skus);
	 resp=clean_service.Submit_Send_clean_Shipment(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))), clean_form.getDest_id(), clean_form.getDriver_id(), json_str, user_name);
	return new ResponseEntity<String>(resp,HttpStatus.OK);
}
@RequestMapping(value="/CleanShipmentList")
public ModelAndView Get_Clean_Shipment_List(HttpServletRequest request)
{
	HttpSession session=request.getSession();
	User u=new User();
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();	
	    u=user_service.getUser(userDetail.getUsername());
	    }
	ModelAndView new_mod=new ModelAndView();
	List<CleanShipment> lst_shipment=clean_service.Get_Clean_Shipment(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	System.out.println(lst_shipment.size());
	new_mod.addObject("lst_shipment", lst_shipment);
	new_mod.setViewName("CleanShipmentList");
	return new_mod;
}
@RequestMapping(value ="/CleanShipmentDetails",method=RequestMethod.GET)
public ModelAndView Get_Clean_Shipment_Details(@RequestParam(value = "shipment_id", required = true) int shipment_id,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
ModelAndView new_mod=new ModelAndView();
HttpSession session=request.getSession();
System.out.println(shipment_id);
User u=new User();
Authentication auth = SecurityContextHolder.getContext().getAuthentication();
if (!(auth instanceof AnonymousAuthenticationToken)) {
	UserDetails userDetail = (UserDetails) auth.getPrincipal();	
    u=user_service.getUser(userDetail.getUsername());
    }
Facility fac=receiving_service.Get_Facility_Info(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
CleanShipmentForm form=new CleanShipmentForm();
CleanShipment clean_ship_data=clean_service.Get_Shipment_By_Id(shipment_id);
AllShipments shipment=receiving_service.Get_Details(shipment_id);
String new_fac=String.valueOf(session.getAttribute("fac"));
if(!(new_fac.equals(shipment.getDest())))
{
	return new ModelAndView("redirect:/DashboardNoDust");
}
List<CleanProduct> shipment_details =clean_service.Get_Shipment_Details(shipment_id);
List<ShipmentLog>shipment_log=clean_service.shipment_logs(shipment_id);
List<DirtyProduct> products = dirty_service.getDirtyShipmentProduct(String.valueOf(shipment_id));
List<drivers>lst_drivers=create_dirty_service.getAllDrivers();
new_mod.addObject("shipmentProducts", shipment_details);
new_mod.addObject("shipment_id", shipment_id);
new_mod.addObject("shipmentData", clean_ship_data);
System.out.println(clean_ship_data.getDriver_name());
System.out.println(clean_ship_data.getDriver_id());
new_mod.addObject("Dest_warehouse",fac.getFacility_name());
new_mod.addObject("requested_by",cash_ser.GetRequestedAgentName(shipment_id));
new_mod.addObject("drivers", lst_drivers);
if(shipment_log.size()>1)
{
	String app=cash_ser.GetAgentDisplayName(shipment_id);

new_mod.addObject("approved_by",app);
}
else
{
	new_mod.addObject("approved_by",u.getDisplay_name()+','+u.getUser_name());	
}
String date_txt=dirty_service.Get_Approval_Date(shipment_id);
new_mod.addObject("Approval_Date",date_txt);
new_mod.setViewName("CleanShipmentDetails");
return new_mod;
}
@RequestMapping(value="/ReceiveCleanShipment",method = RequestMethod.POST , consumes = "application/json")
public ResponseEntity<String> Receive_Clean(@RequestBody DirtyProductsForm dirtyForm , HttpServletRequest request)
{
	HttpSession session=request.getSession();
	Gson gson_products=new Gson();
	List<DirtyProduct> prod_lst=dirtyForm.getDirty_list();
	String json_str=gson_products.toJson(prod_lst);
	User u=new User();
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();	
	    u=user_service.getUser(userDetail.getUsername());
	    }
	System.out.println(json_str);
	String out_res=clean_service.Receive_Clean_Shipment(Integer.parseInt(dirtyForm.getShipment_id()), dirtyForm.getProductsIds(), dirtyForm.getProductsIds3(), dirtyForm.getProductsIds2(), u.getUser_name(), json_str, Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	
	if(out_res.equals("true"))
	{
	return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	else
	{
		return new ResponseEntity<String>("no",HttpStatus.OK);

	}
}
}
