package com.jwt.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jwt.model.AllShipments;
import com.jwt.model.CashReconciliationReport;
import com.jwt.model.Consumable;
import com.jwt.model.Facility;
import com.jwt.model.InventoryCheck;
import com.jwt.model.InventoryDetail;
import com.jwt.model.InventoryProduct;
import com.jwt.model.LostRlostReportProducts;
import com.jwt.model.Operation;
import com.jwt.model.Order;
import com.jwt.model.OrderDetail;
import com.jwt.model.ProductsType;
import com.jwt.model.ReportForm;
import com.jwt.model.ReportShipment;
import com.jwt.model.ReportType;
import com.jwt.model.Shipment;
import com.jwt.model.ShipmentDetailsData;
import com.jwt.model.ShipmentLog;
import com.jwt.model.ShipmentStatus;
import com.jwt.model.ShipmentType;
import com.jwt.model.TransactionReport;
import com.jwt.model.Treatment;
import com.jwt.model.User;
import com.jwt.model.WashingPrograms;
import com.jwt.service.CashOnCoverService;
import com.jwt.service.CreateDirtyShipmentService;
import com.jwt.service.ReceivingProductsService;
import com.jwt.service.ReportService;
import com.jwt.service.StockManagmentService;
import com.jwt.service.UserService;

@Controller
public class ReportController {
	
	
	@Autowired 
	private ReportService reportService;
	
	@Autowired
	private ReceivingProductsService receivingService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private StockManagmentService stockService;
	
	@Autowired
	private CashOnCoverService cashService;
	
	@Autowired
	private CreateDirtyShipmentService dirtyService;
	
