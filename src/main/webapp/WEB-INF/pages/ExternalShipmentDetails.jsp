<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
   <title>Dirty Shipment Details</title>
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
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
<!--    <link href="resources/assetsnodust/css/style_arabic.css" rel="stylesheet" />  --> 

 <style type="text/css">
 #astr
{
    color: red;
    font-size: large;
     
}
#cons_total
{
visibility:hidden;
}
#cons_det{
visibility:hidden;
}
#driver_name
{
float:left;
width:50%;
}
#laundry_data
{
float:left;
width:50%;
}
 #Approved_Data
{
  visibility:hidden;
  }
   #date_time_now
{
visibility:hidden;
}
#Driver
  {
  display:none;
  }
 #lost_Data
{
  visibility:hidden;
  }
  #approval_date_time
  {
  float:left;
  width:50%;
  }
  #approval_user_div
  {
  float:left;
  width:50%;
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
   #nodust_misr{
  visibility:hidden;
  }
#logoprint{display: NONE;}
</style>


 <style type="text/css" media="print">

 @page { size:A4 ;  }
  
  @media print {
 #style_driver
 {
 
 visibility:hidden;
 display:none;
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
  
 
   #nodust_misr{
  visibility:visible;
  }
   #date_time_now
{
visibility:visible;
}
  #cons_total
{
visibility:visible;
}


 #lost_Data
{
  visibility:visible;
  }
  #tableform{
  display:none;
  }
  #page { padding: 20PX;}
  #astr{
  display:none;
  }
  #attavch{
      display: none;
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
 #all_lost_div
 {
 display:none;
 }
 #sidemenu{
 display: none
 }
 
 #tableBtns{
  display: none
 }
 
 #showDate{ color: black;}
  #titlepage{ display: none;}
}
#div_ver_code{
display:none;
}
#title_id
{
display:none;
}
#logoprint{display: block;}
 
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
                      <li><a href="ViewExternalShipments"><spring:message code="ViewExternalShipments.PageTitle"/></a> <span class="divider">&nbsp; &nbsp;</span></li>
                       <li><a href="ExternalShipmentDetails?shipmentID=${shipmentID}"> <spring:message code="ExternalShipmentDetails.PageTitle"/></a><span class="divider-last">&nbsp;</span></li>
               
                  </ul>
      	  
				   
               </div>
            </div>
       
	   
 		                 <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:5%; margin-top: -20px ; " id="logoprint">
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="title_id">
                           <h4> <spring:message code="ExternalShipmentDetails.PageTitle"/></h4>
                        </div>
                        
						<div class="widget-body">
							<table width="100%" >
<tr>
<td>
<div class="widget-title" >
                           <h4> <spring:message code="ShipemntsData_Page_Title"/></h4>
                        </div>
