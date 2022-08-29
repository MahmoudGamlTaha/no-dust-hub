<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <title><spring:message code="inventoryReport"/></title>
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
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
   
    <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
     
   
   	   <script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
       <script type="text/javascript" src="resources/assetsnodust/js/jasontable.js"></script>

<!--    <link href="resources/assetsnodust/css/style_arabic.css" rel="stylesheet" />  --> 

<style type="text/css">
#logoprint{display: none;}
  #nodust_misr{
  visibility:hidden;
  }
  #lost_data{display:none;}
 #date_time_now
{
visibility:hidden;
}
</style>
 <style type="text/css" media="print">

 @page { size:A4 ;  }
  
  @media print {
    #nodust_misr{
  visibility:visible;
  }
  
 #date_time_now
{
visibility:visible;
}
  table td.first { display: none; }
  table th.first { display: none; }
  #printBtn {
    display: none;
  }
  #printBtn2 {
    display: none;
  }
  #lost_data{display: inline;
  width: fit-content;
  margin: auto;}
  #exportExcel{
    display: none;
  }
  #submitBtn {
    display: none;
  }
  #links{
  display: none;
  }
 #navBar{
  display: none;
 }
 #sidemenu{
 display: none;
 }
 #pageTitle{
 display: none;
 }
 #tableBtns{
  display: none;
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
                      <li><a href="ShipmentsReport"><spring:message code="ShipmentReport"/></a> <span class="divider">&nbsp; &nbsp;</span></li>
                       <li><a href="InventoryReportDetails?CheckID=${check.id}"> <spring:message code="inventoryReport"/></a><span class="divider-last">&nbsp;</span></li>
               
                  </ul>
      	  
				   
               </div>
            </div>
       
		     <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:5%;   margin-top: -20px ; " id="logoprint">
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                     
                        <div id= "pageTitle" class="widget-title">
                           <h4> <spring:message code="inventoryReport"/></h4>
                        </div>
                        
						<div class="widget-body">
							<table width="100%" >
<tr>
<td>