	@RequestMapping(value = "/GeneralReports")
	public ModelAndView GeneralReports(ModelAndView model) throws IOException {
		List<Facility> warehouses = reportService.getALLWarehouses();
		List<ShipmentType> types = reportService.getShipmentTypes();
		//System.out.println(types.size());
		model.addObject("warehouses", warehouses);
		model.addObject("types", types);
		model.setViewName("GeneralReports");
		return model;
	}
	
	
	@RequestMapping(value = "/loadShipments",  method = RequestMethod.POST,consumes ="application/json")
	public  ResponseEntity<List<ReportShipment>> loadWarehouseProducts(@RequestBody ShipmentType shipmentType)throws ServletException, IOException {
		  User u = new User();
		  System.out.println("id : "+shipmentType.getShipment_type_id() + " "+shipmentType.getShipment_type());
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (!(auth instanceof AnonymousAuthenticationToken)) {
				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				System.out.println(userDetail);
			String user="";
			user=userDetail.getUsername();
			System.out.println("user : "+user);
		//	System.out.println("auth :"+userDetail.getAuthorities());
		//	List<UserTeam> listTeam = userTeamService.getAllUserTeam(user);
		    u=userService.getUser(user);
			}
			if(u.getUSER_NAME() != null)
			{
				List<ReportShipment> ships = reportService.getShipmentsOfFacility(Integer.valueOf(shipmentType.getShipment_type()), shipmentType.getShipment_type_id());
				//System.out.println("SIZE"+ships.size());
				 if(ships == null)
					{
						ReportShipment ship = new ReportShipment();
						ships = new ArrayList<ReportShipment>();
						ship.setState("not success");
						ships.add(ship);
						return new ResponseEntity<List<ReportShipment>>(ships, HttpStatus.OK);

					}
					else {
						//request.setAttribute("error","notDone");
						return new ResponseEntity<List<ReportShipment>>(ships, HttpStatus.OK);

					}

			}
			else {
				ReportShipment ship = new ReportShipment();
				ship.setState("no session");
				List<ReportShipment> ships = new ArrayList<ReportShipment>();
				ships.add(ship);
				return new ResponseEntity<List<ReportShipment>>(ships, HttpStatus.OK);
			}
			
			
	
	}
	@RequestMapping(value = "/GenralReportDetails")
	public ModelAndView GeneralReportShipment(ModelAndView model , @RequestParam(value = "ShipmentID", required = true) int shipID) throws IOException {
		ReportShipment ship = reportService.getShipmentByID(shipID);
		System.out.println("ship_type "+ship.getShipment_type_id());
		List<Operation>operations = reportService.getAllOperationShipID(shipID);
		List<ShipmentLog> logs = reportService.getLogsShipment(shipID);
		List<ShipmentStatus> statusLst = reportService.getAllStatus();
		System.out.println( ship.getDriver());
		model.addObject("shipment", ship);
		if((ship.getDriver().length())>3)
		{
			model.addObject("Shiptype", "notConvert");
		}
		else {
			model.addObject("Shiptype", "Convert");
		}
		if (ship.getShipment_type_id()==2)
		{
			
			List<LostRlostReportProducts> lostRlost_lst = reportService.getLostRlost(shipID);
			System.out.println("size Lost"+lostRlost_lst.size());
			
			for(int i =0 ;i<operations.size();i++)
			{
								
				if(operations.get(i).getType().equals("Dirty"))
					{
					List<LostRlostReportProducts> tmp = new ArrayList<LostRlostReportProducts>();
					for(int j =0;j<lostRlost_lst.size();j++)
					{

						
						
						if(operations.get(i).getProduct_id().equals(lostRlost_lst.get(j).getProduct_id()))
						{
							tmp.add(lostRlost_lst.get(j));
							lostRlost_lst.remove(j);
							//--j;
						}
						
					}
					
					if(operations.get(i+tmp.size()).getProduct_id().equals(operations.get(i).getProduct_id()))
					{
						for(int j =0 ; j<tmp.size();j++ )
						{
							if (tmp.get(j).getT_type().equals("Lost"))
							{
								for(int l = i ; l<=i+tmp.size();l++)
								{
									if(Integer.valueOf(operations.get(l).getQuantity()).equals(tmp.get(j).getProduct_lost_quantity())&&
											operations.get(l).getType().equals("Dirty"))
									{
										operations.get(l).setType("Lost");
										break;
									}
										
										
								}
							}
							else
							{
								for(int l = i ; l<=i+tmp.size();l++)
								{
									if(Integer.valueOf(operations.get(l).getQuantity()).equals(tmp.get(j).getProduct_returned_quantity())&&
											operations.get(l).getType().equals("Dirty"))
									{
										operations.get(l).setType("RLost");
										break;
									}
										
										
								}
								
							}
						}
						
					}
					
					i+= tmp.size();
					
					}
				else {
					
					for(int j =0;j<lostRlost_lst.size();j++)
					{

						if(operations.get(i).getProduct_id().equals(lostRlost_lst.get(j).getProduct_id())&&
								Integer.valueOf(operations.get(i).getQuantity())==lostRlost_lst.get(j).getProduct_lost_quantity())
						{
							operations.get(i).setType("Lost");
							lostRlost_lst.remove(j);
							break;
							//--j;
						}
						
					}
				}
					
				
			}
			System.out.println("size Lost"+lostRlost_lst.size());
			

			
		}
		else
		{
			model.addObject("Recon", "false");
		}
		model.addObject("operations", operations);
		System.out.println(statusLst.get(0).getStatus_id());
	
		model.addObject("logs", logs);
		model.addObject("statusLst", statusLst);
		model.setViewName("ReportShipDetail");
		return model;
	}
	@RequestMapping(value = "/ShipmentsReport")
	public ModelAndView shipmentsReport(ModelAndView model) throws IOException {
		List<Facility> warehouses = reportService.getALLWarehouses();
		List<ShipmentType> types = reportService.getShipmentTypes();
		List<ReportType> alltypes = new ArrayList<ReportType>();
		for(int i =0 ;i<types.size();i++)
		{
			ReportType type = new ReportType();
			type.setId(types.get(i).getShipment_type_id());
			type.setName(types.get(i).getShipment_type());
			alltypes.add(type);
		}
		List<ReportType> ordersTypes = reportService.getOrdersTypes();
		int x =15;
		for(int i =0 ;i<ordersTypes.size();i++)
		{
			ReportType type = new ReportType();
			type.setId(x+ordersTypes.get(i).getId());
			type.setName(ordersTypes.get(i).getName());
			alltypes.add(type);
		}
		ReportType type = new ReportType();
		type.setId(25);
		type.setName("Inventory Checks");
		alltypes.add(type);
		Collections.sort(alltypes, 
				Comparator.comparing(ReportType::getName));
		model.addObject("warehouses", warehouses);
		model.addObject("types", alltypes);
		model.setViewName("shipmentsReport");
		return model;
	}
	@RequestMapping(value = "/loadShipmentsReport",  method = RequestMethod.POST,consumes ="application/json")
	public  ResponseEntity<ReportForm> loadShipmentsReport(@RequestBody ShipmentType shipmentType)throws ServletException, IOException {
		  User u = new User();
		  ReportForm form = new ReportForm();
		  System.out.println("id : "+shipmentType.getShipment_type_id() + " "+shipmentType.getShipment_type());
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String[] comingData = shipmentType.getShipment_type().split(",");
			System.out.println(comingData[0]);
			if (!(auth instanceof AnonymousAuthenticationToken)) {
				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				System.out.println(userDetail);
			String user="";
			user=userDetail.getUsername();
			System.out.println("user : "+user);
			
			
		//	System.out.println("auth :"+userDetail.getAuthorities());
		//	List<UserTeam> listTeam = userTeamService.getAllUserTeam(user);
		    u=userService.getUser(user);
			}
			if(u.getUSER_NAME() != null)
			{
				System.out.println(shipmentType.getShipment_type_id());
				if (shipmentType.getShipment_type_id()<=15) {
					List<ReportShipment> ships = new ArrayList<ReportShipment>();
					ships = reportService.getShipmentsByDate(Integer.valueOf(comingData[0]), shipmentType.getShipment_type_id(), comingData[1], comingData[2]);
					form.setShips(ships);
				 if(ships == null)
					{
						ReportShipment ship = new ReportShipment();
						ships = new ArrayList<ReportShipment>();
						ship.setState("not success");
						ships.add(ship);
						form.setShips(ships);
						return new ResponseEntity<ReportForm>(form, HttpStatus.OK);
						
					}
					else {
						//request.setAttribute("error","notDone");
						return new ResponseEntity<ReportForm>(form, HttpStatus.OK);

					}
				}
				
				else if (shipmentType.getShipment_type_id()>15 && shipmentType.getShipment_type_id()!=25){
					System.out.print("inside else");
					List<Order>orders = new ArrayList<Order>();
					   int order_id = shipmentType.getShipment_type_id()-15;
						orders = reportService.getOrdersByFacility(Integer.valueOf(comingData[0]), Integer.toString(order_id) , comingData[1], comingData[2]);

						List<ProductsType> types = stockService.lst_shipment_type();
						if (orders!=null)
						{
							for(int i=0;i<orders.size();i++)
							{
								if(orders.get(i).getFrom_type()!=null)
								{
								String x =(orders.get(i).getFrom_type().toString());
								String[] arrSplit = x.split(",");
								String tmp ="";
								ArrayList<String> all_types = new ArrayList<String>();
								for(int k=0;k<arrSplit.length;k++)
								{

									for(int j=0;j<types.size();j++)
									{
										String y = types.get(j).getType_id().toString();
										if(arrSplit[k].equals(y))
										{
											 if(all_types.isEmpty()) {
											        all_types.add(types.get(j).getType_name());
											    }
											 else {
												 boolean found = false;
												 for(int l = 0;l<all_types.size();l++) {
													 if (all_types.get(l).equals(types.get(j).getType_name()))
													 {
														 found = true;
														 break;
													 }
												 }
												 if (found == false)
													 all_types.add(types.get(j).getType_name());
											 }
											
										}
									}
								}
								 for (int ll =0 ;ll<all_types.size();ll++)
								 {
									 if(ll==0)
										 tmp += all_types.get(ll);
									 else
										 tmp += "-"+all_types.get(ll);
								 }
								orders.get(i).setFrom_type(tmp);
							}
								else
								{
									orders.get(i).setFrom_type("");
									orders.get(i).setTo_type("");
								}
							}
						}
						form.setOrders(orders);
					    return new ResponseEntity<ReportForm>(form, HttpStatus.OK);
				}
				else{
					List<InventoryCheck>checks = new ArrayList<InventoryCheck>();
					checks = reportService.getinventoryChecks(Integer.valueOf(comingData[0]), comingData[1], comingData[2]);
					form.setChecks(checks);
				    return new ResponseEntity<ReportForm>(form, HttpStatus.OK);
				}

			}
			else {
				ReportShipment ship = new ReportShipment();
				ship.setState("no session");
				List<ReportShipment> ships = new ArrayList<ReportShipment>();
				ships.add(ship);
				form.setShips(ships);
				return new ResponseEntity<ReportForm>(form, HttpStatus.OK);
			}
			
			
	
	}
	@RequestMapping(value = "/ShipmentReportDetails")
	public ModelAndView ShipmentReportDetails(ModelAndView model , @RequestParam(value = "ShipmentID", required = true) int shipID) throws IOException {
		ReportShipment ship = reportService.getShipmentByID(shipID);
		List<ShipmentDetailsData> details = reportService.getShipDetails(shipID);
		List<Treatment> treats = stockService.Get_treatment_List();
		List<ProductsType>types = stockService.lst_shipment_type();
		List<ShipmentType> shipmentTypes= reportService.getShipmentTypes();
		//System.out.print("source "+ship.getSource());
		if(ship.getShipment_type_id()==5 && ship.getDestination_type()==4)
		{
			List<Consumable> consumables =dirtyService.Get_Program_Consumables(shipID);
			if (consumables.equals(null)||!consumables.isEmpty())
			{
				model.addObject("Consumables", consumables);
			}
		}
		if (ship.getShipment_type_id()==2) {
			String related_shipments=receivingService.get_ship_data_by_id(shipID).getRelated_shipments();
			String[] x_related;
			List<AllShipments>lst_related=new ArrayList<AllShipments>();
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
					model.addObject("lst_related", lst_related);
				}
				
			}
			
		}

		model.addObject("shipTypes", shipmentTypes);
		model.addObject("types", types);
		model.addObject("treats", treats);
		model.addObject("details", details);
		model.addObject("shipment", ship);
		model.setViewName("ShipmentReportDetails");
		return model;
	}
	
	
	@RequestMapping(value = "/OrderReportDetails")
	public ModelAndView OrderReportDetails(ModelAndView model , @RequestParam(value = "OrderID", required = true) int orderID) throws IOException {
		Order order = reportService.getOrderByID(orderID);
		List<OrderDetail> details = reportService.getOrderDetails(orderID);
		List<ProductsType> types = stockService.lst_shipment_type();
		if(order.getOrder_type().equals("1") ||order.getOrder_type().equals("3"))
		{
			List<Consumable> consumables =dirtyService.Get_Total_Consumables(Integer.toString(orderID));
			if (consumables.equals(null)||!consumables.isEmpty())
			{
				model.addObject("Consumables", consumables);
			}
		}
		if(order.getOrder_type().equals("4") )
		{
			List<Consumable> consumables =dirtyService. GetTreatmentConsumables(orderID);
			if (consumables.equals(null)||!consumables.isEmpty())
			{
				model.addObject("Consumables", consumables);
			}
		}
		if (order.getOrder_type().equals("5"))
		{
			List<Operation>operations = reportService.getAllOperationShipID(orderID);
			if(operations!=null &&operations.size()>0)
			{
				model.addObject("creatingProduct", operations.get(0));
			}
			
		}
		//String x =(order.getFrom_type().toString());
		//String[] arrSplit = x.split(",");
		//String tmp ="";
		if(order.getFrom_type()!=null)
		{
		String x =(order.getFrom_type().toString());
		String[] arrSplit = x.split(",");
		String tmp ="";
		ArrayList<String> all_types = new ArrayList<String>();
		for(int k=0;k<arrSplit.length;k++)
		{

			for(int j=0;j<types.size();j++)
			{
				String y = types.get(j).getType_id().toString();
				if(arrSplit[k].equals(y))
				{
					 if(all_types.isEmpty()) {
					        all_types.add(types.get(j).getType_name());
					    }
					 else {
						 boolean found = false;
						 for(int l = 0;l<all_types.size();l++) {
							 if (all_types.get(l).equals(types.get(j).getType_name()))
							 {
								 found = true;
								 break;
							 }
						 }
						 if (found == false)
							 all_types.add(types.get(j).getType_name());
					 }
					
				}
			}
		}
		 for (int ll =0 ;ll<all_types.size();ll++)
		 {
			 if(ll==0)
				 tmp += all_types.get(ll);
			 else
				 tmp += "-"+all_types.get(ll);
		 }
			order.setFrom_type(tmp);

		}
		List<WashingPrograms> programs = reportService.getAllWashingPrograms();
		//System.out.println("details: "+details.size());
		model.addObject("details", details);
		model.addObject("programs", programs);
		model.addObject("order", order);
		System.out.println("Order_Type"+order.getOrder_type());
		model.setViewName("OrderReportDetails");
		return model;
	}
	@RequestMapping(value = "/InventoryReportDetails")
	public ModelAndView InventoryReportDetails(ModelAndView model , @RequestParam(value = "CheckID", required = true) int checkID) throws IOException {
		InventoryCheck check = reportService.getCheckByID(checkID);
		List<InventoryDetail> details = reportService.getInventoryDetails(checkID);
		model.addObject("details", details);
		model.addObject("check", check);
		model.setViewName("InventoryReportDetails");
		return model;
	}
	@RequestMapping(value="CashReconciliationReport")
	public ModelAndView GetCashReconciliation(ModelAndView model,HttpServletRequest request)
	{
	
		HttpSession session=request.getSession();
		List<CashReconciliationReport> lst_report=reportService.Get_Reconciliation_Transaction(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		List<Facility>lst_facilities=cashService.Get_Facilites();
		model.addObject("lst_transactions", lst_report);
		model.addObject("warehouses", lst_facilities);
		model.addObject("count_lst", lst_report.size());
		model.setViewName("CashReconciliationReport");
		return model;
	}
	@RequestMapping(value="GetCashReconData",method=RequestMethod.POST,consumes = "application/json",produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> Getcashdata(@RequestBody TransactionReport data) throws JsonProcessingException
	{
		List<CashReconciliationReport>lst_recon=reportService.Get_ReconciliationsInDuration(data.getFacility_id(), data.getFrom_date(), data.getTo_date());
		
		ObjectMapper mapper=new ObjectMapper();
		String data_x="";
				if(lst_recon.size()>0)
				{
					data_x=mapper.writeValueAsString(lst_recon);
				}
				else
				{
					data_x="noprod";
				}
				return new ResponseEntity<String>(data_x,HttpStatus.OK);
	}

}
