<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
      <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="DailyInventoryCheckDetails"/></title>
   <link href="img/no.jpeg" rel="icon" />
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
   <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
   
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
   <link href="resources/assetsnodust/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />  
  <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
   
   <link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.5.1/css/colReorder.dataTables.min.css"/>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>
   <link href="resources/assetsnodust/css/style.css" rel="stylesheet" />
 <!--    <link href="resources/assetsnodust/css/style_red.css" rel="stylesheet" /> -->
 <!--   <link href="resources/assetsnodust/css/style_arabic.css" rel="stylesheet" lang="ar"/>  --> 
 <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
   <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.js"></script>
   
      <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
      <script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
      <script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.print.min.js"></script>
   
   
<style type="text/css">
#logoprint{visibility: hidden;}
#p_id{  display: none;}
#date_time_now
{
visibility:hidden;
}
#warehouse_val
  {
  display:none;
  }
#space_div
 {
 display:none;
 }
#nodust_misr
{
margin-left:25px;
visibility:hidden;
}
.dataTables_filter, .dataTables_info {margin-right:150px; }
.dataTables_wrapper .dataTables_filter{float:left;}
</style>   
   <style type="text/css" media="print">


  @page { size:A4 ; }
  
  @media print {
  
 #date_time_now
{
visibility:visible;
}
#select_div
{
display:none;
}
#nodust_misr
{
visibility:visible;
}
  #printBtn {
    display: none;
  }
  #submitBtn {
    display: none;
  }
  #links{
  display: none
  }
  #warehouse_val
  {
  margin-left:5px;
  display:inline-block;
  }
 #navBar{
  display: none
 }
 #sidemenu{
 display: none
 }
 #endorsement
 {
 direction: rtl;
 }
 #space_div
 {
 display:block;
 }
 #titlepage{ display: none;}
}

#logoprint{visibility: visible;}
#t_foot
{
display:none;
}
#contentpage{ margin-top: -50px;}

 #Header, #Footer { display: none !important; }
#footer{ display: none;}
.dataTables_filter, .dataTables_info { display: none; }
</style>
   <style >
   
  @media {
  .item.list-group-item img {width: 17% !important;  }
  
  
  }

 
  tfoot {
    display: table-header-group;
}
  
.item.list-group-item
{
    float: none;
    width: 100%;
    background-color: #fff;
    margin-bottom: 10px;
    margin-left: 0;
}

.item.list-group-item img
{
    float: left;
    width: 20%; 
    margin-right: 10px;
}
table.dataTable tfoot th, table.dataTable tfoot td {
  /*  padding: 5px; */
    border-top: 1px solid #111;
}
.select2-container {
width:fit-content; !important;
}
.item.list-group-item:after
{
    clear: both;
}


#grid .row-fluid .span3 { width: 21.9% !important]}
   
   
   </style>
</head>

<body class="fixed-top">
<div id="navBar">
	<jsp:include page="NavBarNoDust.jsp">
	         <jsp:param name="param1" value="Dashboardli"/>
	 </jsp:include>
	 </div>
      
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
                  
                
			
                  <ul id="links"class=" breadcrumb mtop5 pull-left">
                       <li>
                           <a href="DashboardNoDust"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                       <li>
                           <a href="DailyInventoryCheck"><spring:message code="DailyInventoryCheck"/></a><span class="divider">&nbsp;</span>
                       </li>
                       <li>
                           <a href="DailyInventoryCheckDetails?InventoryCheckID=${check_data.inventory_check_id}"><spring:message code="DailyInventoryCheckDetails"/><span class="divider">&nbsp;</span></a>
                       </li>
                       <li><a href="#"></a><span class="divider-last">&nbsp;</span></li>
                  </ul>
                
				  
				   
               </div>
            </div>
       
                        <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:35%; margin-top: -50px ; " id="logoprint">
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                     
                        <div class="widget-title" >
                           <h4 id="titlepage"><spring:message code="DailyInventoryCheckDetails"/></h4>
                          
                        </div>
                        
						<div class="widget-body" style="text-align: left;">
						
                           
                            
                          
    
    <div id="products" class="row-fluid list-group">

<table style="width:100%">
<tr>
<td>
<div class="space10"></div>
<div class="widget-title">
                      <h4><spring:message code="DailyInventoryCheckData"/></h4>
                      </div>
                            <div  style="border:outset;">
                            
                      <div class="space10"></div>
                        <div class="row-fluid">
                        <div style="float:left; width: 35%;">
                        <h5>
                        <strong style="margin-left:5px;"><spring:message code="DailyInventoryCheckID"/></strong>
                        ${check_data.inventory_check_id}
                        </h5>
                        </div>
                        <div style="float:left;width:35%;">
                        <h5>
                        <strong><spring:message code="warehousename"/></strong>
                        ${WarehouseName}
                        </h5>
                        </div>
                        <div style="float:left;width:30%;">
                        <h5>
                        <strong><spring:message code="Date"/></strong>
                     <fmt:formatDate value="${check_data.inventory_check_time}" pattern="dd-MM-yyyy HH:mm" />
                        
                        </h5>
                        
                        </div>
                        </div>
                           <div class="space10"></div>
                              
 </div>
 </td>
 </tr>
 </table>


     						<div class="widget-body" id = "tableDiv">
						<div id="space_div" class="space10"></div>
							<table id="example" style="margin-left: 14px; margin:auto; width:80%;" class="table dataTable table-striped table-bordered table-advance table-hover table-responsive" >
						        <thead>
						            <tr>
						            <th ><spring:message code="product_only"/></th>
									<th ><spring:message code="ProductType"/> </th>
									<th><spring:message code="ProductReconciliation.ProductTable.Treatment"/></th>
									<th ><spring:message code="Quantity"/></th>
						            </tr>
						        </thead>
						         <tfoot id="t_foot">
                                     <tr>
						            <th ><spring:message code="product_only"/></th>
									<th ><spring:message code="ProductType"/> </th>
									<th><spring:message code="ProductReconciliation.ProductTable.Treatment"/></th>
									
									<th ><spring:message code="Quantity"/></th>
						            </tr>
						            
                                    </tfoot>
						 
						 
						        <c:forEach var="product"  items="${products}" varStatus="loop">
						        <c:if test="${product.total_quantity!=null}">
						                   <tr>
						                    <td >${product.product_name}</td>
						                    <td >${product.type} </td>
						                    <td>${product.treatment_name}</td>
						                    <td >${product.total_quantity}  </td>
						                </tr>
						      </c:if>
						        </c:forEach>
						      
                             </table>
                       
                       <button type="button" id="printBtn"  class="btn btn-primary pull-right" onclick="printFun()"><i class="icon-print  icon-white"></i> <spring:message code="Print" /></button>   
                       
						
						 </div>
        
    </div>
