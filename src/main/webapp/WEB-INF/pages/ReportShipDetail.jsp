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

<!--    <link href="resources/assetsnodust/css/style_arabic.css" rel="stylesheet" />  --> 

<style type="text/css">
#logoprint{display: none;}
</style>
 <style type="text/css" media="print">

 @page { size:A4 ;  }
  
  @media print {
  
  table td.first { display: none; }
  table th.first { display: none; }
  #printBtn {
    display: none;
  }
  #printBtn2 {
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
 
 #tableBtns{
  display: none
 }
 
 #showDate{ color: black;}
  #titlepage{ display: none;}
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
                      <li><a href="GeneralReports"><spring:message code="GeneralReport.PageTitle" /></a> <span class="divider">&nbsp; &nbsp;</span></li>
                       <li><a href="#"> <spring:message code="GeneralReportDetails.PageTitle"/></a><span class="divider-last">&nbsp;</span></li>
               
                  </ul>
      	  
				   
               </div>
            </div>
       
	      <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:35%;   margin-top: -30px ; " id="logoprint">
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                     
                        <div class="widget-title">
                           <h4> <spring:message code="GeneralReportDetails.PageTitle"/></h4>
                        </div>
                        
						<div class="widget-body">
							<table width="100%" >
<tr>
<td>

<div class="row-fluid invoice-list" >
                              
                             <div>
                                <div class="span6">
                               
                                <div > <h5 ><spring:message code="ShipmentID_" /> 
                                     <strong>${shipment.shipment_id}</strong>	</h5></div>
                              
                              
                                </div>
                                 <div class="span6">
                                   
                               <c:if test="${Shiptype == 'notConvert' }">
                                    <div> <h5 ><spring:message code="Drivername" />
                                     <strong>${shipment.driver} </strong>	</h5></div>
                                     </c:if>
                                     <c:if test="${Shiptype == 'Convert' }">
                                    <div> <h5 ><spring:message code="warehouseManager_" />
                                     <strong>${shipment.manager} </strong>	</h5></div>
                                     </c:if>
                                </div>
                             </div>
                                
                            <div>
                                <div class="span6">
                                    <div > <h5 ><spring:message code="ShipmentDate_" />
                                   <strong><fmt:formatDate value="${shipment.shipment_date}" pattern="yyyy-MM-dd" />  </strong>	</h5></div>
                                </div>
                            <div class="span6">
                                    <div style="float: left; margin-right: 5px;" > <h5 > <spring:message code="Agentname" />
                                    <strong>${shipment.agent}  </strong>	</h5></div>
                                    
                                </div>
                               </div>
                            <div class="clearfix"></div>
                            	
                                    
                                <div>
                           
                              
                               </div>
                               
                                
                            </div>
</td>
</tr>
</table>
						 </div>
						 
						 
						 <div class="widget-body">
						 
			<ul class="nav nav-tabs">
 
			    <li class="nav-item active">
			      <a class="nav-link" data-toggle="tab" href="#tab1"><spring:message code="operation.tabTitle"/></a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" data-toggle="tab" href="#tab2"><spring:message code="logs.tabTiltle"/></a>
			    </li>
          </ul>
 
			  <div class="tab-content">
			   
			    <div id="tab1" class="container tab-pane active"><br>
			     
			
			      <table class="table table-striped table-bordered table-advance table-hover table-responsive " style="max-width: 90%;">
						        <thead>
						            <tr>
						            <th><spring:message code="ProductName"/></th>
								    <th><spring:message code="transactionMovement"/></th> 
						            <th><spring:message code="Quantity"/></th>
						            <th class="type_"><spring:message code="ProductType"/></th>
						            </tr>
						        </thead>
						        <c:forEach var="operation" items="${operations}">
						           <tr>
				                    <td>
				                    <c:if test="${operation.treatment == ' ' }">${operation.product_name} </c:if>
				                    <c:if test="${operation.treatment == '' }">${operation.product_name} </c:if>
				                    <c:if test="${operation.treatment != ' ' && operation.treatment != '' }">${operation.product_name} - ${operation.treatment}</c:if>
				                 </td>
				                    <td>
				                    <c:if test="${operation.transaction == '1' }">Positive</c:if>
				                    <c:if test="${operation.transaction == '-1' }">Negative</c:if>
				                    </td>
				                    <td>${operation.quantity}</td>
				                    <td class="type_">${operation.type}</td>
				                    						         </tr>
						         </c:forEach>
                             </table>
                         
                         <br>  
                           <div style="max-width: 90%;">
                             <button type="button" id="printBtn" class="btn btn-primary pull-right" onclick="javascript:window.print();" ><i class="icon-print  icon-white"></i> Print</button>
                             </div>
			    </div>
			    <div id="tab2" class="container tab-pane fade"><br>
			     
			      <table class="table table-striped table-bordered table-advance table-hover table-responsive " style="max-width: 90%;">
						        <thead>
						            <tr>
						            <th><spring:message code="fromStatus"/></th> 
						            <th><spring:message code="toStatus"/></th>
						            </tr>
						        </thead>
						        <c:forEach var="log" items="${logs}">
						           <tr>
				                    <td>
				                    <c:forEach items="${statusLst}" var="status" >
				                      <c:if test="${log.from_status_id == status.status_id}">${status.status_name}</c:if>
				                    </c:forEach>
				                    </td>
				                    <td>
				                 <c:forEach items="${statusLst}" var="status" >
				                      <c:if test="${log.to_status_id == status.status_id}">${status.status_name}</c:if>
				                    </c:forEach>
				                     </td>
						         </tr>
						         </c:forEach>
                             </table>	
                            
                               <br>  
                           <div style="max-width: 90%;">
                             <button type="button" class="btn btn-primary pull-right" id="printBtn2" onclick="javascript:window.print();" ><i class="icon-print  icon-white"></i> Print</button>
                             </div> 
                             
                             		    </div>
			  </div>
			  
          </div>
						
						
						
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
      $(document).ready(function() {
    	  
    	  if ('${Recon}'== "false")
    		  {
    		  var column2 = "table .type_";	
    		  $(column2).hide();
    		  }
      });
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>