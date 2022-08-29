<!DOCTYPE html>

 <html lang="en">


<head>
   <meta charset="utf-8" />
         <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="ReconciliationShipments"/></title>
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

.dataTables_wrapper {
margin-left: 15px;
}

.dataTables_wrapper .dataTables_length , 
.dataTables_wrapper .dataTables_info
{ margin-left: 15px;} 
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
                           <a href="ReceivingCashOnCover"> <spring:message code="ReceivingCahsoncoverlbl"/> </a><span class="divider-last">&nbsp;</span>
                       </li>
                      
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title">
                           <h4> <spring:message code="ReconciliationShipments"/></h4>
                        </div>
                        
						<div class="widget-body">
					
					
						<table id="shipmentTable" class="table table-striped table-bordered" style="margin-left: 10px;">
						        <thead>
						            <tr>
						            <th><spring:message code="ShipmentID"/></th>
						            <th><spring:message code="ReceivingProduct.DriverName"/> </th>
						            <th><spring:message code="ShipmentDate"/></th>
									<th><spring:message code="Actions"/></th>
						            </tr>
						        </thead>
						      <tfoot>
									<tr>
									<th><spring:message code="ShipmentID"/></th>
									<th><spring:message code="ReceivingProduct.DriverName"/></th>
									<th><spring:message code="ShipmentDate"/></th>
									<th></th>
									</tr>
									</tfoot>
				                <tbody>
				                
				                <c:forEach var="shipment" items="${shipmentlst}">
						          <tr>
						            <td>${shipment.shipment_obj.id}</td>
								     <td>${driver.full_name_en}</td>
								    <td>${shipment.shipment_date }</td>
								  <td>
									   <a href="ReceivingCashOnCoverDetails?driver_id=${shipment.shipment_obj.shippment_souce_id}&shipment_id=${shipment.shipment_obj.id}"><span class="label label-success normal" ><i class="icon-pencil mright5"></i><spring:message code="Readmore"/></span></a>
									
						            </td>
				                </tr>
				                </c:forEach>
						       </tbody>       
                            </table>
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
 
   <script>
      jQuery(document).ready(function() {			
      	// initiate layout and plugins
      	App.init();
      });
      
      $(document).ready(function() {
    	    
    	    
    	  
    	    var table=  $('#shipmentTable').DataTable( {
    	        initComplete: function () {
    	            this.api().columns([0 , 1, 2]).every( function () {
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
