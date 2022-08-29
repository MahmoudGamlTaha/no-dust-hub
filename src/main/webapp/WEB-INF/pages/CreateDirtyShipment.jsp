<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
             <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="CreateDirtyShipment.PageTitle"/></title>
   <link href="img/no.jpeg" rel="icon" />
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
   
   
   <link href="resources/assetsnodust/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />  
   <link href="resources/assetsnodust/css/style.css" rel="stylesheet" />
   <link href="resources/assetsnodust/css/style_red.css" rel="stylesheet" />
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
       <link rel="stylesheet" href="resources/css/jquery-confirm.min.css"/>
       
   
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
          <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
     
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
	 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
	   <script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
	     <script type="text/javascript" src="resources/assetsnodust/js/jasontable.js"></script>
	     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>

<style type="text/css">
#astr
{
    color: red;
    font-size: large;
     
    
}
#from_value
{
display:none;
}
#to_value
{
display:none;
}

#from{
visibility:hidden;}
#to{
visibility:hidden;}

#Laudry
{
visibility:hidden;
display:none;
}
#Driver
{
visibility:hidden;
display:none;
}
#cancel_btn
{
visibility:hidden;
}
#print_tbl
  {
  visibility:hidden;
  }
#pageFooter
{
visibility:hidden;
}
#div_data1
{
visibility:hidden;
}
#next_btn2
{visibility:hidden;}
#types
{visibility:hidden;}
#div_data2
{
visibility:hidden;
}
#ver_div
{visibility:hidden;

}
#tableBtns
{visibility:hidden;
}
#example
{visibility:hidden;}
#printBtn
{visibility:hidden;}
#submitBtn
{visibility:hidden;}
 #W_A
  {
  visibility:hidden;
  }
 #W_M
  {
  visibility:hidden;
  }
  #D
  {
  visibility:hidden;
  }
   #S
  {
  visibility:hidden;
  }
  #nodust_misr{
  visibility:hidden;
  }
  #cons_total
{
visibility:hidden;
}

 #date_time_now
{
visibility:hidden;
}
#cancel_btn2
{
visibility:hidden;
}
#warehouse_name_div{
  margin-left:5px;
  float:left;
  width:35%;
  }
  #agent_name_div
  {
  float:left;
  width:30%;
  }
  #assign_date_div
  {
   float:left;
  width:30%;
  }
#cons_det{
visibility:hidden;
}
   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}
#catgory{
display:none;}
#logoprint{visibility:hidden; display:none;}

@font-face {
  font-family: ArbFONTS;
  src: url(ArbFONTS-Abdo-salem-Bold.ttf);
}

   </style>
   	 
 <style type="text/css" media="print">

 @page { size:A4 ;  }
  
  @media print {
    #W_A
  {
  visibility:visible;
  }
  #from_value
{
display:inline-block;
margin-top:10px;
visibility:visible;


}
#catgory{
display:inline-block;
margin-top:10px;
visibility:visible;


}
#to_value
{
display:inline-block;
margin-top:10px;
visibility:visible;

}
  #print_tbl
  {
  visibility:visible;
  }
  #nodust_misr{
  visibility:visible;
  }
  
  #style_driver{
display:none;
}
#ludry_style
{
display:none;
}
#from_style{
display:none;}
#to_style{
display:none;}
#category_style{
display:none;}
   #date_time_now
{
visibility:visible;
}
 #W_M
  {
 visibility:visible;
  }
  #D
  {
 visibility:visible;
  }
   #S
  {
  visibility:visible;
  }
  #astr
  {
  display:none;
  }
  table td.first { display: none; }
  table th.first { display: none; }
  #printBtn {
    display: none;
  }
  #submitBtn {
    display: none;
  }
  #links{
  display: none
  }
  #example
  {
  display:none;
  }
  #cons_total
{
visibility:visible;
}
#cons_det{
display:none;
}
 #navBar{
  display: none
 }
 #sidemenu{
 display: none
 }
 #man_from
 {
 float:left;
 width:50%;
 }
 #div_data1
 {
 float:left;
 width:50%;
 }
 #man_to
 {
 float:left;
 width:50%;
 }
 #tableBtns{
  display: none
 }
 #pageFooter
 {
 visibility:visible;
 }
 
 #pageFooter
 {
 display: table-footer-group;
 }
 #pageFooter:after {
    counter-increment: page;
    content: counter(page);
}
 #showDate{ color: black;}
  #titlepage{ display: none;}
}

#Laudry
{
display:inline-block;
margin-top:10px;
visibility:visible;


}
#Driver
{
display:inline-block;
margin-top:10px;
visibility:visible;

}
#cancel_btn2
{
display:none;
}
#logoprint{visibility: visible; display:block;}

#contentpage{ margin-top: -50px;}

 #Header, #Footer { display: none !important; color: white !important ; background: red; }
#footer{ display: none;  }

@page {	margin:0;}
body{ margin: 1.6cm}



}
</style>

<style>

</style>
</head>

<body class="fixed-top">

<div id="navBar">
	<jsp:include page="NavBarNoDust.jsp">
	         <jsp:param name="param1" value="HideButton"/>
	 </jsp:include>
   </div>
    
   
   <!-- BEGIN CONTAINER -->	
   <div id="container" class="row-fluid">
   
   <div id="sidemenu">
	 
		<jsp:include page="SideNaveNoDust.jsp">
		         <jsp:param name="param1" value="Dashboardli"/>
		 </jsp:include>	
    </div>
    

    
	


		<div id="main-content">
	
         <div class="container-fluid">
            <div class="row-fluid">
               <div class="span12">
                  
                
			
                  <ul id="links"class=" breadcrumb mtop5 pull-left">
                       <li>
                           <a href="DashboardNoDust"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                   
                         <li>
                           <a href="CreateDirtyShipment"><spring:message code="CreateDirtyShipment.PageTitle" /> </a><span class="divider-last">&nbsp; &nbsp;</span>
                       </li>
                     
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
      <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:5%;   margin-top: -20px ; " id="logoprint">
         
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4> <spring:message code="CreateDirtyShipment.PageTitle" /></h4>
                        </div>
                        
						<div class="widget-body" style="text-align: left;">


		<table width="100%" >
<tr>
<td>
<div class="space10"></div>
<div class="widget-title" >
                           <h4> <spring:message code="ShipemntsData_Page_Title" /></h4>
                        </div>
