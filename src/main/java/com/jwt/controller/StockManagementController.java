package com.jwt.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.jwt.model.AccountBalance;
import com.jwt.model.ConsumableData;
import com.jwt.model.ConversionForm;
import com.jwt.model.DailyInventoryCheck;
import com.jwt.model.DailyInventoryCheckDetails;
import com.jwt.model.DailyShipments;
import com.jwt.model.DirtyProduct;
import com.jwt.model.DirtyProductInPackage;
import com.jwt.model.DirtyShipmentData;
import com.jwt.model.ExpectedQuantityOfProducts;
import com.jwt.model.Facility;
import com.jwt.model.InventoryCheck;
import com.jwt.model.InventoryFormData;
import com.jwt.model.InventoryProduct;
import com.jwt.model.NewProduct;
import com.jwt.model.ProductComponentDetails;
import com.jwt.model.ProductListsCoverForm;
import com.jwt.model.ProductRawMaterial;
import com.jwt.model.ProductTransaction;
import com.jwt.model.Products;
import com.jwt.model.ProductsType;
import com.jwt.model.TransactionReport;
import com.jwt.model.Treatment;
import com.jwt.model.User;
import com.jwt.model.UserData;
import com.jwt.model.UserRole;
import com.jwt.service.ReceivingProductsService;
import com.jwt.service.ReleasingProductsService;
import com.jwt.service.StockManagmentService;
import com.jwt.service.UserRoleService;
import com.jwt.service.UserRoleServiceImpl;
import com.jwt.service.UserService;

@Controller
public class StockManagementController {
	@Autowired
	private StockManagmentService stockService;
	
	@Autowired
	private UserService userService;
	@Autowired
	private UserRoleService userRoleService;
	@Autowired
	private ReleasingProductsService shipmentService;
	@Autowired
	private ReceivingProductsService receivingService;
	
	@RequestMapping(value="/GetRawMaterials",method=RequestMethod.POST,consumes = "application/json")
	public ResponseEntity<String>Get_Order_RawMaterials(@RequestBody ConsumableData consum) throws JsonProcessingException
	{
		int order_id=Integer.parseInt(consum.getIds());
		List<ProductRawMaterial> lst=stockService.Get_Raw_Materials(order_id);
		ObjectMapper mapper=new ObjectMapper();
		String lst_mat=mapper.writeValueAsString(lst);
		return new ResponseEntity<String>(lst_mat,HttpStatus.OK);
	}
	
	@RequestMapping(value="/SubmitCreateProduct",method=RequestMethod.POST,consumes = "application/json")
	public ResponseEntity<String>SubmitCreatingProduct(@RequestBody ProductListsCoverForm form_data , HttpServletRequest request) throws JsonProcessingException
	{
		HttpSession session=request.getSession();
		List<Products> prod_lst=form_data.getLst_prods();
		ObjectMapper mapper=new ObjectMapper();
		String pro_data=mapper.writeValueAsString(prod_lst);
		User u = new User();
		String user="";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
	
		user=userDetail.getUsername();
	    u=userService.getUser(user);
		}
		System.out.println(user);
		System.out.println(u.getOrg_unit_id());
		System.out.println(pro_data);

