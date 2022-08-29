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
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <link rel="stylesheet" href="resources/css/jquery-confirm.min.css"/>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.5.1/css/colReorder.dataTables.min.css"/>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>

   <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
   <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
   <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
   <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
   <script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
   <script type="text/javascript" src="resources/assetsnodust/js/jasontable.js"></script>
<script type="text/javascript" src="resources/vendor/DatePicker/moment.js"></script>
 <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
   <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.js"></script>

<style type="text/css">
   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}

tfoot {
    display: table-header-group;
}
 #noData
 {
 color: white;
 }
 .dataTables_wrapper {
margin-left: 15px;

}
.select2-container {
width:80% !important;
}

.dataTables_wrapper .dataTables_filter {

display: none;
}

#logoprint{visibility:hidden;}


@font-face {
  font-family: ArbFONTS;
  src: url(ArbFONTS-Abdo-salem-Bold.ttf);
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
    

    
	


		<div id="main-content">
	
         <div class="container-fluid">
            <div class="row-fluid">
               <div class="span12">
                  
                
			
                  <ul id="links"class=" breadcrumb mtop5 pull-left">
                       <li>
                           <a href="DashboardNoDust"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                   
                       <li>
                           <a href="#"><spring:message code="GeneralReport.PageTitle"/></a><span class="divider-last">&nbsp; &nbsp;</span>
                       </li>
                     
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4><spring:message code="GeneralReport.PageTitle"/></h4>
                        </div>
                        
						<div class="widget-body" style="text-align: left;">
 						


                         
                  							               
                  <div class="control-group">
                              <label class="control-label black span2  " > <spring:message code="warehousename"/></label>
                              
                              <div class="controls">
                                <div class="input-group mb-3 ">
								  <select id='sel_warehouse' class= "span10 js-example-basic-multiple" >
									        <option value="">Select Warehouse </option>
									        <c:forEach items="${warehouses}" var="warhouse">
									         <option value="${warhouse.id}">${warhouse.facility_name}</option>
									        </c:forEach>
								  </select>
                                </div>
                              </div>
                         </div>
                            
					
					
				
                         <div class="control-group">
                              <label class="control-label black span2  " ><spring:message code="ShipmentType"/></label>
                              
                              <div class="controls">
                                <div class="input-group mb-3 ">
								  <select id='sel_shipment' class= "span10 js-example-basic-multiple" >
									        <option value="">Select Shipment type</option>
									        <c:forEach items="${types}" var="type">
									         <option value="${type.shipment_type_id}">${type.shipment_type}</option>
									        </c:forEach>
								  </select>
                                </div>
                              </div>
                         </div>
         <button type="button" id="submitBtn" onclick="getShipments()" class="btn btn-success pull-right  mright5 " style="margin-bottom: 5px;"><i class=" icon-white mright5"></i><spring:message code="search" /> </button>
                         
                        
                         
                    <div class="space10"></div>
                               
                    
                            <div class="row-fluid">
                   
                   <div id = "tableDiv" style="display:none;">
                                <table id="tableform"  class="table table-striped table-bordered   table-advance table-hover table-responsive ">
                                    <thead>
                                    <tr>
                                      
                                        <th class="shipId" ><spring:message code="ShipmentID"/></th>
                                        <th  class="shipDate" ><spring:message code="DateOnly"/></th>
                                        <th class="driver_" ><spring:message code="DriverNameOnly"/></th>
                                        <th class="agent" ><spring:message code="AgentName_"/></th>
                                        <th class ="manager_"><spring:message code="warehouseManager"/></th>
                                        <th  class="shipDetail"><spring:message code="Actions"/></th>
                                    
                                    </tr>
                                    
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th class="shipId" ><spring:message code="ShipmentID"/></th>
                                        <th class="shipDate"><spring:message code="DateOnly"/></th>
                                        <th class="driver_"><spring:message code="DriverNameOnly"/></th>
                                        <th class="agent"><spring:message code="AgentName_"/></th>
                                        <th class ="manager_"><spring:message code="warehouseManager"/></th>
                                        <th class="shipDetail"><spring:message code="Actions"/></th>
                                    </tr>
                                    </tfoot>
                                    <tbody> </tbody>
                                </table>
                                
                            </div>
								 <div  align="center"   >
                                 <strong id="noData" >
                                 NO Data Found
                                 </strong>
                              </div>
                            
                            </div>
                       <div class="space20"></div> 
                       <div class="clearfix"></div>
                                             
                  
                              
            
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
    </script>    
      

      
    <script>  
    $(document).ready(function() {
  	  var table=  $('#tableform').DataTable( {
  		  "order": [[ 0, "desc" ]] ,
  		 "bPaginate": false,
	        initComplete: function () {
	       /*     this.api().columns([0,2,3,4]).every( function () {
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
	            } );*/
	            $('.js-example-basic-single').select2({

    		    });
	           
	        }
	    
	    } );
	    
  	  
  	  
	 //   $('.js-example-basic-multiple').select2();
	   
	});
    
      $(document).ready(function() {
  	    $('.js-example-basic-multiple').select2();
  	  getShipments();
  	    
 	   
  	});
      function  getShipments() {
    		
       	  document.getElementById("tableDiv").style.display = "none";
			document.getElementById("noData").style.color = "white"; 
             var warhouse = document.getElementById('sel_warehouse').value ;
             var shipmentType = document.getElementById('sel_shipment').value ;
             
             if(warhouse != "" && shipmentType !="")
            	 {
             var shipData = {"shipment_type_id": shipmentType,
            		 "shipment_type": warhouse}
             
             var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function() {

         	if (this.readyState == 4 && this.status == 200) {
         		var response= this.responseText;
        		var ships=JSON.parse(response);
        		//alert(ships.length);
        		if (ships.length>0)
        			{
        			loadTable(ships , shipmentType);
        			}

         	 }
         	 }
         	 xhttp.open("POST","loadShipments", true);
         	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
         	 xhttp.send(JSON.stringify(shipData));
           }
    	
    	  
     }
      
      function loadTable(ships ,shipmentType) {
    	  var table = $('#tableform').DataTable();
    	  var column = "table .manager_";
    	  var column2 = "table .driver_";	 
    	  document.getElementById("tableDiv").style.display = "contents";
    	//  $('#tableform tr').has('td').remove() ;
    	   table.clear().draw(); 
    	//  $("#tableform").find("tr:gt(0) :gt(1) ").remove();
    		if( $(column2).is(":hidden") )
      		{
          $(column2).toggle();
      		}
    		if( $(column).is(":hidden") )
      		{
          $(column).toggle();
      		}
    	  
    		

    		
    		if(ships.length >1)
    		{
				document.getElementById("noData").style.color = "white"; 

    			for(var i =0 ; i<ships.length ; i++)
    				{
    				//alert(ships[i].shipment_date);
    				 var markup = '<tr> '+
    	             ' <td class="ShipmentID">'+ships[i].shipment_id+'</td>'+
    	             ' <td class="shipDate" >'+moment(ships[i].shipment_date).format("YYYY-DD-MM ")+'</td>'+
    	             ' <td class ="driver_">'+ships[i].driver+'</td>'+
    	             ' <td class ="agent">'+ships[i].agent+'</td>'+
    	             ' <td class ="manager_">'+ships[i].manager+'</td>' +
    	             ' <td class="shipDetail"><a href="GenralReportDetails?ShipmentID='+ships[i].shipment_id+'"> <span class="label label-success normal" ><i class="icon-pencil mright5"></i><spring:message code="Readmore" /></span></a></td>' +
    	             '</tr>';
    	             table.row.add($(markup)).draw(false);
    	            
    	             //$("#tableform tbody").append(markup);
    	             
    				}
    			 table.columns([0,1,2,3,4]).every( function () {
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
    		else{
    			if(ships[0].state == null)
    			{
    				document.getElementById("noData").style.color = "white"; 
    				 var markup = '<tr> '+
    	             ' <td class="ShipmentID">'+ships[0].shipment_id+'</td>'+
    	             ' <td class="shipDate">'+moment(ships[0].shipment_date).format("YYYY-DD-MM ")+'</td>'+
    	             ' <td class ="driver_">'+ships[0].driver+'</td>'+
    	             ' <td class ="agent">'+ships[0].agent+'</td>'+
    	             ' <td class ="manager_">'+ships[0].manager+'</td>' +
    	             ' <td class="shipDetail"><a href="GenralReportDetails?ShipmentID='+ships[0].shipment_id+'"> <span class="label label-success normal" ><i class="icon-pencil mright5"></i><spring:message code="Readmore" /></span></a></td>' +
    	             '</tr>';
    	             table.row.add($(markup)).draw(false);
    	             table.columns([0,1,2,3,4]).every( function () {
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
    	           //  $("#tableform tbody").append(markup);
    			}
    			else if(ships[0].state =="no session")
    				{
    				document.getElementById("noData").style.color = "white"; 
    				 document.getElementById("tableDiv").style.display = "none";
    				location.reload();
    				}
    			else{
        			document.getElementById("noData").style.color = "black"; 

    				 document.getElementById("tableDiv").style.display = "none";
    			}

    		}
    		
			if((shipmentType =='1'||shipmentType =='2' || shipmentType=='5') && (ships[0].state ==null))
          	 {
          	if( !$(column).is(":hidden") )
          		{
              $(column).hide();
          		}
          	if( $(column2).is(":hidden") )
      		{
          $(column2).toggle();
      		}
          	 }
           else if (ships[0].state ==null){
        	   console.log(column2);
           	if( !$(column2).is(":hidden") )
               $(column2).hide();
              if( $(column).is(":hidden") )
	            	  $(column).toggle();
	            	  
           }
    		
	}
      function submitForm() {
    	  document.getElementById("submitBtn").disabled = true;
    	  if($("#tableform input:checkbox:checked").length > 0){
    		  document.getElementById("inventoryForm").submit();

    	  }
    	  else{
        	  document.getElementById("submitBtn").disabled = false;

    	  }
	}
   </script>
   
   

    <script src="resources/assetsnodust/js/scripts.js"></script>
    
</body>
<!-- END BODY -->
</html>