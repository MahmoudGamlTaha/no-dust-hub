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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
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
div.MaskedDiv 
{
	visibility: hidden;
	position:absolute;
	left:0px;
	top:0px;
	font-family:verdana;
	font-weight:bold;
	padding:40px;
    z-index:100;
	_background-image:none;
}
.details
{
display:none;
}
#tableDiv
{
width:100%;
  overflow:scroll;
}
#data_div
{
visibility:hidden;
}
tfoot {
    display: table-header-group;
}
#exportExcel
{
visibility:hidden;
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
                           <a href="CashTransferReport">Cash Transfer Report</a><span class="divider-last">&nbsp; &nbsp;</span>
                       </li>
                     
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div >
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4>Cash Transfer Report</h4>
                        </div>
                         
						<div class="widget-body" >
 						<div class="widget-title" >
                           <h4>Transfer Data</h4>
                        </div>

                   <div class="row-fluid" style="border:outset;">
                          <div  style="float:left;width:50%;margin-top: 5px">
                              <h5 style="float:left;margin-right: 62px;margin-left: 5px"> <strong><spring:message code="from_date"/><span id="astr"> * </span></strong></h5>
                              <input onchange="hideAllTables()" type="date" id="from_Date" style="display: inline-block;margin-left:3px;"/>
                                
                         </div>
                            <div style="float:left;width:50%;margin-top: 5px">
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
                              <h5 style="float:left;margin-right: 50px;" ><strong>Cash Account : <span id="astr">*</span></strong></h5>
								  <select onchange="hideAllTables()" id='sel_shipment' class= "span10 js-example-basic-multiple" style="width:39%; !important;">
									        <option value=""><spring:message code="PleaseSelect"/></option>
									        <c:forEach items="${lst_accounts}" var="acc">
									         <option value="${acc.product_sku}">${acc.product_name}</option>
									        </c:forEach>
								  </select>
                         </div>
                         
             </div>			               
                          
                          
					
					
				
                         
         <button type="button" id="submitBtn" onclick="validateInputs()" class="btn btn-success pull-right  mright5 " style="margin-top:20px;"><i class=" icon-white mright5"></i><spring:message code="search" /> </button>
                                                                   							 <button type="button" id="exportExcel"  onclick="ExportTableOUtAsExcel()" class="btn btn-primary pull-right" style="    margin-top: 20px; margin-right: 10px;"><i class="icon-save icon-white"></i> Save As Excel</button>                                         
                         
                         
                          
                    <div class="space10"></div>
                               
                     
                            <div id="data_div">
                            <table id="table_data" style="width:80%;" class="table dataTable table-striped table-bordered   table-advance table-hover table-responsive ">
                            <thead>
                          <tr>  
                          <th>Transaction Date </th>
                             <th style="display:none;">Transfer Date </th>
                             <th>Payment Reference</th>
                          <th>Comment</th>
                          <th>Credit</th>
                          <th>Debit</th>
                          <th>Balance</th>
                          <th>Transaction Type</th>
                            </tr>
                            </thead>
                            <tbody>
                            
                            </tbody>
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
  	    $('.js-example-basic-multiple').select2();
        
 	   
  	});
      function validateInputs(){
    	  var fromDate = document.getElementById("from_Date").value;
    	  var toDate = document.getElementById("to_Date").value;
    	  var x =new Date(fromDate).getTime();
    	  var y= new Date(toDate).getTime();
    	 
           var warhouse = document.getElementById('sel_warehouse').value ;
           var shipmentType = document.getElementById('sel_shipment').value ;
    	  if(fromDate=="" || toDate=="")
          {
    		  swal('<spring:message code="ShipmentList.Error.Title"/>','<spring:message code="date_error_message"/>',"error");
               
                }
    	  else if(x>y)
    		  {
    		  swal('<spring:message code="ShipmentList.Error.Title"/>','<spring:message code="date_error_message2"/>',"error");
    		
    		  
    		  }
    	  else if(warhouse == ""){
    		  swal('<spring:message code="ShipmentList.Error.Title"/>','<spring:message code="warehouse_error_msg"/>',"error");
    		
   		  
    	  }
    	  else if(shipmentType ==""){
    		  swal('<spring:message code="ShipmentList.Error.Title"/>',"Please Select Valid Cash Account ! ","error");
    		
    	  }
    	  else{
    		get_data();
    		document.getElementById("exportExcel").style.visibility='visible';
    	  }
    	  

      }
     
      function get_data()
      {
    	  var from_date=document.getElementById("from_Date").value;
    	  var to_date=document.getElementById("to_Date").value;
    	  var warehouse_id=document.getElementById("sel_warehouse").value;
    	  var product=document.getElementById("sel_shipment").value;
    	  var data={
    			  "from_date": from_date,
    			  "to_date":to_date,
    			  "facility_id":warehouse_id,
    			  "product_id":product
    	  }
    	  var xhttp = new XMLHttpRequest();
      	xhttp.onreadystatechange = function() {

      	if (this.readyState == 4 && this.status == 200) {
      		var response= this.responseText;
      		if(response!='noprod')
      			{
      			var resp=JSON.parse(response);
      			console.log(resp);
      			//var x=resp.lst_products;
      			//var pro_type=resp.lst_products_types;
      			var rows="";
      			for(var i=0;i<resp.length;i++)
      				{
      				//var previous=parseFloat(resp[i].previous_amount).toFixed(2);
      				//console.log(previous);
      				var bal=resp[i].previous_amount;
      				var comm=resp[i].comments;
      				var ref=resp[i].payment_refrence;
      				if(resp[i].comments==null || resp[i].comments=="null" )
      					{
      					
      					
      					comm="";
      						
      					}
      				if(resp[i].payment_refrence==null || resp[i].payment_refrence=="null")
      					{
      					ref="";
      					}
      				else
      					{
      					if(resp[i].transaction_type=="Shipment Reconciliation")
  						{
      						var comm_val=resp[i].comments;
      					comm="<a href=ShipmentReportDetails?ShipmentID="+resp[i].id+">"+comm_val+"</a>";
  						}
      					}
      				rows+="<tr> <td>"+resp[i].transaction_date+"</td> <td style='display:none;'>"+resp[i].transfer_date+"</td><td>"+ref+"</td><td>"+comm+"</td><td>"+resp[i].added+"</td><td>"+resp[i].deducted+"</td><td>"+bal+"</td><td>"+resp[i].transaction_type+"</td></tr>";
      				}
      			$('#table_data tbody').html(rows);
      			document.getElementById("data_div").style.visibility="visible";
      			}
      		else
      			{
      			var rows="<tr><td colspan='7' style='text-align:center;'>No Transfer Found </td></tr>"
      			$('#table_data tbody').html(rows);
      			document.getElementById("data_div").style.visibility="visible";
      			}
      	}
      	}
      	 xhttp.open("POST","GetTransfers", true);
    	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    	 xhttp.send(JSON.stringify(data));
      			
    	  console.log(data);
      }
      
      function hideAllTables()
      {
    	 document.getElementById("data_div").style.visibility="hidden";
    	 document.getElementById("exportExcel").style.visibility="hidden";
      }
      
      function display_det(x)
      {
    	 var index=x.parentNode.parentNode.rowIndex;
    	  var class_list=x.classList;
    	  var tbl = document.getElementById("table_data");
    	  if (class_list.contains("fa-plus-circle"))
    		  {
    		  x.classList.remove("fa-plus-circle");
        	  x.classList.add("fa-minus-circle");
        	  tbl.rows[index+1].style.display='table-row';
    		  }
    	  else
    		  {
    		  x.classList.remove("fa-minus-circle");
        	  x.classList.add("fa-plus-circle");
        	  tbl.rows[index+1].style.display='none';
    		  }
    	 
      }
      
      
   </script>
 
   <script type="text/javascript">
   var now = new Date(),
   minDate = now.toISOString().substring(0,10);

  $('#from_Date').prop('max', minDate);

  $('#to_Date').prop('max', minDate);
  
   </script>
<script>
function ExportTableOUtAsExcel() {
    var uri = 'data:application/vnd.ms-excel;charset=UTF-8;base64,',
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
	    
	    var rows=document.getElementById("table_data").rows;
    	
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
   
    link.download = "Cash Transfers.xls";
    link.href = uri + base64(format(template, ctx))
    link.click();
  }

</script>

    <script src="resources/assetsnodust/js/scripts.js"></script>
    
</body>
<!-- END BODY -->
</html>