<div class="row-fluid invoice-list" >
<div class="space10"></div>
<div class="widget-title" >
                           <h4> <spring:message code="InventoryCheckData" /></h4>
                        </div> 
                              
                             <div class="row-fluid" style="border:outset;">
                               
                                <div style="float:left;width:40%;" > <h5 style="margin-left:5px;"><strong><spring:message code="Check_ID"/> </strong>
                                     ${check.id}</h5></div>
                                                              
                                    <div style="float:left;width:30%;"> <h5 ><strong><spring:message code="RequestedBy_" /></strong>
                                     ${check.logged_user} 	</h5></div>
                                     
                                     <div style="float:left;width:30%;"> <h5 > <strong><spring:message code="Date"/></strong>
                                  <fmt:formatDate value="${check.check_date}" pattern="dd-MM-yyyy hh:mm" />  	</h5></div>
                                     
                                    <div style="float:left;width:40%;" > <h5 style="margin-left:5px;" > <strong><spring:message code="status_"/></strong>
                                    ${check.last_status_id}  	</h5></div>
                                      <div style="float:left;width:30%;" > <h5 > <strong><spring:message code="ApprovedBy_"/> </strong>
                                    ${check.warehouse_manager}  	</h5></div>
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
						 
			
 
			   
			     
			
			      <table id="checkDetail" class="table table-striped table-bordered table-advance table-hover table-responsive " style="max-width: 100%;width: 80%;margin: auto;">
						        <thead>
						            <tr>
						            <th><spring:message code="ProductName"/></th>
						            <th><spring:message code="ProductType"/></th>
								    <th><spring:message code="Quantity"/></th>
								    <th><spring:message code="ActualQ"/></th> 
						            <th><spring:message code="Difference"/></th>
						            
						            </tr>
						        </thead>
						        <c:forEach var="detail" items="${details}">
						           <tr>
				                    <td>${detail.product_name} 
				                    <c:if test="${detail.treatment_name!=' '}">-${detail.treatment_name}</c:if>
				                   </td>
				                   <td>${detail.type}</td>
				                    <td>${detail.product_system_quantity} 
				                    </td>
				                    <td>${detail.product_actual_quantity_checked}</td>
				                    <td> ${detail.lost_quantity}</td>
				                   </tr>
						         </c:forEach>
                             </table>
                          <div class="space20"> </div>
                          <div class="row-fluid" id="lost_data" style="margin-top: 15px;">
                            <strong><spring:message code="LostProducts"/></strong>
                           <div class="space10"></div>
                          <table id="checkDetail_" class="table table-striped table-bordered table-advance table-hover table-responsive " style="max-width: 100%;width: 80%;margin: auto;">
						        <thead>
						            <tr>
						            <th><spring:message code="ProductName"/></th>
						            <th><spring:message code="ProductType"/></th>
								    <th><spring:message code="Quantity"/></th>
								    <th><spring:message code="ActualQ"/></th> 
						            <th><spring:message code="Difference"/></th>
						            
						            </tr>
						        </thead>
						        <c:forEach var="detail" items="${details}">
						        <c:if test="${detail.lost_quantity < 0}">
						           <tr>
				                    <td>${detail.product_name} 
				                    <c:if test="${detail.treatment_name!=' '}">-${detail.treatment_name}</c:if>
				                    </td>
				                   	<td>${detail.type}</td>
				                    <td>${detail.product_system_quantity} 
				                    </td>
				                    <td>${detail.product_actual_quantity_checked}</td>
				                    <td> ${detail.lost_quantity}</td>
				                   </tr>
				                   </c:if>
						         </c:forEach>
                             </table>
                          </div>
							 <button type="button" id="exportExcel" onclick="ExportTableOUtAsExcel('check')" class="btn btn-primary pull-right" style="margin-bottom: 20px; margin-left: 5px;"><i class="icon-save icon-white"></i> Save As Excel</button>                                         
                             <button type="button" id="printBtn" class="btn btn-primary pull-right" onclick="print_data()" ><i class="icon-print  icon-white"></i> Print</button>
                         <div class="space10"></div>

			  
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
    	  
    	  if ('${shipment.shipment_type_id}'!= 2)
    		  {
    		  $(".recon").hide()
    		 
    		  }
    	  
    	  if ('${shipment.shipment_type_id}'!= 2 && '${shipment.shipment_type_id}'!= 5 && '${shipment.shipment_type_id}'!= 9 )
    		  {
    		  $(".recon_lundry_new").hide()
    		  }
    	  if ('${shipment.shipment_type_id}'!= 5 && '${shipment.shipment_type_id}'!= 9)
		  {
		  $(".lundry_new").hide()
		  }
    	  
      });
      
      
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
           window.print();
      }
      
      function ExportTableOUtAsExcel(file_name) {
  	    var uri = 'data:application/vnd.ms-excel;base64,',
  	      template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
  	      base64 = function(s) {
  	        return window.btoa(unescape(encodeURIComponent(s)))
  	      },
  	      format = function(s, c) {
  	        return s.replace(/{(\w+)}/g, function(m, p) {
  	          return c[p];
  	        })
  	      }
  	      var toExcel = "";//document.getElementById("ExpectedOut").innerHTML;
    	    
    	    var rows=document.getElementById("checkDetail").rows;
          	
          	for(var x=0;x<rows.length;x++)
          		{
          		toExcel += '<tr>'
          		var row=[];
          		var columns=rows[x].querySelectorAll("td, th");
          		var columnLenght = columns.length;
          		for(var i=0;i<columnLenght;i++)
          			{
          			toExcel +='<td>'+columns[i].innerText+'</td>'
          			//row.push(columns[i].innerText);
          			}
          		toExcel += '</tr>'
          		}
  	    
  	    var ctx = {
  	      worksheet: name || '',
  	      table: toExcel
  	    };
  	    var link = document.createElement("a");
  	    link.download = file_name+'${check.id}'+".xls";
  	    link.href = uri + base64(format(template, ctx))
  	    link.click();
  	  }
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>