<div class="row-fluid invoice-list" style="border:outset;">
                              <div class="space10"></div>
                             <div class="row-fluid">
                                
                                    <div id="warehouse_name_div"> <h5 ><strong><spring:message code="warehousename" /></strong>
                                     ${dirtyForm.wareHouseName} </h5></div>
                                
                                 <div id="agent_name_div"> <h5 > <strong><spring:message code="Agentname" /></strong>
                                  ${dirtyForm.agentName}  	</h5></div>
                                    <div id="assign_date_div"> <h5 ><strong><spring:message code="Date" /> </strong>
                                      ${dirtyForm.assignDate} 	</h5></div>
                                
                                
                                    
                                
                             </div>
                                <div class="row-fluid">
                                 <div class="span6" id="cat_div">
                           <div style="float: left; margin-right: 5px;" > <h5 style="display: inline-block; margin-left:5px;" > <strong><spring:message code="Category"/></strong></h5> 
                                      <span id="astr"> * </span> </div>
                                       <h5 id='catgory' ></h5>
                              <div id="category_style" style="margin-top: 5px; margin-left: 115px;">
                                     <select  id="Selectcategory" name="cat" style="margin-left:10px;" class= "span6 js-example-basic-multiple" >
                                     <option value="No_value">Please Select</option>
								     <c:forEach var="category" items="${categories}" varStatus="vs">
                                        <option value="${category.id}">${category.category_name}</option>
                                        </c:forEach>
							  </select >
							                                               	             <button type="button" id="next_btn" onclick="Check_from_types()" class="btn btn-success pull-right green mright5"><i class="icon-save icon-white"></i> <spring:message code="Next"/></button>
							  
                           </div>
                           
                               </div>
                               
                                </div>
                                  	 <div id="types" class="span12" style="margin-left: 0; ">
                            	 <div class="span6" id="man_from">
                            	  <div style="float: left; margin-right: 25px;" > <h5 style="display: inline-block; margin-left:5px;"><strong><spring:message code="ConvertFrom"/></strong></h5> <span id="astr"> * </span> </div>
                                                                	 <h5 id="from_value"></h5>
                                    
                                     <div  id="from_style" style="margin-top: 5px; margin-left: 15px;">
                            	 <select id="from" onchange="get_to_types(this)" class= "span6 js-example-basic-multiple" >
                            	 <option><spring:message code="PleaseSelect"/></option>
                            	 <c:forEach items="${from_types}" var="type" varStatus="vs">
                            	 <option value="${type.type_id}">${type.type_name}</option>
                            	 </c:forEach>
                            	 </select>
                            	 </div>
                            	 </div>
                            	 <div class="span6" id="man_to">
                            	   <div style="float: left; margin-right:5px;" > <h5 style="display: inline-block;"><strong><spring:message code="ConvertTo" /></strong></h5>    <span id="astr"> * </span>                         
                            	   </div>
                            	                               	   	                             	                                       <h5 id="to_value"></h5>
                            	   
                                     <div id="to_style" style="margin-top: 5px; margin-left: 15px;">
                            	 <input  id="program_data" style="display:none;"/>
                            	 
                            	 <select id="to" onchange="get_washing_programs(this)" class= "span6 js-example-basic-multiple" >
                            	   <option><spring:message code="PleaseSelect"/></option>

                            	 </select>
                            	 </div>
                            	 
                            	 </div>
                            	 
                            	 	       <button type="button" id="next_btn2" onclick="Check_type_entered()" class="btn btn-success pull-right green mright5"><i class="icon-save icon-white"></i> <spring:message code="Next"/></button>
                            	                             	 	      <button type="button" onclick="Back_Types()" class="btn btn-success pull-right  green mright5" id="cancel_btn" style="display='none'; margin-right: 4px; "><i class="icon-save icon-white"></i> <spring:message code="Back"/></button>
                            	 
                                    </div>
                            <div id="div_data1" >
                                
                            <div class="span6">
                                    <div style="float: left; margin-right: 30px;" > <h5 style="display: inline-block; margin-left:5px;" > <strong><spring:message code="Drivername" /></strong>	</h5> 
                                    <span id="astr"> * </span></div>
                                                                      <h5 id='Driver' ></h5>
                                  
                                    <div id="style_driver" style="margin-top: 5px; margin-left: 15px;">
                                    	  <select  id="SelectDriver" name="driver" class= "span6 js-example-basic-multiple" onchange="Check_driver_select()" >
                                    	  <option value="No_value"><spring:message code="PleaseSelect"/></option>
								     <c:forEach var="driver" items="${dirtyForm.driversList}" varStatus="vs">
                                        <option value="${driver.user_name}">${driver.full_name_en} , ${driver.user_name}</option>
                                        </c:forEach>
							  </select >
                           
                                    </div>
                                </div >
                                <div id="ver_div" class="span6" style="margin: 0 ; float: left;">
                                    <div style="float: left; margin-right: 5px;" > <h5 style="display: inline-block;"> <strong><spring:message code="ReceivingProduct.VerificationCode" />	</strong></h5>
                                     <span id="astr"> * </span></div>
                                    <div >
                                    
                                    	  <input id="verif_code" onchange="validate_Code()" required="required" style="padding: 0 8px;"/>
                           
                                    </div>
                                </div>
                               </div>
                                <div id="div_data2" >
 							 <div class="span6">
                                      <div style="float: left; margin-right: 5px;" > <h5 style="display: inline-block; margin-left:5px;" > <strong><spring:message code="To_"/></strong></h5> 
                                      <span id="astr"> * </span> </div>
                                                                 			      <h5 id='Laudry' ></h5>
                                      
                                     <div id="ludry_style" style="margin-top: 5px; margin-left: 115px;">
                                     <select  id="SelectLundry" name="lundry" class= "span6 js-example-basic-multiple" >
                                     <option value="No_value"><spring:message code="PleaseSelect"/></option>
								     <c:forEach var="lundry" items="${dirtyForm.lundries_list}" varStatus="vs">
                                        <option value="${lundry.id}">${lundry.facility_name}</option>
                                        </c:forEach>
							  </select >
							  
                           </div>
                           
                           </div >
                           
                            
                                
                                    </div>
                            <div class="clearfix"></div>
                            	
                                                                <div class="clearfix"></div>
                                    
                               
                               
                            <div class="space10"></div>    
                            </div>
