<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
      <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title><spring:message code="ViewDirtyShipmentDetails.PageTitle"/></title>
   <link href="img/no.jpeg" rel="icon" />
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
 
   <link href="resources/assetsnodust/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />  
          <link rel="stylesheet" href="resources/css/jquery-confirm.min.css"/>
      <link href="resources/assetsnodust/css/style.css" rel="stylesheet" />
      
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
   
    <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
     
   
   	   <script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
       <script type="text/javascript" src="resources/assetsnodust/js/jasontable.js"></script>
	 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
	   <script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
	     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
<!--    <link href="resources/assetsnodust/css/style_arabic.css" rel="stylesheet" />  --> 

 <style type="text/css">
 #astr
{
    color: red;
    font-size: large;
}
#warehouse_name_div
 {
 margin-left:5px;
 float:left;
 width:35%;
 }
  #agent_name_div
 {
 float:left;
 width:30%;
 }
 #date_div
 {
 float:left;
 width:30%;
 }
 #Driver
 {
 display:none;
 }
#logoprint{visibility :hidden; display:none;}
 #Approved_Data
{
  visibility:hidden;
  }
  #driver_name_div
 {
 margin-left:5px;
 float:left;
 width:45%;
 }
 #destination
 {
 float:left;
 width:50%;
 }
 #approval_date_div
 {
 float:left;
 width:50%;
 }
 #approval_user_div
 {
 margin-left:5px;
 float:left;
 width:45%;
 }
 #lost_Data
{
  visibility:hidden;
  }
#date_time_now
{
visibility:hidden;
}
  #nodust_misr{
  visibility:hidden;
  }
</style>

 <style type="text/css" media="print">

 @page { size:A4 ;  }
  
  @media print {
  #space_1_div
  {
  display:none;
  }
    #nodust_misr{
  visibility:visible;
  }
  #date_time_now
{
visibility:visible;
}
  #Approved_Data
{
  visibility:visible;
  }
  #Driver_approved
  {
  visibility:hidden;
  display:none;
  }
  #Driver
  {
  display:inline-block;
  margin-top:5px;
  }
  #div_ver_code
  {
  display:none;
  }
 #lost_Data
{
  visibility:visible;
  }
  #tableform{
  display:none;
  }
  #astr{
  display:none;
  }
  #attavch{
      display: none;
  }
#title_page
{
display:none;
}
  #printBtn {
    display: none;
  }
  #submitBtn {
    display: none;
  }
  #links{
  display: none
  }
 #navBar{
  display: none
 }
 #sidemenu{
 display: none
 }
 #style_driver
 {
 display:none;
 }
 
 
 
 
 
 
 #tableBtns{
  display: none
 }
 
 #showDate{ color: black;}
  #titlepage{ display: none;}
}

#logoprint{visibility: visible; display:block;}

#contentpage{ margin-top: -50px;}

 #Header, #Footer { display: none !important; color: white !important ; background: red; }
#footer{ display: none;  }

@page {	margin:0;}
body{ margin: 1.6cm}



}
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
    
	<!-- BEGIN PAGE -->


		<div id="main-content">
	
         <div class="container-fluid">
            <div class="row-fluid">
               <div class="span12">
                  
                
			
                  <ul id="links" class=" breadcrumb mtop5 pull-left">
                       <li>
                           <a href="DashboardNoDust"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                      <li><a href="ViewDirtyShipments"><spring:message code="ViewDirtyShipments.PageTitle" /></a> <span class="divider">&nbsp; &nbsp;</span></li>
                       <li><a href="DirtyShipmentDetails?shipmentID=${shipmentID}"> <spring:message code="ViewDirtyShipmentDetails.PageTitle"/></a><span class="divider-last">&nbsp;</span></li>
               
                  </ul>
      	  
				   
               </div>
            </div>
       
		                 <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:5%;  margin-top: -20px ; " id="logoprint">
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div id="title_page" class="widget-title">
                           <h4> <spring:message code="ViewDirtyShipmentDetails.PageTitle"/></h4>
                        </div>
                        
						<div class="widget-body">
							<table width="100%" >
