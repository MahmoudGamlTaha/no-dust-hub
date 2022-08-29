<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <html lang="en">

<head>
   <meta charset="utf-8" />
      <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title><spring:message code="ReceivingCash.PageTitle"/></title>
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
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
      <link rel="stylesheet" href="resources/css/jquery-confirm.min.css"/>
      
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
     <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
    
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
 <style type="text/css">
   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}
#astr
{
    color: red;
    font-size: large;
     
    
}
#nodust_misr
 {
 visibility:hidden;
 }
 #date_time_now
 {
 visibility:hidden;
 }
#logoprint{visibility:hidden;}
#print_data_div
{
display:none;
}

@font-face {
  font-family: ArbFONTS;
  src: url(ArbFONTS-Abdo-salem-Bold.ttf);
}


   </style>
   
<style type="text/css" media="print">


  @page { size:A4 ;  }
  
  @media print {
  #display_data
  {
  display:none;
  }
  #btn_div
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
 #nodust_misr
 {
 visibility:visible;
 }
 #date_time_now
 {
 visibility:visible;
 }
 #showDate{ color: black;}
  #titlepage{ display: none;}
}
#print_data_div
{
display:contents;
}
#logoprint{visibility: visible;}

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
                       <li>
                           <a href="ReceivingCash"> <spring:message code="ReceivingCash.PageTitle" /> <span class="divider">&nbsp;</span></a>
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
                           <h4> <spring:message code="ReceivingCash.PageTitle" /></h4>
                        </div>
                        
						
						
						<div class="widget-body" style="text-align: left;" id="contentpage">
						
						<table width="100%" dir="rtl">
<tr>
<td>
<div class="space10"></div>
 <div class="widget-title" style="margin-left:-5px;">
                           <h4> <spring:message code="CashData" /></h4>
                        </div>
<div class="row-fluid invoice-list" style="border:outset;">
                              <div class="space10"></div>
                             <div class="row-fluid">
                                
                                    <div style="float:left;width:35%;"> <h5 style="margin-left:5px;"><strong><spring:message code="warehousename" /></strong>
                                     ${formData.wareHouseName} 	</h5></div>
                                
                                 <div style="float:left;width:35%;"> <h5 ><strong><spring:message code="Agentname" /></strong>
                                   ${formData.agentName} 	</h5></div>
                                    <div style="float:left;width:30%;"> <h5 ><strong><spring:message code="Date" />  </strong>
                                      ${formData.assignDate}	</h5></div>
                                
                             </div>
                                
                            <div id="print_data_div" >
                            
                            <div style="float:left;width:50%;">
                            <strong style="margin-left:5px;"><spring:message code="CashOnCover.CashAccount" /></strong>
                            <h5 id="cash_account_val" style="display:contents;"></h5>
                            </div>
                             <div style="float:left;width:50%;">
                            <strong><spring:message code="Amount_Received" /></strong>
                            <h5 id="received_amount_val" style="display:contents;"></h5>
                            </div>
                            <div class="space10"></div>
                            <div style="float:left;width:100%;">
                            <strong style="margin-left:5px;"><spring:message code="Drivername" /></strong>
                            <h5 id="driver_name_val" style="display:contents;"></h5>
                            </div>
                            <div class="space10"></div>
                            <div style="float:left;">
                            <strong style="margin-left:5px;"><spring:message code="comment" /></strong>
                            <h5 id="comment_val" style="display:contents;"></h5>
                            </div>
                            </div>
                             <div class="space10"></div>  
                                
                            </div>
