<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <html lang="en">

<head>
   <meta charset="utf-8" />
      <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="Payroll_payments"/></title>
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
      <link rel="stylesheet" href="resources/css/jquery-confirm.min.css"/>
      <link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.5.1/css/colReorder.dataTables.min.css"/>
      <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>
      
      
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
     <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
     <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
   <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.js"></script>
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
   	     <script type="text/javascript" src="resources/assetsnodust/js/jasontable.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
<script src="https://querybuilder.js.org/node_modules/sql-parser-mistic/browser/sql-parser.min.js"></script>


 <style type="text/css">
 .dataTables_filter, .dataTables_info { display: none; }
#submitBtn
{
visibility:hidden;
}
#payment_print
{
display:none;
}

#srch_due_date
{
visibility:hidden;
}
#pilot_div
{
visibility:hidden;
}
#collected_by_div
{
visibility:hidden;
}
#collected
{
visibility:hidden;
}
#printBtn
{
visibility:hidden;
}
   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}
 .dataTables_empty
 {
 }
#logoprint{visibility:hidden;
display:none;}
#printing_data{
display:none;
}
 #Approved_Data
{
  visibility:hidden;
  }
  #lost_Data
{
  visibility:hidden;
  }
#payment_print
{
display:none;
}
@font-face {
  font-family: ArbFONTS;
  src: url(ArbFONTS-Abdo-salem-Bold.ttf);
}
#button_d
{
visibility:hidden;
}
 #date_time_now
{
visibility:hidden;
}
#pilot_div
{
visibility:hidden;
}
#nodust_misr{
  visibility:hidden;
  }
#astr
{
    color: red;
    font-size: large;
   
}
#tableform_
  {
  visibility:hidden;
  }
   </style>
   
<style type="text/css" media="print">


  @page { size:A4 ; }
  
  @media print {
  #printBtn {
    display: none;
  }
  #payment_print
  {
  display:block;
  }
  #btn_div
  {
  display:none;
  }
  #button_d
  {
  display:none;
  }
   #Approved_Data
{
  visibility:visible;
  }
  #srch_due_date
  {
  display:none;
  }
   #tableform_{
  display:none;
  }
  
  #lost_Data
{
  visibility:visible;
  }
  #submitBtn {
    display: none;
  }
  #hiddenform{
  visibility:hidden;
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
 #endorsement
 {
 direction: rtl;
 }
 #data_master
 {
 display:none;
 }
 #printing_data{
display:inline-block;
}
 
  #titlepage{ display: none;}
}
 #date_time_now
{
visibility:visible;
}
#submitBtn1
{
display:none;
}
#nodust_misr{
  visibility:visible;
  }

#logoprint{visibility: visible;
display:block;}

#contentpage{ margin-top: -50px;}

 #Header, #Footer { display: none !important; }
#footer{ display: none;}

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
                       <li>
                           <a href="PayrollPayment"> <spring:message code="Payroll_payments" /> <span class="divider">&nbsp;</span>
                       </li>
                       <li><a href="#"></a><span class="divider-last">&nbsp;</span></li>
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
		                 <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:5%;   margin-top: -20px ; " id="logoprint">
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4> <spring:message code="Payroll_payments" /></h4>
                        </div>
                        
						
						
						<div class="widget-body" style="text-align: left;" id="contentpage">
						
						<table width="100%" dir="rtl">
<tr>
<td>

<div class="row-fluid invoice-list" >

<div class="space10"></div>
<div class="widget-title" style="margin-left:-5px;">
                           <h4> <spring:message code="PaymentData" /></h4>
                        </div>                              
                             <div class="row-fluid" style="border:outset;">
                              
                                    <div style="float:left;width:40%;"> <h5 style="margin-left:5px;"><strong><spring:message code="warehousename" /></strong>
                                     ${formData.wareHouseName} 	</h5></div>
                                
                                 <div style="float:left;width:30%;"> <h5 ><strong><spring:message code="Agentname" /></strong>
                                   ${formData.agentName} 	</h5></div>
                                    <div style="float:left;width:30%;"> <h5 ><strong><spring:message code="Date" /> </strong>
                                      ${formData.assignDate} 	</h5></div>
                             
                            
                                
                             
                                    
                               
                               
                            
                             
                                
                              
                             
                               </div>
                                
                            </div>
