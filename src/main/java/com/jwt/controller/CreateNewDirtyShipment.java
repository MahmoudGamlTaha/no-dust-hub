package com.jwt.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.security.RolesAllowed;
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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.jwt.model.Category_For_Dirty_Shipments;
import com.jwt.model.Consumable;
import com.jwt.model.ConsumableData;
import com.jwt.model.ConversionForm;
import com.jwt.model.DirtyOrderData;
import com.jwt.model.DirtyProduct;
import com.jwt.model.DirtyProductData;
import com.jwt.model.DirtyProductInPackage;
import com.jwt.model.DirtyProductsForm;
import com.jwt.model.Facility;
import com.jwt.model.Products;
import com.jwt.model.ProductsType;
import com.jwt.model.ProgramsData;
import com.jwt.model.Treatment;
import com.jwt.model.User;
import com.jwt.model.UserRole;
import com.jwt.model.WashingPrograms;
import com.jwt.model.drivers;
import com.jwt.service.CreateDirtyShipmentService;
import com.jwt.service.ReleasingProductsService;
import com.jwt.service.StockManagmentService;
import com.jwt.service.UserRoleService;
import com.jwt.service.UserService;

@Controller
public class CreateNewDirtyShipment {
	
	@Autowired
	private CreateDirtyShipmentService createDirtyService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserRoleService userRoleService;
	
