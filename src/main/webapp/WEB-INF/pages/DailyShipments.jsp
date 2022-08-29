<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
             <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="DailyShipment"/></title>
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
       
   
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
          <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
     
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>

	 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
	   <script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
	     <script type="text/javascript" src="resources/assetsnodust/js/jasontable.js"></script>
	     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
      <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
   <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.js"></script>
   	     <script type="text/javascript" src="resources/assetsnodust/js/jasontable.js"></script>
<style type="text/css">
#astr
{
    color: red;
    font-size: large;
     
    
}
#type_val{
visibility:hidden;
}
#nodust_misr
{
visibility:hidden;
}
#data
{
visibility:hidden;
}
#cancel_btn
{
visibility:hidden;
}
#example
{
visibility:hidden;
}
#tableBtns
{
visibility:hidden;
}
#submitBtn
{
visibility:hidden;
}
#printBtn
{
visibility:hidden;
}
#date_time_now{visibility:hidden;}
 #sig{visibility:hidden;}
   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}

#logoprint{visibility:hidden;}
#dest_val
{
display:none;
}
#print_tbl
{
visibility:hidden;
}
#warehouse_name_div
  {
  margin-left:5px;
  float:left;
  width:35%;
  }
  
  #agent_name_div
  {
  float:left;
  width:30%;
  }
  #date_div
  {
  float:left;
  width:30%;
  }
#driver_val
{
display:none;}
@font-face {
  font-family: Arial, Helvetica, sans-serif;;
  src: url(ArbFONTS-Abdo-salem-Bold.ttf);
}

   </style>
   	 
 <style type="text/css" media="print">

 @page { size:A4 ;  }
  
  @media print {
  #driver_val
{
visibility:visible;
display:inline-block;
margin-top:8px;
}
  #date_time_now{visibility:visible;}
  #sig{visibility:visible;}
  #astr{display:none;}
  table td.first { display: none; }
  table th.first { display: none; }
  #printBtn {
    display: none;
  }
  #driver_div
  {
  float:left;
  width:50%;
  }
  #dest
  {
  float:left;
  width:50%;
  }
  #type_style
  {
  display:none;
  }
  #example
  {
  display:none;
  }
  #nodust_misr
{
visibility:visible;
}
#type_val{
visibility:visible;
display:inline-block;
margin-top:8px;
}
  #verif_div
  {
  display:none;
  }
  #cancel_btn
  {
  display:none;
  }
  #submitBtn {
    display: none;
  }
  #dest_style
  {
  display:none;
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
 #print_tbl
 {
 visibility:visible;
 }
 #tableBtns{
  display: none
 }
 
 #showDate{ color: black;}
  #titlepage{ display: none;}
}

#logoprint{visibility: visible;}
#driver_style
{
display:none;
}
#dest_val
{
visibility:visible;
display:inline-block;
margin-top:8px;
}
#contentpage{ margin-top: -50px;}

 #Header, #Footer { display: none !important; color: white !important ; background: red; }
#footer{ display: none;  }

@page {	margin:0;}
body{ margin: 1.6cm}



}
</style>

<style>

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
                           <a href="DailyShipmentsData"><spring:message code="DailyShipment"/></a><span class="divider-last">&nbsp; &nbsp;</span>
                       </li>
                     
                  </ul>
                
				  
				   
               </div>
            </div>
       
		                 <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" display:none; width: 25%;  float: right; margin-right:5%;   margin-top: -20px ; " id="logoprint">
	   
         
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4><spring:message code="DailyShipment"/></h4>
                        </div>
                        
						<div class="widget-body" style="text-align: left;">


		<table width="100%" >
<tr>
<td>

<div class="row-fluid invoice-list" >
                              
                             <div class="widget-body">
						<div class="row-fluid">
						<table  style="display:none;" id="shipment_data" class="table table-striped table-bordered   table-advance table-hover table-responsive">
						<thead>
						<tr>
						<th><spring:message code="ShipmentTypeOnly"/></th>
						<th><spring:message code="TotalNum"/></th>
						</tr>
						</thead>
						<tbody>
						                        <c:forEach items="${lst_daily_shipment}" var="shipment">
						<tr>
						<td>${shipment.shipment_type}</td>
						<td>${shipment.total_num}</td>
						
						</tr>
						</c:forEach>
						</tbody>
						</table>
						
                       
                        </div>
                        
                           <div id="piechart" style="width: 900px; height: 500px;"></div>
 <c:if test="${financial_access=='Yes'}">
                        <h5 style="margin-left:20px;"> <strong>Expected Cash To Be In : ${expected_cash}</strong></h5>