</td>
</tr>
</table>
						
						
                            
                           <br> 
                            <div  id="data_master" class="row-fluid">
						<div style="width:50%;float:left;">
						<strong>Payment Type :<span id="astr">*</span></strong>
						<select id="payment_type" onchange="check_type(this)" class= "span6 js-example-basic-multiple">
						<option value="no_val"> Please Select</option>
						<c:forEach items="${formData.lst_payment_type }" var="payment">
						<option value="${payment.id}">${payment.payment_type }</option>
						</c:forEach>
						</select>
						</div>
						
						
						<div style="width:50%;float:left; display:none;">
						<strong>Due Date : <span id="astr">*</span></strong>
						   <input type="date" id="from_Date"  required/>
						
						</div>
						<div style="width:50%;float:left;display:none;">
						<strong>Cash Account : <span id="astr">*</span></strong>
						<select id="account" onchange="change_acc(this)" class= "span6 js-example-basic-multiple">
						<option value="no_val">Please Select</option>
						<c:forEach items="${ formData.lst_payment_accounts}" var="acc">
						<option value="${acc.account_id },${acc.account_cash}">${acc.account_name }</option>
						</c:forEach>
						</select>
						</div>
						<div id="pilot_div" style="width:50%;float:left;">
						<strong>Employee :<span id="astr">*</span></strong>
						<select   id="selectpilot" class= "span6 js-example-basic-multiple">
                                  		<option value="no_value"><spring:message code="PleaseSelect"/></option>
								         <c:forEach items="${formData.lst_emp}" var="driver">
								        <option value="${driver.user_name}" >${driver.full_name_en} , ${driver.user_name}</option>
								     </c:forEach>
								     
							       </select>
						</div>
										  <button type="button"  id="submitBtn1" onclick="validateForm()" class="btn btn-success pull-right green mright5 " style="margin-right:25px;"><i class="icon-save icon-white"></i> Load Payments</button>   
						<div class="space20"></div>
						<div id="collected" style="float:left;width:50%;">
								   								  <strong> Collected By Self : <span id="astr">*</span></strong>
								   <select id="collected_" required onchange="change_collected(this)" class= "span6 js-example-basic-multiple">
								   <option value="no_value">Please Select</option>
								   <option>Yes</option>
								    <option>No</option>
								   
								   </select>

						</div>
						<div id="collected_by_div" style="float:left;width:50%;">
						<strong>Collected By : <span id="astr">*</span></strong>
						<select   id="collected_by" class= "span6 js-example-basic-multiple">
                                  		<option value="no_value"><spring:message code="PleaseSelect"/></option>
								         <c:forEach items="${formData.lst_emp}" var="driver">
								        <option value="${driver.user_name}" >${driver.full_name_en} , ${driver.user_name}</option>
								     </c:forEach>
								     
							       </select>
						</div>
						
						</div>
						
					<form:form id="tableform" modelAttribute="formData" class="form-horizontal"  >
					<div style="display:none;"><strong ><spring:message code="CashOnCover.AvailableBalance" /></strong> <form:input id="total" style="margin-left:30px;" path="accounts[0].total_stock_quantity"  class="span8" disabled="true" />
                                        <strong class="span3" style="margin-right:10px;"><spring:message code="Total" /> :</strong> <form:input id="totalPayed" value="0.0" class="span8" path="" disabled="true" step="0.01" />
                         </div>               
            
                                               
                            <table id="accounts_cash_tbl" style="display:none;">
                            <thead>
                            <tr><th>Account_Name</th>
                            <th>Account_ID</th>
                            <th>Available_Stock</th>
                            </tr>
                            
                            </thead>
                            <tbody>
                            <c:forEach items="${ formData.lst_payment_accounts}" var="acc">
                            <tr>
                            <td>${acc.account_name }</td>
                            <td>${acc.account_id }</td>
                            <td>${acc.account_cash }</td>
                            
                            </tr>
						</c:forEach>
                            </tbody>
                            </table>
                            <div id="s1" class="space20"></div>
                          <div id="srch_due_date">  <strong>Employee Name : </strong>
                            <input type="text" id="search_date" onchange="search_due_date()"/>
                          </div>
                            <div class="space20">
                            
                            </div>
                            <table id="tableform_" class="table dataTable table-striped table-bordered table-advance table-hover table-responsive" style="width:90%;margin:auto;">
						          <thead>
                                    <tr>
                                        <th class="first">  <input onchange="selectDeselectAll(this)" id="selectAll" type='checkbox' name='selectAll'> </th>                                        
                                         <th style="display: none;">ID</th>
                                        <th  class="emp">Employee</th>
                                        <th >Cash Account</th>
                                        <th data-override="amount"><spring:message code="amount_only"/></th>
                                        <th style="display: none;">check_</th>
                                        <th style="display: none;">id</th>
                                        <th ><spring:message code="reference"/></th>
                                        <th style="display:none;"><spring:message code="payment_type"/></th>
                                        <th><spring:message code="notes"/></th>
                                        <th style="display: none;">note</th>
                                        <th>Due Date</th>
                                        <th style="display:none;" data-override="due_date">due_date</th>
                                    </tr>
                                    
                                    </thead>
						                 <tbody>
						            <c:forEach items="${formData.lst_payment }" var="pay">
						           <tr>
						            <td><input class="check_one" type="checkbox" onchange="change_select(this)"/></td>
						            <td style="display:none;">${pay.id}</td>
						            <td class="emp"><c:if test="${pay.payment_type!=3}">${pay.emp_name},${pay.emp_id}</c:if></td>
						            <td >${pay.account}</td>
						            <td>${pay.amount}</td>
						            <td style="display:none;">false</td>
						            <td style="display:none;">${pay.id}</td>
						            <td>${pay.payment_name}</td>
						            <td style="display:none;"></td>
						            <td><textarea  required onchange="change_note(this)" disabled >${pay.note}</textarea></td> 
						            <td style="display:none;">${pay.note}</td> 
						            <td style="display:none;"><input type="date" value="${pay.d1}" required disabled onchange="change_date(this)" style="width:fit-content;"/></td>
						           <td >${pay.due_date}</td>
						           
						           
						            </tr>
						            
						            </c:forEach>
                                    </tbody>
						      
                             </table>
                       <div class="row-fluid  " id="btn_div">
                       <div class="space20"></div>
                           <button type="button"  id="submitBtn" onclick="check_all_data()" class="btn btn-success pull-right green mright5 "><i class="icon-save icon-white"></i> <spring:message code="Submit" /></button>   
                                                                           <button type="button"  id="button_d" onclick="check_Form(5)" class="btn btn-light pull-right green mright5 " style="margin-right:25px;"><i class="icon-save icon-white"></i> Mark As deleted</button>   
                            
                             <button type="button" id="printBtn"  disabled="true" style="margin-right:5px;" class="btn btn-primary pull-right" onclick="print_data()"><i class="icon-print  icon-white"></i> <spring:message code="Print" /></button>   
                            
       
                            </div>                                  
                              <div  class="space20" ></div>
                        <div class="clearfix"></div>
                        <div id="payment_print" style="display:none;">
                        <strong>Payment Type :</strong><h5 style="display:inline-block;" id="payment_type_val"></h5>
                        <br>
                        <!--  <strong>Due Date : </strong><h5 style="display:inline-block;" id="due_date_val"></h5>-->
                       <!--   <strong>Cash Account :</strong><h5 style="display:inline-block;" id="cash_acc_val"></h5>-->
                        <strong>Total Paid : </strong><h5 style="display:inline-block;" id="total_paid_pr"></h5>
                       <div id="pilot_v" style="display:none;"> <strong>Employee : </strong><h5  style="display:inline-block;" id="pilot_val_pr"></h5>
                        <br>
                        </div>
                       <div id="collector" style="display:none;"> <strong>Collected By : </strong><h5 style="display:inline-block;" id="collector_val"></h5> </div>
                        
                        </div>
                            <div class="row-fluid" id="Approved_Data">
                            <strong><spring:message code="paidPayroll"/></strong>
                            <div class="space10"></div>
                            <table id="approved_tbl"   class="table table-striped table-bordered   table-advance table-hover table-responsive" style="width:80%;margin:auto;">
                            <thead>
                             <tr>
                                        <th data-override="payment_value"><spring:message code="amount_only"/></th>
                                        <th ><spring:message code="reference"/></th>
                                        <th><spring:message code="notes"/></th>
                                 
                                       </tr>
                                       </thead>
                                       <tbody>
                                       </tbody>
                            </table>
                            </div> 
                                                        <div class="row-fluid" id="lost_Data" style="margin-top: 15px;">
                            <strong><spring:message code="unpaidPayroll"/></strong>
                           <div class="space10"></div>
                            <table id="lost_prod" class="table table-striped table-bordered   table-advance table-hover table-responsive" style="width:80%;margin:auto;">
                            <thead>
                            <tr>
                                        <th data-override="payment_value"><spring:message code="amount_only"/></th>
                                        <th ><spring:message code="reference"/></th>
                                        <th>Notes</th>
                                        </thead>
                                    <tbody></tbody>    
                            </table>
                            </div>
                            
                       
                      
                            
                             
                          <div class="clearfix"></div>
                      </form:form>
                           
						 </div>
						 <input id="resp" style="display:none;"/>
						                                        <input id="check_submit" style="display:none;"/>
						            
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
      	// initiate layout and plugins
      	App.init();
      });
      
      
      function check_all_data()
      {
    	  var pay_type=document.getElementById("payment_type").value;
    	  var check_valid=document.getElementById("tableform").reportValidity();
    	  if(check_valid!=false)
    		  {
    	  if(pay_type!=3)
    		  {
    	  var collected_check=document.getElementById("collected_").value;
    	  var collected_by_check=document.getElementById("collected_by").value;
    	  if(collected_check=="no_value")
    		  {
    		  swal("Error","Please Select Collected By Self ! ","error");
    		  }
    	  else if(collected_check=="No"&&collected_by_check=="no_value")
    		  {
    		  swal("Error","Please Select Collected By ! ","error");
    		  }
    	  else
    		  {
    		  var x=document.getElementsByClassName("check_one");
    		  var check_selected="";
    		  for(var i=0;i<x.length;i++)
    			  {
    			  if(x[i].checked==true)
    				  {
    				  check_selected="yes";
    				  break;
    				  }
    			  
    			  }
    		  if(check_selected=="yes")
    			  {
    			var paid_amount=parseFloat(document.getElementById("totalPayed").value.replace(",",""));
    			//alert(paid_amount);
    			var exceed_limit="";
    			var available=parseFloat(document.getElementById("total").value.replace(",",""));
    			//alert(available);
    			console.log(paid_amount);
    			console.log(available);
    			var account_num=document.getElementById("accounts_cash_tbl").rows.length;
    			var acc_tbl=document.getElementById("accounts_cash_tbl");
    			var payment_tbl=document.getElementById("tableform_");
    			var payment_rows=document.getElementById("tableform_").rows.length;
    			for(var i=1;i<account_num;i++)
    				{
    				
        			var total_in_account=0;
        			var account_id=acc_tbl.rows[i].cells[0].innerHTML;
        			var available_cash=parseFloat(acc_tbl.rows[i].cells[2].innerHTML.replace(",",""));
        			
        			for(var r=1;r<payment_rows;r++)
        				{
        				 
        				var checked=payment_tbl.rows[r].cells[5].innerHTML;
        				var acc=payment_tbl.rows[r].cells[3].innerHTML;
        				if(checked=="true"&&acc==account_id)
        					{
        					var p_amount=parseFloat(payment_tbl.rows[r].cells[4].innerHTML.replace(",",""));
        					total_in_account=parseFloat(total_in_account+p_amount);
        					if(total_in_account>available_cash)
        					{
        						console.log("exceed:"+available_cash);
        						exceed_limit="You Can't Select Payments With amounts more than "+available_cash;
break;
        					}
        					}
        				}
console.log("paid :"+total_in_account);
console.log("available :"+available_cash);

    				}
    			if(exceed_limit!="")
				{
				swal("Error",exceed_limit,"error");
				}
    			else
    				{
    				confirm_submit();
    				
    				}
    			  }
    		  else
    			  {
    			  console.log("No Payments");
    			  swal("Error","Please Select At least One Payment !","error");
    			  }
    		  }
    		  
    		  }
    	  
    	  else
    		  {
    		  var x=document.getElementsByClassName("check_one");
    		  var check_selected="";
    		  for(var i=0;i<x.length;i++)
    			  {
    			  if(x[i].checked==true)
    				  {
    				  check_selected="yes";
    				  break;
    				  }
    			  
    			  }
    		  if(check_selected=="yes")
    			  {
    				var paid_amount=parseFloat(document.getElementById("totalPayed").value.replace(",",""));
        			//alert(paid_amount);
        			var exceed_limit="";
        			var available=parseFloat(document.getElementById("total").value.replace(",",""));
        			//alert(available);
        			console.log(paid_amount);
        			console.log(available);
        			var account_num=document.getElementById("accounts_cash_tbl").rows.length;
        			var acc_tbl=document.getElementById("accounts_cash_tbl");
        			var payment_tbl=document.getElementById("tableform_");
        			var payment_rows=document.getElementById("tableform_").rows.length;
        			for(var i=1;i<account_num;i++)
        				{
        				
            			var total_in_account=0;
            			var account_id=acc_tbl.rows[i].cells[0].innerHTML;
            			var available_cash=parseFloat(acc_tbl.rows[i].cells[2].innerHTML.replace(",",""));
            			
            			for(var r=1;r<payment_rows;r++)
            				{
            				 
            				var checked=payment_tbl.rows[r].cells[5].innerHTML;
            				var acc=payment_tbl.rows[r].cells[3].innerHTML;
            				if(checked=="true"&&acc==account_id)
            					{
            					var p_amount=parseFloat(payment_tbl.rows[r].cells[4].innerHTML.replace(",",""));
            					total_in_account=parseFloat(total_in_account+p_amount);
            					if(total_in_account>available_cash)
            					{
            						console.log("exceed:"+available_cash);
            						exceed_limit="You Can't Select Payments With amounts more than "+available_cash;
    break;
            					}
            					}
            				}
    console.log("paid :"+total_in_account);
    console.log("available :"+available_cash);

        				}
        			if(exceed_limit!="")
    				{
    				swal("Error",exceed_limit,"error");
    				}
        			else
        				{
        				confirm_submit();
        				}
    			  }
    		  else
    			  {
    			  swal("Error","Please Select At least One Payment !","error");
    			  console.log("no_payments");
    			  }
    		  }
    	  
      }
      }
      
      
      function change_acc(row)
      {
    	  var val=row.value.split(',');
    	  document.getElementById("total").value=val[1];
      }
      
      function change_collected(row)
      {
    	  if(row.value=="No")
    		  {
    		  document.getElementById("collected_by_div").style.visibility='visible';
    		  }
    	  else
    		  {
    		  document.getElementById("collected_by_div").style.visibility='hidden';

    		  }
      }
      
      function check_type(row)
      {
    	  console.log(row.value);
    	  if(row.value==3)
    	  { document.getElementById("pilot_div").style.visibility= 'hidden';
    	  document.getElementById("collected").style.visibility='hidden';
    	  document.getElementById("collected_by_div").style.visibility='hidden';
    	  }
    	  else
    		  {
    		  if(row.value==1)
    			  {
        	  document.getElementById("pilot_div").style.visibility='visible';
        	 /* document.getElementById("collected").style.visibility='visible';
        	  document.getElementById("collected_by_div").style.visibility='visible';*/
    			  }
    		  else
    			  {
    			  document.getElementById("pilot_div").style.visibility= 'hidden';
    	    	  document.getElementById("collected").style.visibility='hidden';
    	    	  document.getElementById("collected_by_div").style.visibility='hidden';
    			  }
    		  }
    	  load_Today_Payments(row.value);
      }
      function load_Today_Payments(val)
      {
    	  var payment={
    			  "payment_type":val
    	  };
    	  console.log(payment);
    	   var xhttp = new XMLHttpRequest();
  		   	xhttp.onreadystatechange = function() {

  		   	if (this.readyState == 4 && this.status == 200) {
  		   		var response= this.responseText;
  		   		if(response=="no_data")
  		   			{
  		   			swal("Error","No Payments Found , Please Select Valid Data !","error");
  		   			var rows="<tr><td colspan='12' style='text-align:center;'>No Payments Found</td></tr>";
  		   			$('#tableform_ tbody').html(rows);
  		   			document.getElementById("tableform_").style.visibility='visible';
  		   			document.getElementById("payment_type").disabled=false;
  		   			document.getElementById("selectpilot").disabled=false;
  		   			document.getElementById("submitBtn1").disabled=false;

  		   			}
  		   		else
  		   			{
  		   			document.getElementById("srch_due_date").style.visibility='visible';
  		   			var pay_type=document.getElementById("payment_type").value;
  		   			if(pay_type!=1)
  		   				{
  		   				document.getElementById("collected").style.display='none';
  		   				document.getElementById("collected_by_div").style.display='none';
  		   				document.getElementById("s1").style.display='none';

  		   				}
  		   		 document.getElementById("collected").style.visibility='visible';
  	    	  document.getElementById("collected_by_div").style.visibility='visible';
  		   				
  		   			//document.getElementById("submitBtn1").style.display='none';
  		   			var data=JSON.parse(response);
  		   			var rows="";
  		   			for(var x=0;x<data.length;x++)
  		   				{
  		   			var x_note="";
		   			var emp_name=data[x].emp_name+','+data[x].emp_id;

  		   			console.log(data[x].d1)	;
  		   	        rows+='<tr>';
  		   	        rows+='<td><input class="check_one" type="checkbox" onchange="change_select(this)"/></td>';
  		   	     rows+='<td style="display:none;">'+data[x].id+'</td><td  class="emp">'+emp_name+'</td>';
  		   	  rows+=' <td >'+data[x].account+'</td><td>'+data[x].amount+'</td><td style="display:none;">false</td>';
  		   	 rows+=' <td style="display:none;">'+data[x].id+'</td><td>'+data[x].payment_name+'</td><td style="display:none;"></td>';
  		  if(data[x].note=="null"||data[x].note==null)
			 {
			x_note=" ";
		   	 rows+= '<td><textarea  onchange="change_note(this)" required disabled style=""/></td> <td style="display:none;"></td> <td>'+data[x].due_date+'</td>';

			 }
		 else
			 {
			x_note=data[x].note;
 		   	 rows+= '<td><textarea value='+data[x].note+' defaultValue='+data[x].note+' onchange="change_note(this)" required disabled style="">'+data[x].note+'</textarea></td> <td style="display:none;">'+data[x].note+'</td> <td>'+data[x].due_date+'</td>';

			 }
  		   	rows+= '<td style="display:none;">'+data[x].d1+'</td></tr>';
  		   				}
  		   			$('#tableform_ tbody').html(rows);
  		   			var pay_type=document.getElementById("payment_type").value;
  		   			if(pay_type==3)
  		   				{
  		               $('.emp').hide();

  		   				}

  		   			document.getElementById("tableform_").style.visibility='visible';
  		   			document.getElementById("submitBtn").style.visibility='visible';
  		   			document.getElementById("printBtn").style.visibility='visible';
document.getElementById("button_d").style.visibility='visible';
  		   			}
  		   	}
  		   	}
  		   	xhttp.open("POST","GetTodayPayment", true);
  			 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
  			 xhttp.send(JSON.stringify(payment));    	  
      }
      function validateForm()
      {
    	 
   	   document.getElementById("payment_type").disabled=true;
   	  // document.getElementById("loc").disabled=true;
   	  // document.getElementById("account").disabled=true;
   	  // document.getElementById("from_Date").disabled=true;
   	   document.getElementById("submitBtn1").disabled=true;
      	document.getElementById("selectpilot").disabled=true;

   	   
   	   
   	   
   	   var payment_type=document.getElementById("payment_type").value;
   	  // var loc=document.getElementById("loc").value;
   	   //var due_date_check=document.getElementById("from_Date").reportValidity();
   	   //var acc_1=document.getElementById("account").value.split(',');
   	   //var acc=acc_1[0];
   	   
   	   //var due_date_val=document.getElementById("from_Date").value;
   	   var pilot=document.getElementById("selectpilot").value;
   	   if(payment_type=="no_val"||(pilot=="no_value"&&payment_type!=3))
   		   {
   		   console.log(pilot);
   		   document.getElementById("payment_type").disabled=false;
   		  // document.getElementById("loc").disabled=false;
   		   //document.getElementById("account").disabled=false;
   		   //document.getElementById("from_Date").disabled=false;
   		   document.getElementById("submitBtn1").disabled=false;
   	   	document.getElementById("selectpilot").disabled=false;

   		   if(payment_type=="no_val")
   			   {
   			   swal("Error","Please Select Payment Type !","error");
   			   }
   		  else if (pilot=="no_value"&&payment_type!=3)
   			   {
   			   swal("Error","Please Select Employee !","error");

   			   }
   		   else if(acc=="no_val")
   			   {
   			   swal("Error","Please Select Cash Account !","error");

   			   }
   		   else
   			   {
   			   
   			   }
   		   }
   	   else
   		   {
   		   var x=document.getElementById("selectpilot").value;
   		   var acc={
   				   "payment_type":payment_type,
   				 
   				   "emp_id":x
   		   };
   		   console.log(acc);
   		   var xhttp = new XMLHttpRequest();
   		   	xhttp.onreadystatechange = function() {

   		   	if (this.readyState == 4 && this.status == 200) {
   		   		var response= this.responseText;
   		   		if(response=="no_data")
   		   			{
   		   			swal("Error","No Payments Found , Please Select Valid Data !","error");
   		   			var rows="<tr><td colspan='12' style='text-align:center;'>No Payments Found</td></tr>";
   		   			$('#tableform_ tbody').html(rows);
   		   			document.getElementById("tableform_").style.visibility='visible';
   		   			document.getElementById("payment_type").disabled=false;
   		   			document.getElementById("selectpilot").disabled=false;
   		   			document.getElementById("submitBtn1").disabled=false;

   		   			}
   		   		else
   		   			{
   		   			document.getElementById("srch_due_date").style.visibility='visible';
   		   			var pay_type=document.getElementById("payment_type").value;
   		   			if(pay_type!=1)
   		   				{
   		   				document.getElementById("collected").style.display='none';
   		   				document.getElementById("collected_by_div").style.display='none';
   		   				document.getElementById("s1").style.display='none';

   		   				}
   		   		 document.getElementById("collected").style.visibility='visible';
   	    	  document.getElementById("collected_by_div").style.visibility='visible';
   		   				
   		   			document.getElementById("submitBtn1").style.display='none';
   		   			var data=JSON.parse(response);
   		   			var rows="";
   		   			for(var x=0;x<data.length;x++)
   		   				{
   		   			var x_note="";
		   			var emp_name=data[x].emp_name+','+data[x].emp_id;
   		   			console.log(data[x].d1)	;
   		   	        rows+='<tr>';
   		   	        rows+='<td><input class="check_one" type="checkbox" onchange="change_select(this)"/></td>';
   		   	     rows+='<td style="display:none;">'+data[x].id+'</td><td  class="emp">'+emp_name+'</td>';
   		   	  rows+=' <td >'+data[x].account+'</td><td>'+data[x].amount+'</td><td style="display:none;">false</td>';
   		   	 rows+=' <td style="display:none;">'+data[x].id+'</td><td>'+data[x].payment_name+'</td><td style="display:none;"></td>';
   		  if(data[x].note=="null"||data[x].note==null)
			 {
			x_note=" ";
 		   	 rows+= '<td><textarea  onchange="change_note(this)" required disabled style=""/></td> <td style="display:none;">'+x_note+'</td> <td>'+data[x].due_date+'</td>';

			 }
		 else
			 {
			x_note=data[x].note;
  		   	 rows+= '<td><textarea value='+data[x].note+' defaultValue='+data[x].note+' onchange="change_note(this)" required disabled style="">'+data[x].note+'</textarea></td> <td style="display:none;">'+data[x].note+'</td> <td>'+data[x].due_date+'</td>';

			 }
   		   	rows+= '<td style="display:none;">'+data[x].d1+'</td></tr>';
   		   				}
   		   			$('#tableform_ tbody').html(rows);
   		   			var pay_type=document.getElementById("payment_type").value;
   		   			if(pay_type==3)
   		   				{
   		               $('.emp').hide();

   		   				}

   		   			document.getElementById("tableform_").style.visibility='visible';
   		   			document.getElementById("submitBtn").style.visibility='visible';
   		   			document.getElementById("printBtn").style.visibility='visible';

   		   			}
   		   	}
   		   	}
   		   	xhttp.open("POST","GetPayments", true);
   			 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
   			 xhttp.send(JSON.stringify(acc));
   		   	
   		   }
   	   
      }
      
      function print_data()
      {
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
     	   var table=document.getElementById("tableform_");
   		   var row_num=table.getElementsByTagName("tr").length;
	     	  var emp_body="";
	     	 $("#lost_prod tbody").html(emp_body);
	     	 $("#approved_tbl tbody").html(emp_body);
	     	var lost_rec="";
  		  var approved_rec="";
  		  var total_num=0;
	     	 for(var x=1;x<row_num;x++)
   		  {
	     	if(table.rows[x].cells[5].innerText=="true")
	     		{
	     		var row_val="<tr><td>"+table.rows[x].cells[4].innerText+"</td><td>"+table.rows[x].cells[7].innerText+"</td><td>"+table.rows[x].cells[10].innerText+"</td></tr>";
	     		approved_rec = approved_rec+ row_val;
	     		//total_num+=table.rows[x].cells[4].innerText.toMoney();
	     		}
	     	else{
	     		var row_val="<tr><td>"+table.rows[x].cells[4].innerText+"</td><td>"+table.rows[x].cells[7].innerText+"</td><td>"+table.rows[x].cells[10].innerText+"</td></tr>";
	     		lost_rec = lost_rec+ row_val;
	     	}
	     	
   		  }
	     	 var total_num=document.getElementById("resp").value;
     		 document.getElementById("total_paid_pr").innerHTML=total_num;

	     		 document.getElementById("lost_Data").style.display='none';
	     		 
	     	/* else{
	     		
	     		
	     	// $("#lost_prod tbody").append(lost_rec);
	     	 }*/
	     	 var pay=document.getElementById("payment_type");
     		 var txt_pay=pay.options[pay.selectedIndex].text;
     		 document.getElementById("payment_type_val").innerHTML=txt_pay;
     		 
     		/* var acc=document.getElementById("account");
     		 var txt_acc=acc.options[acc.selectedIndex].text;
     		 document.getElementById("cash_acc_val").innerHTML=txt_acc;
     		 
     		 var date_due=document.getElementById("from_Date").value;
     		 document.getElementById("due_date_val").innerHTML=date_due;
     		*/
    		 var payment_type_check=document.getElementById("payment_type").value;

     		 var total_count=document.getElementById("totalPayed").value;
     		 if(payment_type_check!=3)
     			 {
         		 var pilot=document.getElementById("selectpilot");
var pilot_txt=pilot.options[pilot.selectedIndex].text;
     			 document.getElementById("pilot_val_pr").innerHTML=pilot_txt;
     			 document.getElementById("pilot_v").style.display='block';
     			 var collected_by_self=document.getElementById("collected_").value;
     			 if(collected_by_self=="Yes")
     				 {
     				 document.getElementById("collector_val").innerHTML=pilot_txt;
     				 }
     			 else
     				 {
     				 var collector=document.getElementById("collected_by");
     				 var collector_txt=collector.options[collector.selectedIndex].text;
     				document.getElementById("collector_val").innerHTML=collector_txt;
     				 }
     			 document.getElementById("collector").style.display='block';
     			 }
     		 
     		 document.getElementById("payment_print").style.display='block';
	     	$("#approved_tbl tbody").append(approved_rec);
           window.print();
      }
      
      function confirm_submit()
      {
    	  $.confirm({
  		    title: 'Confirmation',
  			theme: 'Bootstrap',
  		    content:'Are you Sure You want to submit selected Payments ? ',
  			icon:'glyphicon glyphicon-remove-sign',
  		    buttons: {
  		    	  OK: function () {
  		    		var check_submit=document.getElementById("check_submit").value;
		    		   if(check_submit=="submitted")
		    			   {
		   	   			swal("Error","Payment Already Submitted !","error");

		    			   }
		    		   else{
  		    		  document.getElementById("button_d").disabled=true;
  		    		document.getElementById("payment_type").disabled=true;
    				document.getElementById("collected_").disabled=true;
    				document.getElementById("collected_by").disabled=true;
    				document.getElementById("search_date").disabled=true;
    				document.getElementById("selectpilot").disabled=true;
  		      	  checkForm();
		    		   }
  		    	  },
  		    cancel: function () {
  		    	
  	        }
  		    }
  		});
    	  
      }
      
      
      function checkForm() {
   	   document.getElementById("check_submit").value="submitted";

    		document.getElementById("collected_by").disabled = true ;
    		document.getElementById("collected_").disabled = true ;
var payment_type=document.getElementById("payment_type").value;
        	$('#tableform_  input[type=checkbox]').prop("disabled", true);
        	$("#tableform_ textarea").prop("disabled", true);
	    	document.getElementById("submitBtn").disabled = true;
	    	  var totalPayed =   parseFloat(document.getElementById("totalPayed").value).toFixed(2);
	      	  var avaiableCash =   parseFloat(document.getElementById("total").value).toFixed(2);
	          var difference = avaiableCash-totalPayed;
var check_collected_by=document.getElementById("collected_").value;
      	  var driver_selected =  document.getElementById("collected_by").value;
      	  if(check_collected_by=="no_value"&&payment_type!=3)
      		  {
      		   document.getElementById("check_submit").value="notsubmitted";

      		$('#tableform_  input[type=checkbox]').prop("disabled", false);
        	$("#tableform_ textarea").prop("disabled", false);
	    	document.getElementById("submitBtn").disabled = false;
      		document.getElementById("collected").disabled = false ;
      		document.getElementById("collected_by").disabled = false ;

	    	swal("<spring:message code="ShipmentList.Error.Title"/>","Please Select Collected By Self !","error");
      		  }
      	  
      	  else  if (driver_selected=="no_value"&&check_collected_by=="No"&&payment_type!=3)
      		  {
     		   document.getElementById("check_submit").value="notsubmitted";

      		document.getElementById("collected_by").disabled = false ;
      		document.getElementById("collected_").disabled = false ;

        	$('#tableform_  input[type=checkbox]').prop("disabled", false);
        	$("#tableform_ textarea").prop("disabled", false);
	    	document.getElementById("submitBtn").disabled = false;
	    	swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="SelectValidDriver"/>","error");
      		/*$.alert({
   	          title: "<spring:message code="ShipmentList.Error.Title"/>",
   			    content:"<spring:message code="SelectValidDriver"/>",
   	          }); */
      		  }
      	  else if(totalPayed==0.00)
      		  {
     		   document.getElementById("check_submit").value="notsubmitted";

      		document.getElementById("selectpilot").disabled = false ;
        	$('#tableform_  input[type=checkbox]').prop("disabled", false);
        	$("#tableform_ textarea").prop("disabled", false);
	    	document.getElementById("submitBtn").disabled = false;
      		  swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="PleaseSelectaPaymentatleast"/>","error");
      		/*$.alert({
     	          title: "<spring:message code="ShipmentList.Error.Title"/>",
     			    content:"<spring:message code="PleaseSelectaPaymentatleast"/>",
     	          }); */
      		  }
      	  /*else if(difference < 0.00){
      		  
      		document.getElementById("selectpilot").disabled = false ;
        	$('#tableform_  input[type=checkbox]').prop("disabled", false);
        	$("#tableform_ textarea").prop("disabled", false);
	    	document.getElementById("submitBtn").disabled = false;
      		  swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code ="TotalPaymentsisgreaterthanAvailbleBalance"/>","error");
        		/*$.alert({
       	          title: "<spring:message code="ShipmentList.Error.Title"/>",
       			    content:"<spring:message code ="TotalPaymentsisgreaterthanAvailbleBalance"/>",
       	          }); 
      	  }*/
      	  else{
      		submitData(totalPayed);
      	  }
      	  
       
      	 
	}
      
      function selectDriverfn(selected) {
    	 
    	  var table =$('#tableform_').DataTable();
    	  $("#selectAll"). prop("checked", false);
    	  $('.commonClass').attr('checked',false).change();
    	 // document.getElementById("totalPayed").value = parseFloat(0.0).toFixed(2) ;
    	  var selected_driver= selected.value;
    	  var selectedText = $("#selectDriver option:selected").html();
    	  if(selectedText!="Please Select Driver")
    		  {
    	  var nameArr = selectedText.split(',');
    	  document.getElementById("driver_name").innerHTML=nameArr[0];
    		  }
          
    	  table
          .columns( 1 )
          .search( selected_driver )
          .draw();

	}
      
      function submitData(totalPayed) {
    		 var table = $('#tableform_').tableToJSON(
          			  {}
          			  );
    		 var table2 =  $('#tableform_').tableToJSON(
         			  { }
 			  );
    		 console.log(table);
    		 console.log(table2);
    		 for (var i = table.length - 1; i >= 0; i--)  {
    		   		var x = table[i];
    		   		if (x.check=="false")
    		   			{
    		   			table.splice( i, 1 );
    		   			table2.splice( i, 1 );
    		   			}
    		   			
    		     	}
    		 
    		 console.log(table2);
    		 var pay_type=document.getElementById("payment_type").value;
    		 var collected_by_self=0;
    		 var collected_by="";
    		 if(pay_type!=3)
    			 {
    			 collected_by_self=document.getElementById("collected_").value;
    		 if(collected_by_self=="Yes")
    			 {
    			 collected_by_self=1;
    			 collected_by=document.getElementById("selectpilot").value;
    			 }
    		 else
    			 {
    			 collected_by_self=0;
    			 collected_by=document.getElementById("collected_by").value;
    			 }
    			 }
    	    var payments ={
    			  "lst_payments" : table2 ,
    			  "totalPayed" : totalPayed ,
    			  "collected_by_self":collected_by_self,
    			  "collected_by":collected_by
    			   	  };
    	 
    	 console.log(payments);
    	var xhttp = new XMLHttpRequest();
    	xhttp.onreadystatechange = function() {

    	if (this.readyState == 4 && this.status == 200) {
    		var response= this.responseText;
if(response==0)
    		{
    			
    		    document.getElementById("submitBtn").disabled = false;
      	    	document.getElementById("printBtn").disabled = true ;
       	    	document.getElementById("account").disabled = false ;
       	    	document.getElementById("selectpilot").disabled = false ;
    			swal("<spring:message code="ShipmentList.Error.Title" />","<spring:message code="PaymentsNotSubmitted" />","error");
    		 	  /*$.alert({
    		 		 title: "<spring:message code="ShipmentList.Error.Title" />",
         		    content:"<spring:message code="PaymentsNotSubmitted" />",
    		                         }); */
    		 	
    		}
    			
    		else if(response =="no session"){
    			location.reload();
    		}
    		else
    		{
    			document.getElementById("resp").value=response;
    			 var totalPayed =   parseFloat(document.getElementById("totalPayed").value).toFixed(2);
    	      	  var avaiableCash =   parseFloat(document.getElementById("total").value).toFixed(2);
    	    	  //document.getElementById("total_cash").innerHTML=totalPayed;

    	      	document.getElementById("total").value = parseFloat(avaiableCash -totalPayed).toFixed(2)
     	    	document.getElementById("printBtn").disabled = false;
      	    	swal("<spring:message code="ShipmentList.Success.Title"/>","<spring:message code="PaymentsSubmittedsuccessfully"/>","success");
	      	    	/*$.alert({
	      	    	  title: "<spring:message code="ShipmentList.Success.Title"/>",
	         		    content:"<spring:message code="PaymentsSubmittedsuccessfully"/>",
	                    }); */
	      	    	

      	    	
    			}
    	 }
    	 }
    	 xhttp.open("POST","submitPayrollPayments", true);
    	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    	 xhttp.send(JSON.stringify(payments));
    	  
	}
      
 
      
      function  changeState(checkedVar) {
    	  var rowIndex =checkedVar.parentNode.parentNode.rowIndex;
    	  var myTable = document.getElementById('tableform_');
          var totalPay = parseFloat(document.getElementById("totalPayed").value);
          var payValue = parseFloat(myTable.rows[rowIndex].cells[4].innerHTML);
    	  //alert(rowIndex);
    	  
    	  if (checkedVar.checked) {
    		 
              myTable.rows[rowIndex].cells[5].innerHTML="true";
              document.getElementById("totalPayed").value = parseFloat(totalPay+payValue).toFixed(2) ;
              
    	  }
    	  else{
    		  myTable.rows[rowIndex].cells[5].innerHTML="false";
    		  $("#selectAll"). prop("checked", false);
    		  document.getElementById("totalPayed").value = parseFloat(totalPay-payValue).toFixed(2) ;
    	  }
      }
      function submitFunction()
      {
    	  document.getElementById("submitBtn").disabled = true;
      }
      
      function selectDeselectAll(checkedVar) {
    	  
    	  if (checkedVar.checked) {
    		  document.getElementById("totalPayed").value = parseFloat(0.0).toFixed(2) ;
        	  $('.commonClass').attr('checked',true).change();

        	  }
        	  else{
        		  $('.commonClass').attr('checked',false).change();
        	  }
    	  }
      function changeComment(x) {
      	var rowIndex = x.parentNode.parentNode.rowIndex;
          var val= x.value;
          var myTable = document.getElementById('tableform_');
          myTable.rows[rowIndex].cells[10].innerHTML = val;
		}
      
      $(document).ready(function() {
    	  
    	  var table=  $('#tableform_').DataTable( {
    		  "paging":   false ,
    		  "info": false ,
    		  "ordering": false,
    		  "language":{
    			  "zeroRecords": "<spring:message code="NoPaymentsFound" />"
    			  }
   		   

    	    } );
    	  
    	 
    	
    	  
    	  
    	    $('.js-example-basic-multiple').select2();
    	   // document.getElementById("totalPayed").value = parseFloat(0.0).toFixed(2) ;    	   
    	});
    /*  $('td input[type="checkbox"]').change(function () {
    	  if (!this.checked)
    		  {
    		  $(this).closest('tr').find('textarea').val('');
    		  }
    	 
    	  $(this).closest('tr').find('textarea').prop('disabled', !this.checked);
    	  
    	}).change();*/
   </script>
   <script type="text/javascript">
   
   </script>
      <script>
   var now = new Date(),
   minDate = now.toISOString().substring(0,10);

  $('#from_Date').prop('min', minDate);
   
   </script>
   
      <script>
   function selectDeselectAll(row)
   {
	   if(row.checked==false)
{
	   $('.check_one').attr('checked',false).change();
}
	   else
	   {		   $('.check_one').attr('checked',true).change();
	   }
	   
	   
	   }