	@Autowired
	private ReleasingProductsService shipmentService;
	@Autowired
	private StockManagmentService stock_service;
	@RequestMapping(value = "/GetTreatmentConsumables",method=RequestMethod.POST,consumes = "application/json")
	public ResponseEntity<String> Get_treatment_Data(@RequestBody ConsumableData consum) throws JsonProcessingException
	{
		List<Consumable>lst_consumables=createDirtyService.Get_Program_Consumables(consum.getIds());
		List<Consumable> lst_total_consumables=createDirtyService.GetTreatmentConsumables(Integer.parseInt(consum.getIds()));
		List<DirtyOrderData>lst_data_for_printing=createDirtyService.Get_Order_DataFor_Printing(Integer.parseInt(consum.getIds()));
		ConsumableData con_data=new ConsumableData();
		con_data.setConsumable_details(lst_consumables);
		con_data.setTotal_consumables(lst_total_consumables);
		con_data.setOrder_data_printing(lst_data_for_printing);
		ObjectMapper mapper=new ObjectMapper();
		String x=mapper.writeValueAsString(con_data);
		return new ResponseEntity<String>(x,HttpStatus.OK);
	}
	//InternalDirtyShipment
	@RequestMapping(value = "/CreateDirtyShipment")
	public ModelAndView CreateDirtyShipment(ModelAndView model , HttpServletRequest request) throws IOException {
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
		List<DirtyProductInPackage> products = new ArrayList<DirtyProductInPackage>();
		//System.out.println(products.get(0).getProduct_sku());
		//List<WashingPrograms> programs = createDirtyService.getWashingPrograms(1);
		List<ProgramsData>programs=createDirtyService.Get_Programs_by_Category(1);
		List<Facility> lundries = new ArrayList<Facility>();
		//System.out.println("size of lundries "+lundries.size());
		List<drivers>drivers = createDirtyService.getAllDrivers();
		//System.out.println("size drivers "+drivers.size());
		ModelAndView model1 = new ModelAndView();
		DirtyProductsForm dirtyForm = new DirtyProductsForm();
		dirtyForm.setPrograms_lst(programs);
		dirtyForm.setDriversList(drivers);
		dirtyForm.setAgentName(u.getDisplay_name()+','+u.getUSER_NAME());
		dirtyForm.setAssignDate(dateFormat.format(date));
		dirtyForm.setWareHouseName(facility.getFacility_name());
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
			lundries = createDirtyService.getExternalLundries();
			dirtyForm.setLundries_list(lundries);
			
			model1.setViewName("CreateDirtyShipment");
			products = createDirtyService.getProductsListNotPack(facility.getId());
		    model1.addObject("external", "true");

		}
		else
		{
			Facility facility1 = createDirtyService.getAbuRawashData();
			lundries.add(facility1);
			dirtyForm.setLundries_list(lundries);
			
			products = createDirtyService.getProductsListNotPack(facility.getId());
			model1.setViewName("CreateDirtyShipment");
			model1.addObject("external", "false");
		}
		if (products.size()==0 || programs.size()==0)
		{ 
			model1.addObject("validation", "false");
		}
		dirtyForm.setProduct_list(products);
		model1.addObject("dirtyForm", dirtyForm);
		List<Category_For_Dirty_Shipments>lst_cat=createDirtyService.Get_Category_For_dirty_shipment();
		model1.addObject("categories",lst_cat);
		model1.addObject("fac", Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));

		return model1;
	
	}
	
	
	@RequestMapping(value="/Washing")
	public ModelAndView Washing_Reverse(ModelAndView model , HttpServletRequest request)
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
		List<ProductsType>lst_types=createDirtyService.Get_Products_Type_By_Category(1);
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
		dirtyForm.setWashing_list(programs);
		dirtyForm.setDriversList(drivers);
		dirtyForm.setAgentName(u.getUSER_NAME());
		dirtyForm.setAssignDate(dateFormat.format(date));
		dirtyForm.setWareHouseName(facility.getFacility_name());
		List<UserRole> rols = userRoleService.getAllUserRole(u.getUSER_NAME());
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
		if((Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))) ==1 )&& (flag.equals("5")))
		{
			products = createDirtyService.getProductsListNotPack(facility.getId());
		}
		model1.setViewName("ReverseWashing");

		
			model1.addObject("Lundry", "External");
			lundries = createDirtyService.getExternalLundries();
			dirtyForm.setLundries_list(lundries);
			products = createDirtyService.getProductsList(facility.getId());
		
		
			Facility facility1 = createDirtyService.getAbuRawashData();
			lundries.add(facility1);
			dirtyForm.setLundries_list(lundries);
			products = createDirtyService.getProductsList(facility.getId());
		dirtyForm.setProduct_list(products);
		model1.addObject("dirtyForm", dirtyForm);
		model1.addObject("fac", Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		model1.addObject("from_types", lst_types);
		return model1;
	}
	@RequestMapping(value = "/InternalDirtyShipment")
	public ModelAndView CreateInternalDirtyShipment(ModelAndView model , HttpServletRequest request) throws IOException {
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
		List<ProductsType>lst_types=createDirtyService.Get_Products_Type_By_Category(1);
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
		dirtyForm.setWashing_list(programs);
		dirtyForm.setDriversList(drivers);
		dirtyForm.setAgentName(u.getDisplay_name()+','+u.getUSER_NAME());
		dirtyForm.setAssignDate(dateFormat.format(date));
		dirtyForm.setWareHouseName(facility.getFacility_name());
		List<UserRole> rols = userRoleService.getAllUserRole(u.getUSER_NAME());
		String flag = "";
		System.out.println("size"+ rols.size());
		
		model1.setViewName("AbuRawashInternalLaundry");
			products = createDirtyService.getProductsListNotPack(facility.getId());
			for(int i=0;i<rols.size();i++)
			{
				if(rols.get(i).getRole_id()==6)
				{
					model1.setViewName("ReverseWashing");

				}
			}
			
		
			
			products = createDirtyService.getProductsList(facility.getId());
		
			Facility facility1 = createDirtyService.getAbuRawashData();
			lundries.add(facility1);
			dirtyForm.setLundries_list(lundries);
			products = createDirtyService.getProductsList(facility.getId());
			
		
		dirtyForm.setProduct_list(products);
		model1.addObject("dirtyForm", dirtyForm);
		model1.addObject("fac", Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		model1.addObject("from_types", lst_types);
		return model1;
	
	}
	
	
	@RequestMapping(value = "/submitDirtyShipment", method = RequestMethod.POST,consumes ="application/json")
	public ResponseEntity<String> submitCoverDetails(@RequestBody  DirtyProductsForm dirtyForm , HttpServletRequest request)throws ServletException, IOException {
		System.out.println("driver "+ dirtyForm.getSelectedDriver());
		HttpSession session=request.getSession();
		//System.out.println("date"+coverForm.getCoverProducts().size());
		Gson gson = new Gson();
		String json = gson.toJson(dirtyForm.getDirty_list());
		  
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

				String validation =gatheringAndValidate(dirtyForm.getDirty_list(),facility);
				if(validation.equals(""))
				{
					System.out.println("external : "+dirtyForm.getExternalFlag());
				/*	if(dirtyForm.getExternalFlag().equals("true"))
					{*/
						submit=createDirtyService.submitExternalShipment_(dirtyForm.getSelectedDriver(), u.getUSER_NAME(), dirtyForm.getSelectedLundry(),json,dirtyForm.getFrom_type(),String.valueOf(session.getAttribute("fac_id"))) ;	
					/*}
					else {
				submit=createDirtyService.submitDirtyShipment(dirtyForm.getSelectedDriver(), u.getUSER_NAME(), dirtyForm.getSelectedLundry(),json) ;	
					}*/
				}
				else {
					return new ResponseEntity<String>(validation, HttpStatus.OK);
				}

			}
			
			System.out.println("submited1 : "+dirtyForm.getSelectedDriver()+" "+ u.getUSER_NAME()+" "+ dirtyForm.getSelectedLundry()+" "+json);
			System.out.println("submited : "+submit);
			if(!submit.equals("0")||!submit.equals("null")||!submit.equals(null))
			{
				return new ResponseEntity<String>(submit, HttpStatus.OK);

			}
			else {				
				return new ResponseEntity<String>("not success", HttpStatus.OK);

			}

	}
	
	
	private String gatheringAndValidate(List<DirtyProduct> produsts,Facility facility)
	{
		List<DirtyProductInPackage> dataBaseproducts = createDirtyService.getProductsListNotPack(facility.getId());
		System.out.println("size of validation"+dataBaseproducts.size());
		String validationString = "";
		for(int i =0 ;i< dataBaseproducts.size();i++ )
		{
			int Enteredquentity =0;
			for(int j =0 ;j< produsts.size();j++)
			{
				if (dataBaseproducts.get(i).getProduct_sku().equals(produsts.get(j).getProduct_id()))
				{
					Enteredquentity+=produsts.get(j).getQuantity();
				}
			}
			if (Enteredquentity > dataBaseproducts.get(i).getQuantity())
			{
				validationString+= dataBaseproducts.get(i).getProduct_name()+" Total Quantity you Entered is : "+Enteredquentity+ " And Actual is : "+dataBaseproducts.get(i).getQuantity()+"<br />";
				
			}
			
		}
		return validationString;
	}
	
	
	
	private String gatheringAndValidateNotInPacks(List<DirtyProduct> produsts,Facility facility)
	{
		List<DirtyProductInPackage> dataBaseproducts = createDirtyService.getProductsListNotPack(facility.getId());
		System.out.println("size of validation"+dataBaseproducts.size());
		String validationString = "";
		for(int i =0 ;i< dataBaseproducts.size();i++ )
		{
			int Enteredquentity =0;
			for(int j =0 ;j< produsts.size();j++)
			{
				if (dataBaseproducts.get(i).getProduct_sku().equals(produsts.get(j).getProduct_id()))
				{
					Enteredquentity+=produsts.get(j).getQuantity();
				}
			}
			if (Enteredquentity > dataBaseproducts.get(i).getQuantity())
			{
				validationString+= dataBaseproducts.get(i).getProduct_name()+" Total Quantity you Entered is : "+Enteredquentity+ " And Actual is : "+dataBaseproducts.get(i).getQuantity()+"<br />";
				
			}
			
		}
		return validationString;
	}
	
	
	@RequestMapping(value = "/submitInternalLaundry", method = RequestMethod.POST,consumes ="application/json")
	public ResponseEntity<String> submitInternalLaundry(@RequestBody  DirtyProductsForm dirtyForm , HttpServletRequest request)throws ServletException, IOException {
		System.out.println("driver "+ dirtyForm.getSelectedDriver());
		//System.out.println("date"+coverForm.getCoverProducts().size());
		Gson gson = new Gson();
		String json = gson.toJson(dirtyForm.getDirty_list());
		  HttpSession session=request.getSession();
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
				List<String> sku=new ArrayList<String>();
				String unique_skus="";
				
			for(int i=0;i<dirtyForm.getDirty_list().size();i++)
			{
				if(unique_skus.contains(dirtyForm.getDirty_list().get(i).getProduct_id()))
				{
					
				}
				else
				{
					if(unique_skus=="")
					{
						unique_skus+=dirtyForm.getDirty_list().get(i).getProduct_id();

					}
					else
					{
					unique_skus+=','+dirtyForm.getDirty_list().get(i).getProduct_id();
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
			for(int i=0;i<dirtyForm.getDirty_list().size();i++)
			{
				if(dirtyForm.getDirty_list().get(i).getProduct_id().equals(sku_arr[x]))
				{

					total_quan=dirtyForm.getDirty_list().get(i).getReceived_quantity();
					System.out.println(total_quan);
					quan=Integer.parseInt(String.valueOf(dirtyForm.getDirty_list().get(i).getQuantity()));
					sum_quan+=quan;
					BigDecimal check_quan=new BigDecimal(sum_quan);
					if(check_quan.compareTo(total_quan)>=1)
					{
						String x_product_name=dirtyForm.getDirty_list().get(i).getProduct_name()+" Has Wrong Quantities";
						System.out.println(x_product_name);
						return new ResponseEntity<String>(x_product_name,HttpStatus.OK);
					}
				}
				
			}
			}
			System.out.println("UniqueSKUS:"+unique_skus);
				String validation =gatheringAndValidateNotInPacks(dirtyForm.getDirty_list(),facility);
				System.out.println("validation"+validation);
				if(validation.equals(""))
				{
				submit=createDirtyService.submitInternalLundry(json, u.getUser_name(), "1", "1", 1 , dirtyForm.getFrom_type(),dirtyForm.getTo_type())	;
				}
				else {
					return new ResponseEntity<String>(validation, HttpStatus.OK);
				}

			}
			
		//	System.out.println("submited1 : "+dirtyForm.getSelectedDriver()+" "+ u.getUSER_NAME()+" "+ dirtyForm.getSelectedLundry()+" "+json);
			System.out.println("submited : "+submit);
			
			if(!submit.equals("0")||!submit.equals("null")||!submit.equals(null))
			{
				return new ResponseEntity<String>(submit, HttpStatus.OK);

			}
			else {				
				return new ResponseEntity<String>("not success", HttpStatus.OK);

			}

	}
	
	
	@RequestMapping(value="/ProductsTreatment")
	public ModelAndView ProductsTreatmentProgram(ModelAndView new_Mod)
	{
		
		//List<WashingPrograms> Treatment_Programs
		return new_Mod;
		
	}
	@RequestMapping(value="/GetToTypes")
	public ResponseEntity<String> get_to_types(@RequestBody ProductsType prod_type) throws JsonProcessingException
	{
		List<ProductsType>lst_to_type=createDirtyService.Get_To_Types(prod_type.getType_id());
		ObjectMapper mapper=new ObjectMapper();
		String x_to_types= mapper.writeValueAsString(lst_to_type);
		System.out.println(x_to_types);
		return new ResponseEntity<String>(x_to_types,HttpStatus.OK);
	}
	@RequestMapping(value="/GetProgramsData")
	public ResponseEntity<String> get_programs_data(@RequestBody ConversionForm Dying_form) throws JsonProcessingException
	{
		BigDecimal from_id=new BigDecimal(Dying_form.getFrom_type());
		BigDecimal to_id=new BigDecimal(Dying_form.getTo_type());
		List<ProgramsData> lst_programs=createDirtyService.Get_Programs(from_id, to_id);
		ObjectMapper mapper=new ObjectMapper();
		String programs=mapper.writeValueAsString(lst_programs);
		return new ResponseEntity<String>(programs,HttpStatus.OK);
	}
	@RequestMapping(value="/GetProductsForDying")
	public ResponseEntity<String> Get_Products_For_Dying(@RequestBody ConversionForm Dying_form) throws JsonProcessingException
	{
		int from_id=Integer.parseInt(Dying_form.getFrom_type());
		int fac_id=Integer.parseInt(Dying_form.getFac_id());
		List<Products>lst_products=stock_service.get_product_list(from_id, fac_id);
		ObjectMapper mapper=new ObjectMapper();
		String products=mapper.writeValueAsString(lst_products);
		if(lst_products.size()>0)
		{
		return new ResponseEntity<String>(products,HttpStatus.OK);
		}
		else
		{
			return new ResponseEntity<String>("No_Pro",HttpStatus.OK);

		}
	}
	@RequestMapping(value="/Dyeing")
	public ModelAndView DyingReverse(ModelAndView newMod , HttpServletRequest request)
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
		Facility fac=new Facility();
		fac=shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		ConversionForm Dying_form=new ConversionForm();
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		LocalDate date1=LocalDate.now();
		Date rec_date1=java.sql.Date.valueOf(date1);
		String check_current=String.valueOf(dateFormat.format(date));
		Dying_form.setAgent_name(u.getDisplay_name());
		Dying_form.setWarehouse_name(fac.getFacility_name());
		Dying_form.setConv_date(check_current);
		List<ProductsType> lst_of_dying_types=createDirtyService.Get_Products_Type_By_Category(2);
		System.out.println(lst_of_dying_types.size());
		newMod.addObject("from_types",lst_of_dying_types);
		newMod.addObject("dying_form", Dying_form);
		newMod.addObject("fac", Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));

		newMod.setViewName("ReverseDying");
		return newMod;
	}
	@RequestMapping(value="/ProductsDying")
	public ModelAndView ProductsDyingProgram(ModelAndView newMod , HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		if(Integer.parseInt(String.valueOf(session.getAttribute("fac_id")))!=1)
		{
			return new ModelAndView("redirect:/DashboardNoDust");
		}
		User u = new User();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
		String user="";
		user=userDetail.getUsername();
		u=userService.getUser(user);
		}
		Facility fac=new Facility();
		fac=shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		ConversionForm Dying_form=new ConversionForm();
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		LocalDate date1=LocalDate.now();
		Date rec_date1=java.sql.Date.valueOf(date1);
		String check_current=String.valueOf(dateFormat.format(date));
		Dying_form.setAgent_name(u.getDisplay_name()+','+u.getUser_name());
		Dying_form.setWarehouse_name(fac.getFacility_name());
		Dying_form.setConv_date(check_current);
		List<ProductsType> lst_of_dying_types=createDirtyService.Get_Products_Type_By_Category(2);
		System.out.println(lst_of_dying_types.size());
		newMod.addObject("from_types",lst_of_dying_types);
		newMod.addObject("dying_form", Dying_form);
		newMod.addObject("fac", Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));

		newMod.setViewName("ProductsDying");
		List<UserRole> roles = userRoleService.getAllUserRole(u.getUSER_NAME());

		for(int i=0;i<roles.size();i++)
		{
			if(roles.get(i).getRole_id()==6)
			{
				newMod.setViewName("ReverseDying");
			}
		}
		return newMod;
	}
	@RequestMapping(value="/SubmitDying")
	public ResponseEntity<String> Submit_Dying(@RequestBody ConversionForm Dying_form , HttpServletRequest request)
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
		Gson gson = new Gson();
		String json = gson.toJson(Dying_form.getDirty_product_lst());
		  
		int from_type=Integer.parseInt(Dying_form.getFrom_type());
		int to_type=Integer.parseInt(Dying_form.getTo_type());
		String logged_user=u.getUser_name();
		Facility fac=new Facility();
		fac=shipmentService.getFacilityById(1);
		List<String> sku=new ArrayList<String>();
		String unique_skus="";
		
	for(int i=0;i<Dying_form.getDirty_product_lst().size();i++)
	{
		if(unique_skus.contains(Dying_form.getDirty_product_lst().get(i).getProduct_id()))
		{
			
		}
		else
		{
			if(unique_skus=="")
			{
				unique_skus+=Dying_form.getDirty_product_lst().get(i).getProduct_id();

			}
			else
			{
			unique_skus+=','+Dying_form.getDirty_product_lst().get(i).getProduct_id();
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
	for(int i=0;i<Dying_form.getDirty_product_lst().size();i++)
	{
		if(Dying_form.getDirty_product_lst().get(i).getProduct_id().equals(sku_arr[x]))
		{

			total_quan=Dying_form.getDirty_product_lst().get(i).getReceived_quantity();
			System.out.println(total_quan);
			quan=Integer.parseInt(String.valueOf(Dying_form.getDirty_product_lst().get(i).getQuantity()));
			sum_quan+=quan;
			BigDecimal check_quan=new BigDecimal(sum_quan);
			if(check_quan.compareTo(total_quan)>=1)
			{
				String x_product_name=Dying_form.getDirty_product_lst().get(i).getProduct_name()+" Has Wrong Quantities";
				System.out.println(x_product_name);
				return new ResponseEntity<String>(x_product_name,HttpStatus.OK);
			}
		}
		
	}
	}
	System.out.println("UniqueSKUS:"+unique_skus);
		String validation =gatheringAndValidate(Dying_form.getDirty_product_lst(),fac);
if(validation.equals(""))
{
		String out_submit=createDirtyService.Submit_Dying_Programs(from_type, to_type, Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))), logged_user, json);
		if(!out_submit.equals("0")||!out_submit.equals("null")||!out_submit.equals(null))
		{
			return new ResponseEntity<String>(out_submit, HttpStatus.OK);

		}
		else {				
			return new ResponseEntity<String>("not success", HttpStatus.OK);

		}
	}
	
	else
	{
		return new ResponseEntity<String>(validation,HttpStatus.OK);
	}
	}
	
	@RequestMapping(value="/Treatment")
	public ModelAndView TreatmentProgram(ModelAndView newMod , HttpServletRequest request) throws JsonProcessingException
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
		Facility fac=new Facility();
		fac=shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		ConversionForm Dying_form=new ConversionForm();
		List<Treatment> lst_treatment=stock_service.Get_treatment_List();
		ObjectMapper mapper=new ObjectMapper();
		String x_treatments= mapper.writeValueAsString(lst_treatment);
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		LocalDate date1=LocalDate.now();
		Date rec_date1=java.sql.Date.valueOf(date1);
		String check_current=String.valueOf(dateFormat.format(date));
		Dying_form.setAgent_name(u.getDisplay_name());
		Dying_form.setWarehouse_name(fac.getFacility_name());
		Dying_form.setConv_date(check_current);
		List<ProductsType> lst_of_dying_types=createDirtyService.Get_Products_Type_By_Category(3);
		System.out.println(lst_of_dying_types.size());
		newMod.addObject("from_types",lst_of_dying_types);
		newMod.addObject("dying_form", Dying_form);
		newMod.addObject("treatment",x_treatments );
		newMod.addObject("fac", Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		newMod.setViewName("Treatment");
		return newMod;
	}
	@RequestMapping(value="/ProductTreatment")
	public ModelAndView ProductTreatment (ModelAndView newMod,HttpServletRequest request) throws JsonProcessingException
	{
		HttpSession session=request.getSession();
		if(Integer.parseInt(String.valueOf(session.getAttribute("fac_id")))!=1)
		{
			return new ModelAndView("redirect:/DashboardNoDust");
		}
		User u = new User();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
		String user="";
		user=userDetail.getUsername();
		u=userService.getUser(user);
		}
		Facility fac=new Facility();
		fac=shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		ConversionForm Dying_form=new ConversionForm();
		List<Treatment> lst_treatment=stock_service.Get_treatment_List();
		ObjectMapper mapper=new ObjectMapper();
		String x_treatments= mapper.writeValueAsString(lst_treatment);
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		LocalDate date1=LocalDate.now();
		Date rec_date1=java.sql.Date.valueOf(date1);
		String check_current=String.valueOf(dateFormat.format(date));
		Dying_form.setAgent_name(u.getDisplay_name()+','+u.getUser_name());
		Dying_form.setWarehouse_name(fac.getFacility_name());
		Dying_form.setConv_date(check_current);
		List<ProductsType> lst_of_dying_types=createDirtyService.Get_Products_Type_By_Category(3);
		System.out.println(lst_of_dying_types.size());
		newMod.addObject("from_types",lst_of_dying_types);
		newMod.addObject("dying_form", Dying_form);
		newMod.addObject("treatment",x_treatments );
		newMod.addObject("fac", Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		newMod.setViewName("ProductsTreatment");
		List<UserRole> roles = userRoleService.getAllUserRole(u.getUSER_NAME());

		for(int i=0;i<roles.size();i++)
		{
			if(roles.get(i).getRole_id()==6)
			{
				newMod.setViewName("Treatment");

			}
		}
		return newMod;
	}
	@RequestMapping(value="/SubmitTreatment")
	public ResponseEntity<String> Submit_Treatment(@RequestBody ConversionForm Treatment_Page , HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		Gson gson=new Gson();
		String json=gson.toJson(Treatment_Page.getTreated_product_lst());
		User u = new User();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
		String user="";
		user=userDetail.getUsername();
		u=userService.getUser(user);
		}
		Facility fac=new Facility();
		fac=shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		int from_id=Integer.parseInt(Treatment_Page.getFrom_type());
		int to_id=Integer.parseInt(Treatment_Page.getTo_type());
		List<String> sku=new ArrayList<String>();
		String unique_skus="";
		
	for(int i=0;i<Treatment_Page.getTreated_product_lst().size();i++)
	{
		if(unique_skus.contains(Treatment_Page.getTreated_product_lst().get(i).getProduct_id()))
		{
			
		}
		else
		{
			if(unique_skus=="")
			{
				unique_skus+=Treatment_Page.getTreated_product_lst().get(i).getProduct_id();

			}
			else
			{
			unique_skus+=','+Treatment_Page.getTreated_product_lst().get(i).getProduct_id();
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
	for(int i=0;i<Treatment_Page.getTreated_product_lst().size();i++)
	{
		if(Treatment_Page.getTreated_product_lst().get(i).getProduct_id().equals(sku_arr[x]))
		{

			total_quan=Treatment_Page.getTreated_product_lst().get(i).getTotal_stock_quantity();
			System.out.println(total_quan);
			quan=Integer.parseInt(String.valueOf(Treatment_Page.getTreated_product_lst().get(i).getQuantity()));
			sum_quan+=quan;
			BigDecimal check_quan=new BigDecimal(sum_quan);
			if(check_quan.compareTo(total_quan)>=1)
			{
				String x_product_name=Treatment_Page.getTreated_product_lst().get(i).getProduct_name()+" Has Wrong Quantities";
				System.out.println(x_product_name);
				return new ResponseEntity<String>(x_product_name,HttpStatus.OK);
			}
		}
		
	}
	}
	System.out.println("UniqueSKUS:"+unique_skus);
		String out_submit=createDirtyService.Submit_Treatment_Programs(from_id, to_id,Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))), json, u.getUser_name());
		if(!out_submit.equals("0")||!out_submit.equals("null")||!out_submit.equals(null))
		{
			return new ResponseEntity<String>(out_submit, HttpStatus.OK);

		}
		else {				
			return new ResponseEntity<String>("not success", HttpStatus.OK);

		}
	}
	@RequestMapping(value="/GetConsumables")
	public ResponseEntity<String>Get_Consumables(@RequestBody ConsumableData consum) throws JsonProcessingException
	{
		/*List<String> lst_ids=new ArrayList<String>();
		String[] ids=consum.getIds().split(",");
		for(int i=0;i<ids.length;i++)
		{
			lst_ids.add(ids[i]);
		}
		int index=consum.getIds().lastIndexOf(',');
		String x_ids=consum.getIds().substring(0, index);*/
		List<Consumable>lst_consumables=createDirtyService.Get_Program_Consumables(consum.getIds());
		List<Consumable> lst_total_consumables=createDirtyService.Get_Total_Consumables(consum.getIds());
		List<DirtyOrderData>lst_data_for_printing=createDirtyService.Get_Order_DataFor_Printing(Integer.parseInt(consum.getIds()));
		ConsumableData con_data=new ConsumableData();
		con_data.setConsumable_details(lst_consumables);
		con_data.setTotal_consumables(lst_total_consumables);
		con_data.setOrder_data_printing(lst_data_for_printing);
		ObjectMapper mapper=new ObjectMapper();
		String x=mapper.writeValueAsString(con_data);
		return new ResponseEntity<String>(x,HttpStatus.OK);
	}
	@RequestMapping(value="/GetShipmentConsumable")
	public ResponseEntity<String>Get_Shipment_Consumables(@RequestBody ConsumableData consum) throws JsonProcessingException
	{
		int shipment_id=Integer.parseInt(consum.getIds());
		List<Consumable>lst_consumables=createDirtyService.Get_Total_Consumables_Details(shipment_id);
		List<Consumable> lst_total_consumables=createDirtyService.Get_Program_Consumables(shipment_id);
		List<DirtyProductData>data_for_printing=createDirtyService.Get_Data_For_Printing(shipment_id);
		ConsumableData con_data=new ConsumableData();
		con_data.setConsumable_details(lst_consumables);
		con_data.setTotal_consumables(lst_total_consumables);
		con_data.setData_for_printing(data_for_printing);
		ObjectMapper mapper=new ObjectMapper();
		String x=mapper.writeValueAsString(con_data);
		return new ResponseEntity<String>(x,HttpStatus.OK);
	}
	@RequestMapping(value="/GetTypeByCtegoryId")
	public ResponseEntity<String>Get_Types_BY_Cat(@RequestBody ProductsType pro_type) throws JsonProcessingException
	{
		List<ProductsType>lst_from_types=createDirtyService.Get_Products_Type_By_Category(Integer.parseInt(String.valueOf(pro_type.getType_id())));
		ObjectMapper mapper=new ObjectMapper();
		String val_types=mapper.writeValueAsString(lst_from_types);
		if(lst_from_types.size()>0)
		{
		return new ResponseEntity<String>(val_types,HttpStatus.OK);
		}
		else
		{
			return new ResponseEntity<String>("No_types",HttpStatus.OK);

		}
	}
} 