<tr>
<td>
<div class="space10"></div>
 <div  class="widget-title">
                           <h4> <spring:message code="ShipemntsData_Page_Title"/></h4>
                        </div>
<div class="row-fluid invoice-list" style="border:outset;">
                              <div class="space10"></div>
                             <div class="row_fluid">
                                <div id="warehouse_name_div">
                                    <div> <h5 ><strong><spring:message code="SourceWarehouse" /></strong>
                                     ${shipmentData.facility_name} 	</h5></div>
                                </div>
                                <div id="agent_name_div">
                                    <div > <h5 ><strong><spring:message code="RequestedBy_" /></strong>
                                   ${Requested_by}  	</h5></div>
                                </div>
                                 <div id="date_div">
                                    <div > <h5 ><strong><spring:message code="Date" /> </strong>
                                     <fmt:formatDate value="${shipmentData.shipment_date}" pattern="dd-MM-yyyy" />  	</h5></div>
                                </div>
                             </div>
                                
                            <div class="row-fluid">
                                
                            <div id="driver_name_div">
                                    <div style="float: left; margin-right: 10px;"> <h5 style="display: inline-block;"> <strong><spring:message code="Drivername" /></strong>
                                    	</h5>
                                    <c:if test="${shipmentData.last_status!= '5'}">	<span id="astr"> * </span> </c:if>
                                    	<h5 id='Driver' >  <c:if test="${shipmentData.last_status== '5'}">    ${shipmentData.full_name_en }	</c:if> </h5> 
                                         <c:if test="${shipmentData.last_status== '5'}">  <h5 id='Driver_approved' style="display:inline-block;">  ${shipmentData.full_name_en }</h5> </c:if>
                                 
                                    	
                                    	</div>
                                 
                                  <c:if test="${shipmentData.last_status!= '5'}">
                                    <div id="style_driver" style="margin-top: 5px; margin-left: 15px;">
                                    	  <select  id="SelectDriver" name="driver" style="width:fit-content" class= "span6 js-example-basic-multiple" onchange="Check_driver_select()" >
                                    	  <option value="No_value">Please Select</option>
								     <c:forEach var="driver" items="${driversList}" varStatus="vs">
                                        <option value="${driver.user_name}">${driver.full_name_en} , ${driver.user_name}</option>
                                        </c:forEach>
							  </select >
                           
                                    </div>
                                    	</c:if>
                                    
                                </div>
                                <div id="destination" >
                                      <div > <h5 ><strong><spring:message code="DestWarehouse" /></strong>
                                      ${shipmentData.lundry_name}  </h5> </div>
                         </div>
                               </div>
                               
                            <div class="clearfix"></div>
                            
                            	 <div >
 							 
                        <!--  
                         <div class="span6" id="div_ver_code" style="margin-top: -10px;">
                                      <div style="float: left; margin-right: 5px;" >
                                        <h5 style="display: inline-block;"><spring:message code="ReceivingProduct.VerificationCode" /></h5> <span id="astr"> * </span></div>  
                                        <div  style="margin-top: 5px; margin-left: 15px;"> <input type="text" required="required" id="verif_code" onchange="validate_Code()"/></div>
                
               
                  </div>
                  -->
                  </div>
                  
                                              <div class="clearfix"></div>
                                    <c:if test="${shipmentData.last_status== '5'}">
                 
                  <div class="row-fluid">
                    <div  id="approval_user_div">
                    <div >
                 <h5 ><strong> <spring:message code="ApprovedBy_"/></strong>${approved_by}</h5>
                 </div>
                 </div>
                 
                 <div id="approval_date_div">
                 <div style="float: left; margin-right: 5px;" >
                 <h5 > <strong><spring:message code="ApprovalDate_"/></strong>
                 ${Approval_Date}</h5>
                 </div>
                 </div>
                 
                 </div>
                 </c:if>
                  <div class="clearfix"></div>
                  <div class="space10"></div>
                      </div>
                      
                   
                                    
                                
                               
                                
                            
