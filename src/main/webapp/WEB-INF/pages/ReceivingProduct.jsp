<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
     <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <title> <spring:message code="ProductReconciliation.ReceivingProducts"/></title>
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
      <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
     <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
    
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
	
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
  <style type="text/css">
#astr
{
    color: red;
    font-size: large;
     
    
}
#sweet-alert{
text-align:center;
    margin-top: -500px;
}
#showSweetAlert{
float:right;
  }
</style>
</head>

<body class="fixed-top">

	<jsp:include page="NavBarNoDust.jsp">
	         <jsp:param name="param1" value="HideButton"/>
	 </jsp:include>
   
    
   
   <!-- BEGIN CONTAINER -->	
   <div id="container" class="row-fluid">

	 
		<jsp:include page="SideNaveNoDust.jsp">
		         <jsp:param name="param1" value="Dashboardli"/>
		 </jsp:include>	
    
	<!-- BEGIN PAGE -->


		<div id="main-content">
	
         <div class="container-fluid">
            <div class="row-fluid">
               <div class="span12">
                  
                
			
                  <ul class=" breadcrumb mtop5 pull-left">
                       <li>
                           <a href="DashboardNoDust"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                       <li>
                           <a href="ReceivingProduct"> <spring:message code="ReceivingProdct"/> </a><span class="divider-last">&nbsp;</span>
                       </li>
                       
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title">
                           <h4><spring:message code="ReceivingProdct"/></h4>
                        </div>
                        
						<div class="widget-body">
						<form:form  class="form-horizontal"  modelAttribute="selected_driver" id="receivingform">
                            <div class="control-group">
                              <label class="control-label black  " style="text-align:left;">  <strong><spring:message code="Drivername" /> </strong> <span id="astr" > * </span></label>

                              <div class="controls">
                              <div class="input-group mb-3 ">
							  <form:select path="selectedDriver"  id="inputGroupSelect02" name="driver" class= "span12 js-example-basic-multiple">
								    <option value="NoValue"><spring:message code="PleaseSelect"/></option>
								    <c:forEach items="${lst_drivers}" var="driver">
								        <option value="${driver.user_name}"<c:if test="${driver.user_name eq selected_driver.selectedDriver}">selected="selected"</c:if> >${driver.full_name_en} , ${driver.user_name}</option>
								     </c:forEach>
							  </form:select >
                           
                           </div>
                              </div>
                            </div>
                            <div class="control-group">
                              <label class="control-label black" style="text-align:left;"><strong><spring:message code="ReceivingProduct.VerificationCode" /></strong><span id="astr" > * </span></label>
                              <div class="controls">
                                 <form:input path="code" type="text" id="verificationCode" class="span12 " required="true"/>
                              </div>
                           </div>
                            <button type="button" onclick="Submit_Data()" class="btn btn-success pull-right green"><i class="icon-save icon-white"></i> <spring:message code="Submit"/></button>   
                       
                          <div class="clearfix"></div>
                        <!--  <div id="error_div">
                         <img alt="" src="resources/assetsnodust/img/error_message_icon.png">
                         </div> -->
                           </form:form>
                           
						 </div>
                        </div>
                     </div>
                  
                  </div>
               </div>
           
            </div>
          
         </div>
   
	
    </div>

 
 
   <div id="footer">
       &copy; <spring:message code="CopyRights"/>
   
   </div>
 
 <!-- Open & close MENU -->
  <script>
  function Submit_Data()
  {
	  var check_val=document.getElementById('inputGroupSelect02').value;
	  if(check_val=="NoValue")
		  {
		  //$("#selectdriver").dialog();
		 
		/*  $.alert({
              title: "<spring:message code="ShipmentList.Error.Title"/>",
  		    content:"<spring:message code="SelectValidDriver"/>",
  		  theme: 'dark theme'
              }); */
           /* swal({
            	title:"<spring:message code="ShipmentList.Error.Title"/>" , 
            	text:"<spring:message code="SelectValidDriver"/>" , 
            	imageUrl:"resources/assetsnodust/img/error_message_icon.png"
            });*/
		  swal("<spring:message code="ShipmentList.Error.Title"/>", "<spring:message code="SelectValidDriver"/>", "error"); 
		  }
	  else
		  {
		  Submit_Form();
		  }
  }
  function Submit_Form()
  {
	  var driver_id=document.getElementById("inputGroupSelect02").value;
	  var ver_code=document.getElementById("verificationCode").value;
  	 var validate_form = document.getElementById("receivingform").reportValidity()
  	var selected_driver={
				 "selectedDriver":driver_id,
				 "code":ver_code
		 };
  	 if(validate_form != false)
  		 {
  		 
  		console.log(selected_driver);
  		var xhttp = new XMLHttpRequest();
  		xhttp.onreadystatechange = function() {
  			

  			if (this.readyState == 4 && this.status == 200) {
  			var resp=this.responseText;
  			
  			console.log(resp);
  			if(resp=="not autheticate")
  				{
  				swal("<spring:message code="ReleasingProducts.validation.title"/>","<spring:message code="ReleasingProducts.validation.content"/>","error");
  			/*	$.alert({
  		            
                    title: "<spring:message code="ReleasingProducts.validation.title"/>",
        		    content:"<spring:message code="ReleasingProducts.validation.content"/>",
        		   
                    }); */
  				}
  			else if(resp=="NoRecon")
  				{
  				swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message  code="DrivernothaveReconciliationData"/>","error");
  				/*$.alert({
                    title: "<spring:message code="ShipmentList.Error.Title"/>",
        		    content:"<spring:message  code="DrivernothaveReconciliationData"/>"
                    });*/
  				}
  			else if(resp=="notworecon")
  				{
  				swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="DriverAlreadyhasreconciliationshipment"/>","error");
  				/*$.alert({
                    title: "<spring:message code="ShipmentList.Error.Title"/>",
        		    content:"<spring:message code="DriverAlreadyhasreconciliationshipment"/>"
                    });*/

  				}
  			
  			else if(resp=="Actuals")
  				{
  				window.location.replace("Actuals?driver_id="+driver_id);
  				}
  			else if(resp=="ActualQuantities")
  				{
  				window.location.replace("ProductReconcilaitionData?driver_id="+driver_id);
  				}
  			else
  				{
  				window.location.replace("ReconciliationValidate?driver_id="+driver_id);
  				}
  		 }

  }
  		xhttp.open("POST","submitReceivingProduct", true);
  		 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
  		 xhttp.send(JSON.stringify(selected_driver));
  		 }
  }
  </script>
   <script>
      jQuery(document).ready(function() {			
      	// initiate layout and plugins
      	App.init();
      });
      
      $(document).ready(function() {
    	    $('.js-example-basic-multiple').select2();
    	    
    	    
    	    console.log('${error}')
    	    if('${error}'!==null||'${error}'=="")
    	    	{
    	    	if('${error}'=="NoRecon")
    	    		{
    	    		$.alert({
                        title: "<spring:message code="ShipmentList.Error.Title"/>",
            		    content:"<spring:message code="DrivernothaveReconciliationData"/>"
                        }); 
    	    		}
    	        
    	    	if('${error}'=="not autheticate")
	{
   	  $.alert({
            
                           title: "<spring:message code="ReleasingProducts.validation.title"/>",
               		    content:"<spring:message code="ReleasingProducts.validation.content"/>"
                           }); 
	}
   		 
    	    	}   
    	});
      
      
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>