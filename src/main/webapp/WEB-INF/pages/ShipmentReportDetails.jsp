<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <title><spring:message code="ShipmentReportDetails"/></title>
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
#consumableDetails{display: none;}
#nodust_misr{
  visibility:hidden;
  }
  
 #date_time_now
{
visibility:hidden;
}
</style>
 <style type="text/css" media="print">

 @page { size:A4 ;  }
  
  @media print {
  
  table td.first { display: none; }
  table th.first { display: none; }
  #printBtn {
    display: none;
  }
  #nodust_misr{
  visibility:visible;
  }
  
 #date_time_now
{
visibility:visible;
}
  #printBtn2 {
    display: none;
  }
  #consumableDetails{display: table;}
  #Pagetitle{
  display: none;
  }
  #exportExcel{
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
                      <li><a href="ShipmentsReport"><spring:message code="ShipmentReport"/></a> <span class="divider">&nbsp; &nbsp;</span></li>
                       <li><a href="ShipmentReportDetails?ShipmentID=${shipment.shipment_id}"> <spring:message code="ShipmentReportDetails"/></a><span class="divider-last">&nbsp;</span></li>
               
                  </ul>
      	  
				   
               </div>
            </div>
       
		     <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:5%;   margin-top: -20px ; " id="logoprint">
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                     
                        <div id="Pagetitle" class="widget-title">
                           <h4> <spring:message code="ShipmentReportDetails"/></h4>
                        </div>
                        
						<div class="widget-body">
							<table width="100%" >
<tr>
<td>

<div class="row-fluid invoice-list" >
<div class="space10"></div>
<div class="widget-title" >
                           <h4> <spring:message code="shipmentData" /></h4>
                        </div> 
                         <div class="row-fluid" style="border:outset;">
                               <div style="float:left;width:40%;"> <h5 style="margin-left:5px;"><strong><spring:message code="ShipmentID_" /> </strong>${shipment.shipment_id}	</h5></div>
                                <div style="float:left;width:30%;" > <h5 > <strong><spring:message code="ShipmentType" /></strong>
                               <c:forEach var="ship" items="${shipTypes}">
                               <c:if test="${ship.shipment_type_id == shipment.shipment_type_id }">${ship.shipment_type}</c:if>
                               </c:forEach></h5></div>
                               <div style="float:left;width:30%;"> <h5 ><strong><spring:message code="ShipmentDate_" /> </strong><fmt:formatDate value="${shipment.shipment_date}" pattern="dd-MM-yyyy hh:mm" /> 	</h5></div>
                              
                             <c:if test="${shipment.shipment_type_id!=6 }">  <div style="float:left;width:40%;"> <h5 style="margin-left:5px;"><strong><spring:message code="Drivername" /></strong>${shipment.driver} 	</h5></div></c:if>
                               <div style="float:left;width:30%;" > <h5 > <strong><spring:message code="Agentname" /></strong>${shipment.agent}</h5></div>
                               <c:if test="${shipment.shipment_type_id =='1' || shipment.shipment_type_id=='2'}">
                               <div style="float:left;width:30%;"> <h5 ><strong><spring:message code="warehousename" /> </strong>
                               <c:if test="${shipment.shipment_type_id =='1'}">
                               ${shipment.source}</c:if>
                               <c:if test="${shipment.shipment_type_id =='2'}">
                               ${shipment.destination}</c:if>
                               </h5></div>
                               </c:if>
                               <c:if test="${lst_related != null}">
                               <div style="float:left;width:40%;" ><h5 style="margin-left:5px;"><strong><spring:message code="RelatedShipmennts"/> </strong>
                                    <c:forEach items="${lst_related}" var="ship">
                                    <a class="ref_link" href="ShipmentReportDetails?ShipmentID=${ship.shipment_id}">${ship.shipment_id}</a>
                                    </c:forEach>
                                    </h5>
                                     </div>
                                    	</c:if>
                                    	
                                   <c:if test="${shipment.shipment_type_id =='9' ||shipment.shipment_type_id=='5'}">
                               <div style="float:left;width:30%;" > <h5 > <strong><spring:message code="ProductType_" /></strong>
                                <c:forEach var="type" items="${types}">
				                    <c:if test="${details[0].type==type.type_id}">
				                    ${type.type_name}
				                    </c:if>
				                  </c:forEach>
                              </h5></div>
                              
                              <div style="float:left;width:40%;"> <h5 style="margin-left:5px;" ><strong><spring:message code="Source_lbl" /> </strong>${shipment.source} </h5></div>
                              <div style="float:left;width:30%;"> <h5 ><strong><spring:message code="Dest_lbl" /> </strong>${shipment.destination} </h5></div>
                              </c:if>
                              
                              
                              
                            <div class="clearfix"></div>
                            	
                            </div>
                       </div>