</td>
</tr>
</table>
 						


						
						<form:form id="t_data">
						<div id="space_1_div" class="space20"></div>
							<table id="tableform" class="table table-striped table-bordered   table-advance table-hover table-responsive" style="width:fit-content; margin:auto;">
						          <thead>
                                    <tr>
                                        <th class="first">  <input onchange="selectDeselectAll(this)" id="selectAll" type='checkbox' name='selectAll'> <spring:message code="approved"/></th>
                                      <th class="second"><input onchange="selectDeselectAllsealed(this)" id="selectAllsealed" type='checkbox' disabled="true" name='selectAll'> <spring:message code="Sealed"/></th>
                                        
                                        <th ><spring:message code="ProductName" /></th>
                                        <th ><spring:message code="WashingProgram" /></th>
                                        <th><spring:message code="Quantity" /></th>
                                        <th><spring:message code="ReceivedQuantity"/></th>
                                        
                                        <th ><spring:message code="Weight" /></th>
                                        <th style="display: none;">check</th>
                                        <th style="display: none;">id</th>
                                        <th style="display:none;">sealed_check</th>
                                        <th style="display:none;">received_quantity</th>
                                        <th><spring:message code="LostQuantity"/></th>
                                        <th><spring:message code="ProductReconciliation.LostTable.Accountable"/></th>
                                    </tr>
                                    
                                    </thead>
						 
						                 <tbody>
						            <c:forEach var="product" items="${shipmentProducts}" varStatus="vs">
                                    <tr class="odd gradeX ">
                                      <td class="first" ><input class="commonClass" onchange="changeState(this)" type='checkbox' name='record' 
                                      <c:if test="${product.approved==1}"> checked="checked"</c:if>  >
                                      </td>
                                       <td class="second" ><input class="commonClass2" onchange="changeStatesealed(this)" disabled="true" type='checkbox' name='record' <c:if test="${product.sealed==1}"> checked="checked"</c:if> ></td>
                                      
                                        <td>${product.product_name}</td>
                                        <td>${product.washing_program_name}</td>
                                        <td>${product.quantity}</td>
                                        <td>
                                        <c:if test="${shipmentData.last_status== '1' }">
                                        <input type="number" min="0.0" required="required" disabled="true" onchange="changeQuantity(this)"/>
                                        </c:if>                                        
                                        <c:if test="${shipmentData.last_status== '5'}">
                                        <c:if test="${product.received_quantity==null}">0</c:if>
                                        <c:if test="${product.received_quantity!=null}">
                                        ${product.received_quantity}
                                        </c:if>
                                        </c:if>
                                        </td>
                                        
                                        <td>${product.weight}</td>
                                        <td style="display: none;">false</td>
                                        <td style="display: none;">${product.id}</td>
                                        <td style="display:none;">false</td>
                                       <td style="display:none;">
                                       <c:if test="${shipmentData.last_status== '1'}">0</c:if>
                                       <c:if test="${shipmentData.last_status== '5'}">${product.received_quantity}</c:if>
                                       </td>
                                        <td class="lost_quan">
                                        <c:if test="${shipmentData.last_status== '5'}">${product.quantity-product.received_quantity}</c:if>
                                        </td>
                                        <td >
                                        <c:if test="${product.quantity > product.received_quantity}">
                                        <c:if test="${product.approved==false}"><spring:message code="Driver"/></c:if>
                                         <c:if test="${product.approved==true}">
                                         <c:if test="${product.sealed==true}"> <spring:message code="Warehouse"/> </c:if>
                                          <c:if test="${product.sealed==false}"> <spring:message code="Driver"/> </c:if>
                                         
                                         </c:if>
                                        </c:if>                                       
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
						      
                             </table>
                             <div class="space20"></div>
                              <div class="row-fluid  ">
                                <div class="widget-body">
                                <input id="auth_driver" style="display:none;"/>
                                                               <button id="submitBtn" type="button" onclick="submitForm()" class="btn btn-success pull-right green mright5 "><i class="icon-save icon-white"></i> <spring:message code="Approve" /></button>   
                                
                             <button type="button" id="printBtn" style="margin-right:5px;" disabled class="btn btn-primary pull-right" onclick="print_data()"><i class="icon-print  icon-white"></i> <spring:message code="Print" /></button>   
                            
                                   <input id="check_auth_done" style="display:none;"/>
       
                                  <!--  <button id="submitBtn" type="submit" class="btn btn-success pull-right green mright5 "><i class="icon-save icon-white"></i> Submit</button>   
       -->
                            </div></div>
               </form:form>
						   <div  class="space20" ></div>
                        <div class="clearfix"></div>
                            <div class="row-fluid" id="Approved_Data">
                            <strong><spring:message code="ApprovedProduct"/></strong>
                            <table id="approved_tbl"   class="table table-striped table-bordered   table-advance table-hover table-responsive" style="width:fit-content; margin:auto;">
                            <thead>
                             <tr>
                             <th><spring:message code="ProductName" /></th>
                                        <th ><spring:message code="WashingProgram" /></th>
                                        <th><spring:message code="Quantity" /></th>
                                        <th><spring:message code="ReceivedQuantity"/></th>
                                        
                                        <th ><spring:message code="Weight" /></th>
                                     
                                     
                                        <th style="display:none;">received_quantity</th>
                                 
                                       </tr>
                                       </thead>
                                       <tbody>
                                       </tbody>
                            </table>
                            </div>
                            <div class="row-fluid" id="lost_Data" style="margin-top: 15px;">
                            <strong><spring:message code="LostProducts"/></strong>
                            <table id="lost_prod" class="table table-striped table-bordered   table-advance table-hover table-responsive" style="width:fit-content; margin:auto;">
                            <thead>
                            <tr>
                             <th><spring:message code="ProductName" /></th>
                                        <th ><spring:message code="WashingProgram" /></th>
                                        <th><spring:message code="Quantity" /></th>
                                        <th><spring:message code="ReceivedQuantity"/></th>
                                        
                                        <th ><spring:message code="Weight" /></th>
                                       
                                        <th><spring:message code="LostQuantity"/></th>
                                        <th><spring:message code="ProductReconciliation.LostTable.Accountable"/></th>
                                       </tr>
                                        </thead>
                                    <tbody></tbody>    
                            </table>
                            </div>
                           
						 </div>
						 
                        </div>
                        
                     </div>
                  </div>
               </div>
            <div  class="row-fluid  " > 
                            <strong id="nodust_misr" style="text-align:left; margin-left:25px;"><spring:message code="MisrNoDust"/></strong>
                       
                        <strong id="date_time_now" style="text-align: center; margin-left:200px;"> </strong>
                        </div>
           
            </div>
          
         </div>
   
	
    </div>

 
 
   <div id="footer">
       &copy; <spring:message code="CopyRights" />
   
   </div>
 
 <!-- Open & close MENU -->
  
   <script>
      jQuery(document).ready(function() {			
      	App.init();
      });
      
      function print_data(){
    	  var table=document.getElementById("tableform");
    	  var row_num=table.getElementsByTagName("tr").length;
    	//  alert(row_num);
    	var driver_val='${shipmentData.full_name_en}';
    	document.getElementById('Driver').innerHTML=driver_val;
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
    	var emp_body="";
    	 $("#lost_prod tbody").html(emp_body);
    	 $("#approved_tbl tbody").html(emp_body);
    	  var lost_rec="";
    		  var approved_rec="";
    			  
    			  var count_lost=0;
              var count_approved=0;
    	  for(var x=1;x<row_num;x++)
    		  {
    		  var x_diff_val=table.rows[x].cells[11].innerText;
    		  if(x_diff_val>0||x_diff_val=='')
    			  {
    			  var pro_name=table.rows[x].cells[2].innerText;
    			  var washing_program=table.rows[x].cells[3].innerText;
    			  var quan=table.rows[x].cells[4].innerText;
    			  var received_quan=table.rows[x].cells[10].innerText;
    			  var weight=table.rows[x].cells[6].innerText;
    			  var lost_q=table.rows[x].cells[11].innerText;
    			  if(x_diff_val=='')
    				  {
    				  lost_q=quan;
    				  }
    			  var accountability=table.rows[x].cells[12].innerText;
    			  if(accountability=='')
    				  {
    				  accountability="Driver";
    				  }
    			  var row_val="<tr><td>"+pro_name+"</td><td>"+washing_program+"</td><td>"+quan+"</td><td>"+received_quan+"</td><td>"+weight+"</td><td>"+lost_q+"</td><td>"+accountability+"</td></tr>";
    			  lost_rec=lost_rec+row_val;
    			  count_lost+=1;
    			  }
    	
    		  else
    			  {
    			  var pro_name=table.rows[x].cells[2].innerText;
    			  var washing_program=table.rows[x].cells[3].innerText;
    			  var quan=table.rows[x].cells[4].innerText;
    			  var received_quan=table.rows[x].cells[10].innerText;
    			  var weight=table.rows[x].cells[6].innerText;
    			  var row_val="<tr><td>"+pro_name+"</td><td>"+washing_program+"</td><td>"+quan+"</td><td>"+received_quan+"</td><td>"+weight+"</td></tr>";
    			  approved_rec=approved_rec+row_val;
    			  count_approved+=1;
    			  }
    		  
    		  
    		  }

    	  if(count_lost>0)
    		  {
    		  $("#lost_prod tbody").append(lost_rec);
    		  }
    	  else
    		  {
    		  document.getElementById("lost_Data").style.display='none';
    		  }
    	  if(count_approved>0)
    		  {
    		  $("#approved_tbl tbody").append(approved_rec);

    		  }
    	  else
    		  {
    		  document.getElementById("Approved_Data").style.display='none';

    		  }
    	  window.print();
      }
      
      
      function selectDeselectAll(checkedVar) {
    	  if (checkedVar.checked) {
    		  var check_state_sealed_all=document.getElementsByClassName("commonClass2");
              var x_check_val="";
              for(var i=0;i<check_state_sealed_all.length;i++)
            	  {
            	  if(check_state_sealed_all[i].checked==false)
            		  x_check_val="uncheck";
            	  }
              if(x_check_val=="uncheck")
            	  {
            	//  document.getElementById("selectAll").checked=false;

            	  }
              else
            	  {
            	 // document.getElementById("selectAll").checked=true;

            	  }
    	  $('.commonClass').attr('checked',true).change();
		  $('.commonClass2').attr('disabled',false).change();
document.getElementById("selectAllsealed").disabled=false;
    	  }
    	  else{
    		  $('.commonClass').attr('checked',false).change();
    		  $('.commonClass2').attr('disabled',true).change();
    		  $('.commonClass2').attr('checked',false).change();
    		  document.getElementById("selectAllsealed").disabled=true;
    		  document.getElementById("selectAllsealed").checked=false;

    		  var table=document.getElementById("tableform");
    		  var x_rows_num=table.rows.length;
    	  }
    	  

	}
      
      function Check_driver_select()
      {
    	  var val=document.getElementById("SelectDriver").value;
    	  var driver_id='${shipmentData.user_name}';
    	  if(val==driver_id)
    		  {
    		  document.getElementById("auth_driver").value="Auth";
     		 document.getElementById("check_auth_done").value="done";
    		  }
    	  else
    		  {
    		  document.getElementById("auth_driver").value="not autheticate";
      		 document.getElementById("check_auth_done").value="done";
      		 swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="Select_Shipment_Deriver"/>","error");
    		  /*$.alert({
		            
	                title: "Error",
	    		    content:"<spring:message code="Select_Shipment_Deriver"/>"
	                }); */
    		  }
      }
      function  changeState(checkedVar) {
    	  var rowIndex =checkedVar.parentNode.parentNode.rowIndex;
    	  if (checkedVar.checked) {
    		  var myTable = document.getElementById('tableform');
              myTable.rows[rowIndex].cells[7].innerHTML="true";
             //  myTable.rows[rowIndex].cells[1].querySelectorAll(".commonClass2 :not([disabled])");
            	  myTable.rows[rowIndex].cells[1].children[0].disabled=false;
            	  document.getElementById("selectAllsealed").disabled=false;
            	  myTable.rows[rowIndex].cells[5].children[0].disabled=false;
            	  myTable.rows[rowIndex].cells[5].children[0].required=true;
            	  var check_all=document.getElementsByClassName('commonClass');
            	  var check_var="";
            	  for(var i=0;i<check_all.length;i++)
            		  {
            		  if(check_all[i].checked==false)
            			  {
            			  check_var="uncheck"
            			  }
            		  }
            	  if(check_var=="uncheck")
            		  {
            		  document.getElementById("selectAll").checked=false;
            		  document.getElementById("selectAllsealed").disabled=true;            	

            		  }
            	  else
            		  {
            		  document.getElementById("selectAll").checked=true;
            		  document.getElementById("selectAllsealed").disabled=false;            	
            		  }
            	  
    	  }
    	  else
    		  {
    		  var myTable = document.getElementById('tableform');
              myTable.rows[rowIndex].cells[7].innerHTML= "false"
                $("#selectAll").prop("checked", false);
              document.getElementById("selectAllsealed").checked=false;
              document.getElementById("selectAllsealed").disabled=true;

        	  myTable.rows[rowIndex].cells[1].children[0].disabled=true;
        	  myTable.rows[rowIndex].cells[1].children[0].checked=false;
        	  myTable.rows[rowIndex].cells[5].children[0].disabled=true;
        	  myTable.rows[rowIndex].cells[5].children[0].required=false;
        	  myTable.rows[rowIndex].cells[11].innerText=myTable.rows[rowIndex].cells[4].innerText;
        	  myTable.rows[rowIndex].cells[12].innerText='Driver';
        	  myTable.rows[rowIndex].cells[5].children[0].value='';
        	 

    		  }
    	  
     }
      
      
      function changeStatesealed(val)
      {
		  var myTable = document.getElementById('tableform');

    	  var rowIndex =val.parentNode.parentNode.rowIndex;
    	  if (val.checked) {
              myTable.rows[rowIndex].cells[9].innerHTML="true"
            	  myTable.rows[rowIndex].cells[12].innerHTML="Warehouse";
            	  var check_state_sealed_all=document.getElementsByClassName("commonClass2");
              var x_check_val="";
              for(var i=0;i<check_state_sealed_all.length;i++)
            	  {
            	  if(check_state_sealed_all[i].checked==false)
            		  x_check_val="uncheck";
            	  }
              if(x_check_val=="uncheck")
            	  {
            	  document.getElementById("selectAllsealed").checked=false;

            	  }
              else
            	  {
            	  document.getElementById("selectAllsealed").checked=true;

            	  }
              var diff=myTable.rows[rowIndex].cells[11].innerText;
    		  if(diff>0)
    			  {
    			  var check_sealed=myTable.rows[rowIndex].cells[9].innerText;
    			  
    				  myTable.rows[rowIndex].cells[12].innerText='Warehouse';
    			 
    			  }
    		  else
    			  {
    			  myTable.rows[rowIndex].cells[12].innerText='';
    			  }
      }
    	  else
    		  {
    		  var diff=myTable.rows[rowIndex].cells[11].innerText;
    		  if(diff>0)
    			  {
    			  var check_sealed=myTable.rows[rowIndex].cells[9].innerText;
    			  
    			  myTable.rows[rowIndex].cells[12].innerText="Driver";    			 
    			  }
    		  else
    			  {
    			  myTable.rows[rowIndex].cells[12].innerText=""; 
    			  }
    		 
              myTable.rows[rowIndex].cells[9].innerHTML="false"
              document.getElementById("selectAllsealed").checked=false;

             
    		  }
      }
      
		
      
      function selectDeselectAllsealed(check_val)
      {
    	  if(check_val.checked)
    		  {
    		  $('.commonClass2').attr('checked',true).change();
        	  }
        	  else{
        		  $('.commonClass2').attr('checked',false).change();
        	  }
    		  
      }
	
      
      function changeQuantity(val)
      {
    	  var val_quan=val.value;
    	  var rowIndex=val.parentNode.parentNode.rowIndex;
		  var myTable = document.getElementById('tableform');

		  myTable.rows[rowIndex].cells[10].innerText=val_quan;
		  var expected= myTable.rows[rowIndex].cells[4].innerText;
		  
		  var diff=expected-val_quan;
		  myTable.rows[rowIndex].cells[11].innerText=diff;
		  if(diff>0)
			  {
			  var check_sealed=myTable.rows[rowIndex].cells[9].innerText;
			  if(check_sealed=='true')
				  myTable.rows[rowIndex].cells[12].innerText='Warehouse';
			  else
				  myTable.rows[rowIndex].cells[12].innerText='Driver';

			  }
		  else
      {
			  myTable.rows[rowIndex].cells[12].innerText=' ';
      }
      
      }
      
     function submitForm()
     {

    	 if($("#tableform input:checkbox:checked").length > 0)
    	 {
    		// validate_Code();
    		// var val_code=document.getElementById("verif_code").reportValidity();
    		 var validate_quan=document.getElementById("t_data").reportValidity();
    		 var auth_val=document.getElementById("auth_driver").value;
    		 var Driver_val=document.getElementById("SelectDriver").value;
    		 check_auth_done=document.getElementById("check_auth_done").value
    		 if(Driver_val!="No_value"&&validate_quan!=false&& auth_val=="Auth"&&check_auth_done=="done")
    			 {
    			 if(auth_val=="not autheticate"&&check_done_or_not=="done")
    	 			{
    	      			 document.getElementById("submitBtn").disabled = false;
    	      			 swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="Select_Shipment_Deriver"/>","error");
    	 			/*$.alert({
    		            
    	                title: "Error",
    	    		    content:"<spring:message code="Select_Shipment_Deriver"/>"
    	                }); */
    	 			document.getElementById("verif_code").focus();
    	 			}
    			 else
    				 {
    		 submitData();
    				 }
    			 }
    		 else
    			 {
    			 if(check_auth_done=="done"&&auth_val=="not autheticate")
    				 {
    				 swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="Select_Shipment_Deriver"/>","error");
    			 /*$.alert({
   		            
                     title: "Error",
         		    content:"<spring:message code="Select_Shipment_Deriver"/>"
                     }); */
    			 }
    			 else if(document.getElementById("SelectDriver").value=="No_value")
    				 {
    				 swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="SelectValidDriver"/>","error");
/*
    				 $.alert({
    	   		            
                         title: "Error",
             		    content:"<spring:message code="SelectValidDriver"/>"
                         }); */
    				 }
    			 }
    	 }
    	 else{
    		 swal("<spring:message code="ViewDirtyShipmentDetails.uncheckMessage" />","<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.content" />","error");
    		/* $.alert({
                 title: "<spring:message code="ViewDirtyShipmentDetails.uncheckMessage" />",
     		    content:"<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.content" />",
                 }); */
    	 }
     }
     
     function submitData()
     {
    	 document.getElementById("submitBtn").disabled = true;
		$('#tableform  input[type=checkbox]').prop("disabled", true);

   	  var table = $('#tableform').tableToJSON(
   			  { ignoreColumns:[2,3,4]}
   			  );
   	  var table2  = $('#tableform').tableToJSON(
   			  { ignoreColumns:[2,3,4,5]}
		  );
   	  var pro_table=$('#tableform').tableToJSON(
   		{ignoreColumns:[0,1,2,3,4,5,6,7,9,11,12]}	  
   	  );
   //	console.log(table2);
   	 var ids = "";
   	 var ids2 = "";
   	 var ids3="";
   	for (var i = table.length - 1; i >= 0; i--)  {
   		var x = table[i];
   		//console.log(x);
   		if (x.check=="false")
   			{
   			if(ids2!="")
				{
				ids2+=",";
				}
			ids2+= table2[i].id;
			
			
   			table.splice( i, 1 );
   			table2.splice( i, 1 );
   			}
   		else
   			{
   			if(x.sealed_check=="false")
   				{
   				if(ids3!="")
   					{
   					ids3+=',';
   					}
   				ids3+=table2[i].id;
   				table.splice( i, 1 );
   	   			table2.splice( i, 1 );
   				}
   			else
   				{
   			if(ids!="")
   				{
   				ids+=",";
   				}
   			ids+= table2[i].id;
   				}
   			}
   			
     	}
   	console.log(ids);
   	console.log(ids2);
   	console.log(ids3);
    var dirtyData ={
			  "productsIds" : ids ,
			  "shipment_id" : '${shipmentID}' ,
			  "productsIds2" : ids2,
			  "productsIds3":ids3,
			  "dirty_list":pro_table,
	  };
	  
	  console.log(dirtyData);
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {

	if (this.readyState == 4 && this.status == 200) {
		var response= this.responseText;
		if(response == "success")
			{
			
  			$('#tableform  input[type=checkbox]').prop("disabled", true);
  			$('#tableform  input[type=number]').prop("disabled", true);

  			swal("<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.title" />","<spring:message code="ReceiveNewDirtyShipmentSubmittedSuccessfully" />","success");
    	    	/*$.alert({
    	    		
                  title: "<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.title" />",
      		    content:"<spring:message code="ReceiveNewDirtyShipmentSubmittedSuccessfully" />",
                  }); */
    	    	document.getElementById("submitBtn").disabled = true;
    	    	document.getElementById("printBtn").disabled = false;
    	    	document.getElementById("SelectDriver").disabled=true;
    	    //	document.getElementById("verif_code").disabled=true;
			}
		else if(response =="no session"){
			location.reload();
		}
		else if(response== "alreadyApproved")
			{
			swal("<spring:message code="ViewDirtyShipmentsDetails.alreadySubmitted.title" />","<spring:message code="ViewDirtyShipmentsDetails.alreadySubmitted.content" />","error");
			 /* $.alert({
                  title: "<spring:message code="ViewDirtyShipmentsDetails.alreadySubmitted.title" />",
      		    content:"<spring:message code="ViewDirtyShipmentsDetails.alreadySubmitted.content" />",
                  }); */
			}
		else{
			
  			$('#tableform  input[type=checkbox]').prop("disabled", false);
  			document.getElementById("submitBtn").disabled = false;
	    	document.getElementById("printBtn").disabled = true ;
	    	swal("<spring:message code="ShipmentNotSubmittedSuccessfully" />","<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.content" />","error");
		 	/*  $.alert({
		                         title: "<spring:message code="ShipmentNotSubmittedSuccessfully" />",
		             		    content:"<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.content" />",
		                         }); */
		  	      
		}
	 }
	 }
	 xhttp.open("POST","approveDirtyShipment", true);
	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
	 xhttp.send(JSON.stringify(dirtyData));
   
   	}
   	
     
     $(document).ready(function() {
    	 $('.js-example-basic-multiple').select2();
   	  if ('${shipmentData.last_status}' == '5')
   		  {
   		// document.getElementById('astr').display='none';
			$('#tableform  input[type=checkbox]').prop("disabled", true);
			document.getElementById("submitBtn").disabled = true;
	    	document.getElementById("printBtn").disabled = false ;
	    	//document.getElementById("div_ver_code").style.display='none';
	    	 var table=document.getElementById("tableform");
	   		 var row_num=table.getElementsByTagName("tr").length;
	   		 
	   		 for(var x=1;x<row_num;x++)
	   			 {
	   			 var lost_val=table.rows[x].cells[11].innerText;
	   			 if(lost_val>0)
	   				 {
	   			// alert(x+"approved:"+table.rows[x].cells[0].children[0].checked);
	   			 //alert(x+"sealed:"+table.rows[x].cells[1].children[0].checked);
	   			 if(table.rows[x].cells[0].children[0].checked==false)
	   				 {
	   				table.rows[x].cells[12].innerText="Driver";
	   				 }
	   			 else
	   				 {
	   				 if(table.rows[x].cells[1].children[0].checked==true)
	   					 {
	   					table.rows[x].cells[12].innerText="Warehouse";
	   					 }
	   				 else
	   					 {
	   					table.rows[x].cells[12].innerText="Driver";
	   					 }
	   				 }
	   			 }
	   			 }
   		  }
   	  else
   		  {
	    	

   		  }
     
     });
          
   </script>
   <script>
   function validate_Code()
   {
	   document.getElementById("auth_driver").value='';
		document.getElementById("check_auth_done").value="";
       	 var user_name='${courier_id}';
       	 var code=document.getElementById("verif_code").value;
       	 var selected_driver={
     				 "selectedDriver":user_name,
     				 "code":code
     		 };
         	console.log(user_name);
         	console.log(code);
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
   </script>
   <script type="text/javascript">

</script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>