<div class="row-fluid invoice-list" style="border:outset;">
                              
                             <div class="row-fluid">
                             <div id="warehouse_name_div"> <h5 ><strong><spring:message code="warehousename" /></strong>
                                     ${shipmentData.facility_name} 	</h5></div>
                                     <div id="agent_name_div"> <h5 ><strong><spring:message code="RequestedBy_" /></strong>
                                   ${Requested_by}  	</h5></div>
                                <div id="assign_date_div"> <h5 ><strong><spring:message code="Date" /> </strong>
                                     <fmt:formatDate value="${shipmentData.shipment_date}" pattern="dd-MM-yyyy" />  	</h5></div>
                               
                                 
                             </div>
                                
                            <div class="row-fluid">
                               
                            
                                    <div  id ="driver_name"  style="float: left; "> <h5 style="display:inline-block; margin-left:5px;"><strong><spring:message code="Drivername" /></strong> 
                                    </h5>
                                       <c:if test="${shipmentData.last_status!= '5'}">	<span id="astr"> * </span> </c:if>
                                        <h5 id='Driver' >  <c:if test="${shipmentData.last_status== '5'}">  ${shipmentData.full_name_en } </c:if>	</h5> 
                                       <c:if test="${shipmentData.last_status== '5'}">  <h5 id='Driver_approved' style="display:inline-block;"> ${shipmentData.full_name_en } </h5> </c:if>
                                   <c:if test="${shipmentData.last_status!= '5'}">
                                    <div id="style_driver" style="display:contents;">
                                    	  <select  id="SelectDriver" name="driver" style="width:fit-content" class= "span6 js-example-basic-multiple" onchange="Check_driver_select()" >
                                    	  <option value="No_value">Please Select</option>
								     <c:forEach var="driver" items="${drivers}" varStatus="vs">
                                        <option value="${driver.user_name}">${driver.full_name_en} , ${driver.user_name}</option>
                                        </c:forEach>
							  </select >
                           
                                    </div>
                                    	</c:if>
                                    </div>
                                      
                                
                                    
                                
                             
                                   <div  id="laundry_data"> <h5 ><strong><spring:message code="LaundryName" /></strong>
                                      ${shipmentData.lundry_name}  </h5> </div>
                               </div>     
                            	 <div >
 							 
                         <div id="attavch" class="span6" style="height: 40px;">
                                      <div style="float: left; margin-right: 5px;" > <h5 style="display: inline-block; margin-left:5px;"><strong><spring:message code="Attachment" /></strong>  </h5>  <c:if test="${shipmentData.last_status=='1'}"><span id="astr"> * </span></c:if> </div>
                                     <div style="margin-top: 5px; margin-left: 15px;">
                                     <form id ='uploadFile' action="">
										   <input type="file"  id="recieveAttach" required/>
										   <a id="attachementFile" style="display: none; color: blue; margin-top: 11px;" href="${shipmentData.bank_attachement}" download="ExternalLaundry_attachment" target="_new">External_Laundry_attachment</a>	
										   </form>
                           </div></div>
                           
                                    </div>
                                    
                                 <div class="clearfix"></div> 
                                       
                                         <div >
                                     <div class="span6" id="div_ver_code" style=" display:none; margin-top: -10px;">
                                      <div style="float: left; margin-right: 5px;" >
                                        <h5 style="display: inline-block;"><spring:message code="ReceivingProduct.VerificationCode" /></h5> <span id="astr"> * </span>
                                         </div>
                                        <div  style="margin-top: 5px; margin-left: 15px;"> <input type="text" required="required" id="verif_code" onchange="validate_Code()"/></div>
                        </div>    
                        <c:if test="${shipmentData.last_status== '5'}">
                        <div class="row-fluid">
                            
              
                                <div  id="approval_user_div">
					                 <div  >
					                 <h5 style="margin-left:5px;"> <strong><spring:message code="ApprovedBy_"/></strong>
					                 ${approved_by}</h5>
					                 </div>
					                 </div>  
					                 <div id="approval_date_time">
                
			                 <h5 > <strong><spring:message code="ApprovalDate_"/></strong>
			                 ${Approval_Date} </h5>
			                 </div> 
					                 </div>
                 </c:if>                      
                           </div>   
                              <div class="clearfix"></div> 
                                       
                           
                          
                               </div>
                               
                                
                            
