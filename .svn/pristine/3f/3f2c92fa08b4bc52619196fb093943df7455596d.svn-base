<!DOCTYPE html>

 <html lang="en">

<head>

   <meta charset="utf-8" />
      <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title><spring:message code="LaundryShipment"/></title>
   <link href="img/no.jpeg" rel="icon" />
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
   <link href="resources/assetsnodust/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />  
   	 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
   
        <link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.5.1/css/colReorder.dataTables.min.css"/>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
   
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
   <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
   
   <link href="resources/assetsnodust/css/style.css" rel="stylesheet" />
<!--    <link href="resources/assetsnodust/css/style_arabic.css" rel="stylesheet" />  --> 

 <style type="text/css" media="print">

 @page { size:A4 ;  }
  
  @media print {
  
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
 
 #tableBtns{
  display: none
 }
 
 #showDate{ color: black;}
  #titlepage{ display: none;}
}

#logoprint{visibility: visible;}

#contentpage{ margin-top: -50px;}

 #Header, #Footer { display: none !important; color: white !important ; background: red; }
#footer{ display: none;  }

@page {	margin:0;}
body{ margin: 1.6cm}



}
</style>

<style type="text/css">
tfoot {
    display: table-header-group;
}
table.dataTable tfoot th, table.dataTable tfoot td {
  /*  padding: 5px; */
    border-top: 1px solid #111;
}
.select2-container {
width:80% !important;
}

#logoprint { display: none;}

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
                    
                       <li><a href="ViewDirtyShipments"> <spring:message code="ViewDirtyShipments.PageTitle"/></a><span class="divider-last">&nbsp;</span></li>
                  </ul>
      	  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title">
                           <h4> <spring:message code="DirtyShipmentsList"/></h4>
                        </div>
                        
                        <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:35%; margin-top: -150px ; " id="logoprint">
                        
						<div class="widget-body">
						<div class="space10"></div>
						<div class="widget-title">
                           <h4> <spring:message code="WarehouseData_Page_Title"/></h4>
                        </div>
						  <div  style="border:outset;">
                                    <div > <h5 style="margin-left:5px;"><strong><spring:message code="warehousename" /></strong>	
                                   ${warehouse_name}  </h5></div>
                                   <div class="space10"></div>
                                </div>
                                <div class="space20"></div>
							<table id="example" style="margin-left: 14px;" class="table dataTable table-striped table-bordered table-advance table-hover table-responsive" style="width:fit-content;">
						        <thead>
						            <tr>
						            <th><spring:message code="ShipmentID"/></th>
									<th><spring:message code="ProductReconciliation.LostTable.Source"/></th>
									<th><spring:message code="DateOnly"/></th>
									<th><spring:message code="status"/></th>
									<th><spring:message code="Actions"/></th>
						            </tr>
						        </thead>
						         <tfoot>
                                     <tr>
						            <th><spring:message code="ShipmentID"/></th>
									<th><spring:message code="ProductReconciliation.LostTable.Source"/></th>
									<th><spring:message code="DateOnly"/></th>
								    <th><spring:message code="status"/></th>
									<th><spring:message code="Actions"/></th>
						            </tr>
						            
                                    </tfoot>
						 
						 
						        <c:forEach var="shipment" items="${dirtyList}" varStatus="loop">
						                   <tr>
						                    <td>${shipment.shipment_id}</td>
						                    <td>${shipment.facility_name}</td>
						                    <td><fmt:formatDate value="${shipment.shipment_expected_delivery_date}" pattern="dd-MM-yyyy" /> </td>
						                    <td><c:if test="${shipment.last_status ==1 }"><spring:message code="pending"/></c:if>
						                    <c:if test="${shipment.last_status == 5}"><spring:message code="approved"/></c:if>
						                    </td>
						                    <th><a href="DirtyShipmentDetails?shipmentID=${shipment.shipment_id}"><span class="label label-success"><i class="icon-pencil mright5"></i><spring:message code="Readmore" /></span></a>  </th>
						                </tr>
						      
						        </c:forEach>
						      
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
       &copy; <spring:message code="CopyRights" />
   
   </div>
 
 <!-- Open & close MENU -->
  
   <script>
      jQuery(document).ready(function() {			
      	App.init();
      	
      	
      });
      
      $(document).ready(function() {
    	  var table=  $('#example').DataTable( {
    		  "language":{
    			  "zeroRecords":"<spring:message code="NoShipmentsFound"/>"
    		  },
    		  "order": [[ 0, "desc" ]] ,
  	        initComplete: function () {
  	            this.api().columns([0,1,2,3]).every( function () {
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
  	    
    	  
    	  
  	 //   $('.js-example-basic-multiple').select2();
 	   
  	});
    
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>