</td>
</tr>
</table>
						
						
                            
                           <br> 
                            
					<form:form id="tableform" modelAttribute="formData" class="form-horizontal"  >
                        <!--     <div class="control-group">
                              <label ><spring:message code="DriverNameOnly" /></label>
                              
                              <div class="controls">
                              <div class="input-group mb-3  ">
							  <form:select path="selectedDriver" id="selectDriver" class= "span8 js-example-basic-multiple">
								       <c:forEach items="${formData.drivers}" var="driver">
								        <option value="${driver.USER_NAME}"<c:if test="${driver.USER_NAME eq formData.selectedDriver}">selected="selected"</c:if> >${driver.FULL_NAME_EN} , ${driver.USER_NAME}</option>
								     </c:forEach>
								     
							       </form:select>
                               </div>
                              </div>
                            </div>
                       -->
                 
                       <div id="display_data" class="row-fluid">
                                <div class="span6 invoice-block pull-right">
                                    <ul class="unstyled amounts" data-select2-id="4">
                                 <li><strong class="span4">Reverse Transaction : </strong><input type="checkbox" id="reverse"/></li>
                                       <li>  <strong class="span4">  <spring:message code="Drivername" />  <span id="astr" style="padding: 5px;"> * </span></strong> 
                                    
                                     <form:select path="selectedDriver" id="selectDriver" class= "span7 js-example-basic-multiple">
								    								    <option value="NoValue"><spring:message code="PleaseSelect"/></option>
								    
								       <c:forEach items="${formData.employees}" var="employee">
								        <option value="${employee.USER_NAME}"<c:if test="${employee.USER_NAME eq formData.selectedDriver}">selected="selected"</c:if> >${employee.FULL_NAME_EN} , ${employee.USER_NAME}</option>
								     </c:forEach>
								     
							       </form:select>
							       	
								    </li>
									    
									    
									    
                                       <li>  <strong class="span4"><spring:message code="CashOnCover.CashAccount" /><span id="astr" style="padding: 5px;"> * </span></strong> 
                                     <form:select  id="accountSelect" path="selected_product_id" class= "span7 js-example-basic-multiple">
								       <option value="No_Value"><spring:message code="PleaseSelect"/></option>
								       <c:forEach items="${formData.receiveCashFinancailAccounts}" var="account">
										  <option value="${account.product_sku}"<c:if test="${account.product_sku eq formData.selected_product_id}">selected="selected"</c:if> >${account.product_name}</option>
								     </c:forEach>
							       </form:select>
							       	
								    </li>
                                        <li><strong class="span4"><spring:message code="Amount_Received" /><span id="astr" style="padding: 5px;"> * </span> </strong> <form:input required="true" id="recievedCash" path="recievedCash" type="number" step="0.01" class="span7" min="1.0"/></li>
                                    
                                        <li>
                                   <textarea class="span12" required placeholder="Write Comment" id="RecievedCashComment" rows="2" ></textarea>
                                    
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        <!--     <div style="text-align: center;">
                            <textarea class="span10" required placeholder="Write Comment" id="RecievedCashComment" ></textarea>
                            </div>  -->
                       
                       <div id="btn_div" class="row-fluid  ">
                                                         <button type="button"  id="submitBtn" onclick="validateForm()" class="btn btn-success pull-right green mright5 "><i class="icon-save icon-white"></i> <spring:message code="Submit" /></button>   
                            
                             <button type="button" id="printBtn"  disabled="true" class="btn btn-primary pull-right" style="margin-right:5px;" onclick="print_data();"><i class="icon-print  icon-white"></i> <spring:message code="Print" /></button>   
                            
       
                            </div>
                            
                              <br> <br> <br>   
                        <div  class="row-fluid  " > 
                            <strong id="nodust_misr" style="text-align:left; margin-left:25px;"><spring:message code="MisrNoDust"/></strong>
                       
                        <strong id="date_time_now" style="text-align: center; margin-left:200px;"> </strong>
                        </div>
                             
                          <div class="clearfix"></div>
                      </form:form>
                           
						 </div>
						 
						            
                             <div class="widget-body" style="    font-family: cursive; font-size: 18px;     text-align: justify;"  >
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
      
      
      function validateForm() {
    	  var validation = document.getElementById("tableform").reportValidity()
    	  var check_driver=document.getElementById("selectDriver").value;
    	  var check_account=document.getElementById("accountSelect").value;
      	 if(validation != false&&check_driver!="NoValue"&&check_account!="No_Value")
      		 {
      		document.getElementById("submitBtn").disabled = true;
      		document.getElementById("reverse").disabled=true;
      		submitData()
      		
      		 }
      	 else{
      		 if(check_driver=="NoValue"||check_account=="No_Value")
      			 {
      		 if(check_driver=="NoValue")
      			 {
      			 swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="SelectValidDriver" />","error");
      			/*$.alert({
	      	    	  title: "<spring:message code="ShipmentList.Error.Title"/>",
	         		    content:"<spring:message code="SelectValidDriver" />",
	                    }); */
      			 }
      		 else if(check_account=="No_Value")
      			 {
      			 swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="NoSelectionCashAccount" />","error");
      			/*$.alert({
	      	    	  title: "<spring:message code="ShipmentList.Error.Title"/>",
	         		    content:"<spring:message code="NoSelectionCashAccount" />",
	                    }); */
      			 }
      		document.getElementById("submitBtn").disabled = false;
      			 }
      	 }
	}
      
      function submitData() {
    	  var e = document.getElementById("accountSelect");
    	  var selectedAccount = e.options[e.selectedIndex].value;
    	  console.log(selectedAccount);
    	  var d = document.getElementById("selectDriver");
    	  var selectedDriver = d.options[d.selectedIndex].value;
    	  var check=document.getElementById("reverse").checked;
    	  if(check==true)
    		  {
        	  var recieved =(-1)*document.getElementById("recievedCash").value;

    		  }
    	  else
    		  {
    	  var recieved =document.getElementById("recievedCash").value;
    		  }
    	  var comment = document.getElementById("RecievedCashComment").value;
    	  var cashInOutForm ={
    			  "selectedDriver" : selectedDriver ,
    			  "selected_product_id" : selectedAccount ,
    			  "recievedCash": recieved   ,
    			  "comment": comment };
    	 
    	  console.log(cashInOutForm);
    	var xhttp = new XMLHttpRequest();
    	xhttp.onreadystatechange = function() {

    	if (this.readyState == 4 && this.status == 200) {
    		var response= this.responseText;
    		if(response == "success")
    			{

    			document.getElementById("recievedCash").disabled = true ;
     	    	document.getElementById("accountSelect").disabled = true ;
     	    	document.getElementById("selectDriver").disabled = true ;
     	    	document.getElementById("RecievedCashComment").disabled = true
     	    	document.getElementById("submitBtn").disabled = true;
     	    	document.getElementById("printBtn").disabled = false;
      	    	var today = new Date();
      	    	var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
      	    	var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
      	    	var dateTime = date+' '+time;
      			//document.getElementById("showDate").innerHTML = dateTime;

      			swal("<spring:message code="ReleasingCash.SuccessSubmit.title" />","<spring:message code="ReleasingCash.SuccessSubmit.content" />","success");
	      	    	/*$.alert({
	      	    	  title: "<spring:message code="ReleasingCash.SuccessSubmit.title" />",
	         		    content:"<spring:message code="ReleasingCash.SuccessSubmit.content" />",
	                    }); */
	      	    	

      	    	
    			}
    		else if(response =="no session"){
    			location.reload();
    		}
    		else{
    			
    		    document.getElementById("submitBtn").disabled = false;
      	    	document.getElementById("printBtn").disabled = true ;
       	    	document.getElementById("accountSelect").disabled = false ;
       	    	document.getElementById("selectDriver").disabled = false ;
     	    	document.getElementById("RecievedCashComment").disable = false;

    			swal("<spring:message code="ReleasingCash.FailedSubmit.title" />","<spring:message code="ReleasingCash.FailedSubmit.content" />","success");
    		 	/*  $.alert({
    		 		 title: "<spring:message code="ReleasingCash.FailedSubmit.title" />",
         		    content:"<spring:message code="ReleasingCash.FailedSubmit.content" />",
    		                         }); */
    		 	
    		}
    	 }
    	 }
    	 xhttp.open("POST","submitCashReceived", true);
    	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    	 xhttp.send(JSON.stringify(cashInOutForm));
    	  
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
    	 var driver_control=document.getElementById("selectDriver");
    	 var driver_name=driver_control.options[driver_control.selectedIndex].text;
    	 var driver_name_without_id=driver_name.split(",");
    	 document.getElementById("driver_name_val").innerHTML=driver_name_without_id[0];
    	 var cash_account_control=document.getElementById("accountSelect");
    	 var cash_account_name=cash_account_control.options[cash_account_control.selectedIndex].text;
    	 document.getElementById("cash_account_val").innerHTML=cash_account_name;
    	 var check=document.getElementById("reverse").checked;
   	  if(check==true)
   		  {
   		var cash_received_val =(-1)*document.getElementById("recievedCash").value;

   		  }
   	  else
   		  {
   		var cash_received_val =document.getElementById("recievedCash").value;
   		  }
    	// var cash_received_val=document.getElementById("recievedCash").value;
    	 document.getElementById("received_amount_val").innerHTML=cash_received_val;
    	 var comment_val=document.getElementById("RecievedCashComment").value;
    	 document.getElementById("comment_val").innerHTML=comment_val;
    	 window.print();
     }
      function submitFunction()
      {
    	  document.getElementById("submitBtn").disabled = true;
      }
      
      $(document).ready(function() {
    	    $('.js-example-basic-multiple').select2();
    	    
    	    $('#tableform').on('keyup keypress', function(e) {
  	    	  var keyCode = e.keyCode || e.which;
  	    	  if (keyCode === 13) { 
  	    		  
  	    	    e.preventDefault();
  	    	    if($("#submitBtn").is(":disabled"))
  	    	    	{}
  	    	    else{
  	    	    document.getElementById("submitBtn").click();
  	    	    }
  	    	    
  	    	    return false;
  	    	  }
  	    	});
  	    
    	});
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>