<!DOCTYPE html>

 <html lang="en">

<head>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

   <meta charset="utf-8" />
   <title> <spring:message code="ReleasingProducts.PageTitle" /></title>
   <link href="img/no.jpeg" rel="icon" />
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
   <link href="resources/assetsnodust/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />  
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <link rel="stylesheet" href="resources/css/jquery-confirm.min.css"/>
          <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
      
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
     <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
    
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
  
   <link href="resources/assetsnodust/css/style.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
  <!--  <link href="resources/assetsnodust/css/style_arabic.css" rel="stylesheet" />  --> 

<style type="text/css">
#astr
{
    color: red;
    font-size: large;
     
    
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
                           <a href="DispatchingProducts"> <spring:message code="ReleasingProducts.PageTitle" /> <span class="divider-last">&nbsp;</span></a>
                       </li>
                       <li><a href="#"></a><span class="divider-last">&nbsp;</span></li>
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title">
                           <h4><spring:message code="ReleasingProducts.PageTitle" /></h4>
                        </div>
                        
						<div class="widget-body">
						<form:form id="tableform" class="form-horizontal"  modelAttribute="selected_driver" >
                            <div class="control-group">
                              <label class="control-label black  " style="text-align:left;"> <strong><spring:message code="Drivername" /> <span id="astr" > * </span></strong> </label>
                              
                              <div class="controls">
                              <div class="input-group mb-3 ">
                              
							  <form:select path="selectedDriver"  id="DriverSelect" name="driver" class= "span12 js-example-basic-multiple">
								<option value="NoValue"><spring:message code="PleaseSelect"/></option>
								    <c:forEach items="${lst_drivers}" var="driver">
								        <option value="${driver.USER_NAME}"<c:if test="${driver.USER_NAME eq selected_driver.selectedDriver}">selected="selected"</c:if> >${driver.FULL_NAME_EN} , ${driver.USER_NAME}</option>
								     </c:forEach>
							  </form:select >
                           
                           </div>
                              </div>
                            </div>
                            <div class="control-group">
                              <label class="control-label black" style="text-align:left; margin-right:-5px;"> <strong><spring:message code="VerificationCode" />:<span id="astr" > * </span></strong></label>
                              <div class="controls">
                                 <form:input path="code" type="text" class="span12 " id="code" required="true"/>
                              </div>
                           </div>
                            <button type="button" id="submitBtn" onclick="submitForm()" class="btn btn-success pull-right green"><i class="icon-save icon-white"></i> <spring:message code="Submit" /></button>   
                       
                          <div class="clearfix"></div>
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
       &copy; <spring:message code="CopyRights" />
   
   </div>
 
 <!-- Open & close MENU -->
  
   <script>
      jQuery(document).ready(function() {			
      	// initiate layout and plugins
      	App.init();
      });
      
      $(document).ready(function() {
    	    $('.js-example-basic-multiple').select2();
    	    
    	    $('#tableform').on('keyup keypress', function(e) {
    	    	  var keyCode = e.keyCode || e.which;
    	    	  if (keyCode === 13) { 
    	    	    e.preventDefault();
    	    	    document.getElementById("submitBtn").click();
    	    	    return false;
    	    	  }
    	    	});
    	    
    	   
    	});
      function submitForm()
      {
    	  if(document.getElementById("DriverSelect").value=="NoValue")
    		  {
    		  swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="SelectValidDriver" />","error");
    		  /*$.alert({
 		 		 title: "<spring:message code="ShipmentList.Error.Title"/>",
         		    content:"<spring:message code="SelectValidDriver" />",
 		                         }); */
    		  }
    	  else
    		  {
    		  submitData();
    		  }
      }
      
      function submitData() {
     	 var validation = document.getElementById("tableform").reportValidity()
     	 if(validation != false)
     		 {
    	  document.getElementById("submitBtn").disabled = true;
    	 
    	  var e = document.getElementById("DriverSelect");
    	  var selectedDriver = e.options[e.selectedIndex].value;
    	  var code =document.getElementById("code").value;
    	  var selected_driver ={
    			  "selectedDriver" : selectedDriver ,
    			  "code" : code 
    	  };
    	 
    	  console.log(selected_driver);
    	var xhttp = new XMLHttpRequest();
    	xhttp.onreadystatechange = function() {

    	if (this.readyState == 4 && this.status == 200) {
    		var response= this.responseText;
    		if(response == "success")
    			{
    			window.location.replace("CoverList?Username="+selectedDriver);
      	    	
    			}
    		else if (response == "Not Auth") {
		  	      document.getElementById("submitBtn").disabled = false;
		  	      swal("<spring:message code="ReleasingProducts.validation.title" /> ","<spring:message code="ReleasingProducts.validation.content" />","error");
    		 	  /*$.alert({
    		 		 title: "<spring:message code="ReleasingProducts.validation.title" /> ",
            		    content:"<spring:message code="ReleasingProducts.validation.content" />",
    		                         }); */
    		 	  
    		}
    		else if(response == "Not Auth Have Recon")
    			{
    			document.getElementById("submitBtn").disabled = false;
    			swal("<spring:message code="ReleasingProducts.validation.title.haveReconclation" /> ","<spring:message code="ReleasingProducts.validation.content.haveReconclation" />","error");
    			/* $.alert({
                     title: "<spring:message code="ReleasingProducts.validation.title.haveReconclation" /> ",
         		    content:"<spring:message code="ReleasingProducts.validation.content.haveReconclation" />",
                     });*/
    			}
    			
    	 }
    	 }
    	 xhttp.open("POST","Driversubmit", true);
    	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    	 xhttp.send(JSON.stringify(selected_driver));
     		 }
	}
      
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>