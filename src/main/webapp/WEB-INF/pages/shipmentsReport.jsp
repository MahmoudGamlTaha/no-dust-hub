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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>

<style type="text/css">
   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}
#tableDiv
{
width:100%;
  overflow:scroll;
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


#astr
{
    color: red;
    font-size: large;
     
    
}
.dataTables_wrapper .dataTables_filter {

display: none;
}




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
   
  
	 
		<jsp:include page="SideNaveNoDust.jsp">
		         <jsp:param name="param1" value="Dashboardli"/>
		 </jsp:include>	
   
    

    
	


		<div id="main-content">
	
         <div class="container-fluid">
            <div class="row-fluid">
               <div class="span12">
                  
                
			
                  <ul id="links"class=" breadcrumb mtop5 pull-left">
                       <li>
                           <a href="DashboardNoDust"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                   
                       <li>
                           <a href="#"><spring:message code="ShipmentReport"/></a><span class="divider-last">&nbsp; &nbsp;</span>
                       </li>
                     
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div >
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4><spring:message code="ShipmentReport"/></h4>
                        </div>
                        
						<div class="widget-body" >
 						

                   <div class="row-fluid" style="border:outset;">
                          <div  style="float:left;width:50%;margin-top: 5px">
                              <h5 style="float:left;margin-right: 62px;margin-left: 5px"> <strong><spring:message code="from_date"/><span id="astr"> * </span></strong></h5>
                              <input onchange="hideAllTables()" type="date" id="from_Date" style="display: inline-block;margin-left:3px;"/>
                                
                         </div>
                            <div style="float:left;width:50%;margin-top: 5px"">
                              <h5 style="float:left;margin-right: 45px;"><strong><spring:message code="to_date"/><span id="astr"> * </span></strong></h5>
								 <input onchange="hideAllTables()" type="date" id="to_Date" min="30-01-2018" style="display: inline-block; margin-left:3px;"/>
                           </div>
                             
                         <div style="float:left;width:50%;">
                              <h5 style="float:left;margin-right: 22px;margin-left: 5px" ><strong><spring:message code="warehousename"/><span id="astr">*</span></strong></h5>
								  <select onchange="hideAllTables()" id='sel_warehouse' class= "span10 js-example-basic-multiple select2-container_" style=" width:39% ;display: inline-block; margin-left:3px;" >
									        <option value=""><spring:message code="PleaseSelect"/> </option>
									        <c:forEach items="${warehouses}" var="warhouse">
									         <option value="${warhouse.id}">${warhouse.facility_name}</option>
									        </c:forEach>
								  </select>
                               
                            </div>
                            
                            
                            <div style="float:left;width:50%;">
                              <h5 style="float:left;margin-right: 22px;" ><strong><spring:message code="report_type"/><span id="astr">*</span></strong></h5>
								  <select onchange="hideAllTables()" id='sel_shipment' class= "span10 js-example-basic-multiple" style="width:39%; !important;">
									        <option value=""><spring:message code="PleaseSelect"/></option>
									        <c:forEach items="${types}" var="type">
									         <option value="${type.id}">${type.name}</option>
									        </c:forEach>
								  </select>
                         </div>
                         
             </div>			               
                          
                          
					
					
				
                         
         <button type="button" id="submitBtn" onclick="validateInputs()" class="btn btn-success pull-right  mright5 " style="margin-top:20px;"><i class=" icon-white mright5"></i><spring:message code="search" /> </button>
                         
                         
                          
                    <div class="space10"></div>
                               
                     
                            
                   
                  <div id = "tableDiv" class="scrollWrapper" style="display:none;">
                                <table  id="tableform"  class="table table-striped table-bordered   table-advance table-hover table-responsive " >
                                    <thead>
                                    <tr>
                                      
                                        <th class="shipId" ><spring:message code="ShipmentID"/></th>
                                        <th  style="width:fit-content;" class="shipDate" ><spring:message code="DateOnly"/></th>
                                        <th style="width:fit-content;" class="driver_" ><spring:message code="DriverNameOnly"/></th>
                                        <th style="width:fit-content;" class="agent" ><spring:message code="AgentName_"/></th>
                                        <th style="width:fit-content;" class ="manager_"><spring:message code="warehouseManager"/></th>
                                        <th style="width:fit-content;" class="sourc_"><spring:message code="Source_"/></th>
                                        <th style="width:fit-content;" class="destination_"><spring:message code="Destination_"/></th>
                                        <th style="width:fit-content;" class="product_type"><spring:message code="ProductType"/></th>
                                        <th style="width:fit-content;" ><spring:message code="status"/></th>
                                        <th style="width:fit-content;"  class="shipDetail"><spring:message code="Actions"/></th>
                                    
                                    </tr>
                                    
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th class="shipId" ><spring:message code="ShipmentID"/></th>
                                        <th style="width:fit-content;" class="shipDate"><spring:message code="DateOnly"/></th>
                                        <th style="width:fit-content;" class="driver_"><spring:message code="DriverNameOnly"/></th>
                                        <th style="width:fit-content;" class="agent"><spring:message code="AgentName_"/></th>
                                        <th style="width:fit-content;" class ="manager_"><spring:message code="warehouseManager"/></th>
                                        <th style="width:fit-content;" class="sourc_"><spring:message code="Source_"/></th>
                                        <th style="width:fit-content;" class="destination_"><spring:message code="Destination_"/></th>
                                        <th style="width:fit-content;" class="product_type"><spring:message code="ProductType"/></th>
                                        <th style="width:fit-content;" ><spring:message code="status"/></th>
                                        
                                        <th style="width:fit-content;" class="shipDetail"><spring:message code="Actions"/></th>
                                    </tr>
                                    </tfoot>
                                    <tbody> </tbody>
                                </table>
                                
                            </div>
                            <div id = "tableDiv2" style="display:none;">
                            
                                      <table id="tableConversion"  class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width: 80%">
                                    <thead>
                                    <tr>
                                      
                                        <th><spring:message code="OrderID"/></th>
                                        <th><spring:message code="DateOnly"/></th>
                                        <th><spring:message code="AgentName_"/></th>
                                        <th class="from_"><spring:message code="from_type"/></th>
                                        <th class="to_"><spring:message code="to_type"/></th>
                                        <th class="status_"><spring:message code="status"/></th>
                                        <th  class="shipDetail"><spring:message code="Actions"/></th>
                                    </tr>
                                    
                                    </thead>
                                    <tfoot>
                                    <tr>
                                         <th><spring:message code="OrderID"/></th>
                                        <th><spring:message code="DateOnly"/></th>
                                        <th><spring:message code="AgentName_"/></th>
                                        <th class="from_"><spring:message code="from_type"/></th>
                                        <th class="to_"><spring:message code="to_type"/></th>
                                        <th class="status_"><spring:message code="status"/></th>
                                        <th class="shipDetail"><spring:message code="Actions"/></th>
                                    </tr>
                                    </tfoot>
                                    <tbody> </tbody>
                                </table>
                            </div>
                            
                            <div id = "tableDiv3" style="display:none;">
                            
                                      <table id="tableChecks"  class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width: 80%">
                                    <thead>
                                    <tr>
                                      
                                        <th><spring:message code="checkID"/></th>
                                        <th><spring:message code="DateOnly"/></th>
                                        <th><spring:message code="RequestedBy"/></th>
                                        <th><spring:message code="status"/></th>
                                        <th><spring:message code="ApprovedBy"/></th>
                                        <th  class="shipDetail"><spring:message code="Actions"/></th>
                                    </tr>
                                    
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th><spring:message code="checkID"/></th>
                                        <th><spring:message code="DateOnly"/></th>
                                        <th><spring:message code="AgentName_"/></th>
                                        <th><spring:message code="status"/></th>
                                        <th><spring:message code="warehouseManager"/></th>
                                        <th  class="shipDetail"><spring:message code="Actions"/></th>
                                    </tr>
                                    </tfoot>
                                    <tbody> </tbody>
                                </table>
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
  		  "language":{
			  "zeroRecords": "No Shipments Found"
			  },
	        initComplete: function () {
	            $('.js-example-basic-single').select2({

    		    });
	           
	        }
	    
	    } );
	    
    	var table2=  $('#tableConversion').DataTable( {
    		  "order": [[ 0, "desc" ]] ,
    		 "bPaginate": false,
    		 "language":{
   			  "zeroRecords": "No Orders Found"
   			  },
  	        initComplete: function () {
  	     
  	            $('.js-example-basic-single').select2({

      		    });
  	           
  	        }
  	    
  	    } );
    	
    	var table2=  $('#tableChecks').DataTable( {
  		  "order": [[ 0, "desc" ]] ,
  		 "bPaginate": false,
  		  "language":{
			  "zeroRecords": "No Checks Found"
			  },
	        initComplete: function () {
	     
	            $('.js-example-basic-single').select2({

    		    });
	           
	        }
	    
	    } );
  	  
  	  
	 //   $('.js-example-basic-multiple').select2();
	   
	});
    
      $(document).ready(function() {
  	    $('.js-example-basic-multiple').select2();
  	  getShipments();
	  //  $('#from_date').val(new Date().toDateInputValue());

 	   
  	});
      function validateInputs(){
    	  document.getElementById("tableDiv").style.display = "none";
		 //  document.getElementById("noData").style.color = "white"; 
    	  var fromDate = document.getElementById("from_Date").value;
    	  var toDate = document.getElementById("to_Date").value;
    	  var x =new Date(fromDate).getTime();
    	  var y= new Date(toDate).getTime();
    	 
           var warhouse = document.getElementById('sel_warehouse').value ;
           var shipmentType = document.getElementById('sel_shipment').value ;
    	  if(fromDate=="" || toDate=="")
          {
    		  swal('<spring:message code="ShipmentList.Error.Title"/>','<spring:message code="date_error_message"/>',"error");
                /*$.alert({
           title: '<spring:message code="ShipmentList.Error.Title"/>',
           icon: 'glyphicon glyphicon-remove-sign',
           type: 'red',
           content: '<spring:message code="date_error_message"/>',
     				  });*/
                }
    	  else if(x>y)
    		  {
    		  swal('<spring:message code="ShipmentList.Error.Title"/>','<spring:message code="date_error_message2"/>',"error");
    		 /* $.alert({
    	           title: '<spring:message code="ShipmentList.Error.Title"/>',
    	           icon: 'glyphicon glyphicon-remove-sign',
    	           type: 'red',
    	           content:'<spring:message code="date_error_message2"/>',
    	       });*/
    		  
    		  }
    	  else if(warhouse == ""){
    		  swal('<spring:message code="ShipmentList.Error.Title"/>','<spring:message code="warehouse_error_msg"/>',"error");
    		 /* $.alert({
   	           title: '<spring:message code="ShipmentList.Error.Title"/>',
   	           icon: 'glyphicon glyphicon-remove-sign',
   	           type: 'red',
   	           content:  '<spring:message code="warehouse_error_msg"/>',
   	       });*/
   		  
    	  }
    	  else if(shipmentType ==""){
    		  swal('<spring:message code="ShipmentList.Error.Title"/>','<spring:message code="report_error_msg"/>',"error");
    		 /* $.alert({
      	           title: '<spring:message code="ShipmentList.Error.Title"/>',
      	           icon: 'glyphicon glyphicon-remove-sign',
      	           type: 'red',
      	           content: '<spring:message code="report_error_msg"/>',
      	       });*/
    	  }
    	  else{
    		  getShipments();
    	  }
    	  

      }
      function  getShipments() {
    		
       	  document.getElementById("tableDiv").style.display = "none";
		//  document.getElementById("noData").style.color = "white"; 
	      document.getElementById("tableDiv2").style.display = "none";

             var warhouse = document.getElementById('sel_warehouse').value ;
             var shipmentType = document.getElementById('sel_shipment').value ;
             var fromDate = document.getElementById("from_Date").value;
       	     var toDate = document.getElementById("to_Date").value;
             var x = warhouse+","+fromDate+","+toDate;
             if(warhouse != "" && shipmentType !="")
            	 {
             var shipData = {"shipment_type_id": shipmentType,
            		 "shipment_type": x}
             
             var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function() {

         	if (this.readyState == 4 && this.status == 200) {
         		var response= this.responseText;
         		var form = JSON.parse(response);
         		if (shipmentType<15)
         			{
	        		var ships= form["ships"];
	        		
	        		//alert(ships);
	        		//console.log(ships)
	        		if (ships.length>0)
	        			{
	        			loadTable(ships , shipmentType);
	        			}
         			}
         		else if (shipmentType<25){
         			var orders = form["orders"];
         			 
        			loadConversion(orders ,shipmentType);
        			
         		}
         		else{
         			var checks = form["checks"];
         			
        			loadChecks(checks);
        			
         		}
         		

         	 }
         	 }
         	 xhttp.open("POST","loadShipmentsReport", true);
         	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
         	 xhttp.send(JSON.stringify(shipData));
           }
    	
    	  
     }
      
      
      function hideAllTables()
      {
    	  document.getElementById("tableDiv").style.display = "none";
    	  document.getElementById("tableDiv2").style.display = "none";
    	  document.getElementById("tableDiv3").style.display = "none";
      }
      
      
      
      function loadChecks(checks) {
    	  $("#tableChecks").dataTable().fnDestroy()
          $('#tableChecks').DataTable( {
  		  "order": [[ 0, "desc" ]] ,
  		 "bPaginate": false,
  		  "language":{
			  "zeroRecords": "No Inventory Checks Found"
			  },
	        initComplete: function () {
	            $('.js-example-basic-single').select2({

    		    });
	           
	        }
	    
	    } );
    	  var table = $('#tableChecks').DataTable();
    	  document.getElementById("tableDiv2").style.display = "none";
    	  document.getElementById("tableDiv3").style.display = "contents";
    	  document.getElementById("tableDiv").style.display = "none";


    	//  $('#tableform tr').has('td').remove() ;
    	   table.clear().draw(); 
    	
    	if (checks == null){ 
    		
    		table
	          .columns( 1 )
	          .search( "no_value" )
	          .draw();

           table.columns([0,1,2,3,4]).every( function () {
               var column = this;
                var select = $('<select style="width: fit-content;" class="form-control  js-example-basic-single" data-placeholder="'+column.header().textContent+'"><option value="All">All</option></select>')
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
    	
    	
    	else if(checks.length >0)
    		{
				//document.getElementById("noData").style.color = "white"; 

    			for(var i =0 ; i<checks.length ; i++)
    				{
    				 var markup = '<tr> '+
    	             ' <td>'+checks[i].id+'</td>'+
    	             ' <td>'+moment(checks[i].check_date).format("DD-MM-YYYY ")+'</td>'+
    	             ' <td>'+checks[i].logged_user+'</td>'+
    	             ' <td>'+checks[i].last_status_id+'</td>'+
    	             ' <td>'+checks[i].warehouse_manager+'</td>' +
    	             ' <td class="shipDetail"><a href="InventoryReportDetails?CheckID='+checks[i].id+'"> <span class="label label-success normal" ><i class="icon-pencil mright5"></i><spring:message code="Readmore" /></span></a></td>' +
    	             '</tr>';
    	             table.row.add($(markup)).draw(false);
    	            
    	             //$("#tableform tbody").append(markup);
    	             
    				}
    			 table.columns([0,1,2,3,4]).every( function () {
		                var column = this;
		                 var select = $('<select style="width:fit-content;" class="form-control js-example-basic-single" data-placeholder="'+column.header().textContent+'"><option value="All">All</option></select>')
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
    			
        			//document.getElementById("noData").style.color = "black"; 

    				 document.getElementById("tableDiv3").style.display = "none";

    		}
          
			
	}
      
      
      
      
      
      function loadConversion(orders,shipmentType) {
    	  $("#tableConversion").dataTable().fnDestroy()
          $('#tableConversion').DataTable( {
  		  "order": [[ 0, "desc" ]] ,
  		 "bPaginate": false,
  		  "language":{
			  "zeroRecords": "No Orders Found"
			  },
	        initComplete: function () {
	            $('.js-example-basic-single').select2({

    		    });
	           
	        }
	    
	    } );
    	  
    	  var table = $('#tableConversion').DataTable();
    	  document.getElementById("tableDiv2").style.display = "contents";
    	  document.getElementById("tableDiv3").style.display = "none";
    	  document.getElementById("tableDiv").style.display = "none";
    	  var column = "table .from_";
    	  var column2 = "table .to_";
    	  var column3 = "table .status_";
    	  if( $(column2).is(":hidden") )
    		{
        $(column2).toggle();
    		}
  		if( $(column).is(":hidden") )
    		{
        $(column).toggle();
    		}
  		
  		if( $(column3).is(":hidden") )
    		{
        $(column3).toggle();
    		}
    	//  $('#tableform tr').has('td').remove() ;
    	   table.clear().draw(); 
    	//  $("#tableform").find("tr:gt(0) :gt(1) ").remove();
    	if (orders == null){ 
    		
    		table
	          .columns( 1 )
	          .search( "no_value" )
	          .draw();

           table.columns([0,1,2,3,4,5]).every( function () {
               var column = this;
                var select = $('<select style="width: fit-content;" class="form-control  js-example-basic-single" data-placeholder="'+column.header().textContent+'"><option value="All">All</option></select>')
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
          if(orders.length >0)
    		{
			//	document.getElementById("noData").style.color = "white"; 

    			for(var i =0 ; i<orders.length ; i++)
    				{
    				 var markup = '<tr> '+
    	             ' <td>'+orders[i].id+'</td>'+
    	             ' <td>'+moment(orders[i].order_time).format("DD-MM-YYYY ")+'</td>'+
    	             ' <td>'+orders[i].logged_user+'</td>'+
    	             ' <td class="from_">'+orders[i].from_type+'</td>'+
    	             ' <td class="to_">'+orders[i].to_type+'</td>' +
    	             ' <td class="status_">'+orders[i].order_status+'</td>' +
    	             ' <td class="shipDetail"><a href="OrderReportDetails?OrderID='+orders[i].id+'"> <span class="label label-success normal" ><i class="icon-pencil mright5"></i><spring:message code="Readmore" /></span></a></td>' +
    	             '</tr>';
    	             table.row.add($(markup)).draw(false);
    	            
    	             //$("#tableform tbody").append(markup);
    	             
    				}
    			 table.columns([0,1,2,3,4,5]).every( function () {
		                var column = this;
		                 var select = $('<select style="width:fit-content;" class="form-control js-example-basic-single" data-placeholder="'+column.header().textContent+'"><option value="All">All</option></select>')
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
    			
    		}
    	}
    		var realId= shipmentType-15;
    		if (realId==1 ||realId==4)
    			{
	    			if( !$(column).is(":hidden") )
	          		{
	              $(column).hide();
	          		}
	    			if( !$(column2).is(":hidden") )
	          		{
	              $(column2).hide();
	          		}
	    			if( !$(column3).is(":hidden") )
	          		{
	              $(column3).hide();
	          		}
    			
    			}
    		else if(realId ==3)
    			{
	    			if( !$(column2).is(":hidden") )
	          		{
	              $(column2).hide();
	          		}
	    			if( !$(column3).is(":hidden") )
	          		{
	              $(column3).hide();
	          		}
	    			if( $(column).is(":hidden") )
	          		{
	              $(column).toggle();
	          		}
    			
    			}
    		else{
    			if( $(column).is(":hidden") )
          		{
              $(column).toggle();
          		}
    			if( $(column2).is(":hidden") )
          		{
              $(column2).toggle();
          		}
    			if( $(column3).is(":hidden") )
          		{
              $(column3).toggle();
          		}
    		}
    		if (realId ==5)
    			{
	    			if( !$(column3).is(":hidden") )
	        		{
	            $(column3).hide();
	        		}
    			}
			/*if((shipmentType =='1'||shipmentType =='2' || shipmentType=='5') && (ships[0].state ==null))
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
	            	  
           }*/
    		
	}
      
      
      
      
      
      function loadTable(ships ,shipmentType) {
          $("#tableform").dataTable().fnDestroy()
          $('#tableform').DataTable( {
  		  "order": [[ 0, "desc" ]] ,
  		 "bPaginate": false,
  		  "language":{
			  "zeroRecords": "No Shipments Found"
			  },
	        initComplete: function () {
	            $('.js-example-basic-single').select2({

    		    });
	           
	        }
	    
	    } );
    	  var table = $('#tableform').DataTable();
    	  var column = "table .manager_";
    	  var column2 = "table .driver_";
    	  var column3 = "table .sourc_";
    	  var column4 = "table .destination_";
    	  var column5 = "table .product_type";
    	  document.getElementById("tableDiv").style.display = "block";
    	  document.getElementById("tableDiv3").style.display = "none";

    	  document.getElementById("tableDiv2").style.display = "none";

    	//  $('#tableform tr').has('td').remove() ;
    	   table.clear().draw(); 
    	   table
	          .columns( 1 )
	          .search( "" )
	          .draw();
    	//  $("#tableform").find("tr:gt(0) :gt(1) ").remove();
    		if( $(column2).is(":hidden") )
      		{
          $(column2).toggle();
      		}
    		if( $(column).is(":hidden") )
      		{
          $(column).toggle();
      		}
    		
    		if( $(column3).is(":hidden") )
      		{
          $(column3).toggle();
      		}
    		if( $(column4).is(":hidden") )
      		{
          $(column4).toggle();
      		}
    		if( $(column5).is(":hidden") )
      		{
          $(column5).toggle();
      		}
    		
    		
    		if(ships.length >1)
    		{
				//document.getElementById("noData").style.color = "white"; 

    			for(var i =0 ; i<ships.length ; i++)
    				{
    				//alert(ships[i].shipment_date);
    				 var markup = '<tr> '+
    	             ' <td style="width:fit-content;" class="ShipmentID">'+ships[i].shipment_id+'</td>'+
    	             ' <td style="width:fit-content;" class="shipDate" >'+moment(ships[i].shipment_date).format("DD-MM-YYYY ")+'</td>'+
    	             ' <td style="width:fit-content;" class ="driver_">'+ships[i].driver+'</td>'+
    	             ' <td style="width:fit-content;" class ="agent">'+ships[i].agent+'</td>'+
    	             ' <td style="width:fit-content;" class ="manager_">'+ships[i].manager+'</td>' +  
    	             ' <td style="width:fit-content;" class="sourc_">'+ships[i].source+'</td>'+
                     ' <td style="width:fit-content;" class="destination_">'+ships[i].destination+'</td>'+
                     ' <td style="width:fit-content;" class="product_type">'+ships[i].type+'</td>'+
                     ' <td style="width:fit-content;" >'+ships[i].status+'</td>'+
    	             ' <td style="width:fit-content;" class="shipDetail"><a href="ShipmentReportDetails?ShipmentID='+ships[i].shipment_id+'"> <span class="label label-success normal" ><i class="icon-pencil mright5"></i><spring:message code="Readmore" /></span></a></td>' +
    	             '</tr>';
    	             table.row.add($(markup)).draw(false);
    	            
    	             //$("#tableform tbody").append(markup);
    	             
    				}
    			 table.columns([0,1,2,3,4,5,6,7,8]).every( function () {
		                var column = this;
 		               console.log($(column.footer()));

		                 var select = $('<select style="width:fit-content;" class="form-control example js-example-basic-single" data-placeholder="'+column.header().textContent+'"><option value="All">All</option></select>')
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
    			console.log("state"+ships[0].state);
    			console.log(ships[0]);
    			if(ships[0].state == null)
    			{
        			console.log("length"+ships.length);

    				//document.getElementById("noData").style.color = "white"; 
    				 var markup = '<tr> '+
    	             ' <td class="ShipmentID">'+ships[0].shipment_id+'</td>'+
    	             ' <td class="shipDate">'+moment(ships[0].shipment_date).format("YYYY-DD-MM ")+'</td>'+
    	             ' <td class ="driver_">'+ships[0].driver+'</td>'+
    	             ' <td class ="agent">'+ships[0].agent+'</td>'+
    	             ' <td class ="manager_">'+ships[0].manager+'</td>' +
    	             '<td class="sourc_">'+ships[0].source+'</td>'+
                     '<td class="destination_">'+ships[0].destination+'</td>'+
                     ' <td class="product_type">'+ships[0].type+'</td>'+
                     ' <td >'+ships[0].status+'</td>'+
    	             ' <td class="shipDetail"><a href="ShipmentReportDetails?ShipmentID='+ships[0].shipment_id+'"> <span class="label label-success normal" ><i class="icon-pencil mright5"></i><spring:message code="Readmore" /></span></a></td>' +
    	             '</tr>';
    	             table.row.add($(markup)).draw(false);
    	             table.columns([0,1,2,3,4,5,6,7,8]).every( function () {
 		                var column = this;
 		                 var select = $('<select class="form-control  js-example-basic-single" data-placeholder="'+column.header().textContent+'"><option value="All">All</option></select>')
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
    				//document.getElementById("noData").style.color = "white"; 
    				 document.getElementById("tableDiv").style.display = "none";
    				location.reload();
    				}
    			else{
    				
    				 table
    		          .columns( 1 )
    		          .search( "no_value" )
    		          .draw();

    	             table.columns([0,1,2,3,4,5,6]).every( function () {
 		                var column = this;
 		                 var select = $('<select style="width: fit-content;" class="form-control  js-example-basic-single" data-placeholder="'+column.header().textContent+'"><option value="All">All</option></select>')
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

    		}
    		
			if((shipmentType =='1'||shipmentType =='2' || shipmentType=='5' ||shipmentType =='9') && (ships[0].state ==null))
          	 {
				if(shipmentType=='9'||shipmentType=='5'){
					
					if(shipmentType=='9')
					{
					if( $(column5).is(":hidden") )
		            	  $(column5).toggle();
					}
				else{
					if( !$(column5).is(":hidden") )
			               $(column5).hide();
				}
				
					if( $(column3).is(":hidden") )
	            	  $(column3).toggle();
				  if( $(column4).is(":hidden") )
		            	  $(column4).toggle();
					
				}
				else{
					if( !$(column3).is(":hidden") )
			               $(column3).hide();
					if( !$(column4).is(":hidden") )
			               $(column4).hide();
					if( !$(column5).is(":hidden") )
			               $(column5).hide();
				}
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
   <script type="text/javascript">
   var now = new Date(),
   minDate = now.toISOString().substring(0,10);

  $('#from_Date').prop('max', minDate);

  $('#to_Date').prop('max', minDate);
   </script>

    <script src="resources/assetsnodust/js/scripts.js"></script>
    
</body>
<!-- END BODY -->
</html>