</div>
            <div  class="row-fluid  " > 
                            <strong id="nodust_misr" style="text-align:left;"><spring:message code="MisrNoDust"/></strong>
                       
                        <strong id="date_time_now" style="text-align: center; margin-left:200px;"> </strong>
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
   <!-- END FOOTER -->
  
  <!-- BEGIN JAVASCRIPTS -->		
   
 
 
 <!-- Open & close MENU -->
  
   <script>
   
  
      jQuery(document).ready(function() {			
      	// initiate layout and plugins
      	App.init();
      	
      	
      	
      	$(".sidebar-togggler").hide();
		$(".sidebar-toggler").show();
      	
    	$("#translatetoarabic").hide();
    	
    	$("#translatetoarabic").click(function(){
    		$("link[href*='arabic']").remove(); 
    		$("#translatetoarabic").hide();
    		$("#translatetoenglish").show();
    	});
    	
    	$("#translatetoenglish").click(function(){
        	
    	 	$(".sidebar-toggler").hide();
    		$(".sidebar-togggler").show();
    		
        		<!-- $("link[href*='style']").attr("href" , "css/" + $(this.val()+".css"));  -->
        		$('head').append('<link rel="stylesheet" href="resources/assetsnodust/css/style_arabic.css" type="text/css" />');
        		$("#translatetoarabic").show();
        		$("#translatetoenglish").hide();
        	});
    	
      });
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
  
  <script type="text/javascript">
  
  function printFun() {
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
  
  
    $(document).ready(function() {
  	  var table=  $('#example').DataTable( {
  		"language":{
			  "zeroRecords": "<spring:message code="NoProductsFound"/>"
			  },
			  "bPaginate": false,
	        initComplete: function () {
	            this.api().columns([0,1,2]).every( function () {
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
    	
  	  
  	  
  	  if('${financail}' !="false")
  		  {
  		var table = $('#example').DataTable();
  		var column = "table .proType";
  	  var column2 = "table .proTrt";
  	 $(column).hide();
  	 $(column2).hide();
  		  }
    	
    	
    	$('#products .item').addClass('list-group-item');
        $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
        $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
    });
  
    </script>

<script type="text/javascript">
function  clearDiv() {
	 document.getElementById("tableDiv").style.display = "none";
	
	   var e = document.getElementById("warehouseSelect");
	   var wareHouseId = e.options[e.selectedIndex].value;
		var xhttp = new XMLHttpRequest();
    	xhttp.onreadystatechange = function() {
    	if (this.readyState == 4 && this.status == 200) {
    		var response= this.responseText;
    		var products=JSON.parse(response);
    		console.log(products);
    		
    			 loadData(products);
    			
    	 }
    	 }
    	 xhttp.open("POST","loadWarehouseProducts", true);
    	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    	 xhttp.send(JSON.stringify(wareHouseId));
    	
}
function loadData(products) {
	 var table = $('#example').DataTable();
	 table.clear().draw();
	var allProdusts = "";
	if(products.length >1)
	{
		 document.getElementById("tableDiv").style.display = "contents";
		for(var i =0 ; i<products.length ; i++)
			{

			 var markup = '<tr> '+
			     ' <td class="proName">'+products[i].product_name+'</td>'+
	             ' <td class="proType" >'+products[i].p_type+'</td>'+
	             ' <td id="p_id" class ="proId">'+products[i].product_id+'</td>'+
	             ' <td class ="proTrt">'+products[i].treatment+'</td>'+
	             ' <td class ="proQ">'+products[i].quantity+'</td>' +
	             '</tr>';
	             table.row.add($(markup)).draw(false);
	             table.columns([0,1,2,3]).every( function () {
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
		// $('#bigDiv').html(allProdusts);
		// $('#products .item').addClass('list-group-item');
	}
	else{
		if(products[0].state == null)
		{
			 var markup = '<tr> '+
		     ' <td class="proName">'+products[0].product_name+'</td>'+
             ' <td class="proType" >'+products[0].p_type+'</td>'+
             ' <td id="p_id" class ="proId">'+products[0].product_id+'</td>'+
             ' <td class ="proTrt">'+products[0].treatment+'</td>'+
             ' <td class ="proQ">'+products[0].quantity+'</td>' +
             '</tr>';
             table.row.add($(markup)).draw(false);
             
			 table.columns([0,1,2,3]).every( function () {
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
		else if(products[0].state =="no session")
			{
			location.reload();
			}
	}
	
}
</script>
    <script>
    $('.js-example-basic-multiple').select2({

	    });
    </script>
</body>

</html>