</td>
</tr>
</table>
 						


                         
                  							               
                 
                    <div class="space10"></div>
                            <div id="tableBtns" class="row-fluid  ">
    
			          <button id="deleterows" class="btn btn-danger pull-right delete-row mright5 "  style="margin-bottom: 5px; margin-right: 5px;"><i class="icon-trash icon-white mright5"></i><spring:message code="DeleteRow" /></button>  
				  
                           <button id="addrows" class="btn btn-success pull-right add-row mright5 " style="margin-bottom: 5px; "><i class="icon-plus icon-white mright5"></i><spring:message code="AddRow" /></button>
                                             
                           <div class="space10"></div>                             
                            </div>         
                    
                        
                   
			
			               <form:form id="tableform" modelAttribute="dirtyForm" >
			
                            <div class="row-fluid">
                   
                                <table id="example" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width:80%;margin:auto;">
                                    <thead>
                                    <tr>
                                        <th class="first"><input type='checkbox' name='record1' id='selectAll' onchange="selectDeselectAll(this)"></th>
                                        <th><spring:message code="ProductName" /></th>
                                        <th><spring:message code="WashingProgram" /></th>
                                        <th><spring:message code="Quantity" /></th>
                                        <th><spring:message code="Weight" /></th>
                                        <th style="display: none;">product_id</th>
                                     	<th style="display: none;">washing_programs_id</th>
                                     	<th style="display: none;">quantity</th>
                                     	<th style="display: none;">weight</th>
                                        <th class="cq"><spring:message code="CurrentQuantity" /></th>
                                    </tr>
                                    
                                    </thead>
                                    <tbody>
                                    <tr class="odd gradeX ">
                                      <td class="first" ><input type='checkbox' id="firstCheck" name='record' disabled="disabled"></td>
                                        <td>
                                        <form:select  id="" onchange="changingproduct(this)" path=""  class="productSelect" style="width:fit-content;" >
                                        <option value="No_value"><spring:message code="PleaseSelect"/></option>
                                        <c:forEach var="product" items="${dirtyForm.product_list}" varStatus="vs">
                                        <option value='${product.product_sku},${product.quantity}'>${product.product_name}</option>
                                        </c:forEach>
								     </form:select></td>
                                        <td><form:select  onchange="changingwashing(this)" id=""   path="" class="washingSelect" style="width:fit-content;">
                                        <option value="No_value"><spring:message code="PleaseSelect"/></option>
										<c:forEach var="wash" items="${dirtyForm.programs_lst}" varStatus="vs">
                                        <option value="${wash.id}">${wash.program}</option>
                                        </c:forEach>
								     </form:select>
								     </td>
                                        <td><input required="required" min="1" onchange="changeQuentity(this)" type="number"  /></td>
                                        <td><input  type="number" onchange="changeWeight(this)"  min="0.1" step="0.1" /></td>
                                        <td style="display: none;"> ${dirtyForm.product_list[0].product_sku}</td>
                                        <td style="display: none;">${dirtyForm.programs_lst[0].id}</td>
                                        <td style="display: none;">0</td>
                                        <td style="display: none;">0</td>
                                       <!--   <td ><select disabled  style="width: 70%" id="quentitySelect">
                                        <c:forEach var="product" items="${dirtyForm.product_list}" varStatus="vs">
                                        <option >${product.quantity}</option>
                                        </c:forEach>
                                        </select></td>-->
                                        <td class="cq"></td>
                                        
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="space20"></div>
                                              <div class="row-fluid  ">
                           <input id="auth_driver" style="display:none;"/>
                               <button type="button" id="submitBtn" onclick="submitFunction()" class="btn btn-success pull-right  mright5" style="margin-bottom: 5px;"><i class="icon-save icon-white"></i> <spring:message code="Submit" /></button>
    
				                              	                             	 	      <button type="button" onclick="Back_Types2()" class="btn btn-success pull-right  green mright5" id="cancel_btn2" style="display='none'; margin-right: 4px; "><i class="icon-save icon-white"></i> <spring:message code="Back"/></button>
				  				          <button type="button" id="printBtn"  disabled="disabled" class="btn btn-primary pull-right" style="margin-right:5px;" onclick="print_data()"><i class="icon-print  icon-white"></i> <spring:message code="Print" /></button>   
				  
                                           <input id="check_auth_done" style="display:none;"/>  
                                             <input id="order_id" style="display:none;" />        
                            </div> 
                                <table id="print_tbl" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width:80%; margin:auto;">
                                 <thead>
                                    <tr>
                                        <th><spring:message code="product_only" /></th>
                                        <th><spring:message code="WashingProgram" /></th>
                                        <th><spring:message code="Quantity" /></th>
                                        <th><spring:message code="Weight_kgr" /></th>
                                    </tr>
                                    
                                    </thead>
                                    <tbody>
                                    
                                    </tbody>
                                </table>
                            </div>
                       <div class="space20"></div> 
                       <div class="clearfix"></div>
                                             
                                                <div id="cons_det" class="row-fluid ">
                 <strong> <spring:message code="ConsumableDetails"/> </strong>
                  <table id="details_tbl" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width:fit-content; margin:auto;">
                  <thead>
                  <tr>
                  <th><spring:message code="WashingProgram"/></th>
                  <th><spring:message code="Consumable"/></th>
                  <th><spring:message code="ProductReconciliation.ProductTable.Quantity"/></th>
                  </tr>
                  </thead>
                  <tbody></tbody>
                  </table>
                  <br>
                  </div>
                  <div id="cons_total" class="row-fluid ">
                  
                  <table id="total_tbl" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width:fit-content; margin:auto;">
                  <thead>
                  <tr>
                  
                  <th><spring:message code="Consumable"/></th>
                  <th><spring:message code="ProductReconciliation.ProductTable.Quantity"/></th>
                  <th><spring:message code="measurementunit"/></th>
                  </tr>
                  </thead>
                  <tbody></tbody>
                  </table>
                  </div>
             <!--        <div  class="row-fluid  ">
                    <div class="span6" style="float: left;">
                            <strong id="W_A" style="float: left; margin-top:15px;"><spring:message code="warehouseAgent"/></strong>
                           <strong id="W_M" style="margin-top:15px; margin-left:140px;"><spring:message code="warehouseManager"/></strong>
                         </div>
                         <div class="span6" style="float: right;">
                            <strong id="D" style="float: right; margin-right: 170px; margin-bottom: 5px; margin-top:15px;"><spring:message code="Driver"/></strong>
                              <strong id="S" style="float: right; margin-bottom: 5px; margin-right: 5px;  margin-top:15px;"><spring:message code="Security"/></strong>
                            </div>
                            </div>
                    -->        
                           
        
                
                            
                        <br> <br> <br>    
                             
                  <div  class="row-fluid  ">
                 
                 <div id="W_A"  style="width: 25% ; float: left; text-align: center;">
                     <strong ><spring:message code="warehouseAgent"/></strong>
                 
                  </div>
                  
                   <div id="W_M" style="width: 25% ; float: left; text-align: center;">
                           <strong ><spring:message code="warehouseManager"/></strong>
                 
                  </div>
                  
                      <div  id="D" style="width: 25% ; float: left; text-align: center;">
                            <strong ><spring:message code="Driver"/></strong>
                 
                  </div>
                  
                   <div id="S"  style="width: 25% ; float: left; text-align: center;">
                              <strong ><spring:message code="Security"/></strong>
                 
                  </div>
                  
                </div>            
                    </form:form>
                   			
						 </div>
						 
                        </div>
                        
                           <br> <br> <br>   
                        <div  class="row-fluid  " > 
                            <strong id="nodust_misr" style="text-align:left; margin-left:25px;"><spring:message code="MisrNoDust"/></strong>
                       
                        <strong id="date_time_now" style="text-align: center; margin-left:200px;"> </strong>
                        </div>
                      <!--    <div id="pageFooter">Page </div> -->
                     </div>
                    
                  </div>
               </div>
            
           
           
       
                  
                  
                           
                  
                            
                            
            </div>
          
         </div>
   
	
    </div>


   <div id="footer">
       &copy; <spring:message code="CopyRights" />
   
   </div>
 
   <script>
      jQuery(document).ready(function() {			
      	// initiate layout and plugins
      	App.init();
      	
      });
      function Back_Types2()
      {
    	  document.getElementById("printBtn").style.visibility='hidden';
	 		document.getElementById("submitBtn").style.visibility='hidden';
	 		document.getElementById("deleterows").style.visibility='hidden';
	 		document.getElementById("addrows").style.visibility='hidden';
	 		document.getElementById("example").style.visibility='hidden';
	 		document.getElementById("cancel_btn").style.visibility='visible';
	 		document.getElementById("next_btn2").style.visibility='visible';
	 		document.getElementById("div_data1").style.visibility='hidden';
 	 		document.getElementById("div_data2").style.visibility='hidden';
 	 		document.getElementById("ver_div").style.visibility='hidden';
	 		document.getElementById("cancel_btn2").style.visibility='hidden';
	 		document.getElementById("from").disabled=false;
	 		document.getElementById("to").disabled=false;
      }
      function get_products_data()
      {
     	 var programs_data=JSON.parse(document.getElementById("program_data").value);
     	 console.log(programs_data);
     	 var from_id=document.getElementById("from").value;
     	 var fac='${fac}';
     	 var Dying_form={
     			 "from_type" : from_id		 ,
     			 "fac_id" : fac
     	 };
     	 var xhttp = new XMLHttpRequest();
     	 	xhttp.onreadystatechange = function() {

     	 	if (this.readyState == 4 && this.status == 200) {
     	 		
     	 		var response= this.responseText;
     	 		console.log(response);
     	 		if(response!='No_Pro')
     	 			{
     	 			
     	 			var programs_data=JSON.parse(document.getElementById("program_data").value);
     	 			var programs="<select  onchange='changingwashing(this)' id='program' class='js-example-basic-multiple washingSelect' style='width:fit-content;'><option value='No_value'><spring:message code="PleaseSelect"/></option>";
     	 			for(var w=0;w<programs_data.length;w++)
     	 				{
     	 				programs+="<option value="+programs_data[w].id+">"+programs_data[w].program+"</option>";
     	 				}
     	 			programs+="</select>";
     	 		var products_data=JSON.parse(response);
     	 		console.log(products_data);
     	 		var products="<select  id='product' onchange='changingproduct(this)'  class='js-example-basic-multiple productSelect' style='width:fit-content;'><option value='No_value'><spring:message code="PleaseSelect"/></option>";
     	 		for(var x=0;x<products_data.length;x++)
     	 			{
     	 			products+="<option value="+products_data[x].product_sku+','+products_data[x].total_stock_quantity+">"+products_data[x].product_name+"</option>"
     	 			}
     	 		products+="</select>"
     	 		var rows="<tr><td class='first'><input type='checkbox' id='firstCheck' name='record' disabled='disabled'></td>";
     	 		rows+="<td>"+products+"</td>";
     	 		rows+="<td>"+programs+"</td>";
     	 		 rows+="<td><input required='required' min='1' onchange='changeQuentity(this)' type='number'  /></td>";
                 rows+="<td><input required='required' type='number' onchange='changeWeight(this)'  min='0.1' step='0.1' /></td>";
                  	 		rows+="<td style='display:none;'></td>";
     	 		rows+="<td style='display:none;'></td>";
     	 		rows+="<td style='display:none;'></td>";
     	 		rows+="<td style='display:none;'></td>";

     	 		rows+="<td></td>";
     	 		rows+="<td style='display:none'></td>";

     	 		rows+="</tr>";
     	 		$("#example tbody").html(rows);
     	 		var table=document.getElementById('example');
     	 		var cat_id=document.getElementById('Selectcategory').value;
     	 		if(cat_id==1)
     	 			{
     	 			table.rows[0].cells[2].innerHTML='Washing Program';
     	 			}
     	 		else
     	 			{
     	 			table.rows[0].cells[2].innerHTML='Dyeing Program';
     	 			}
     	 		document.getElementById("printBtn").style.visibility='visible';
     	 		document.getElementById("submitBtn").style.visibility='visible';
     	 		document.getElementById("deleterows").style.visibility='visible';
     	 		document.getElementById("addrows").style.visibility='visible';
     	 		document.getElementById("example").style.visibility='visible';
     	 		document.getElementById("cancel_btn").style.display='none';
     	 		document.getElementById("next_btn2").style.display='none';

     	 		document.getElementById("div_data1").style.visibility='visible';
     	 		document.getElementById("div_data2").style.visibility='visible';
     	 		document.getElementById("ver_div").style.visibility='visible';

     	 		document.getElementById("cancel_btn2").style.visibility='visible';
     	 		document.getElementById("from").disabled=true;
     	 		document.getElementById("to").disabled=true;
     	 		
     	 			}
     	 		else
     	 			{
     	 			swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="NoAvailableProductsOfType"/>","error");
     	 			/*$.alert({
     			          title: "Error",
     					    content:"<spring:message code="NoAvailableProductsOfType"/>",
     			          });*/
     	 			}
     	 	}
     	 	}
     	 	 xhttp.open("POST","GetProductsForDying", true);
     	 	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
     	 	 xhttp.send(JSON.stringify(Dying_form));
      }
      
      function Check_type_entered()
      {
    	  var from=document.getElementById('from').value;
    	  var to=document.getElementById('to').value;
    	  if(from=='No_value'||to=='No_value')
    		  {
    		  swal("<spring:message code="ShipmentList.Error.Title" />","<spring:message code="SelectValidType" />","error");
    		  /*$.alert({
  	    		
                  title: "<spring:message code="ShipmentList.Error.Title" />",
      		    content:"<spring:message code="SelectValidType" />",
                  });*/
    		  }
    	  else
    		  {
    	     	 get_products_data();
    		  }
    		
      }
      
      function get_to_types(val)
      {
      	var selection=val.options[val.selectedIndex].text;
      	var value=val.value;
      	if(value!="No_value")
      		{
      	var prod_type={
      			"type_id" : value , 
      			"type_name" :selection
      	};
      	var xhttp = new XMLHttpRequest();
      	xhttp.onreadystatechange = function() {

      	if (this.readyState == 4 && this.status == 200) {
      		
      		var response= this.responseText;
      		var data=JSON.parse(response);
      		var to_selection="<option value='No_value'><spring:message code='PleaseSelect'/></option>";
      		for(var i=0;i<data.length;i++)
      			{
      			to_selection+="<option value="+data[i].type_id+">"+data[i].type_name+"</option>";
      			}
      		$('#to').html(to_selection);

      	}
      	}
      	 xhttp.open("POST","GetToTypes", true);
      	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
      	 xhttp.send(JSON.stringify(prod_type));
      		}
      	else
      		{
      		var to_selection="<option><spring:message code='PleaseSelect'/></option>";
      		$('#to').html(to_selection);

      		}
      }
      function get_washing_programs(val)
      {
     	 var from_type_id=document.getElementById("from").value;
     	 var to_type_id=document.getElementById("to").value;
     	 var Dying_form={
     			 "from_type" : from_type_id,
     			 "to_type" : to_type_id
     	 }
     	 var xhttp = new XMLHttpRequest();
     	 	xhttp.onreadystatechange = function() {

     	 	if (this.readyState == 4 && this.status == 200) {
     	 		
     	 		var response= this.responseText;
     	 		//var data=JSON.parse(response);
     	 		console.log(response);
     	 		document.getElementById("program_data").value=response;
     	 	}
     	 	}
     	 	 xhttp.open("POST","GetProgramsData", true);
     	 	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
     	 	 xhttp.send(JSON.stringify(Dying_form));
     	 
      }
      
      function Back_Types()
      {
    	  var emp_val="<option value='No_value'>Please Select</option>";
    	  $('#from').html(emp_val);
    	  $('#to').html(emp_val);
    	  document.getElementById('types').style.visibility='hidden';
    	  document.getElementById('next_btn2').style.visibility='hidden';
    	  document.getElementById('cancel_btn').style.visibility='hidden';
    	  document.getElementById('Selectcategory').disabled=false;
    	  document.getElementById('next_btn').style.visibility='visible';

      }
      
      function get_From_Types()
      {
    	  var category_id=document.getElementById("Selectcategory").value;
    	  var pro_type={
    			  "type_id":category_id
    	  };
    	  console.log(pro_type);
    	  var xhttp = new XMLHttpRequest();
   	 	xhttp.onreadystatechange = function() {

   	 	if (this.readyState == 4 && this.status == 200) {
   	 		
   	 		var response= this.responseText;
   	 		console.log(response)
   	 		if(response!='No_types')
   	 			{
   	 			
   	 		document.getElementById("next_btn").style.visibility='hidden';
  		  document.getElementById("next_btn2").style.visibility='visible';
  		  document.getElementById("cancel_btn").style.visibility='visible';

  		
  		  document.getElementById("types").style.visibility='visible';
  		  var categories=JSON.parse(response);
  		  var options="<option value='No_value'>Please Select </option>";
  		  for(var i=0;i<categories.length;i++)
  			  {
  			options+="<option value="+categories[i].type_id+">"+categories[i].type_name+"</option>";
  			  }
  		  $('#from').html(options);
   	 			}
   	 		else
   	 			{
   	 			swal("<spring:message code="ShipmentList.Error.Title" />","<spring:message code="NoAvaiableTypesOFCategory"/>","error");
   	 		/*$.alert({
	    		
                title: "<spring:message code="ShipmentList.Error.Title" />",
    		    content:"<spring:message code="NoAvaiableTypesOFCategory"/>",
                });*/
   	 			}
   	 	}
   	 	}
   	 xhttp.open("POST","GetTypeByCtegoryId", true);
	 	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
	 	 xhttp.send(JSON.stringify(pro_type));
    	  
      }
      function Check_from_types()
      {
    	  if(document.getElementById("Selectcategory").value=="No_value")
    		  {
    		  swal("<spring:message code="ShipmentList.Error.Title" />","<spring:message code="SelectValidCategory" />","error");
    		 /* $.alert({
    	    		
                  title: "<spring:message code="ShipmentList.Error.Title" />",
      		    content:"<spring:message code="SelectValidCategory" />",
                  }); */
    		  }
    	  else
    		  {
    		  document.getElementById("Selectcategory").disabled=true;
    		  get_From_Types();
    		  
    		  }
      }
      
      function print_data()
      {
    	  var fac='${fac}';
    	  if(fac==1)
    		  {
    	  var from_sel=document.getElementById('from');
     	  var from_text=from_sel.options[from_sel.selectedIndex].text;
     	  var to_sel=document.getElementById('to');
     	  var to_text=to_sel.options[to_sel.selectedIndex].text;
     	  $('#from_value').html(from_text);
     	  $('#to_value').html(to_text);
    	  var cat_sel=document.getElementById('Selectcategory');
    	  var cat_text=cat_sel.options[cat_sel.selectedIndex].text;
    		  }
    	  var laudry_sel=document.getElementById('SelectLundry');
    	  var laun_text=laudry_sel.options[laudry_sel.selectedIndex].text;
    	  var dr_sel=document.getElementById('SelectDriver');
    	  var dr_text=dr_sel.options[dr_sel.selectedIndex].text;
    	  $('#Laudry').html(laun_text);
    	  $('#Driver').html(dr_text);
    	  $('#catgory').html(cat_text);
    	  document.getElementById('cons_det').style.display='none';
    	  var check_ext='${Lundry}';
		  document.getElementById('ver_div').style.display='none';
		  var class_cq= document.getElementsByClassName('cq');
		 /* for(var x=0;x<class_cq.length;x++)
			  {
			  class_cq[x].style.display='none';
			  }*/
    	
    		 // document.getElementsByClassName('cq').style.display='none';
    	   var table=document.getElementById("example");
    	   var row_num=table.rows.length;
    	   //alert(row_num);
    	   var program_ids="";
    	   for(var x=1;x<row_num;x++)
    		   {
    		   program_ids+=table.rows[x].cells[6].innerHTML;
    		   program_ids+=',';
    		   }
    	   program_ids+="";
    	   var order_id=document.getElementById("order_id").value;
    	   var consum={
    			   "ids" : order_id
    			   
    	   };
    	   console.log(consum);
    	   var xhttp = new XMLHttpRequest();
       	xhttp.onreadystatechange = function() {

       	if (this.readyState == 4 && this.status == 200) {
       		var response= this.responseText;
       		var resp=JSON.parse(response);
       		console.log(response);
       		var all_data=resp.data_for_printing;
       		var total_con=resp.total_consumables;
       		var details_con=resp.consumable_details;
       	  if(check_ext=="External")
		  {
		 
       		var Cons_totals="";
       		for(var x=0;x<total_con.length;x++)
       			{
       			Cons_totals+="<tr><td>"+total_con[x].product_name+"</td>"+
       			"<td>"+total_con[x].quantity+"</td>"+
       			"<td>"+total_con[x].unit+"</td>"+
       			"</tr>";
       			}
       		var Cons_det="";
       		for(var i=0;i<details_con.length;i++)
       			{
       			Cons_det+="<tr><td>"+details_con[i].program+"</td>"+
       			"<td>"+details_con[i].product_name+"</td>"+
       			"<td>"+details_con[i].quantity+"</td>"+
       			"</tr>";
       			}
		  }
       	  else
       		 
   		  {
   		  document.getElementById("cons_det").style.display='none';
   		  document.getElementById("cons_total").style.display='none';

       		  }
       	 var today = new Date();
		  var date=today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
		  var hours=today.getHours();
		  	 if(hours>12)
		  		 {
		  		 hours=hours-12;
		  		 }
 	   var time = hours + ":" + today.getMinutes() + ":" + today.getSeconds();
 	   var dateTime = date+'   '+time;
 	   document.getElementById("date_time_now").innerText=dateTime;
       		var total_data_print="";
       		for(var x=0;x<all_data.length;x++)
       			{
       			var x_unit="";
       			if(all_data[x].unit!="null"||all_data[x].unit!="")
       				{
       				x_unit=all_data[x].unit;
       				}
       			total_data_print+="<tr><td>"+all_data[x].product_name+"</td>"+
       			"<td>"+all_data[x].program+"</td>"+
       			"<td>"+all_data[x].quantity_shipped+"</td>"+
       			"<td>"+all_data[x].weight+"</td>"+
       		
       			"</tr>";
       			}
       		$("#total_tbl tbody").html(Cons_totals);
       		$("#details_tbl tbody").html(Cons_det);
       		$("#print_tbl tbody").html(total_data_print);
       	
       	 window.print();
       	}
       	}
        xhttp.open("POST","GetShipmentConsumable", true);
     	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
     	 xhttp.send(JSON.stringify(consum));
    		  
    	
    	
      }
    function Check_driver_select()
    {
    	var ver_code=document.getElementById("verif_code").value;
    	if(ver_code!="")
    		{
    		validate_Code();
    		}
    }
      
      
      function changingproduct(e) {
          var idx = e.selectedIndex ; 
          var rowIndex = e.parentNode.parentNode.rowIndex;
          var myTable = document.getElementById('example');
         
          if(idx==0)
        	  {
        	  myTable.rows[rowIndex].cells[5].innerHTML = "";
              myTable.rows[rowIndex].cells[9].innerHTML = "";
        	  }
          else{
        	  var strUser = e.options[e.selectedIndex].value;
              var array = strUser.split(',');
              myTable.rows[rowIndex].cells[5].innerHTML = array[0];
              myTable.rows[rowIndex].cells[9].innerHTML = array[1];
              $("#example tr").eq(rowIndex).find("td").eq(3).find("input").attr({
                  "max" : array[1]
               }); 
          }
          
        
      
          
      }
      function changingwashing(e){
    	  
    	  var idx = e.selectedIndex ; 
          var rowIndex = e.parentNode.parentNode.rowIndex;
          var strUser = e.options[e.selectedIndex].value;
          var myTable = document.getElementById('example');

          myTable.rows[rowIndex].cells[6].innerHTML = strUser;
      }
      function changeQuentity(e)
      {
          var rowIndex = e.parentNode.parentNode.rowIndex;
          var myTable = document.getElementById('example');
          var strUser = myTable.rows[rowIndex].cells[3].children[0].value;
          myTable.rows[rowIndex].cells[7].innerHTML = strUser;
      }
      
      function changeWeight(e)
      {
          var rowIndex = e.parentNode.parentNode.rowIndex;
          var myTable = document.getElementById('example');
          var strUser = myTable.rows[rowIndex].cells[4].children[0].value;
          myTable.rows[rowIndex].cells[8].innerHTML = strUser;
      }

      function validate_Code()
      {
    	 	 document.getElementById("check_auth_done").value='';
    	  	 document.getElementById("auth_driver").value='';
        	var check_user_name=document.getElementById("SelectDriver").value;

      
    	  if(check_user_name!="No_value")
    		  {
    		  
      	var ver_code=document.getElementById("verif_code").value;
      	var user_name=document.getElementById("SelectDriver").value;
      	var selected_driver={
  				 "selectedDriver":user_name,
  				 "code":ver_code
  		 };
      	console.log(user_name);
      	console.log(ver_code);
      	console.log(selected_driver);
    		var xhttp = new XMLHttpRequest();
    		xhttp.onreadystatechange = function() {
    			

    			if (this.readyState == 4 && this.status == 200) {
    			var resp=this.responseText;
    			if(resp=="not autheticate")
  				{
    				document.getElementById("auth_driver").value=resp;
    				document.getElementById("check_auth_done").value="done";
  				swal("<spring:message code="ReleasingProducts.validation.title"/>","<spring:message code="ReleasingProducts.validation.content"/>","error");
    				/*$.alert({
  		            
                  title: "Verification Error",
      		    content:"Please insert correct Verification Code"
                  }); */
  	 			document.getElementById("verif_code").focus();

  				}
    			else
    				{
    				document.getElementById("auth_driver").value='Auth';
    				document.getElementById("check_auth_done").value="done";

    				}
    			}
    			}
    		xhttp.open("POST","CheckDriverAuth", true);
   		 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
   		 xhttp.send(JSON.stringify(selected_driver));
      }
      }
      function selectDeselectAll(checkedVar) {
    	  if (checkedVar.checked) {
        	  $('.commonClass').attr('checked',true).change();
        	  }
        	  else{
        		  $('.commonClass').attr('checked',false).change();
        	  }
	}
      function submitFunction()
      {
    	  document.getElementById("submitBtn").disabled = true;
	  document.getElementById("cancel_btn2").disabled = true;

    	  var validation = document.getElementById("tableform").reportValidity();
    	  var validation2=document.getElementById("verif_code").reportValidity();
    	  
    	  var x_products_check_select=document.getElementsByClassName("productSelect");
    	  var x_washing_check_select=document.getElementsByClassName("washingSelect");
    	  var selectDriv = document.getElementById("SelectDriver").value
    	  var selectlaundry = document.getElementById("SelectLundry").value
    	  var checkProduct="";
    	  var checkWasing ="";
    	  for(var i=0;i<x_products_check_select.length;i++)
			{
    		  
			if(x_products_check_select[i].value=="No_value")
				checkProduct="Not_Valid";
			}
    	  
    	  for(var i=0;i<x_washing_check_select.length;i++)
			{
  		  
			if(x_washing_check_select[i].value=="No_value")
				checkWasing="Not_Valid";
			}
    	  
    	  if  (selectlaundry == "No_value")
 		 {
 		document.getElementById("submitBtn").disabled = false;
    	
          	document.getElementById("SelectDriver").disabled = false;
 	    	document.getElementById("SelectLundry").disabled = false;
 	    	document.getElementById("deleterows").disabled = false;
 	    	document.getElementById("addrows").disabled = false;
 	    	

 	    	$('#tableform input[type="number"]').prop("disabled", false);
 		$('#tableform select').prop("disabled", false);
 		$('#tableform  input[type=checkbox]').prop("disabled", false);
   	document.getElementById("firstCheck").disabled = true; 
swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="SelectValidLaudry"/>","error");
 		/*$.alert({
 	          title: "Error",
 			    content:"<spring:message code="SelectValidLaudry"/>",
 	          }); */
 		 
 		 }
    	  else if  (selectDriv == "No_value")
 		 {
 		document.getElementById("submitBtn").disabled = false;
     	
    	document.getElementById("SelectDriver").disabled = false;
 	    	document.getElementById("SelectLundry").disabled = false;
 	    	document.getElementById("deleterows").disabled = false;
 	    	document.getElementById("addrows").disabled = false;
 	    	

 	    	$('#tableform input[type="number"]').prop("disabled", false);
 		$('#tableform select').prop("disabled", false);
 		$('#tableform  input[type=checkbox]').prop("disabled", false);
    	document.getElementById("firstCheck").disabled = true; 
swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="SelectValidDriver"/>","error");
 		/*$.alert({
 	          title: "Error",
 			    content:"<spring:message code="SelectValidDriver"/>",
 	          }); */
 		 
 		 }
    	  
    	  else if(validation != false && validation2!=false && checkWasing != "Not_Valid" && checkProduct != "Not_Valid" && selectDriv != "Not_Valid" && selectlaundry != "Not_Valid" )
     		 {
      		var check_authe_driver=document.getElementById("auth_driver").value;
      		var check_done_or_not=document.getElementById("check_auth_done").value;
      		if(check_authe_driver=="not autheticate"&&check_done_or_not=="done")
 			{
      			 document.getElementById("submitBtn").disabled = false;
      			  document.getElementById("cancel_btn2").disabled = false;
swal("<spring:message code="ReleasingProducts.validation.title"/>","<spring:message code="ReleasingProducts.validation.content"/>","error");
 			/*$.alert({
	            
                title: "Verification Error",
    		    content:"Please insert correct Verification Code"
                }); */
 			document.getElementById("verif_code").focus();
 			}
      		else
      			{
      			if(check_done_or_not=="done"&&check_authe_driver=="Auth")
      				{
      			document.getElementById("verif_code").disabled=true;
     		document.getElementById("submitBtn").disabled = true;
			  document.getElementById("cancel_btn2").disabled = true;

	    	document.getElementById("SelectDriver").disabled = true;
  	    	document.getElementById("SelectLundry").disabled = true;
  	    	document.getElementById("deleterows").disabled = true;
  	    	document.getElementById("addrows").disabled = true;
  	    	$('#tableform input[type="number"]').prop("disabled", true);
			$('#tableform select').prop("disabled", true);
			$('#tableform  input[type=checkbox]').prop("disabled", true);
     		 var table = $('#example').tableToJSON(
       			  { ignoreColumns:[]}
       			  );
       	  //alert(table);
       	  console.log(table);
       	  var e = document.getElementById("SelectDriver");
    	  var selectedDriver = e.options[e.selectedIndex].value;
    	  var e2 = document.getElementById("SelectLundry");
    	  var selectedlundry = e2.options[e2.selectedIndex].value;
    	 // alert(selectedlundry);
    	 var cat=document.getElementById('Selectcategory').value;
    	  if(cat=='No_value')
    		  {
    		  cat=1;
    		  }
    	  var dirtyData ={
    			  "dirty_list" : table ,
    			  "selectedDriver" : selectedDriver  ,
    			  "selectedLundry" : selectedlundry  ,
    			  "externalFlag":'${external}',
    			  "from_type" : cat
    	  };
    	  
    	  console.log(dirtyData);
    	var xhttp = new XMLHttpRequest();
    	xhttp.onreadystatechange = function() {

    	if (this.readyState == 4 && this.status == 200) {
    		var response= this.responseText;
    		console.log(response);
    		if(response > 0)
    			{
    			document.getElementById("order_id").value=response;
	    			$('#tableform input[type="number"]').prop("disabled", true);
	    			$('#tableform select').prop("disabled", true);
	    			$('#tableform  input[type=checkbox]').prop("disabled", true);
	    			swal("<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.title" />","<spring:message code="CreateNewDirtyShipmentSubmittedSuccessfully" />","success");
	      	    	/*$.alert({
	      	    		
	                    title: "<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.title" />",
	        		    content:"<spring:message code="CreateNewDirtyShipmentSubmittedSuccessfully" />",
	                    });*/ 
	      	    	document.getElementById("submitBtn").disabled = true;
	  			  document.getElementById("cancel_btn2").disabled = true;

	      	    	document.getElementById("printBtn").disabled = false;
	      	    	document.getElementById("SelectDriver").disabled = true;
	      	    	document.getElementById("SelectLundry").disabled = true;
	      	    	document.getElementById("deleterows").disabled = true;
	      	    	document.getElementById("addrows").disabled = true;
	      	    	
    			}
    		else if(response =="no session"){
    			location.reload();
    		}
    		else if (response =="not success"){
    			
    			$('#tableform input[type="number"]').prop("disabled", false);
    			$('#tableform select').prop("disabled", false);
    			$('#tableform  input[type=checkbox]').prop("disabled", false);

    			document.getElementById("verif_code").disabled=false;

    			swal("<spring:message code="ShipmentNotSubmittedSuccessfully" />","<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.content" />","error");
    		 	  /*$.alert({
    		                         title: "<spring:message code="ShipmentNotSubmittedSuccessfully" />",
    		             		    content:"<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.content" />",
    		                         }); */
    		  	      document.getElementById("submitBtn").disabled = false;
    			    	document.getElementById("printBtn").disabled = true ;
    			    	document.getElementById("SelectDriver").disabled = false;
    	      	    	document.getElementById("SelectLundry").disabled = false;
    	      	    	document.getElementById("deleterows").disabled = false;
    	      	    	document.getElementById("addrows").disabled = false;
    	      	    	document.getElementById("firstCheck").disabled = true;
    	    			document.getElementById("verif_code").disabled=false;
    	  			  document.getElementById("cancel_btn2").disabled = false;


    		}
    		else{
    			
    			$('#tableform input[type="number"]').prop("disabled", false);
    			swal("<spring:message code="ShipmentNotSubmittedSuccessfully" />",response,"error");
    			/*$.alert({
                     title: "<spring:message code="ShipmentNotSubmittedSuccessfully" />",
         		    content:response,
                     }); */
     			document.getElementById("verif_code").disabled=false;

     			$('#tableform input[type="number"]').prop("disabled", false);
     			$('#tableform select').prop("disabled", false);
     			$('#tableform  input[type=checkbox]').prop("disabled", false);
     			
	     document.getElementById("submitBtn").disabled = false;
    	document.getElementById("printBtn").disabled = true ;
    	document.getElementById("SelectDriver").disabled = false;
	    	document.getElementById("SelectLundry").disabled = false;
	    	document.getElementById("deleterows").disabled = false;
	    	document.getElementById("addrows").disabled = false;
	    	document.getElementById("firstCheck").disabled = true; 
    		}
    	 }
    	 }
    	 xhttp.open("POST","submitDirtyShipment", true);
    	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    	 xhttp.send(JSON.stringify(dirtyData));
      			}
      			else
      				{
         			 document.getElementById("submitBtn").disabled = false;

         			 swal("<spring:message code="ReleasingProducts.validation.title"/>","<spring:message code="ReleasingProducts.validation.content"/>","error");
      				/*$.alert({
      		            
      	                title: "Verification Error",
      	    		    content:"Please insert correct Verification Code"
      	                }); */
      				}
     		 }
     		 }
     	
     	
     	 else if  (checkProduct == "Not_Valid")
     		 {
     		document.getElementById("submitBtn").disabled = false;
 	    	
        	document.getElementById("SelectDriver").disabled = false;
    	    	document.getElementById("SelectLundry").disabled = false;
    	    	document.getElementById("deleterows").disabled = false;
    	    	document.getElementById("addrows").disabled = false;
    	    	

    	    	$('#tableform input[type="number"]').prop("disabled", false);
    		$('#tableform select').prop("disabled", false);
    		$('#tableform  input[type=checkbox]').prop("disabled", false);
	    	document.getElementById("firstCheck").disabled = true; 

	    	swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="SelectValidProduct" />","error");
    		/*$.alert({
		          title: "Error",
				    content:"<spring:message code="SelectValidProduct" />",
		          }); */
     		 
     		 }
     	 else if (checkWasing == "Not_Valid")
     		 {
     		document.getElementById("submitBtn").disabled = false;
 	    	
        	document.getElementById("SelectDriver").disabled = false;
    	    	document.getElementById("SelectLundry").disabled = false;
    	    	document.getElementById("deleterows").disabled = false;
    	    	document.getElementById("addrows").disabled = false;
    		$('#tableform select').prop("disabled", false);
    		$('#tableform  input[type=checkbox]').prop("disabled", false);
	    	$('#tableform input[type="number"]').prop("disabled", false);
	    	document.getElementById("firstCheck").disabled = true; 

	    	swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="PleaseSelectValidWashingProgram" />","error");
     		/*$.alert({
		          title: "Error",
				    content:"<spring:message code="PleaseSelectValidWashingProgram" />",
		          }); */
     		 }
     	 else{
 	    	document.getElementById("submitBtn").disabled = false;
    	document.getElementById("SelectDriver").disabled = false;
	    	document.getElementById("SelectLundry").disabled = false;
	    	document.getElementById("deleterows").disabled = false;
	    	document.getElementById("addrows").disabled = false;
	    	$('#tableform input[type="number"]').prop("disabled", false);
		$('#tableform select').prop("disabled", false);
		$('#tableform  input[type=checkbox]').prop("disabled", false);
    	document.getElementById("firstCheck").disabled = true; 


     	 }
    		 
    	 
      
    	  //var table = $('#example').tableToJSON();

    	  //console.log(table);
    	//  document.getElementById("submitBtn").disabled = true;

        /*  if(document.submitForm.onsubmit &&
          !document.submitForm.onsubmit())
          {
              return;
          }
       document.submitForm.submit();*/
      }
      
      function selectDeselect(checkedVar) {
    	  if (!checkedVar.checked)
    		  {
    		  document.getElementById("selectAll").checked = false;

    		  }
	}
      $(document).ready(function() {
  	    $('.js-example-basic-multiple').select2({
  	      tags: true

  	    });
  	    
  	  $('.js-example-basic-single').select2();
  	    if ('${validation}' == "false")
  	    	{
  	    	$('#tableform input[type="number"]').prop("disabled", true);
			$('#tableform select').prop("disabled", true);
			$('#tableform  input[type=checkbox]').prop("disabled", true);
  	    	document.getElementById("submitBtn").disabled = true;
  	    	document.getElementById("printBtn").disabled = true;
  	    	document.getElementById("SelectDriver").disabled = true;
  	    	document.getElementById("SelectLundry").disabled = true;
  	    	document.getElementById("deleterows").disabled = true;
  	    	document.getElementById("addrows").disabled = true;
  	    	}
 	   
  	});
      
   </script>
   
   <script >
    $(document).ready(function(){
    

    	
    	
        $(".add-row").click(function(index){
        	
        	var tbl=document.getElementById("example");
        	var val0=tbl.rows[1].cells[0].innerHTML;
        	var val1=tbl.rows[1].cells[1].innerHTML;
        	var val2=tbl.rows[1].cells[2].innerHTML;
        	var val3=tbl.rows[1].cells[3].innerHTML;
        	var val4=tbl.rows[1].cells[4].innerHTML;
        	var val8 =tbl.rows[1].cells[9].innerHTML;
        	 var markup = "<tr> "+
             "<td class='first'><input type='checkbox'  onchange='selectDeselect(this)' class='commonClass' name='record'></td>"+
             " <td>"+val1+"</td>"+
             " <td>"+val2+"</td>"+
             " <td>"+val3+"</td>"+
             " <td>"+val4+"</td>"+
             " <td style='display: none;'>${dirtyForm.product_list[0].product_sku}</td>" +
             " <td style='display: none;'>${dirtyForm.washing_list[0].id}</td>" +
             "<td style='display: none;'>0</td>"+
             "<td style='display: none;'>0</td>"+
             "<td class='cq'></td>"+
             "</tr>";
             $("#example tbody").append(markup);
        	
          //  $("tbody > tr:first").clone().find('input').val('').end().appendTo("table");  
       
        });
        
        $(".delete-row").click(function(){
        	var rowCount = document.getElementById('example').rows.length;
        	
        	if($("#tableform input:checkbox.commonClass:checked").length > 0)
    		{
        	$.confirm({
        	    title: '<spring:message code="DeleteRowsMessage" />',
        		icon:'glyphicon glyphicon-remove-sign',
        		theme: 'supervan',
        	    content:'',
        	    
        	    buttons: {
        	    	  
        	    	
        	        OK: function () {
        	        	 $("table tbody").find('input[name="record"]').each(function(){
				            	if($(this).is(":checked")){
				                    $(this).parents(" table tbody tr  ").remove();
				                }
				            });
        	        	  document.getElementById("selectAll").checked = false;
        	        },
        	        cancel: function () {
        	        }
        	        
        	    }
        	});
    		}

        });
             
    });    
</script>
<script>
$(document).ready(function(){
var check_ex='${Lundry}';
	if(check_ex!="External")
		{
		document.getElementById('cat_div').style.display='none';
		document.getElementById('types').style.display='none';
		document.getElementById('next_btn').style.display='none';
		document.getElementById('div_data1').style.visibility='visible';
		document.getElementById('ver_div').style.visibility='visible';

		
  		document.getElementById('div_data2').style.visibility='visible';
      		document.getElementById('tableBtns').style.visibility='visible';
    document.getElementById('example').style.visibility='visible';
    document.getElementById('printBtn').style.visibility='visible';
    document.getElementById('submitBtn').style.visibility='visible';
    document.getElementById('cancel_btn2').style.display='none';

		}
	else
		{
		
		}
	
}); 
</script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>