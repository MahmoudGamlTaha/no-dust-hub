package com.jwt.controller;

import java.io.IOException;
import java.util.ArrayList;
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


import com.jwt.model.Facility;
import com.jwt.model.InventoryProduct;
import com.jwt.model.User;
import com.jwt.service.ReleasingProductsService;
import com.jwt.service.StockProductListService;
import com.jwt.service.UserService;

@Controller
public class StockProductListController {
	
	@Autowired
	private StockProductListService stockService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ReleasingProductsService shipmentService;
	
	
	
	
	@RequestMapping(value = "/MyProducts")
	public ModelAndView productlist(ModelAndView model , HttpServletRequest request) throws IOException {
		User u = new User();
		HttpSession session=request.getSession();
		Facility facility = new Facility();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();	
		    u=userService.getUser(userDetail.getUsername());
		    System.out.println("unit"+session.getAttribute("fac_id"));
		   facility = shipmentService.getFacilityById(Integer.parseInt(String.valueOf(session.getAttribute("fac_id"))));
		}
		String role_id = stockService.getUserRole(u.getUser_id());
		if (role_id!= null) {
		List<Facility> faList = stockService.getWareHouses();
		model.addObject("wareHouses", faList);
		model.addObject("currentWareHouse", facility.getId());
		System.out.println("roleId : "+role_id);
		if (role_id.equals("2"))
		{
			List<InventoryProduct> products = stockService.getFinancialProducts(facility.getId());
			model.addObject("financail", "true");
			model.addObject("productLst", products);
			System.out.println("size : "+products.size());


			
			
		}else {
			List<InventoryProduct> products = stockService.getProductOfFacility(facility.getId());
			model.addObject("productLst", products);
			model.addObject("financail", "false");
			System.out.println("products"+ products.size());
		}
		}
		
		model.setViewName("productlist");
		return model;
	}

	@RequestMapping(value = "/loadWarehouseProducts",  method = RequestMethod.POST,consumes ="application/json")
	public  ResponseEntity<List<InventoryProduct>> loadWarehouseProducts(@RequestBody int warehouse_id)throws ServletException, IOException {
		  User u = new User();
		  System.out.println("id : "+warehouse_id);
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
				List<InventoryProduct> products = stockService.getProductOfFacility(warehouse_id);
				 if(products.isEmpty())
					{
						InventoryProduct product = new InventoryProduct();
						product.setState("not success");
						products.add(product);
						return new ResponseEntity<List<InventoryProduct>>(products, HttpStatus.OK);

					}
					else {
						//request.setAttribute("error","notDone");
						return new ResponseEntity<List<InventoryProduct>>(products, HttpStatus.OK);

					}

			}
			else {
				InventoryProduct product = new InventoryProduct();
				product.setState("no session");
				List<InventoryProduct> products = new ArrayList<InventoryProduct>();
				products.add(product);
				return new ResponseEntity<List<InventoryProduct>>(products, HttpStatus.OK);
			}
			
			
	
	}
	
	
}
