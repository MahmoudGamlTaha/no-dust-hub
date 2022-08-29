<!DOCTYPE html>

 <html lang="en">



<head>
   <meta charset="utf-8" />
         <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="ShipmentList"/></title>
   <link href="img/no.jpeg" rel="icon" />
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
   
   
    <link href="resources/assetsnodust/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />  
   <link href="resources/assetsnodust/css/style.css" rel="stylesheet" />
   <link href="resources/assetsnodust/css/style_red.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.5.1/css/colReorder.dataTables.min.css"/>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
   <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
   <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
   <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="https://querybuilder.js.org/node_modules/sql-parser-mistic/browser/sql-parser.min.js"></script>

<style type="text/css">
tfoot {
    display: table-header-group;
}

table.dataTable tfoot th { padding: 5px;}
.select2-container{
width: 100% !important;
}

.dataTables_wrapper {
margin-left: 15px;
}

.dataTables_wrapper .dataTables_length , 
.dataTables_wrapper .dataTables_info
{ margin-left: 15px;} 

table.dataTable thead th, table.dataTable thead td{ padding: 10px; text-align: left;}
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
                     
                       <li><a href="ViewShipmentList"> <spring:message code="ViewShipmentList"/></a><span class="divider-last">&nbsp;</span></li>
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title">
                           <h4><spring:message code="ViewShipmentList"/></h4>
                           
                        </div>
                        
						<div class="widget-body">
						
						
						
						
						
						<form:form id="tableform"  modelAttribute="Shipment_Data" >
                  <!-- 
                            <div class="control-group">
                              <label class="control-label black  ">  <spring:message code="Drivername" /> </label>
                              
                              <div class="controls">
                              <div class="input-group mb-3 ">
							  <select  name="driver" class= "span12 js-example-basic-multiple">
								    <option>1</option>
							  </select>
                           
                           </div>
                              </div>
                            </div>
                         
                          <div class="control-group">
                              <label class="control-label black  "> <spring:message code="ShipmentType"/> </label>
                              
                              <div class="controls">
                              <div class="input-group mb-3 ">
							  <select  name="driver" class= "span12 js-example-basic-multiple">
								    <option>Dispatched Shipment </option>
								    <option>Reconciliation Shipment </option>
							  </select>
                           
                           </div>
                              </div>
                            </div>
                         
                          -->
                     
                         
                         <table id="shipmentTable" class="table dataTable table-striped table-bordered  table-advance table-hover table-responsive" style="margin-left: 7px;">
						        <thead>
						            <tr>
						            <th><spring:message code="ShipmentID"/></th>
						            <th style="width:fit-content;"><spring:message code="DateOnly"/></th>
						            <th style="width:fit-content;">Source</th>
						            <th style="width:fit-content;">Destination</th>
						            <th style="width:fit-content;"><spring:message code="ShipmentTypeOnly"/></th>
						            <th style="width:fit-content;" ><spring:message code="ShipmentStatusOnly"/></th>
									<th><spring:message code="Actions"/> </th>
						            </tr>
						        </thead>
						         <tfoot>
									<tr>
									 <th><spring:message code="ShipmentID"/></th>
									<th style="width:fit-content;"><spring:message code="DateOnly"/></th>
									<th style="width:fit-content;">Source</th>
									<th style="width:fit-content;">Destination</th>
						            <th style="width:fit-content;"><spring:message code="ShipmentTypeOnly"/></th>
						            <th style="width:fit-content;"><spring:message code="ShipmentStatusOnly"/></th>
									<th></th>
									</tr>
									</tfoot>
									
				                <tbody>
				                
				               <c:forEach items="${lst_shipment}" var="ship" >
						          <tr>
						          <td>${ship.shipment_id }</td>
						          <td style="width:fit-content;"><fmt:formatDate value="${ship.shipment_date}" pattern="dd-MM-yyyy" /></td>
						          <td style="width:fit-content;">${ship.source}</td>
						          <td style="width:fit-content;">${ship.dest}</td>
						        <td style="width:fit-content;">
						        <c:choose>
						        <c:when test="${ship.type_id ==1}">
						        Shipment Dispatched
						        </c:when>
						        
						        <c:otherwise>
						        ${ship.shipment_type}
						        </c:otherwise>
						        </c:choose>
						        </td>
						          <td style="width:fit-content;">
						          <c:choose>
						          <c:when test="${ship.status==7}">
						          Car Closed
						          </c:when>
						          <c:when test="${ship.status==8}">
						          Car Open
						          </c:when>
						           <c:when test="${ship.status==10}">
						          Car Open With Cash
						          </c:when>
						          <c:when test="${ship.status==9}">
						          Car Closed With Cash
						          </c:when>
						          <c:when test="${ship.status==1}">
						          Dispatched
						          </c:when>
						          <c:otherwise>
						         ${ ship.status_name}
						         </c:otherwise>
						         </c:choose>
						          </td>
						            <td>
									   <a href="ViewShipmentListDetails?shipment_id=${ship.shipment_id}"><span class="label label-success normal" ><i class="icon-pencil mright5"></i><spring:message code="Readmore" /></span></a>
						            </td>
						 
				                </tr>
				                </c:forEach>
    
						       </tbody>       
                            </table>
                   
                            
                            
                       
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
  	    
    	  var table=  $('#shipmentTable').DataTable( {
    		  "language":{
    			  "zeroRecords": "<spring:message code="NoShipmentsFound"/>"
    			  },
   		   
  	        initComplete: function () {
  	            this.api().columns([0 , 1, 2 , 3, 4 , 5 ]).every( function () {
  	                var column = this;
  	                 var select = $('<select class="form-control js-example-basic-single" data-placeholder="'+column.header().textContent+'"><option value="All">All</option></select>')
  	                    .appendTo( $(column.footer()).empty() )
  	                    .on( 'change', function () {
  	                        var val = $.fn.dataTable.util.escapeRegex(
  	                            $(this).val()
  	                        );
  	                        
  	                        if(val == "All")
  	                        	{
  	                        	table
  	                        	 .columns(column).search( '' )
  	                        	 .draw();
  	                        	}
  	                        else{
  	                        column
  	                            .search( val ? '^'+val+'$' : '', true, false )
  	                            .draw();
  	                        }
  	                    } );
  	 
  	                column.data().unique().sort().each( function ( d, j ) {
  	                    select.append( '<option value="'+d+'">'+d+'</option>' )
  	                } );
  	            } );
  	            $('.js-example-basic-single').select2({

      		    });
  	           
  	        }
  	    
  	    } );
  	    
  	});
      
      
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>