</td>
</tr>
</table>
						 </div>
						 
						 
						 <div class="widget-body">
		
			      <table id="ShipmentDetails" class="table table-striped table-bordered table-advance table-hover table-responsive " style="max-width: 100%;width:80%; margin: auto;min-width: 50%;">
						        <thead>
						            <tr>
						            <th><spring:message code="product_only"/></th>
								    <th class="disatch"><spring:message code="ProductType"/></th> 
								 <c:if test="${shipment.shipment_type_id !='6'}">
								 
								 <th class ="expected_">
								    
						            
						            <spring:message code="ExpectedQuantity"/>
						           
								    </th>
								    </c:if>
						            <th>
						            <c:if test="${shipment.shipment_type_id =='5'}">
						              <spring:message code="receivedQuantity"/>
						            </c:if>
						            <c:if test="${shipment.shipment_type_id != '5'}">
						            <spring:message code="ActualQ"/>
						             </c:if></th>
						            <th class="recon_lundry_new"><spring:message code="Lost"/></th>
						            <th class="recon"><spring:message code="RLost"/></th>
						            <th class="recon"><spring:message code="ExpectedCancel"/></th>
						            <th class="recon"><spring:message code="ActualCancel"/></th>
						            <th class="recon"><spring:message code="ExpectedNew"/></th>
						            <th class="recon"><spring:message code="ActualNew"/></th>
						            <th class="recon"><spring:message code="Out"/></th>
						            <th class="lundry_new"><spring:message code="Over_"/></th>
						            </tr>
						        </thead>
						        <c:forEach var="detail" items="${details}">
						           <tr>
				                    <td>${detail.product_name} 
				                    <c:if test="${detail.treatment_id!='0'}">
				                    <c:forEach  var="treat" items="${treats}">
				                    <c:if test="${detail.treatment_id==treat.treatment_id}">
				                    - ${treat.treatment_name}
				                    </c:if>
				                    </c:forEach>
				                    </c:if>
				                    </td>
				                    <td class="disatch">
				                    <c:forEach var="type" items="${types}">
				                    <c:if test="${detail.type==type.type_id}">
				                    ${type.type_name}
				                    </c:if>
				                    </c:forEach></td>
				                  <c:if test="${shipment.shipment_type_id!='6'}">  <td class= "expected_"><c:if test="${shipment.shipment_type_id != '9' && shipment.shipment_type_id != '5'}">${detail.dms_planned_quantity}</c:if>
				                    <c:if test="${shipment.shipment_type_id =='9'}" >${detail.quantity_shipped}</c:if>
				                    <c:if test="${shipment.shipment_type_id =='5'&& shipment.source_type !='4' }">${detail.quantity_shipped}</c:if></td></c:if>
				                    <td> <c:if test="${shipment.shipment_type_id != '9' && shipment.shipment_type_id != '5'}">${detail.quantity_shipped}</c:if>
				                    <c:if test="${shipment.shipment_type_id == '9'}">${detail.actual_reconcilied_quantity}</c:if>
				                    <c:if test="${shipment.shipment_type_id =='5'&& shipment.source_type !='4'}">${detail.actual_reconcilied_quantity}</c:if>
				                    <c:if test="${shipment.shipment_type_id =='5'&& shipment.source_type =='4'}">${detail.quantity_shipped}</c:if></td>
				                    <td class="recon_lundry_new"> 
				                    <c:if test="${detail.lost == null}">0</c:if>
				                    <c:if test="${detail.lost != null}">${detail.lost}</c:if>
				                    </td>
				                    <td class="recon">
				                    <c:if test="${detail.returned_lost == null}">0</c:if>
				                    <c:if test="${detail.returned_lost != null }">${detail.returned_lost}</c:if>
				                    </td>
				                    <td class="recon">
				                    <c:if test="${detail.cancel == null}">0</c:if>
				                    <c:if test="${detail.cancel != null}">${detail.cancel}</c:if>
				                    </td>
				                    <td class="recon">
				                    <c:if test="${detail.actual_cancel == null}">0</c:if>
				                    <c:if test="${detail.actual_cancel != null}">${detail.actual_cancel}</c:if>
				                    </td>
				                     <td class="recon">
				                    <c:if test="${detail.expected_new == null}">0</c:if>
				                    <c:if test="${detail.expected_new != null}">${detail.expected_new}</c:if>
				                    </td>
				                     <td class="recon">
				                    <c:if test="${detail.actual_new == null}">0</c:if>
				                    <c:if test="${detail.actual_new != null}">${detail.actual_new}</c:if>
				                    </td>
				                    <td class="recon">
				                    <c:if test="${detail.quantity == null}">0</c:if>
				                    <c:if test="${detail.quantity != null}">${detail.quantity}</c:if>
				                    </td>
				                    <td class="lundry_new">
				                    <c:if test="${detail.over == null}">0</c:if>
				                    <c:if test="${detail.over != null}">${detail.over}</c:if>
				                    </td>
				                   </tr>
						         </c:forEach>
                             </table>
                             
                             <div class="space20"> </div>
                        <table id="consumableDetails" class="consumable_class table table-striped table-bordered table-advance table-hover table-responsive " style="max-width: 100%;width:fit-content; margin: auto;min-width: 50%;">
						        <thead>
						            <tr>
						            <th><spring:message code="Consumable"/></th>
								    <th><spring:message code="Quantity"/></th> 
								    <th><spring:message code="measurementunit"/></th>
						            </tr>
						        </thead>
						        <c:forEach var="con" items="${Consumables}">
						           <tr>
				                    <td>${con.product_name}</td>
				                    <td>${con.quantity}</td>
				                    <td>${con.unit}</td>
				                   </tr>
						         </c:forEach>
                             </table>
                             
                             <div class="space20"> </div>
							 <button type="button" id="exportExcel"  onclick="ExportTableOUtAsExcel('shipment')" class="btn btn-primary pull-right" style="margin-bottom: 20px; margin-left: 5px;"><i class="icon-save icon-white"></i> Save As Excel</button>                                         
                             <button type="button" id="printBtn" style="margin-right:5px;" class="btn btn-primary pull-right" onclick="printfun()" ><i class="icon-print  icon-white"></i> Print</button>
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
    	  if ('${shipment.shipment_type_id}'== 5 &&'${shipment.source_type}'==4)
		  {
    		  document.getElementById("ShipmentDetails").style.width ='fit-content';
    		  $(".recon_lundry_new").hide()
		       $(".lundry_new").hide()
		       $(".expected_").hide()
		  }
    	  
    	  if ('${shipment.shipment_type_id}'== 2)
		  {
    		  document.getElementById("ShipmentDetails").style.width ='fit-content';

		  
		  }
    	  
    	  if ('${shipment.shipment_type_id}'!= 2 && '${shipment.shipment_type_id}'!= 5 && '${shipment.shipment_type_id}'!= 9 )
    		  {
    		  $(".recon_lundry_new").hide()
    		  }
    	  if ('${shipment.shipment_type_id}'!= 5 && '${shipment.shipment_type_id}'!= 9)
		  {
		  $(".lundry_new").hide()
		  }
    	  if ('${shipment.shipment_type_id}'== 1|| '${shipment.shipment_type_id}'== 9 || '${shipment.shipment_type_id}'== 5)
		  {
    		  $(".disatch").hide()
		  }
    	  console.log('${Consumables}')
    	  if ('${Consumables}'== "")
		  {
    		  $(".consumable_class").hide()
		  }
    	  
    	  
      });
      
      function printfun()
      {
     	 if('${Consumables}'== "")
     		 {
     		 document.getElementById("consumableDetails").style.display = "none"
     		 }
     	print_data();

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
      	    
      	    var rows=document.getElementById("ShipmentDetails").rows;
            	
            	for(var x=0;x<rows.length;x++)
            		{
            		toExcel += '<tr>'
            		var row=[];
            		var columns=rows[x].querySelectorAll("td, th");
            		var columnLenght = columns.length;
                	if ('${shipment.shipment_type_id}'==1)
                		columnLenght =3;
                	else if('${shipment.shipment_type_id}'==2)
                		columnLenght=10;
                	else if('${shipment.shipment_type_id}'==6)
                		columnLenght=2;
                	else 
                		columnLenght=4;
            		for(var i=0;i<=columnLenght;i++)
            			{
            			toExcel +='<td>'+columns[i].innerText+'</td>'
            			//row.push(columns[i].innerText);
            			}
            		if ('${shipment.shipment_type_id}'==5 ||'${shipment.shipment_type_id}'==9)
            			{
            			toExcel +='<td>'+columns[11].innerText+'</td>'
            			//row.push(columns[11].innerText)
            			}
            		toExcel += '</tr>'
            		}
    	    
    	    var ctx = {
    	      worksheet: name || '',
    	      table: toExcel
    	    };
    	    var link = document.createElement("a");
    	    link.download = file_name+'${shipment.shipment_id}'+".xls";
    	    link.href = uri + base64(format(template, ctx))
    	    link.click();
    	  }
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>