</td>
</tr>
</table>
 						


						<div id="all_lost_div">
						<input onchange="allLost(this)" id="lostAll" type='checkbox' name='lostAll' 
						style="float: left;  margin-right: 5px; margin-left: 10px;" <c:if test="${approved!='true' && shipmentData.last_status== '5'}"> checked="checked"</c:if> 	> <label>All Lost</label>
			</div>
				<form:form id="f_data">
							<table id="tableform" class="table table-striped table-bordered   table-advance table-hover table-responsive" style="width:80%; margin:auto;">
						          <thead>
                                    <tr>
                                        <th class="first"><input onchange="selectDeselectAll(this)" id="selectAll" type='checkbox' name='selectAll'></th>
                                        <th ><spring:message code="ProductName" /></th>
                                        <th ><spring:message code="WashingProgram" /></th>
                                        <th><spring:message code="Quantity" /></th>
                                        <th><spring:message code="receivedQuantity"/></th>
                                        <th ><spring:message code="Weight" /></th>
                                        <th style="display: none;">check</th>
                                        <th style="display: none;">id</th>
                                        <th style="display:none;">received_quantity</th>
                                    </tr>
                                    
                                    </thead>
						 
						                 <tbody>
						            <c:forEach var="product" items="${shipmentProducts}" varStatus="vs">
                                    <tr class="odd gradeX ">
                                      <td class="first" ><input class="commonClass" onchange="changeState(this)" type='checkbox' name='record' <c:if test="${product.approved==1}"> checked="checked"</c:if> ></td>
                                        <td>${product.product_name}</td>
                                        <td>${product.washing_program_name}</td>
                                        <td>${product.quantity}</td>
                                        <td>
                                        <c:if test="${shipmentData.last_status=='1'}">
                                        <input id="rec_quan" type="number" disabled="disabled" min="0" onchange="change_received(this)"/>
                                        </c:if>
                                        <c:if test="${shipmentData.last_status=='5'}">
                                        ${product.received_quantity}
                                        </c:if>
                                        </td>
                                        <td>${product.weight}</td>
                                        <td style="display: none;">false</td>
                                        <td style="display: none;">${product.id}</td>
                                        <td style="display:none;">
                                       <c:if test="${shipmentData.last_status=='1'}"> 0</c:if>
                                       <c:if test="${shipmentData.last_status=='5'}">  ${product.received_quantity}</c:if>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
						      
                             </table>
                               <div class="row-fluid  ">
                                <div class="widget-body">
                                <input id="auth_driver" style="display:none;"/>
                                                               <button id="submitBtn" type="button" onclick="submitForm()" class="btn btn-success pull-right green mright5 "><i class="icon-save icon-white"></i> <spring:message code="Approve" /></button>   
                                
                             <button type="button" id="printBtn"  style="margin-right:5px;" disabled class="btn btn-primary pull-right" onclick="print_data()"><i class="icon-print  icon-white"></i> <spring:message code="Print" /></button>   
                            <input id="check_auth_done" style="display:none;"/>
                            <input id="status" style="display:none;" value='${shipmentData.last_status}' onchange="updateStatus()"/>
       
                                  <!--  <button id="submitBtn" type="submit" class="btn btn-success pull-right green mright5 "><i class="icon-save icon-white"></i> Submit</button>   
       -->
                            </div></div>
               </form:form>
						   <div  class="space10" ></div>
                                 <div class="row-fluid" id="Approved_Data">
                            <strong><spring:message code="ApprovedProduct"/></strong>
                            <table id="approved_tbl"   class="table table-striped table-bordered   table-advance table-hover table-responsive" style="width:80%;margin:auto;">
                             <thead>
                             <tr>
                             <th><spring:message code="product_only" /></th>
                                        <th ><spring:message code="WashingProgram" /></th>
                                        <th><spring:message code="Quantity" /></th>
                                        <th><spring:message code="ReceivedQuantity"/></th>
                                        
                                        <th ><spring:message code="Weight_kgr" /></th>
                                     
                                     
                                        <th style="display:none;">received_quantity</th>
                                 
                                       </tr>
                                       </thead>
                                       <tbody>
                                       
                                       </tbody>
                            </table>
                            </div>
                            
                                 <div class="row-fluid" id="lost_Data" style="margin-top: 15px;">
                            <strong><spring:message code="LostProducts"/></strong>
                            <table id="lost_prod" class="table table-striped table-bordered   table-advance table-hover table-responsive" style="width:80%;margin:auto;">
                            <thead>
                            <tr>
                             <th><spring:message code="ProductName" /></th>
                                        <th ><spring:message code="WashingProgram" /></th>
                                        <th><spring:message code="Quantity" /></th>
                                        <th><spring:message code="ReceivedQuantity"/></th>
                                        
                                        <th ><spring:message code="Weight_kgr" /></th>
                                       
                                        <th><spring:message code="LostQuantity"/></th>
                                        <th><spring:message code="ProductReconciliation.LostTable.Accountable"/></th>
                                       </tr>
                                        </thead>
                                    <tbody></tbody>    
                            </table>
                            </div>
                            
                             <div id="cons_det" class="row-fluid ">
                 <strong> <spring:message code="ConsumableDetails"/> </strong>
                  <table id="details_tbl" style="display:none;" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width:80%;margin:auto;">
                  <thead>
                  <tr>
                  <th><spring:message code="WashingProgram"/></th>
                  <th><spring:message code="Consumable"/></th>
                  <th><spring:message code="ProductReconciliation.ProductTable.Quantity"/></th>
                  </tr>
                  </thead>
                  <tbody>
                  
                  </tbody>
                  </table>
                  <br>
                  </div>
                  <br>
                  <div id="cons_total" >
                  
                  <table id="total_tbl"  class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width:fit-content;margin:auto;">
                  <thead>
                  <tr>
                  
                  <th><spring:message code="Consumable"/></th>
                  <th><spring:message code="ProductReconciliation.ProductTable.Quantity"/></th>
                  <th><spring:message code="measurementunit"/></th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${totals}" var="total">
                  <tr>
                  <td>${total.product_name}</td>
                  <td>${total.quantity}</td>
                  <td>${total.unit}</td>
                  </tr>
                  </c:forEach>
                  </tbody>
                  </table>
                  </div>
                          
						 </div>
						  <br> <br> <br>   
                        <div  class="row-fluid  " > 
                            <strong id="nodust_misr" style="text-align:left; margin-left:25px;"><spring:message code="MisrNoDust"/></strong>
                       
                        <strong id="date_time_now" style="text-align: center; margin-left:200px;"> </strong>
                        </div>
                        </div>
                        
                     </div>
                  </div>
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
      
      function selectDeselectAll(checkedVar) {
    	  if (checkedVar.checked) {
    	  $('.commonClass').attr('checked',true).change();
    	  }
    	  else{
    		  $('.commonClass').attr('checked',false).change();
    	  }
    	  

	}
      function check_driver_val()
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
    		 /* $.alert({
		            
	                title: "Error",
	    		    content:"<spring:message code="Select_Shipment_Deriver"/>"
	                }); */
    		  }
      }
      
      function print_data(){
    	  
    	 var d=document.getElementById('SelectDriver');
    	 if(d!=null)
    		 {
    	 var name=d.options[d.selectedIndex].text;
    	 
    	 document.getElementById('Driver').innerHTML=name;
    		 }
    	  var emp_body="";
    	  var today = new Date();
		  var date=today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
		  var hours=today.getHours();
		  	 if(hours>12)
		  		 {
		  		 hours=hours-12;
		  		 }
    	   var time = hours + ":" + today.getMinutes() + ":" + today.getSeconds();
    	   var dateTime = date+'    '+time;
    	   document.getElementById("date_time_now").innerText=dateTime;
    	  document.getElementById('cons_det').style.display='none';
    	  $("#lost_prod tbody").html(emp_body);
     	 $("#approved_tbl tbody").html(emp_body);
    	  var table=document.getElementById("tableform");
    	  var row_num=table.getElementsByTagName("tr").length;
    	  var lost_rec="";
    		  var approved_rec="";
    			  
    			  var count_lost=0;
              var count_approved=0;
    	  for(var x=1;x<row_num;x++)
    		  {
    		  var shipped_quan=table.rows[x].cells[3].innerText;
    		  var rec_quan=table.rows[x].cells[8].innerText;
    		  var x_diff_val=shipped_quan-rec_quan;
    		  if(x_diff_val>0)
    			  {
    			  var pro_name=table.rows[x].cells[1].innerText;
    			  var washing_program=table.rows[x].cells[2].innerText;
    			  var quan=table.rows[x].cells[3].innerText;
    			  var received_quan=table.rows[x].cells[8].innerText;
    			  var weight=table.rows[x].cells[5].innerText;
    			  var lost_q=x_diff_val;
    			  var accountability="Driver";
    			  var row_val="<tr><td>"+pro_name+"</td><td>"+washing_program+"</td><td>"+quan+"</td><td>"+received_quan+"</td><td>"+weight+"</td><td>"+lost_q+"</td><td>"+accountability+"</td></tr>";
    			  lost_rec=lost_rec+row_val;
    			  count_lost+=1;
    			  }
    	
    		  else
    			  {
    			  var pro_name=table.rows[x].cells[1].innerText;
    			  var washing_program=table.rows[x].cells[2].innerText;
    			  var quan=table.rows[x].cells[3].innerText;
    			  var received_quan=table.rows[x].cells[8].innerText;
    			  var weight=table.rows[x].cells[5].innerText;
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
    	 // document.getElementById("total_tbl").style.display='block';
    	//  document.getElementById("details_tbl").style.display='block';

    	  window.print();
      }
      
      function change_received(val)
      {
    	  var rowIndex =val.parentNode.parentNode.rowIndex;
    	  var table=document.getElementById('tableform');
    	  table.rows[rowIndex].cells[8].innerText=val.value;
      }
      
      function  changeState(checkedVar) {
    	  var rowIndex =checkedVar.parentNode.parentNode.rowIndex;
    	  if (checkedVar.checked) {
    		  var myTable = document.getElementById('tableform');
              myTable.rows[rowIndex].cells[6].innerHTML="true"
              myTable.rows[rowIndex].cells[4].children[0].disabled=false;
              myTable.rows[rowIndex].cells[4].children[0].required=true;

    	  }
    	  else
    		  {
    		  var myTable = document.getElementById('tableform');
              myTable.rows[rowIndex].cells[6].innerHTML= "false"
                $("#selectAll").prop("checked", false);
              myTable.rows[rowIndex].cells[4].children[0].disabled=true;
              myTable.rows[rowIndex].cells[4].children[0].required=false;
              myTable.rows[rowIndex].cells[4].children[0].value='';
              myTable.rows[rowIndex].cells[8].innerText=0;




    		  }
    	  
     }
		
	
     function submitForm()
     {
    	// validate_Code();
    	
    	 var validation = document.getElementById("uploadFile").reportValidity();
    	 var allLostCheck = document.getElementById("lostAll").checked;
    	 if(validation == true){
    	 if($("#tableform input:checkbox:checked").length > 0 || allLostCheck == true)
    	 {
    		 check_driver_val();
       		// var val_code=document.getElementById("verif_code").reportValidity();
    		 var auth_val=document.getElementById("auth_driver").value;
    		 var check_auth_done_or_not=document.getElementById("check_auth_done").value;
    		 var check_quantity=document.getElementById("f_data").reportValidity();
    		 var driver_val=document.getElementById("SelectDriver").value;
    		 if(driver_val!="No_value" && auth_val=="Auth"&&check_auth_done_or_not=="done"&&check_quantity!=false)
    			 {
    			    submitData();
    			 }
    		 else
    			 {
        		 var check_auth_done_or_not=document.getElementById("check_auth_done").value;
        		 var auth_val=document.getElementById("auth_driver").value;

    			 if(check_auth_done_or_not=="done"&&auth_val=="not autheticate")
    				 {
    			 swal("<spring:message code="ShipmentList.Error.Title" />","<spring:message code="Select_Shipment_Deriver"/>","error");
        			 /*$.alert({
       		            
        			     title: "<spring:message code="ShipmentList.Error.Title" />",
     	    		    content:"<spring:message code="Select_Shipment_Deriver"/>"
                         }); */
        			 }
    			 }
    			 }
    	 else{
    		 swal("<spring:message code="ShipmentList.Error.Title" />","<spring:message code="ViewDirtyShipmentDetails.uncheckMessage" />","error");
    		 /*$.alert({
                 title: "<spring:message code="ShipmentList.Error.Title" />",
     		    content:"<spring:message code="ViewDirtyShipmentDetails.uncheckMessage" />",
                 }); */
    	 }
    	 }
    	
    	 }
     
     function allLost(checkedVar) {
    	 if (checkedVar.checked) {
    	 $('.commonClass').attr('checked',false).change();
    	 $("#selectAll").prop("checked", false);
    	 $('#tableform  input[type=checkbox]').prop("disabled", true);
    	 document.getElementById("recieveAttach").required = false;
    	 
    	 }
    	 else{
    		 $('#tableform  input[type=checkbox]').prop("disabled", false);
    	 }
	}
     
     
     function submitData()
     {
    	 document.getElementById("submitBtn").disabled = true;
    	 document.getElementById("lostAll").disable = true;
		$('#tableform  input[type=checkbox]').prop("disabled", true);
document.getElementById("verif_code").disabled=true;
   	  var table = $('#tableform').tableToJSON(
   			  { ignoreColumns:[1,2,3]}
   			  );
   	  var table2  = $('#tableform').tableToJSON(
   			  { ignoreColumns:[1,2,3,4]}
		  );
   	  var table_values=$('#tableform').tableToJSON(
   			  {ignoreColumns:[1,2,3,4,5,6]}
   	  );
   	  console.log(table_values);
//   	console.log(table2);
   	 var ids = "";
   	 var ids2 = "";
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
   			if(ids!="")
   				{
   				ids+=",";
   				}
   			ids+= table2[i].id;
   			
   			}
   			
     	}
   	console.log("ids");
   	console.log(ids2);
   	
    var dirtyData ={
			  "productsIds" : ids ,
			  "shipment_id" : '${shipmentID}' ,
			  "productsIds2" : ids2,
			  "dirty_list":table_values,
	  };
	  
	  console.log(dirtyData);
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {

	if (this.readyState == 4 && this.status == 200) {
		var response= this.responseText;
		if(response == "success")
			{
  			$('#tableform  input[type=checkbox]').prop("disabled", true);
    	    	document.getElementById("SelectDriver").disabled=true;
    	    	document.getElementById("submitBtn").disabled = true;
    	    	document.getElementById("recieveAttach").disabled = true;
    	    	$('#tableform  input[type=number]').prop("disabled", true);
    	    	 var x=document.querySelectorAll("input[type=file]")[0];
    	    	   var files=x.files.length;
    	    	//console.log(files);
    	    	if(files > 0)
    	    		{
    	    	//upload_attachment('${shipmentID}')
    	    	swal("<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.title" />","<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.content" />","success");
/*$.alert({
        	    		
                        title: "<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.title" />",
            		    content:"<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.content" />",
                        }); */
document.getElementById("printBtn").disabled = false ;
	
    	    		}
    	    	else{
    	    		document.getElementById("attavch").style.display = "none";
    	    		swal("<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.title" />","<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.content" />","success");
    	    		/*$.alert({
        	    		
                        title: "<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.title" />",
            		    content:"<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.content" />",
                        }); */
    	    		document.getElementById("printBtn").disabled = false ;
    	    	}
			}
		else if(response =="no session"){
			location.reload();
		}
		else if(response== "alreadyApproved")
			{
			swal("<spring:message code="ViewDirtyShipmentsDetails.alreadySubmitted.title" />","<spring:message code="ViewDirtyShipmentsDetails.alreadySubmitted.content" />","error");
			  /*$.alert({
                  title: "<spring:message code="ViewDirtyShipmentsDetails.alreadySubmitted.title" />",
      		    content:"<spring:message code="ViewDirtyShipmentsDetails.alreadySubmitted.content" />",
                  }); */
			}
		else{
			swal("<spring:message code="ShipmentNotSubmittedSuccessfully" />","<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.content" />","error");
			/* $.alert({
                 title: "<spring:message code="ShipmentNotSubmittedSuccessfully" />",
     		    content:"<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.content" />",
                 }); */
			
  			$('#tableform  input[type=checkbox]').prop("disabled", false);
  			document.getElementById("submitBtn").disabled = false;
	    	document.getElementById("printBtn").disabled = true ;
	    	document.getElementById("verif_code").disabled=false;

		 	 
		  	      
		}
	 }
	 }
	 xhttp.open("POST","approveExterenalDirtyShipment", true);
	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
	 xhttp.send(JSON.stringify(dirtyData));
   
   	}
   	
     
     
     function upload_attachment(ship_id)
     {
  	   var x=document.querySelectorAll("input[type=file]")[0];
  	   var files=x.files[0];
  	   console.log(files);
  	   var url = 'http://192.168.0.42:8080/FileUploader/FileUploader';
         var xhr = new XMLHttpRequest();
         var fd = new FormData();
         xhr.open("POST", url, true);
         var file_name_val="LDS"+ship_id;
         xhr.onreadystatechange = function() {
      	   if (xhr.readyState == 4 && xhr.status == 200) {
                 // Every thing ok, file uploaded
                 console.log("response : "+xhr.responseText); // handle response.
                 if (xhr.responseText!="null"||xhr.responseText!="0")
                	 {
                 var z= JSON.parse(xhr.responseText);
                 console.log(z.Path); // handle response.
                 //document.getElementById("file_path").value=z.Path;
                console.log(file_name_val);
                update_attachment(ship_id, z.Path);
                	 }
                 else{
                	 document.getElementById("attavch").style.display = "none";
                	 $.alert({
         	    		
                         title: "Uploaded Failed",
             		    content:"Uploaded file failed .",
                         }); 
                 }
             }
      	   
         };
        // var file_name_val=document.getElementById("ship_id").value;

         fd.append("SelectedFile",files);
         fd.append('Path',1);  // Module ID
         fd.append('DocType','Transfer_Attachments'); // sub Folder name
         fd.append('ObjectFileName',file_name_val);  // file name
         xhr.send(fd);
         
         }
     
     
     function update_attachment(ship_id , file_path)
     {
  	  // var ship_id=document.getElementById("ship_id").value;
  	  // var file_path=document.getElementById("file_path").value;
  	   var cash_form={
  			   "shipment_id":ship_id,
  			   "file_path":file_path
  	   };
  	   console.log(cash_form);
  	   var xhttp = new XMLHttpRequest();
   		xhttp.onreadystatechange = function() {
   			
   			if (this.readyState == 4 && this.status == 200) {
   			var resp=this.responseText;
   			if (resp=="true")
   				{
   				document.getElementById("status").value = '5';
   				updateStatus();
    	    	document.getElementById("printBtn").disabled = false;
   				swal("<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.title" />","<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.content" />","success");
    	    	/*$.alert({
    	    		
                    title: "<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.title" />",
        		    content:"<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.content" />",
                    });*/ 
   				}
   			}
   		}
   		xhttp.open("POST","updateAttachment", true);
  		 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
  		 xhttp.send(JSON.stringify(cash_form));
     }
     
     $(document).ready(function() {
    	 console.log('${shipmentData.bank_attachement}');
    	 if ('${shipmentData.bank_attachement}' == "" && '${shipmentData.last_status}'== '5')
    		 {
    		 document.getElementById("attavch").style.display = "none";
    		 }
    
    	 updateStatus()
 	});
     function updateStatus() {
    		var x = document.getElementById("status").value;
    	   	  if ( x == '5')
    	   		  {
    				$('#tableform  input[type=checkbox]').prop("disabled", true);
    				$('input[type=checkbox]').prop("disabled", true);
    				document.getElementById("submitBtn").disabled = true;
    				// document.getElementById("lostAll").disable = true;
    		    	document.getElementById("printBtn").disabled = false ;
    		    	document.getElementById("recieveAttach").style.display = "none";
    		    	document.getElementById("attachementFile").style.display = "block";
    		    	document.getElementById("div_ver_code").style.display='none';

    	   		  }
    	
	}
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
         				swal("Verification Error","Please insert correct Verification Code","error");
       				/*$.alert({
       		            
                       title: "Verification Error",
           		    content:"Please insert correct Verification Code"
                       });*/ 
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
   $(document).ready(function() {
  	 $('.js-example-basic-multiple').select2();
   });
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>