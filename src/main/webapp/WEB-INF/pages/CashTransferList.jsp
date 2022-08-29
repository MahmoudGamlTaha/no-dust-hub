<!DOCTYPE html>

 <html lang="en">


<head>
   <meta charset="utf-8" />
         <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="CashTransferList"/>  </title>
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
{} 

.select2-container {width: 150px !important; }
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
                           <a href="ViewCashTransferList"> <spring:message code="CashTransferList"/> </a><span class="divider-last">&nbsp;</span>
                       </li>
                      
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title">
                           <h4> <spring:message code="CashTransferList"/></h4>
                        </div>
                        
						<div class="widget-body">
					
					   <div class="row-fluid" >
						<table id="shipmentTable" class="table dataTable table-striped table-bordered   table-advance table-hover table-responsive ">
						        <thead>
						            <tr>
						            <th style="width:fit-content;"><spring:message code="AttachmentOnly"/></th>
						            <th><spring:message code="ShipmentID"/></th>
						            
						            <th><spring:message code="Bankname"/> </th>
						            <th><spring:message code="Requestdate"/></th>
						            <th><spring:message code="Transferdate"/></th>
						            <th>Account</th>
						            <th>Amount</th>
									<th><spring:message code="Actions"/></th>
						            </tr>
						        </thead>
						      <tfoot>
									<tr>
									<th></th>
									<th><spring:message code="ShipmentID"/></th>
									<th><spring:message code="Bankname"/> </th>
						            <th><spring:message code="Requestdate"/></th>
						            <th><spring:message code="Transferdate"/></th>
						          <th>Account</th>
						            <th></th>
									<th></th>
									</tr>
									</tfoot>
				                <tbody>
				                
				                <c:forEach var="shipment" items="${cash_lst}">
						          <tr>
						          <td style="width:fit-content;">
						          <c:if test="${shipment.attachment==null}"> <a href="ViewCashTransferDetails?shipment_id=${shipment.shipment_id}"><img alt="" title="reattach" src="resources/assetsnodust/img/n_upload.png" width="20px;" height="20px;"></a></c:if>
						         <c:if test="${shipment.attachment!=null}"> <a href="${shipment.attachment}" download="Transfer_attachment" target="_new"><img alt="" title="download" src="resources/assetsnodust/img/n_download.png" width="20px;" height="20px;"></a>	
						         </c:if>
						          </td>
						            <td>${shipment.shipment_id}</td>
								     <td>${shipment.bank_name}</td>
								    <td>${shipment.request_date}</td>
								    <td>${shipment.t_date}</td>
								    <td>${shipment.account_sku }</td>
								    <td>${shipment.cash_amount }</td>
								  <td>
									   <a href="ViewCashTransferDetails?shipment_id=${shipment.shipment_id}"><span class="label label-success normal" ><i class="icon-pencil mright5"></i><spring:message code="Readmore"/></span></a>
									  <!--  <span class="label label-info normal" ><i class="icon-pencil mright5"></i>Edit</span>
									   <span class="label label-danger normal  "><i class="icon-trash mright5"></i>Delete</span> --> 
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
    	    	"language":{
      			  "zeroRecords": "<spring:message code="NoCashTransferFound"/>"
      			  },
    	        initComplete: function () {
    	            this.api().columns([ 1, 2,3,4,5]).every( function () {
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
