package com.jwt.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
import com.jwt.dao.UntreatedProductsDAO;
import com.jwt.model.Consumable;
import com.jwt.model.DirtyProduct;
import com.jwt.model.DirtyProductInPackage;
import com.jwt.model.DirtyProductsForm;
import com.jwt.model.DirtyShipment;
import com.jwt.model.DirtyShipmentData;
import com.jwt.model.Facility;
import com.jwt.model.UntreatedProduct;
import com.jwt.model.User;
import com.jwt.model.WashingPrograms;
import com.jwt.model.drivers;
import com.jwt.service.CashInOutService;
import com.jwt.service.CreateDirtyShipmentService;
import com.jwt.service.ReleasingProductsService;
import com.jwt.service.UntreatedProductsService;
import com.jwt.service.UserService;
import com.jwt.service.ViewDirtyShipmentService;

@Controller
public class ViewDirtyShipmentController {
	
	@Autowired
	private ViewDirtyShipmentService dirtyService;
	

	@Autowired
	private UserService userService;
	
	@Autowired
	private ReleasingProductsService shipmentService;
	
	@Autowired
	private CreateDirtyShipmentService createDirtyService;
	
	@Autowired
	private UntreatedProductsService untreatedProductsServic;
	@Autowired
	private CashInOutService cash_ser;
	@RequestMapping(value = "/ViewDirtyShipments")
	public ModelAndView viewdirtyshipment(ModelAndView model , HttpServletRequest request) throws IOException {
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
			Facility facility = shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));

		List<DirtyShipment> shipments = dirtyService.getAllDirtyShipments(facility.getId());
		model.addObject("dirtyList", shipments);
		model.addObject("warehouse_name",facility.getFacility_name());
		model.setViewName("ViewDirtyShipments");
		return model;
	}
	
	
	
	@RequestMapping(value = "/DirtyShipmentDetails",method = RequestMethod.GET)
	public ModelAndView ViewDirtyShipmentDetails(ModelAndView model ,@RequestParam(value = "shipmentID", required = true) String shipment_id , HttpServletRequest request) throws IOException {
		List<DirtyShipmentData> shipments = dirtyService.getShipmentData(shipment_id);
		HttpSession session=request.getSession();
		if(Integer.parseInt(String.valueOf(session.getAttribute("fac_id")))!=1)
		{
			return new ModelAndView("redirect:/DashboardNoDust");
		}
		//System.out.println(shipments.get(0).getLundry_name());
		List<DirtyProduct> products = dirtyService.getDirtyShipmentProduct(shipment_id);
String Approval_user=dirtyService.Get_Approved_by(Integer.parseInt(shipment_id));
String Approval_date=dirtyService.Get_Approval_Date(Integer.parseInt(shipment_id));
List<drivers>drivers = createDirtyService.getAllDrivers();

		String Requested_user=dirtyService.Get_Requested_By(Integer.parseInt(shipment_id));
		//if(dirtyService.checkStateOfShipment(Integer.parseInt(shipment_id)).equals("1"))
		//{
		model.addObject("shipmentData", shipments.get(0));
		model.addObject("shipmentProducts", products);
		model.addObject("shipmentID", shipment_id);
		model.addObject("approved_by",Approval_user);
		System.out.println("Requested By : "+Requested_user);
		System.out.println("Approved By : "+Approval_user);
		model.addObject("Approval_Date",Approval_date);
model.addObject("driversList", drivers);
		model.addObject("Requested_by", Requested_user);
		//System.out.println("Courier"+shipments.get(0).getUser_name());
		model.addObject("courier_id", shipments.get(0).getUser_name());
		//}
		//model.addObject("dirtyList", shipments);
		model.setViewName("DirtyShipmentDetails");
		return model;
	}

	
	@RequestMapping(value = "/approveExterenalDirtyShipment", method = RequestMethod.POST,consumes ="application/json")
	public ResponseEntity<String> approveExterenalDirtyShipment(@RequestBody  DirtyProductsForm dirtyForm)throws ServletException, IOException {
	
		  User u = new User();
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (!(auth instanceof AnonymousAuthenticationToken)) {
				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				System.out.println(userDetail);
			String user="";
			user=userDetail.getUsername();
		    u=userService.getUser(user);
		    System.out.println("productsIds"+dirtyForm.getProductsIds2());
		    System.out.println("user"+u.getUSER_NAME());
			}
			if(u.getUSER_NAME() == null)
			{
				return new ResponseEntity<String>("no session", HttpStatus.OK);
			}
			System.out.println("submited1 : "+dirtyForm.getShipment_id());
			if(dirtyService.checkStateOfShipment(Integer.parseInt(dirtyForm.getShipment_id())).equals("1"))
			{
				Gson gson = new Gson();
			
				  
				String submit = "";
				String pro_json= gson.toJson(dirtyForm.getDirty_list());
				submit=dirtyService.Submit_receiving_external_shipment(dirtyForm.getProductsIds(), dirtyForm.getProductsIds2(), Integer.parseInt(dirtyForm.getShipment_id()), u.getUSER_NAME(), pro_json);
						
		    System.out.println("submited : "+submit);
			if(submit.equals("true"))
			{
				return new ResponseEntity<String>("success", HttpStatus.OK);

			}
			else {			
				return new ResponseEntity<String>("not success", HttpStatus.OK);

			 }
			}
			else {
				return new ResponseEntity<String>("alreadyApproved", HttpStatus.OK);
			}
	}
	
	
	@RequestMapping(value = "/approveDirtyShipment", method = RequestMethod.POST,consumes ="application/json")
		public ResponseEntity<String> approveDirtyShipment(@RequestBody  DirtyProductsForm dirtyForm)throws ServletException, IOException {
			   User u = new User();
				Authentication auth = SecurityContextHolder.getContext().getAuthentication();
				if (!(auth instanceof AnonymousAuthenticationToken)) {
					UserDetails userDetail = (UserDetails) auth.getPrincipal();
					System.out.println(userDetail);
				String user="";
				user=userDetail.getUsername();
			    u=userService.getUser(user);
			    System.out.println("productsIds"+dirtyForm.getProductsIds2());
			    System.out.println("user"+u.getUSER_NAME());
				}
				if(u.getUSER_NAME() == null)
				{
					return new ResponseEntity<String>("no session", HttpStatus.OK);
				}
				System.out.println("submited1 : "+dirtyForm.getShipment_id());
				if(dirtyService.checkStateOfShipment(Integer.parseInt(dirtyForm.getShipment_id())).equals("1"))
				{
					Gson gson = new Gson();
				
					  
					String submit = "";
					String pro_json= gson.toJson(dirtyForm.getDirty_list());
					submit=dirtyService.Submit_approve_dirty_shipment(dirtyForm.getProductsIds(),dirtyForm.getProductsIds2() ,Integer.parseInt(dirtyForm.getShipment_id()), u.getUSER_NAME(),dirtyForm.getProductsIds3(),pro_json) ;		
			    System.out.println("submited : "+submit);
				if(submit.equals("true"))
				{
					return new ResponseEntity<String>("success", HttpStatus.OK);

				}
				else {			
					return new ResponseEntity<String>("not success", HttpStatus.OK);

				 }
				}
				else {
					return new ResponseEntity<String>("alreadyApproved", HttpStatus.OK);
				}

		}
	
	
	
	
	@RequestMapping(value = "/ViewExternalShipments")
	public ModelAndView viewExternalShipments(ModelAndView model , HttpServletRequest request) throws IOException {
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
			Facility facility = shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));

		List<DirtyShipment> shipments = dirtyService.getExternalLundry();
		if(Integer.parseInt(String.valueOf(session.getAttribute("fac_id")))==1) {
		model.addObject("dirtyList", shipments);
		model.addObject("warehouse_name", facility.getFacility_name());
		}
		model.setViewName("ViewExternalShipments");
		return model;
	}
	
	
	@RequestMapping(value = "/ExternalShipmentDetails",method = RequestMethod.GET)
	public ModelAndView ExternalShipmentDetails(ModelAndView model ,@RequestParam(value = "shipmentID", required = true) String shipment_id , HttpServletRequest request) throws IOException {
		List<DirtyShipmentData> shipments = dirtyService.getShipmentData(shipment_id);
		HttpSession session=request.getSession();
		//System.out.println(shipments.get(0).getLundry_name());
		List<DirtyProduct> products = dirtyService.getDirtyShipmentProduct(shipment_id);
		String Approval_user=dirtyService.Get_Approved_by(Integer.parseInt(shipment_id));
		List<drivers>drivers = createDirtyService.getAllDrivers();

		if(Integer.parseInt(String.valueOf(session.getAttribute("fac_id")))!=1)
		{
			return new ModelAndView("redirect:/DashboardNoDust");
		}
		String Requested_user=dirtyService.Get_Requested_By(Integer.parseInt(shipment_id));
		String Approval_date=dirtyService.Get_Approval_Date(Integer.parseInt(shipment_id));
		List<Consumable> con_totals=createDirtyService.Get_Program_Consumables(Integer.parseInt(shipment_id));
		List<Consumable> cons_details=createDirtyService.Get_Total_Consumables_Details(Integer.parseInt(shipment_id));
		int flag =0;
		
		for (int i=0;i<products.size();i++)
		{
			String x = products.get(i).getApproved();
			//System.out.print(x);
			if(x != null && x.equals("1"))
			{
				model.addObject("approved", "true");
				break;
			}
		
		}
		System.out.print("f"+flag);
		//if(dirtyService.checkStateOfShipment(Integer.parseInt(shipment_id)).equals("1"))
		//{
		model.addObject("drivers", drivers);
		model.addObject("details", cons_details);
		model.addObject("totals", con_totals);
		model.addObject("shipmentData", shipments.get(0));
		model.addObject("shipmentProducts", products);
		model.addObject("shipmentID", shipment_id);
		model.addObject("courier_id", shipments.get(0).getUser_name());
		model.addObject("approved_by",Approval_user);
		System.out.println("Requested By : "+Requested_user);
		model.addObject("Requested_by", Requested_user);
		model.addObject("Approval_Date",Approval_date);
		//}
		//model.addObject("dirtyList", shipments);
		model.setViewName("ExternalShipmentDetails");
		return model;
	}

	
	//ReceiveUntreatedProducts
	@RequestMapping(value="/GetUntreatedProductsInLaundry",method=RequestMethod.POST,consumes = "application/json")
	public ResponseEntity<String> Get_Untreted_Products(@RequestBody DirtyProductsForm dirty_form , HttpServletRequest request) throws JsonProcessingException
	{
		HttpSession session=request.getSession();
		int fac_id=dirty_form.getFrom_type();
		List<UntreatedProduct> lst_untreated=untreatedProductsServic.getUntreatedByFac(fac_id);
		System.out.println("Fac : "+fac_id);
		System.out.println("Size : "+lst_untreated.size());

		if(lst_untreated.size()>0)
		{
		ObjectMapper mapper=new ObjectMapper();
		String str_prod=mapper.writeValueAsString(lst_untreated);
		return new ResponseEntity<String>(str_prod,HttpStatus.OK);
		}
		else
		{
			return new ResponseEntity<String>("No_Pro",HttpStatus.OK);
		}
	}
	
	
	@RequestMapping(value = "/ReceiveUntreatedProducts")
	public ModelAndView ReceiveUntreatedProducts(ModelAndView model , HttpServletRequest request) throws IOException {
		User u = new User();
		HttpSession session=request.getSession();
		if(Integer.parseInt(String.valueOf(session.getAttribute("fac_id")))!=1)
		{
			return new ModelAndView("redirect:/DashboardNoDust");
		}
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
		List<DirtyProductInPackage> products = new ArrayList<DirtyProductInPackage>();
		//System.out.println(products.get(0).getProduct_sku());
		List<WashingPrograms> programs = createDirtyService.getWashingPrograms(1);
		List<Facility> lundries = new ArrayList<Facility>();
		//System.out.println("size of lundries "+lundries.size());
		List<drivers>drivers = createDirtyService.getAllDrivers();
		//System.out.println("size drivers "+drivers.size());
		ModelAndView model1 = new ModelAndView();
		DirtyProductsForm dirtyForm = new DirtyProductsForm();
		
		/*List<UserRole> rols = userRoleService.getAllUserRole(u.getUSER_NAME());
		String flag = "";
		System.out.println("size"+ rols.size());
		for(int i =0;i<rols.size();i++)
		{
			if(rols.get(i).getRole_id()==5)
			{
				flag ="5";
				break;
			}
		}
		System.out.println(flag);
		if((u.getOrg_unit_id() ==1 )&& (flag.equals("5")))
		{
			products = createDirtyService.getProductsListNotPack(facility.getId());
			model1.setViewName("AbuRawashInternalLaundry");
		}
		else*/ if(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))) ==1 )
		{
			model1.addObject("Lundry", "External");
			dirtyForm.setDriversList(drivers);
			lundries = createDirtyService.getExternalLundries();
			dirtyForm.setLundries_list(lundries);
			products = untreatedProductsServic.getUntreatedProducts();
			dirtyForm.setProduct_list(products);
			dirtyForm.setWashing_list(programs);
			dirtyForm.setAgentName(u.getDisplay_name()+','+u.getUSER_NAME());
			dirtyForm.setAssignDate(dateFormat.format(date));
			dirtyForm.setWareHouseName(facility.getFacility_name());
		}
		else
		{
			model1.addObject("freez", "true");
		}
		
		model1.addObject("dirtyForm", dirtyForm);
		model1.setViewName("RecieveUntreatedProducts");

		return model1;
	
	}
	
	
	@RequestMapping(value = "/submitRecieveUntreatedProducts", method = RequestMethod.POST,consumes ="application/json")
	public ResponseEntity<String> submitRecieveUntreatedProducts(@RequestBody  DirtyProductsForm dirtyForm , HttpServletRequest request)throws ServletException, IOException {
		System.out.println("driver "+ dirtyForm.getSelectedDriver());
		HttpSession session=request.getSession();
		//System.out.println("date"+coverForm.getCoverProducts().size());
		Gson gson = new Gson();
		String json = gson.toJson(dirtyForm.getUntreated_list());
		  List<UntreatedProduct> prod_lst=dirtyForm.getUntreated_list();
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
						String x_product_name=prod_lst.get(i).getProduct_name()+" Has Wrong Quantities";
						System.out.println(x_product_name);
						return new ResponseEntity<String>(x_product_name,HttpStatus.OK);
					}
				}
				
			}
			}
			System.out.println("UniqueSKUS:"+unique_skus);
				submit=untreatedProductsServic.submitRecieveUntreatedProducts("1",dirtyForm.getSelectedLundry(), json, u.getUser_name(), dirtyForm.getSelectedDriver());

			}
			
			System.out.println("submited1 : "+dirtyForm.getSelectedDriver()+" "+ u.getUSER_NAME()+" "+ dirtyForm.getSelectedLundry()+" "+json);
			System.out.println("submited : "+submit);
			if(!submit.equals("")&& !submit.equals("0"))
			{
				return new ResponseEntity<String>(submit, HttpStatus.OK);

			}
			else {				
				return new ResponseEntity<String>("not success", HttpStatus.OK);

			}

	}
	
	
}