</c:if>
                        <div  style="display:none;" class="chart">
                        <canvas id="ship_chart"></canvas>
                        </div>
	

	
						 </div>
						 	
	
                        </div>
                       </td>
                       </tr>
                       </table>
                       </div>
                       
	
                    
 <div class="row-fluid">
                  <div class="span12">
                        <div class="widget"> 

                        
                         
	</div>
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
 
   <script>
      jQuery(document).ready(function() {			
      	// initiate layout and plugins
      	App.init();
      	
      });
      
</script>
  <script type="text/javascript">
   function BuildChart(labels, values, chartTitle) {
	   var ctx = document.getElementById("ship_chart").getContext('2d');
	   var myChart = new Chart(ctx, {
	     type: 'pie',
	     data: {
	       labels: labels, 
	       datasets: [{
	         label: chartTitle, 
	         data: values, 
	         backgroundColor: [ 
	           'rgba(255, 99, 132, 0.2)',
	           'rgba(54, 162, 235, 0.2)',
	           'rgba(255, 206, 86, 0.2)',
	           'rgba(75, 192, 192, 0.2)',
	           'rgba(153, 102, 255, 0.2)',
	           'rgba(255, 159, 64, 0.2)'
	         ],
	         borderColor: [ // Add custom color borders
	           'rgba(255,99,132,1)',
	           'rgba(54, 162, 235, 1)',
	           'rgba(255, 206, 86, 1)',
	           'rgba(75, 192, 192, 1)',
	           'rgba(153, 102, 255, 1)',
	           'rgba(255, 159, 64, 1)'
	         ],
	         borderWidth: 1 
	       }]
	     },
	     options: {
	       responsive: true, 
	       maintainAspectRatio: false,  
	     }
	   });
	   return myChart;
	 }
   </script>
   <script type="text/javascript">
   $(document).ready(function() {
	   var table=document.getElementById("shipment_data");
	   var json=[];
	   var headers=[];
	   for(var x=0;x<table.rows[0].cells.length;x++)
		   {
		   headers[i]='x';
		   }
	   for(var i=1;i<table.rows.length;i++)
		   {
		   var row=table.rows[i];
		   var row_Data={};
		   for(var j=0;j<row.cells.length;j++)
			   {
			   row_Data[headers[j]]=row.cells[j].innerHTML;
			   }
		   json.push(row_Data);
		   }
	   console.log(json);
	   var labels = json.map(function (e) {
		   return e.shipment_type;
		 });
	   console.log(labels);
	   var values = json.map(function (e) {
		   return e.total_num;
		 });
	   console.log(values);
	   var chart=BuildChart(labels,values,"<spring:message code="TotalShipmentsOfTheDay"/>");
	   
   });
   </script>
     <script type="text/javascript">
     var lst_shipments='${lst_daily_shipment}';
    	var table2 = $('#shipment_data').tableToJSON(
    			  { }
    			  );
    	console.log(table2);
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
  
      function drawChart() {
    	  var total_dispatch='${total_dispatch_num}';
    	  var total_reconciled='${total_reconciliation_num}';
    	 var total_cash= '${total_cash}'
  		var total_cash_received='${total_cash_received}';
  		var total_laundry='${total_laundry}';
  		var total_internal_cash_transfer='${total_internal_transfer}';
  		var total_shipment_cash_transfer='${total_cash_transfer}';
  		var total_new='${total_new}';
        var data = google.visualization.arrayToDataTable([
        	
          ['Type', 'Total_Num'],
          ['Shipment Dispatch',     ${total_dispatch_num}],
          ['Shipment Reconciliation',      ${total_reconciliation_num}],
          ['Shipment Cash',${total_cash}],
          ['Shipment Cash Received',${total_cash_received}],
          ['Shipment Laundry',${total_laundry}],
          ['Internal Cash Transfer' , ${total_internal_transfer}],
          ['Shipment Cash Transfer' , ${total_cash_transfer}],
          ['New Shipment',${total_new}]
        ],false);

        var options = {
          title: "<spring:message code="TotalShipmentsOfTheDay"/>"
        };
  	   var table=document.getElementById("shipment_data");

     /*   var x_data=google.visualization.arrayToDataTable();
        x_data.addColumn('string', 'Shipment Type');
        x_data.addColumn('number','Total Number');
        x_data.addRows(1);
        x_data.setCell(0, 0, 'Dispatch');
        x_data.setCell(0, 1, {});*/
 	// var data=google.visualization.arrayToDataTable();
 	
 	 //  var x_data= google.visualization.arrayToDataTable($parse.jsonData(lst_shipments));
 	   console.log(data);
        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>