		List<ProductComponentDetails>lst_details=stockService.Get_Component_Details(prod_lst.get(0).getProduct_id(), Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		int Pro_quan=Integer.parseInt(String.valueOf(prod_lst.get(0).getQuantity()));
		for(int i=0;i<lst_details.size();i++)
		{
			BigDecimal com_quan=lst_details.get(i).getQuantity();
			BigDecimal available_quan=lst_details.get(i).getTotal_stock_quantity();
			int total_quan=Integer.parseInt(String.valueOf(com_quan))*Integer.parseInt(String.valueOf(Pro_quan));
			int check_ava=Integer.parseInt(String.valueOf(available_quan));
			if(total_quan>check_ava)
			{
				String Error_Msg=lst_details.get(i).getProduct_name()+" don't have enough Quantity";
				return new ResponseEntity<String>(Error_Msg,HttpStatus.OK);
			}
		}

		String out_submit=stockService.Submit_Create_New_Product(pro_data, user, Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		return new ResponseEntity<String>(out_submit,HttpStatus.OK);
	}
	
	@RequestMapping(value="/CreateProduct")
	public ModelAndView CreateNewProduct(ModelAndView model , HttpServletRequest request)
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
		Facility facility = shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		ModelAndView newMod=new ModelAndView();
		List<NewProduct>lst_products=stockService.Get_New_Product_List();
		newMod.addObject("date", dateFormat.format(date));
		newMod.addObject("wareHouse", facility.getFacility_name());
		newMod.addObject("agent", u.getDisplay_name()+','+u.getUSER_NAME());
		newMod.addObject("lst_products", lst_products);
		newMod.setViewName("CreateProduct");
		return newMod;
	}
	
@RequestMapping(value="/Convertproduct")
public ModelAndView convertproduct(ModelAndView model,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
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
	Facility facility = shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	List<InventoryProduct> products = stockService.getAllProducts(facility.getId());
	System.out.println(products.size());
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	Date date = new Date();
	ModelAndView newMod=new ModelAndView();
	newMod.addObject("date", dateFormat.format(date));
	newMod.addObject("wareHouse", facility.getFacility_name());
	newMod.addObject("agent", u.getDisplay_name()+','+u.getUSER_NAME());
	newMod.addObject("products",products);
	newMod.setViewName("convertproduct");
	return newMod;
}

@RequestMapping(value = "/submitConvertProduct", method = RequestMethod.POST,consumes ="application/json")
public ResponseEntity<String> submitConvertProduct(@RequestBody InventoryFormData inventoryForm , HttpServletRequest request)throws ServletException, IOException {

	Gson gson = new Gson();
	HttpSession session=request.getSession();
	String json = gson.toJson(inventoryForm.getProducts());
		System.out.println("json : "+json);
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

			String validation = gatheringAndValidate(inventoryForm.getProducts(),Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
			if(validation.equals(""))
			{
			submited=stockService.submitConvetProducts(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))),json,u.getUSER_NAME());
			}
			else {
				return new ResponseEntity<String>(validation, HttpStatus.OK);
			}

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
			return new ResponseEntity<String>("not success", HttpStatus.OK);

		}
}

private String gatheringAndValidate(List<InventoryProduct> produsts,int facility_id)
{
	List<InventoryProduct> dataBaseproducts = stockService.getAllProducts(facility_id);
	System.out.println("size of validation"+dataBaseproducts.size());
	String validationString = "";
	for(int i =0 ;i< dataBaseproducts.size();i++ )
	{
		int Enteredquentity =0;
		for(int j =0 ;j< produsts.size();j++)
		{
			if (dataBaseproducts.get(i).getProduct_id().equals(produsts.get(j).getProduct_id()))
			{
				Enteredquentity+=Integer.valueOf(produsts.get(j).getQuantity());
			}
		}
		if (Enteredquentity > Integer.valueOf(dataBaseproducts.get(i).getQuantity()))
		{
			validationString+= dataBaseproducts.get(i).getProduct_name()+" Total Quantity you Entered is : "+Enteredquentity+ " And Actual is : "+dataBaseproducts.get(i).getQuantity()+"<br />";
			
		}
		
	}
	return validationString;
}