</script>
   <script type="text/javascript">
   
   function change_select(row)
   {
  	 var x_row=row.parentNode.parentNode.rowIndex;
  	 var tbl=document.getElementById("tableform_");
  	 tbl.rows[x_row].cells[5].innerHTML=row.checked;
  	if(row.checked==true)
  		{
  		var pay_type=document.getElementById("payment_type").value;
  		if(pay_type==1)
  		{
  			var pilot_sel=document.getElementById("selectpilot");
  		var selected_text=pilot_sel.options[pilot_sel.selectedIndex].text;
  		var selected_val=pilot_sel.options[pilot_sel.selectedIndex].value;
  		//alert(selected_val);
  		var emp_text=tbl.rows[x_row].cells[2].innerHTML;
			var arr_name=emp_text.split(',');

  		if(selected_val=="no_value")
  			{
  			//alert(emp_text);
  			//alert(arr_name[0]);
      	  $('#selectpilot').val(arr_name[1]).change();
      	tbl.rows[x_row].cells[9].children[0].disabled=false;
		  	//tbl.rows[x_row].cells[11].children[0].disabled=false;
		  	var totalPay=parseFloat(document.getElementById("totalPayed").value);
		  	var payValue=parseFloat(tbl.rows[x_row].cells[4].innerHTML);
			  document.getElementById("totalPayed").value = parseFloat(totalPay+payValue).toFixed(2) ;
			  	console.log(document.getElementById("totalPayed").value);
		    	console.log(parseFloat(totalPay+payValue).toFixed(2));
  			}
  		else
  			{
  			if(selected_val!=arr_name[1])
  				{
  				swal("Error","You Can't Select Payments For More Than One Employee ! ","error");
  				tbl.rows[x_row].cells[0].children[0].checked=false;
  			  	 tbl.rows[x_row].cells[5].innerHTML="false";

  				}
  			else
  				{
  				tbl.rows[x_row].cells[9].children[0].disabled=false;
  			  	//tbl.rows[x_row].cells[11].children[0].disabled=false;
  			  	var totalPay=parseFloat(document.getElementById("totalPayed").value);
  			  	var payValue=parseFloat(tbl.rows[x_row].cells[4].innerHTML);
  				  document.getElementById("totalPayed").value = parseFloat(totalPay+payValue).toFixed(2) ;
  				  	console.log(document.getElementById("totalPayed").value);
  			    	console.log(parseFloat(totalPay+payValue).toFixed(2));
  				}
  			}
  		}
  		else
  			{
  	tbl.rows[x_row].cells[9].children[0].disabled=false;
  	//tbl.rows[x_row].cells[11].children[0].disabled=false;
  	var totalPay=parseFloat(document.getElementById("totalPayed").value);
  	var payValue=parseFloat(tbl.rows[x_row].cells[4].innerHTML);
	  document.getElementById("totalPayed").value = parseFloat(totalPay+payValue).toFixed(2) ;
	  	console.log(document.getElementById("totalPayed").value);
    	console.log(parseFloat(totalPay+payValue).toFixed(2));
  			}
  		}
  	else
  		{
  		tbl.rows[x_row].cells[9].children[0].disabled=true;
  	  //	tbl.rows[x_row].cells[11].children[0].disabled=true;
  		var totalPay=parseFloat(document.getElementById("totalPayed").value);
  	  	var payValue=parseFloat(tbl.rows[x_row].cells[4].innerHTML);
    	console.log(parseFloat(totalPay-payValue).toFixed(2));
  	  document.getElementById("totalPayed").value = parseFloat(totalPay-payValue).toFixed(2) ;
  	console.log(document.getElementById("totalPayed").value);
  		}
  	 var clas=document.getElementsByClassName("check_one");
  	 var check="";
  	 for(var x=0;x<clas.length;x++)
  		 {
  		 if(clas[x].checked==false)
  			 {
  			check="no";
  			break;
  			 }
  		 }
  	 if(check=="no")
  		 {
  		 document.getElementById("selectAll").checked=false;
  		 }
  	 else
  		 {
  		 document.getElementById("selectAll").checked=true;

  		 }
   }
   function change_note(row)
   {
	   var val=row.value;
	   var x_row=row.parentNode.parentNode.rowIndex;
	  	 var tbl=document.getElementById("tableform_");
	  	 tbl.rows[x_row].cells[10].innerHTML=row.value;
   }
   function change_date(row)
   {
	   var val=row.value;
	   var x_row=row.parentNode.parentNode.rowIndex;
	  	 var tbl=document.getElementById("tableform_");
	  	 tbl.rows[x_row].cells[12].innerHTML=row.value;
   }
   
   
   function search_due_date()
   {
	   var input, filter, table, tr, td, i, txtValue;
	   input = document.getElementById("search_date");
	   filter = input.value.toUpperCase();
	   table = document.getElementById("tableform_");
	   tr = table.getElementsByTagName("tr");

	   // Loop through all table rows, and hide those who don't match the search query
	   for (i = 1; i < tr.length; i++) {
	     td = tr[i].getElementsByTagName("td")[2];
	     if (td) {
	       txtValue = td.textContent || td.innerText;
	       if (txtValue.toUpperCase().indexOf(filter) > -1) {
	         tr[i].style.display = "";
	       } else {
	         tr[i].style.display = "none";
	       }
	     }
	   }
   }
   </script>
    <script type="text/javascript">
   function check_Form(status)
   {
	   

	   document.getElementById("payment_type").disabled=true;
	   document.getElementById("selectpilot").disabled=true;
	   document.getElementById("collected_").disabled=true;
	   document.getElementById("collected_by").disabled=true;
	   document.getElementById("submitBtn").disabled=true;

	  /* document.getElementById("button_f").disabled=true;
	   document.getElementById("button_r").disabled=true;*/
	   document.getElementById("button_d").disabled=true;

 	  var check_valid=document.getElementById("tableform").reportValidity();
	   //alert(check_valid);
	   if(check_valid==false)
		   {
		   
		   document.getElementById("button_d").disabled=false;
		   }
	   else
		   {
		   $('#tableform input[type="text"]').prop("disabled", true);
		   $('#tableform input[type="date"]').prop("disabled", true);
		   $('#tableform input[type="checkbox"]').prop("disabled", true);
	   	$("#tableform_ textarea").prop("disabled", true);
	  	   document.getElementById("submitBtn").disabled=true;
	  	   document.getElementById("button_d").disabled=true;

		   var clas=document.getElementsByClassName("check_one");
		  	 var check="";
		  	 for(var x=0;x<clas.length;x++)
		  		 {
		  		 if(clas[x].checked==true)
		  			 {
		  			check="no";
		  			break;
		  			 }
		  		 }
		  	 if(check=="no")
		  		 {
		  		 if(status==3)
		  			 {
		  			 var content='Are you Sure You want to Approve Selected Payments ? ';
		  			 
		  			 }
		  		 else if(status==4)
		  			 {
		  			 var content='Are you Sure You want to Reject Selected Payments ? ';

		  			 }
		  		 else
		  			 {
		  			 var content='Are you Sure You want to Marked Selected Payments  As deleted ? ';

		  			 }
		  		$.confirm({
				    title: 'Confirmation',
					theme: 'Bootstrap',
					
				    content:content,
					icon:'glyphicon glyphicon-remove-sign',
				    buttons: {
				    	  OK: function () {
				    		  document.getElementById("payment_type").disabled=false;
			    				document.getElementById("collected_").disabled=false;
			    				document.getElementById("collected_by").disabled=false;
			    				document.getElementById("search_date").disabled=false;
			    				document.getElementById("selectpilot").disabled=false;
			    				document.getElementById("button_d").disabled=false;
				    		  var table = $('#tableform_').tableToJSON(
					       			  { }
					       			  );
							   console.log(table);
							   var cash={
									   "payments":table,
									   "approved_status":status
							   };
							   console.log(cash);
							   var xhttp = new XMLHttpRequest();
							   	xhttp.onreadystatechange = function() {

							   	if (this.readyState == 4 && this.status == 200) {
							   		var response= this.responseText;
							   		if(response=="true")
						   			{
						   			swal("Success","Payments Approved Successfully ","success");
						   			}
						   		else
						   			{
						   			swal("Error","Some thing went wrong , Please try again !","error");
						   			}
					  		 }
							   	}
							   	xhttp.open("POST","SubmitApprovePayment", true);
								 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
								 xhttp.send(JSON.stringify(cash));
							   	
				    	  },
				    cancel: function () {
				    	 $('#tableform input[type="text"]').prop("disabled", false);
				  		 $('#tableform input[type="checkbox"]').prop("disabled", false);
				  		 $('#tableform textarea').prop("disabled", false);
				  		document.getElementById("payment_type").disabled=false;
	    				document.getElementById("collected_").disabled=false;
	    				document.getElementById("collected_by").disabled=false;
	    				document.getElementById("search_date").disabled=false;
	    				document.getElementById("selectpilot").disabled=false;
				  	   $('#tableform input[type="date"]').prop("disabled", false);
				  	   /*document.getElementById("button_f").disabled=false;
				  	   document.getElementById("button_r").disabled=false;*/
				  	   document.getElementById("submitBtn").disabled=false;
				  	   document.getElementById("button_d").disabled=false;

			        }
				    }
				});
		  		
		  		 }
		  	 else
		  		 {
		  		 $('#tableform input[type="text"]').prop("disabled", false);
		  		 $('#tableform input[type="checkbox"]').prop("disabled", false);
		  		 $('#tableform textarea').prop("disabled", false);
			  	   document.getElementById("submitBtn").disabled=false;


		  	   $('#tableform input[type="date"]').prop("disabled", false);
		  	   document.getElementById("button_d").disabled=false;
		  		 swal("Error","Please Select At least One Payment !","error");
		  		 }
		  		 
		   
		   }

   }
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>