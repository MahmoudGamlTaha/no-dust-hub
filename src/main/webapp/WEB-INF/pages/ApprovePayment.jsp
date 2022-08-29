<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <html lang="en">

<head>
   <meta charset="utf-8" />
      <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> Approve Payment</title>
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

 <style type="text/css">
 .dataTables_filter, .dataTables_info { display: none; }

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

@font-face {
  font-family: ArbFONTS;
  src: url(ArbFONTS-Abdo-salem-Bold.ttf);
}
 #date_time_now
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
   </style>
   
<style type="text/css" media="print">


  @page { size:A4 ; }
  
  @media print {
  #printBtn {
    display: none;
  }
  #btn_div
  {
  display:none;
  }
   #Approved_Data
{
  visibility:visible;
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
 #printing_data{
display:inline-block;
}
 
  #titlepage{ display: none;}
}
 #date_time_now
{
visibility:visible;
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
                           <a href="ApprovePayment"> Approve Payment</a> <span class="divider-last">&nbsp;</span>
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
                           <h4> Approve Payment</h4>
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
                             
                            
                                
                             
                                    
                               
                               
                            
                             
                                
                              
                                <div id = "printing_data" class="row-fluid">
                            	
                                    <div style="float:left; width:50%;"> <strong><spring:message code="Drivername" /></strong>
                                   <h5 id="driver_name" style="display:contents;"></h5>	</div>
                             	   
                             
                                    <div style="float:left; width:50%;"> <strong><spring:message code="Total_" /></strong>
                                   <h5 id="total_cash" style="display:contents;"></h5>	</div>
                             	   
                               </div>
                               </div>
                                
                            </div>
</td>
</tr>
</table>
<div class="space20"></div>
						<div class="row-fluid">
						<div style="width:50%;float:left;">
						<strong>Payment Type :<span id="astr">*</span></strong>
						<select id="payment_type" onchange="destroy()" class= "span6 js-example-basic-multiple">
						<option value="no_val"> Please Select</option>
						<c:forEach items="${formData.lst_payment_type }" var="payment">
						<option value="${payment.id}">${payment.payment_type }</option>
						</c:forEach>
						</select>
						</div>
						
						<div style="width:50%;float:left;">
						<strong>Payment Location : <span id="astr">*</span></strong>
						<select id="loc" onchange="destroy()" class= "span6 js-example-basic-multiple">
						<option value="no_val">Please Select </option>
						<c:forEach items="${formData.lst_payment_loc }" var="loc">
						<option value="${loc.id}">${loc.facility_name}</option>
						</c:forEach>
						</select>
						</div>
						<div class="space20"></div>
						<div style="width:50%;float:left;">
						<strong>Due Date : <span id="astr">*</span></strong>
						   <input type="date" onchange="destroy()" id="from_Date"  required/>
						
						</div>
						<div style="width:50%;float:left;">
						<strong>Cash Account : <span id="astr">*</span></strong>
						<select id="account" onchange="destroy()" class= "span6 js-example-basic-multiple">
						<option value="no_val">Please Select</option>
						<c:forEach items="${ formData.lst_payment_accounts}" var="acc">
						<option value="${acc.account_id }">${acc.account_name }</option>
						</c:forEach>
						</select>
						</div>
						</div>
												                  <button type="button"  id="submitBtn" onclick="validateForm()" class="btn btn-success pull-right green mright5 " style="margin-right:25px;"><i class="icon-save icon-white"></i> Load Payments</button>   
						
                            
                           <br> 
                            
					<form:form id="tableform" modelAttribute="formData" class="form-horizontal"  >
                       <div id="hiddenform" class="row-fluid">
                                <div class="span6 invoice-block ">
                                    <ul class="unstyled amounts" data-select2-id="4">
                                    
                                      
                                        
                                    </ul>
                                </div>
                            </div>
                                                       <br> 
                                                       <br> 
                            
                            <form:form id="check_form">
                            <table id="tableform_" class="table dataTable table-striped table-bordered table-advance table-hover table-responsive" style="width:100%;margin:auto;">
						          <thead>
                                    <tr>
                                        <th class="first">  <input onchange="selectDeselectAll(this)" id="selectAll" type='checkbox' name='selectAll'> </th>                                        
                                         <th style="display: none;">ID</th>
                                        <th class="emp">Employee Name</th>
                                        <th style="display: none;">TYPE</th>
                                        <th data-override="amount"><spring:message code="amount_only"/></th>
                                        <th style="display: none;">check_</th>
                                        <th style="display: none;">id</th>
                                        <th ><spring:message code="reference"/></th>
                                        <th style="display:none;"><spring:message code="payment_type"/></th>
                                        <th><spring:message code="notes"/></th>
                                        <th style="display: none;">note</th>
                                        <th>Due Date</th>
                                        <th style="display:none;">due_date</th>
                                        <th>Facility Name</th>
                                        <th>Account Name</th>
                                    </tr>
                                    
                                    </thead>
						                 <tbody>
						                 <c:forEach items="${not_approved}" var="pay">
						            <tr>
						            <td><input class="check_one" type="checkbox" onchange="change_select(this)"/></td>
						            <td style="display:none;">${pay.id}</td>
						            <td class="emp"><c:if test="${pay.payment_type!=3}">${pay.emp_name},${pay.emp_id}</c:if></td>
						            <td style="display:none;"></td>
						            <td>${pay.amount}</td>
						            <td style="display:none;">false</td>
						            <td style="display:none;">${pay.id}</td>
						            <td>${pay.payment_name}</td>
						            <td style="display:none;"></td>
						            <td><textarea  required onchange="change_note(this)" disabled >${pay.note}</textarea></td> 
						            <td style="display:none;">${pay.note}</td> 
						            <td><input type="date" value="${pay.d1}" required disabled onchange="change_date(this)" style="width:fit-content;"/></td>
						           <td style="display:none;">${pay.due_date}</td>
						           <td>${pay.facility_name }</td>
						           <td>${pay.account_name }</td>
						            </tr>
						            </c:forEach>
                                    </tbody>
						      
                             </table>
                             </form:form>
                       <div class="row-fluid  " id="btn_div">
                       <div class="space20"></div>
                       												                  <button type="button"  id="button_f" onclick="checkForm(3)" class="btn btn-success pull-right green mright5 " style="margin-right:25px;"><i class="icon-save icon-white"></i> Approve</button>   
                                              												                  <button type="button"  id="button_r" onclick="checkForm(4)" class="btn btn-danger pull-right green mright5 " style="margin-right:25px;"><i class="icon-save icon-white"></i> Reject</button>   
                                                                     												                  <button type="button"  id="button_d" onclick="checkForm(5)" class="btn btn-light pull-right green mright5 " style="margin-right:25px;"><i class="icon-save icon-white"></i> Mark As deleted</button>   
                       
                            
                            
       
                            </div>                                  
                              <div  class="space20" ></div>
                        <div class="clearfix"></div>
                            
                                                             <input id="check_submit" style="display:none;"/>
                                               
                            
                       
                      
                            
                             
                          <div class="clearfix"></div>
                      </form:form>
                           
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
      	// initiate layout and plugins
      	App.init();
      });
      </script>
   <script>
   $(document).ready(function() {
 	    $('.js-example-basic-multiple').select2();
   });
   </script>

   <script type="text/javascript">
   function checkForm(status)
   {
	   

	   document.getElementById("payment_type").disabled=true;
	   document.getElementById("loc").disabled=true;
	   document.getElementById("from_Date").disabled=true;
	   document.getElementById("account").disabled=true;
	   document.getElementById("submitBtn").disabled=true;

	   document.getElementById("button_f").disabled=true;
	   document.getElementById("button_r").disabled=true;
	   document.getElementById("button_d").disabled=true;

 	  var check_valid=document.getElementById("tableform").reportValidity();
	   //alert(check_valid);
	   if(check_valid==false)
		   {
		   document.getElementById("button_f").disabled=false;
		   document.getElementById("button_r").disabled=false;
		   document.getElementById("button_d").disabled=false;
		   }
	   else
		   {
		   $('#tableform input[type="text"]').prop("disabled", true);
		   $('#tableform input[type="date"]').prop("disabled", true);
		   $('#tableform input[type="checkbox"]').prop("disabled", true);
	   	$("#tableform_ textarea").prop("disabled", true);
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
				    		  var check_submit=document.getElementById("check_submit").value;
				    		   if(check_submit=="submitted")
				    			   {
				   	   			swal("Error","Payment Already Created !","error");

				    			   }
				    		   else
				    			   {
				    			   document.getElementById("check_submit").value="submitted";

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
				    			   }
				    	  },
				    cancel: function () {
				    	 $('#tableform input[type="text"]').prop("disabled", false);
				  		 $('#tableform input[type="checkbox"]').prop("disabled", false);
				  		 $('#tableform textarea').prop("disabled", false);

				  	   $('#tableform input[type="date"]').prop("disabled", false);
				  	   document.getElementById("button_f").disabled=false;
				  	   document.getElementById("button_r").disabled=false;
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

		  	   $('#tableform input[type="date"]').prop("disabled", false);
		  	   document.getElementById("button_f").disabled=false;
		  		 swal("Error","Please Select At least One Payment !","error");
		  		 }
		  		 
		   
		   }

   }
   function validateForm()
   {
	   document.getElementById("payment_type").disabled=true;
	   document.getElementById("loc").disabled=true;
	   document.getElementById("account").disabled=true;
	   document.getElementById("from_Date").disabled=true;
	   document.getElementById("submitBtn").disabled=true;

	   
	   
	   
	   var payment_type=document.getElementById("payment_type").value;
	   var loc=document.getElementById("loc").value;
	   var due_date_check=document.getElementById("from_Date").reportValidity();
	   var acc=document.getElementById("account").value;
	   var due_date_val=document.getElementById("from_Date").value;
	  /* if(due_date_check==false||payment_type=="no_val"||loc=="no_val"||acc=="no_val")
		   {
		   document.getElementById("payment_type").disabled=false;
		   document.getElementById("loc").disabled=false;
		   document.getElementById("account").disabled=false;
		   document.getElementById("from_Date").disabled=false;
		   document.getElementById("submitBtn").disabled=false;
		   if(payment_type=="no_val")
			   {
			   swal("Error","Please Select Payment Type !","error");
			   }
		   else if (loc=="no_val")
			   {
			   swal("Error","Please Select Payment Location !","error");

			   }
		   else if(acc=="no_val")
			   {
			   swal("Error","Please Select Cash Account !","error");

			   }
		   }*/
		   if(payment_type=="no_val")
		   {
			   payment_type=0;
		   }
	    if (loc=="no_val")
		   {
loc=0;
		   }
	  if(acc=="no_val")
		   {
acc="empty";
		   }
	  if(due_date_check==false||due_date_val=="")
		  {
		  due_date_val="empty";
		  }
		   var acc={
				   "payment_type":payment_type,
				   "location":loc,
				   "account":acc,
				   "due_date":due_date_val
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
		   			var pay_type=document.getElementById("payment_type").value;

		   			if(pay_type==3||pay_type=='no_val')
	   				{
	                $('.emp').hide();

	   				}
		   			document.getElementById("tableform_").style.visibility='visible';
		   			document.getElementById("payment_type").disabled=false;
		   			document.getElementById("from_Date").disabled=false;
		   			document.getElementById("loc").disabled=false;
		   			document.getElementById("account").disabled=false;
		   			document.getElementById("submitBtn").disabled=false;


		   			}
		   		else
		   			{
		   			var data=JSON.parse(response);
		   			var rows="";
		   			for(var x=0;x<data.length;x++)
		   				{
		   				var x_note="";
		   			 if(data[x].note=="null")
		   				 {
		   				x_note="";
		   				 }
		   			 else
		   				 {
		   				x_note=data[x].note;
		   				 }
		   			console.log(data[x].d1)	;
		   	        rows+='<tr>';
		   	        if(data[x].emp_name==null)
		   	        	{
		   	        	data[x].emp_name="";
		   	        	}
		   	        rows+='<td><input class="check_one" type="checkbox" onchange="change_select(this)"/></td>';
		   	     rows+='<td style="display:none;">'+data[x].id+'</td><td class="emp">'+data[x].emp_name+'</td>';
		   	  rows+=' <td style="display:none;"></td><td>'+data[x].amount+'</td><td style="display:none;">false</td>';
		   	 rows+=' <td style="display:none;">'+data[x].id+'</td><td>'+data[x].payment_name+'</td><td style="display:none;"></td>';
		   	rows+= "<td><textarea value="+data[x].note+" required onchange='change_note(this)' disabled>"+data[x].note+" </textarea></td> <td style='display:none;'>"+data[x].note+"</td> <td><input type='date' value="+data[x].d1+" required disabled onchange='change_date(this)' style='width:fit-content;'/></td>";
		   	rows+= '<td style="display:none;">'+data[x].due_date+'</td><td>'+data[x].facility_name+'</td><td>'+data[x].account_name+'</td></tr>';
		   				}
		   			$('#tableform_ tbody').html(rows);
		   			var pay_type=document.getElementById("payment_type").value;
		   			if(pay_type==3)
		   				{
		                $('.emp').hide();

		   				}

		   			document.getElementById("tableform_").style.visibility='visible';
		   			document.getElementById("button_f").style.visibility='visible';

		   			}
		   	}
		   	}
		   	xhttp.open("POST","GetApprovePayments", true);
			 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
			 xhttp.send(JSON.stringify(acc));
		   	
		   
	   
   }
   </script>
   <script>
   var now = new Date(),
   minDate = now.toISOString().substring(0,10);

  //$('#from_Date').prop('min', minDate);
   
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

   
   
   function change_select(row)
   {
  	 var x_row=row.parentNode.parentNode.rowIndex;
  	 var tbl=document.getElementById("tableform_");
  	 tbl.rows[x_row].cells[5].innerHTML=row.checked;
  	if(row.checked==true)
  		{
  	tbl.rows[x_row].cells[9].children[0].disabled=false;
  	tbl.rows[x_row].cells[11].children[0].disabled=false;
	tbl.rows[x_row].cells[9].children[0].required=true;
  	tbl.rows[x_row].cells[11].children[0].required=true;
  		}
  	else
  		{
  		tbl.rows[x_row].cells[9].children[0].disabled=true;
  	  	tbl.rows[x_row].cells[11].children[0].disabled=true;
  		tbl.rows[x_row].cells[9].children[0].required=false;
  	  	tbl.rows[x_row].cells[11].children[0].required=false;
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
   
   function destroy()
   {
	   document.getElementById("tableform_").style.visibility='hidden';
	   document.getElementById("button_f").style.visibility='hidden';
   }
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>