<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />   
   <title> NODUST</title>
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
   
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
       <link rel="stylesheet" href="resources/css/jquery-confirm.min.css"/>
   
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
          <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
     
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
	 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
	   <script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
	 
  <style type="text/css">
   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}
#print_data
  {
  display:none;
  }
#logoprint{visibility:hidden;}


@font-face {
  font-family: ArbFONTS;
  src: url(ArbFONTS-Abdo-salem-Bold.ttf);
}


   </style>
   
<style type="text/css" media="print">


  @page { size:A4 ; }
  
  @media print {
  #display_data
  {
  display:none;
  }
  #print_data
  {
  display:contents;
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
 #endorsement
 {
 direction: rtl;
 }
 
  #titlepage{ display: none;}
}

#logoprint{visibility: visible;}
#available_div
{
display:none;
}
#contentpage{ margin-top: -50px;}

 #Header, #Footer { display: none !important; }
#footer{ display: none;}

}
</style>
<style type="text/css">
p.rtl {
  direction: rtl;
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
                  
                
			
                  <ul id="links"class=" breadcrumb mtop5 pull-left">
                       <li>
                           <a href="DashboardNoDust"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                       <li>
                           <a href="DispatchingCashOnCover"><spring:message code="ReleasingCashOnCover.PageTitle"/></a><span class="divider">&nbsp;</span>
                       </li>
                         <li>
                           <a href="#"><spring:message code="ReleasingCashOnCover.ShipmentDetails.PageTitle"/></a><span class="divider-last">&nbsp; &nbsp;</span>
                       </li>
                     
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4><spring:message code="ReleasingCashOnCover.ShipmentDetails.PageTitle"/></h4>
                        </div>
                        
						<div class="widget-body" style="text-align: left;" id="contentpage">
						<table width="100%" dir="rtl">
<tr>
<td>
<div class="space10"></div>
 <div class="widget-title" style="margin-left:-5px;">
                           <h4><spring:message code="ShipemntsData_Page_Title"/></h4>
                        </div>
<div class="row-fluid invoice-list" style="border:outset;">
                              
                             <div class="row-fluid">
                             <div style="float:left;width:40%;"> <h5 style="margin-left:5px;"><strong><spring:message code="warehousename"/></strong>${data.wareHouseName} 	</h5></div>
                                 <div style="float:left; width:30%;"> <h5 ><strong><spring:message code="Agentname"/></strong>${data.agentName}  	</h5></div>
                            
                             <div style="float:left;width:30%;"> <h5 ><strong><spring:message code="Date"/></strong>	${data.assignDate} </h5></div>
                              <div style="float:left;width:40%;"> <h5 style="margin-left:5px;"><strong><spring:message code="Drivername"/> </strong>${data.driver.FULL_NAME_EN}	</h5></div>
                             <div  style="float:left; width:60%;"> <h5 ><strong><spring:message code="areaName"/></strong>${data.areaName} 	</h5></div>
                                <div id="print_data">
                                
                                </div>
                             </div>
                                
                              
  
                               
                               
                               
                                
                            </div>
</td>
</tr>
</table>
                            
                                         <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:35%;   margin-top: -170px ; " id="logoprint">
                            
                            <div class="space20"></div>
                         <form:form id="tableform" name="submitForm" modelAttribute="data">
                   
                            <div class="row-fluid">
                                <table style="display: none;"  class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>Product ID</th>
                                        <th>DMS ID</th>
                                        <th>Product Name</th>
                                        <th>Product SKU</th>
                                        <th>TRT</th>
                                        <th>Quantity</th>
                                       
                                    </tr>
                                    
                                    </thead>
                                    <tbody>
                                    <c:forEach var="product" items="${data.productslst}" varStatus="vs">
                                        
                                    <tr>
                                        <th>${product.product_id}</th>
                                        <th>${product.dms_product_id}</th>
                                        <th>${product.product_name}</th>
                                        <th>${product.product_sku}</th>
                                        <th>${product.treatment_name}</th>
                                    	 <th>${product.quantity_shipped}</th>
                                         
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                       <div class="space20"></div> 
                       <div class="clearfix"></div>
                       
                       
                       <div class="row-fluid" id="display_data">
                                <div class="span6 invoice-block pull-right">
                                    <ul class="unstyled amounts">
                                       <li>  <strong class="span3"><spring:message code="CashOnCover.CashAccount"/></strong> 
                                       <form:select id="accountSelect" required="true" onchange="changingAvailable(this)" path="selected_product_id" class= " js-example-basic-multiple span6">
										 <c:forEach items="${data.accounts}" var="account" varStatus="vs">
										  <option value="${account.product_sku}"<c:if test="${account.product_sku eq data.selected_product_id}">selected="selected"</c:if> >${account.product_name}</option>										   
								     </c:forEach>
									    </form:select >
									    </li>
                                        <li id="available_div"><strong class="span3" ><spring:message code="CashOnCover.AvailableBalance"/></strong> 
                                         <form:select disabled="true" id="accountbalance" class="span6" path="">
										 <c:forEach items="${data.accounts}" var="account">
								        <option value="${account.total_stock_quantity}" <c:if test="${account.product_id eq data.selected_product_id}">selected="selected"</c:if> >${account.total_stock_quantity}</option>
								     </c:forEach>
								     </form:select>
								     </li>
								     
                                        <li><strong class="span3"><spring:message code="CashOnCover.ExpectedCash"/></strong> <form:input path="expectedCash" readonly="true" type="number" step="0.01" name="expected" class="span6"/> </li>
                                        <li><strong class="span3"><spring:message code="CashOnCover.ActualCash"/></strong> <form:input required="true" id="actualCash" path="actualCash"  type="number"  step="0.01" class="span6" min="1.00"/></li>
                                    </ul>
                                </div>
                            </div>
                            
                    <div class="space20"></div> 
                         <div class="clearfix"></div>
                         
                            <div class="row-fluid  ">
                                                      <button  id="submitBtn" onclick="validateForm()" type="button" class="btn btn-success pull-right green mright5 "><i class="icon-save icon-white" style="margin-right: 4px;"></i><spring:message code="Submit"/></button>   
                         
                             <button type="button" id="printBtn" disabled class="btn btn-primary pull-right" onclick="javascript:window.print();" style="margin-right:5px;"><i class="icon-print  icon-white" style="margin-right: 4px;"></i><spring:message code="Print"/></button>   
                            
                            </div>      
                       </form:form>
                    
                       
						
						 </div>
						          
                             <div class="widget-body" style="    font-family: cursive; font-size: 18px;     text-align: justify;"  >
                             <div id="endorsement" style="display: none;"  dir="rtl">
                            <strong dir="rtl" >
                            <spring:message code="Endorsement" /><br dir="rtl" />
                            </strong>
                            <br>
                            </div>
                         <!--    <div align="center">
                            <strong > NO DUST</strong>
                            </div>  -->
                            <strong id ="showDate"></strong>
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
 
   <script>
      jQuery(document).ready(function() {			
      	// initiate layout and plugins
      	App.init();
      	
      });
      
      function validateForm() {
    	  var validation = document.getElementById("tableform").reportValidity()
     	 if(validation != false)
     		 {
     		document.getElementById("submitBtn").disabled = true;
     		submitData()
     		
     		 }
     	 else{
     		document.getElementById("submitBtn").disabled = false;
     	 }
	}
      
      function submitData() {
    	  var e = document.getElementById("accountSelect");
    	  var selectedAccount = e.options[e.selectedIndex].value;
    	  console.log(selectedAccount);
    	  var actualCash =document.getElementById("actualCash").value;
    	  var cashCoverForm ={
    			  "shipment_id" : '${data.shipment_id}' ,
    			  "selected_product_id" : selectedAccount ,
    			  "actualCash": actualCash ,
    			  "expectedCash": '${data.expectedCash}'
    	  };
    	 
    	  console.log(cashCoverForm);
    	var xhttp = new XMLHttpRequest();
    	xhttp.onreadystatechange = function() {

    	if (this.readyState == 4 && this.status == 200) {
    		var response= this.responseText;
    		if(response == "success")
    			{

     	    	document.getElementById("actualCash").disabled = true ;
     	    	document.getElementById("accountSelect").disabled = true ;
     	    	document.getElementById("submitBtn").disabled = true;
     	    	document.getElementById("printBtn").disabled = false;
      	    	document.getElementById("endorsement").style.display = "block";
      	    	var today = new Date();
      	    	var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
      	    	var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
      	    	var dateTime = date+' '+time;
      			document.getElementById("showDate").innerHTML = dateTime;
	      	    	$.alert({
	      	    	  title: "<spring:message code="ReleasingCashOnCover.SuccessSubmit.title" />",
	         		    content:"<spring:message code="ReleasingCashOnCover.SuccessSubmit.content" />",
	                    }); 
	      	    	

      	    	
    			}
    		else if(response =="no session"){
    			location.reload();
    		}
    		else{
    			document.getElementById("submitBtn").disabled = false;
			      document.getElementById("printBtn").disabled = true ;
			 	  document.getElementById("accountSelect").disabled = false ;
    			
    		 	  $.alert({
    		 		 title: "<spring:message code="ReleasingCashOnCover.FailedSubmit.title" />",
         		    content:"<spring:message code="ReleasingCashOnCover.FailedSubmit.content" />",
    		                         }); 
    		  	      
    		}
    	 }
    	 }
    	 xhttp.open("POST","submitCashOnCover", true);
    	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    	 xhttp.send(JSON.stringify(cashCoverForm));
    	  
	}
      
      function changingAvailable(e) {
          var idx = e.selectedIndex ; 
          document.getElementById("accountbalance").selectedIndex = idx;
          var e = document.getElementById("accountbalance");
          var strUser = e.options[e.selectedIndex].value;
         // document.getElementById("actualCash").max = strUser;
          
      }
        
    
      function submitFunction()
      {
    	  document.getElementById("submitBtn").disabled = true;

          if(document.submitForm.onsubmit &&
          !document.submitForm.onsubmit())
          {
              return;
          }
       document.submitForm.submit();
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
  	 //  alert('${data.selected_product_id}');
  	 
  	});
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>