@RequestMapping(value="/ConvertProductRequests")
public ModelAndView ConvertProductRequests(ModelAndView model,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
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
	List<DirtyShipmentData> shipments = stockService.getConvertRequests(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	//System.out.println(shipments.size());
	ModelAndView newMod=new ModelAndView();
	newMod.addObject("shipments",shipments);
	newMod.setViewName("ConvetProductsRequestLst");
	return newMod;
}
@RequestMapping(value="/ConvertProductsDetails")
public ModelAndView ConvertProductsDetails(ModelAndView model,@RequestParam(value = "ConvertID", required = true) int  convert_id,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
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
	ModelAndView newMod=new ModelAndView();
	Facility facility = shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	DirtyShipmentData shipmentData = stockService.getConvertReqWith(convert_id);
	if(shipmentData !=null) {
	List<InventoryProduct> products = stockService.getConvertReqProducts(convert_id);
	System.out.println(products.size());
	newMod.addObject("convertDate", shipmentData.getShipment_date());
	newMod.addObject("LoggedUser", shipmentData.getLogged_user());
	newMod.addObject("status" ,shipmentData.getLast_status());
	newMod.addObject("warehouse", facility.getFacility_name());
	newMod.addObject("convertID", convert_id);
	newMod.addObject("products",products);
	String approved_by="";
	Date approval_date=new Date();
	if(shipmentData.getApproved_by()==null)
	{
		approved_by=u.getDisplay_name()+','+u.getUser_name();
	}
	else
	{
		approved_by=shipmentData.getApproved_by();
		approval_date=shipmentData.getApproval_time();
	}
	newMod.addObject("approved_by", approved_by);
	newMod.addObject("approval_time",approval_date);
	}
	newMod.setViewName("ConvertProductsDetails");
	return newMod;
}
@RequestMapping(value = "/approveRejectConvertReq", method = RequestMethod.POST,consumes ="application/json")
public ResponseEntity<String> approveRejectConvertReq(@RequestBody InventoryCheck inventoryCheck, HttpServletRequest request)throws ServletException, IOException {
	  System.out.println(inventoryCheck.getApproveVa() + inventoryCheck.getId()); 
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
		String submited = new String();
		if(u.getUSER_NAME() != null)
		{
			
			submited=stockService.approveRejectConvertRequest(inventoryCheck.getId(), Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))), u.getUser_name(), inventoryCheck.getApproveVa());

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
			return new ResponseEntity<String>("not success", HttpStatus.OK);

		}
}
@RequestMapping(value="/Conversion")
public ModelAndView Reverse_Conversions(ModelAndView model , HttpServletRequest request) throws JsonProcessingException
{
	HttpSession session=request.getSession();
	String username="";
	String display_name="";
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	User user=new User();
	Facility fac=new Facility();
	if (!(auth instanceof AnonymousAuthenticationToken)) {
	UserDetails userDetail = (UserDetails) auth.getPrincipal();
	username=userDetail.getUsername();
	user=userService.getUser(username);
	display_name=user.getDisplay_name();
	System.out.println("Display Name : "+display_name);
	fac=receivingService.Get_Facility_Info(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	}
	List<Treatment> lst_treatment=stockService.Get_treatment_List();
	ObjectMapper mapper=new ObjectMapper();
	String x_treatments= mapper.writeValueAsString(lst_treatment);
	System.out.println(x_treatments);
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	Date date = new Date();
	LocalDate date1=LocalDate.now();
	Date rec_date1=java.sql.Date.valueOf(date1);
	String check_current=String.valueOf(dateFormat.format(date));

	ConversionForm con_form=new ConversionForm();
	con_form.setWarehouse_name(fac.getFacility_name());
	con_form.setAgent_name(display_name);
	con_form.setConv_date(check_current);
	con_form.setFac_id(String.valueOf(session.getAttribute("fac_id")));
ModelAndView mod=new ModelAndView();
mod.setViewName("ReverseConversions");
mod.addObject("data",con_form);
mod.addObject("treatments", x_treatments);
return mod;
}
@RequestMapping(value="/ProductConversion")
public ModelAndView ProductConversion(ModelAndView model,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
{
	HttpSession session=request.getSession();
	String username="";
	String display_name="";
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	User user=new User();
	List<ProductsType>lst_from_type=null;
	Facility fac=new Facility();
	if (!(auth instanceof AnonymousAuthenticationToken)) {
	UserDetails userDetail = (UserDetails) auth.getPrincipal();
	username=userDetail.getUsername();
	user=userService.getUser(username);
	display_name=user.getDisplay_name();
	System.out.println("Display Name : "+display_name);
	fac=receivingService.Get_Facility_Info(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	lst_from_type=stockService.getsimpleconversionfromtype(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	
	}
	List<Treatment> lst_treatment=stockService.Get_treatment_List();
	ObjectMapper mapper=new ObjectMapper();
	String x_treatments= mapper.writeValueAsString(lst_treatment);
	System.out.println(x_treatments);
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	Date date = new Date();
	LocalDate date1=LocalDate.now();
	Date rec_date1=java.sql.Date.valueOf(date1);
	String check_current=String.valueOf(dateFormat.format(date));

	ConversionForm con_form=new ConversionForm();
	con_form.setWarehouse_name(fac.getFacility_name());
	con_form.setAgent_name(display_name+','+user.getUser_name());
	con_form.setConv_date(check_current);
	con_form.setFac_id(String.valueOf(session.getAttribute("fac_id")));
ModelAndView mod=new ModelAndView();
mod.setViewName("ProductConversion");
List<UserRole> roles = userRoleService.getAllUserRole(user.getUSER_NAME());
for(int i=0;i<roles.size();i++)
{
	if(roles.get(i).getRole_id()==6)
	{
		mod.setViewName("ReverseConversions");

	}
}
mod.addObject("data",con_form);
mod.addObject("treatments", x_treatments);
mod.addObject("from_type", lst_from_type);
return mod;
}
@RequestMapping(value="/GetTreatment",method=RequestMethod.POST,consumes="application/json")
public ResponseEntity<String> Get_Treatment()throws ServletException, IOException 
{

	List<Treatment> lst_treatment=stockService.Get_treatment_List();
	ObjectMapper mapper=new ObjectMapper();
	String x_treatments= mapper.writeValueAsString(lst_treatment);
	System.out.println(x_treatments);
	return new ResponseEntity<String>(x_treatments,HttpStatus.OK);
}
@RequestMapping(value="/SubmitConversion",method=RequestMethod.POST,consumes="application/json")
public ResponseEntity<String> Submit_conversion(@RequestBody ConversionForm con_form , HttpServletRequest request)throws ServletException, IOException 
{
	HttpSession session=request.getSession();
	String convert_from_type=con_form.getFrom_type();
	List<Products> lst_product =new ArrayList<Products>();
	if(convert_from_type.equals("4")||convert_from_type.equals("New"))
	{
		int fac_id=Integer.parseInt(con_form.getFac_id());
		if(convert_from_type.equals("New"))
		{
			fac_id=1;
		}
		lst_product =stockService.get_product_list(4,fac_id);
		System.out.println("Size : "+lst_product.size());
	}
	if(convert_from_type.equals("1"))
	{
		int fac_id=Integer.parseInt(con_form.getFac_id());

		lst_product =stockService.get_product_list(1,fac_id);
		System.out.println("Size : "+lst_product.size());
		
	}
	if(convert_from_type.equals("5"))
	{
		int fac_id=Integer.parseInt(con_form.getFac_id());
		lst_product=stockService.get_product_list(5, fac_id);
		
	}
	if(convert_from_type.equals("6"))
	{
		int fac_id=Integer.parseInt(con_form.getFac_id());
		lst_product=stockService.get_product_list(6, fac_id);
		
	}
	if(lst_product.size()==0)
	{
		return new ResponseEntity<String>("NoPro",HttpStatus.OK);
	}
	ObjectMapper mapper=new ObjectMapper();
String x_products= mapper.writeValueAsString(lst_product);
//System.out.println(x_products);

return new ResponseEntity<String>(x_products,HttpStatus.OK);
}
@RequestMapping(value="EndConversion",method=RequestMethod.POST,consumes ="application/json")
public ResponseEntity<String> EndConvert(@RequestBody ConversionForm con_form,HttpServletRequest request)
{
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();

	String agent_user_name="";
	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		agent_user_name=userDetail.getUsername();
	}
	HttpSession session=request.getSession();
	Gson gson_products=new Gson();
	List<Products> prod_lst=con_form.getProd_lst();
	String json_str=gson_products.toJson(prod_lst);
	System.out.println(json_str);
	String out_conv="";
	int facility_id=Integer.valueOf(String.valueOf(session.getAttribute("fac_id")));
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
	out_conv=stockService.Submit_Conversion(facility_id, agent_user_name, con_form.getFrom_type(), con_form.getTo_type(), json_str);
	return new ResponseEntity<String>(out_conv,HttpStatus.OK);
}
@RequestMapping(value="/ExpectedINOUT")
public ModelAndView Get_Expected_Values(ModelAndView mod , HttpServletRequest request)
{
	HttpSession session=request.getSession();
	List<ExpectedQuantityOfProducts>lst_expected_dirty=stockService.Get_Total_Expected_Dirty(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	List<Treatment>lst_treatment_for_dispatch=stockService.lst_treatment_for_dispatch();
	List<ExpectedQuantityOfProducts>lst_clean_products=stockService.Get_Clean_Products(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	List<ExpectedQuantityOfProducts>lst_clean_with_treatment=stockService.Get_Clean_Products_treatments(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	List<Treatment>lst_treatment_reconciliation=stockService.lst_treatment_for_reconciliation();
	List<ExpectedQuantityOfProducts>lst_all_reconcilation_products=stockService.Get_Reconciliation_Products(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	mod.addObject("expected_dirty", lst_expected_dirty);
	mod.addObject("lst_treatment", lst_treatment_for_dispatch);
	mod.addObject("lst_clean_products",lst_clean_products);
	mod.addObject("clean_treatment_lst", lst_clean_with_treatment);
	mod.addObject("lst_treatment_reconciliation", lst_treatment_reconciliation);
	mod.addObject("lst_reconciliation_products", lst_all_reconcilation_products);
	mod.setViewName("ExpectedInOut");
	return mod;
}
@RequestMapping(value="/DailyShipmentsData")
public ModelAndView Get_Daily_Shipment_Data(HttpServletRequest request,ModelAndView model)
{
	List<DailyShipments>lst_daily_shipments=new ArrayList<DailyShipments>();
	HttpSession session = request.getSession();
    lst_daily_shipments=stockService.Get_Daily_Shipments_Data(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
    int total_dispatch=0;
	int total_reconciliation=0;
	int total_laundry=0;
	int total_new=0;
	int total_cash=0;
	int total_cash_received=0;
	int total_internal_cash_transfer=0;
	int total_shipment_cash_transfer=0;
	String username="";
	String finance_access="";
	double Expected_Cash=0;
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();

	if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		username=userDetail.getUsername();
	List<UserRole>lst_roles=userRoleService.getAllUserRole(username);
    Expected_Cash=stockService.Get_Expected_Cash();

	for(int i=0;i<lst_roles.size();i++)
	{
		
		if(lst_roles.get(i).getRole_id()==2||lst_roles.get(i).getRole_id()==4)
		{
			finance_access="Yes";
		}
	}
	System.out.println("FinanceAccess:"+finance_access);
	for(int i=0;i<lst_daily_shipments.size();i++)
	{
		if(lst_daily_shipments.get(i).getShipment_type_id()==1)
			total_dispatch=lst_daily_shipments.get(i).getTotal_num();
		if(lst_daily_shipments.get(i).getShipment_type_id()==2)
			total_reconciliation=lst_daily_shipments.get(i).getTotal_num();
		if(lst_daily_shipments.get(i).getShipment_type_id()==3)
			total_cash=lst_daily_shipments.get(i).getTotal_num();
		if(lst_daily_shipments.get(i).getShipment_type_id()==4)
			total_cash_received=lst_daily_shipments.get(i).getTotal_num();
		if(lst_daily_shipments.get(i).getShipment_type_id()==5)
			total_laundry=lst_daily_shipments.get(i).getTotal_num();
		if(lst_daily_shipments.get(i).getShipment_type_id()==7)
			total_internal_cash_transfer=lst_daily_shipments.get(i).getTotal_num();
		if(lst_daily_shipments.get(i).getShipment_type_id()==8)
			total_shipment_cash_transfer=lst_daily_shipments.get(i).getTotal_num();
		if(lst_daily_shipments.get(i).getShipment_type_id()==9)
			total_new=lst_daily_shipments.get(i).getTotal_num();
	}
	}
	model.addObject("total_dispatch_num", total_dispatch);
	model.addObject("total_reconciliation_num",total_reconciliation);
	model.addObject("total_cash", total_cash);
	model.addObject("total_cash_received", total_cash_received);
	model.addObject("total_laundry", total_laundry);
	model.addObject("total_internal_transfer", total_internal_cash_transfer);
	model.addObject("total_cash_transfer", total_shipment_cash_transfer);
	model.addObject("total_new", total_new);
	model.addObject("financial_access", finance_access);

	model.addObject("lst_daily_shipment", lst_daily_shipments);	
	model.addObject("expected_cash", Expected_Cash);

	model.setViewName("DailyShipments");
	return model;
}
@RequestMapping(value="/DailyInventoryCheck")
public ModelAndView automatic_inventory(ModelAndView model, HttpServletRequest request)
{
	Authentication auth=SecurityContextHolder.getContext().getAuthentication();
	HttpSession session=request.getSession();
	String username="";
	User user=new User();
	Facility fac=new Facility();
	if (!(auth instanceof AnonymousAuthenticationToken)) {
	UserDetails userDetail = (UserDetails) auth.getPrincipal();
	username=userDetail.getUsername();
	List<DailyInventoryCheck>lst_inventory_check=stockService.Get_Daily_Inventory_Check_List(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));

	System.out.println("Size"+lst_inventory_check.size());
	model.addObject("lst_inventory",lst_inventory_check);
	model.setViewName("AutomaticInventoryCheck");
	}
	return model;
}
@RequestMapping(value="/SubmitAutomaticInventory")
public ResponseEntity<String> submit_inventory(HttpServletRequest request)
{
	String out_check="";
	Authentication auth=SecurityContextHolder.getContext().getAuthentication();
	if (!(auth instanceof AnonymousAuthenticationToken)) {

	HttpSession session=request.getSession();
	 out_check=stockService.Automatic_Inventory_Check(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	//System.out.println("Result: "+out_check);
	}
	return new ResponseEntity<String>(out_check,HttpStatus.OK);
}
@RequestMapping(value="/DailyInventoryCheckDetails")
public ModelAndView GetInventoryCheck(ModelAndView model,@RequestParam(value = "InventoryCheckID", required = true) int checkID ,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
{
	Authentication auth=SecurityContextHolder.getContext().getAuthentication();
	if (!(auth instanceof AnonymousAuthenticationToken)) {

		HttpSession session=request.getSession();
		DailyInventoryCheck inventory_det=stockService.GetDailyInventoryCheckById(checkID);
	int current_fac=Integer.parseInt(String.valueOf(session.getAttribute("fac_id")));
	if(current_fac!=inventory_det.getFacility_id())
	{
		return new ModelAndView("redirect:/DashboardNoDust");
	}
	Facility fac=new Facility();
	fac=receivingService.Get_Facility_Info(inventory_det.getFacility_id());
	List<DailyInventoryCheckDetails>lst_details=stockService.Get_Inventory_Details_ById(checkID);
	model.addObject("WarehouseName", fac.getFacility_name());
	model.addObject("check_data", inventory_det);
	model.addObject("products", lst_details);
	}
	
model.setViewName("DailyInventoryCheckDetails");
return model;
}

@RequestMapping(value="GetSimpleConverionToTypes",method=RequestMethod.POST,consumes ="application/json")
public ResponseEntity<String> gettotypesforsimpleconversion(HttpServletRequest request,@RequestBody ProductsType product_type) throws JsonProcessingException
{
	HttpSession session=request.getSession();
	List<ProductsType>lst_to_types=stockService.getsimpleconversiontotype(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))),Integer.parseInt(String.valueOf(product_type.getType_id())));

	ObjectMapper mapper=new ObjectMapper();
	String to_type=mapper.writeValueAsString(lst_to_types);
	System.out.println(to_type);
	return new ResponseEntity<String>(to_type,HttpStatus.OK);	
}


@RequestMapping(value="/ProductDeduction")
public ModelAndView DeductProductComponents(ModelAndView model , HttpServletRequest request)
{
	HttpSession session=request.getSession();
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	UserDetails userDetail;
	String agent_user_name="";
	if (!(auth instanceof AnonymousAuthenticationToken)) {
		userDetail = (UserDetails) auth.getPrincipal();
		agent_user_name=userDetail.getUsername();
	}
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	Date date = new Date();
	Facility fac=shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	List<InventoryProduct> lst_component=stockService.get_component_list(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	model.addObject("products",lst_component);
model.addObject("wareHouse", fac.getFacility_name());
UserData user=userService.get_user_data(agent_user_name);
model.addObject("agent", user.getDisplay_name()+','+user.getUser_name());
model.addObject("date", String.valueOf(dateFormat.format(date)));
	model.setViewName("ProductDeduction");
	return model;
}
@RequestMapping(value="SubmitDeduction",method=RequestMethod.POST,consumes ="application/json")
public ResponseEntity<String> Submit_ProductDeduction(HttpServletRequest request,@RequestBody InventoryFormData Deduct_form) throws JsonProcessingException
{
	HttpSession session=request.getSession();
	List<InventoryProduct> lst_products=Deduct_form.getProducts();
	ObjectMapper mapper=new ObjectMapper();
	String products=mapper.writeValueAsString(lst_products);
	System.out.println("Products"+products);
	String agent_user_name="";
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	UserDetails userDetail;
	if (!(auth instanceof AnonymousAuthenticationToken)) {
		userDetail = (UserDetails) auth.getPrincipal();
		agent_user_name=userDetail.getUsername();
	}
	String out_submit=stockService.SubmitProductDeduction(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))), agent_user_name, products);
	
	return new ResponseEntity<String>(out_submit,HttpStatus.OK);
}

@RequestMapping(value="OperationTransaction")
public ModelAndView GetOperationTransactionReport(ModelAndView model ,HttpServletRequest request)
{
	List<Facility> lst_fac=stockService.get_facility_list();
	List<Products>lst_products=stockService.getProductList();
	model.addObject("warehouses", lst_fac);
	model.addObject("products", lst_products);
	model.setViewName("OperationTransaction");
	return model;
}
@RequestMapping(value="GetTransactionData",method=RequestMethod.POST,consumes = "application/json" , produces = "application/json;charset=UTF-8")
public ResponseEntity<String>GetTransactionData(@RequestBody TransactionReport data , HttpServletRequest request) throws JsonProcessingException
{
	List<ProductTransaction> lst_product=stockService.gettransactiondata(data.getFacility_id(), data.getProduct_id(), data.getFrom_date(), data.getTo_date());
	List<ProductTransaction>lst_product_types=stockService.getProductsWithTypes(data.getFacility_id(), data.getProduct_id(), data.getFrom_date(), data.getTo_date());
	data.setLst_products(lst_product);
	data.setLst_products_types(lst_product_types);
	ObjectMapper mapper=new ObjectMapper();
	String P_string=mapper.writeValueAsString(data);
	if(lst_product.size()==0)
	{
		P_string="noprod";
	}
	
	return new ResponseEntity<String>(P_string,HttpStatus.OK);
}
@RequestMapping(value="ProductTransactionOnDate")
public ModelAndView GetDataByDate(ModelAndView model,@RequestParam(value = "facility_id", required = true) int facility_id , @RequestParam(value="date",required = true) String date , @RequestParam(value="product",required = true) String product)
{
	Facility fac=shipmentService.getFacilityById(facility_id);
	List<ProductTransaction> lst_products=stockService.getDataWithDate(facility_id, product, date);
	List<ProductTransaction> lst_details=stockService.getDetailsWithDate(facility_id, product, date);
	List<ProductTransaction>lst_byname=stockService.get_productsbydms(product);
	String product_name="";
	if(lst_byname.size()>0)
	{
	product_name=lst_byname.get(0).getProduct_name();
	}
	model.addObject("products", lst_products);
	model.addObject("details", lst_details);
	model.addObject("warehouse", fac.getFacility_name());
	model.addObject("date", date);
	model.addObject("productName", product_name);
	model.setViewName("DetailsOnDate");
	return model;
}
@RequestMapping(value="AccountBalance")
public ModelAndView GetAccounts_Balance(ModelAndView model,HttpServletRequest request)
{
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	UserDetails userDetail;
	User u=new User();
	if (!(auth instanceof AnonymousAuthenticationToken)) {
		userDetail = (UserDetails) auth.getPrincipal();
		//agent_user_name=userDetail.getUsername();
		u=userService.getUser(userDetail.getUsername());
	}
	HttpSession session=request.getSession();
	List<AccountBalance> lst_accounts=stockService.get_account_balance(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	Date date = new Date();
	Facility fac=receivingService.Get_Facility_Info(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
	model.addObject("lst_accounts", lst_accounts);
	model.addObject("agent_name", u.getDisplay_name()+','+u.getUSER_NAME());
	model.addObject("facility_name", fac.getFacility_name());
	model.addObject("date", dateFormat.format(date));
	model.setViewName("AccountBalance");
	return model;
}
}
