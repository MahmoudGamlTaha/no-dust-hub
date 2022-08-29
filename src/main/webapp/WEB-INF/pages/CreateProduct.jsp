<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
             <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="CreateNewProduct"/></title>
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
	     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>

<style type="text/css">
#astr
{
    color: red;
    font-size: large;
     
    
}
#date_time_now{visibility:hidden;}
 #sig{visibility:hidden;}
   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}
#print_tbl
{
visibility:hidden;
}
#logoprint{visibility:hidden; display: none;}
#date_div
{
margin-top:5px;
float:left;
width:25%;
}
#agent_name_div
{
margin-top:5px;
float:left;
width:30%;
}
#warehouse_name_div
{
margin-top:5px;
margin-left:5px;

float:left;
width:40%;
}
#total_tbl
{
visibility:hidden;
}
 #nodust_misr
 {

 visibility:hidden;
 }
 #date_time_now
 {
 visibility:hidden;
 }
@font-face {
  font-family: ArbFONTS;
  src: url(ArbFONTS-Abdo-salem-Bold.ttf);
}

   </style>
   	 
 <style type="text/css" media="print">

 @page { size:A4 ;  }
  
  @media print {
  #master_data_div{
}
  #date_time_now{visibility:visible;}
  #sig{visibility:visible;}
  #astr{display:none;}
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
 #nodust_misr
 {
 visibility:visible;
 }
 #date_time_now
 {
 visibility:visible;
 }
 #tableBtns{
  display: none
 }
 
 #showDate{ color: black;}
  #titlepage{ display: none;}
}

#logoprint{visibility: visible; display:block;}
#example{
display:none;}
#print_tbl
{
visibility:visible;
}

#total_tbl
{
visibility:visible;
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
                           <a href="CreateProduct"><spring:message code="CreateNewProduct" /> </a><span class="divider-last">&nbsp; &nbsp;</span>
                       </li>
                     
                  </ul>
                
				  
				   
               </div>
            </div>
       
		                 <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:5%;   margin-top: -20px ; " id="logoprint">
	   
         
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4> <spring:message code="CreateNewProduct" /></h4>
                        </div>
                        
						<div class="widget-body" style="text-align: left;">


		<table width="100%" >
<tr>
<td>

<div class="row-fluid invoice-list" >
<div class="space10"></div>
                              
                             <div class="row-fluid" style="border : outset;" id="master_data_div">
                             <div class="widget-title">
                      <h4><spring:message code="OrderData_Page_Title"/></h4>
                      </div>
                                <div id="warehouse_name_div">
                                    <div> <h5 > <strong><spring:message code="warehousename" /> </strong>
                                     ${wareHouse} 	</h5></div>
                                </div>
                                 <div id="agent_name_div">
                                    <div > <h5 ><strong><spring:message code="Agentname" /></strong>
                                   ${agent}  	</h5></div>
                                </div>
                                
                                 <div id="date_div">
                                    <div > <h5 ><strong><spring:message code="Date" /> </strong>	
                                      ${date} </h5></div>
                                </div>
                                   <div class="space10"></div>  
                             </div>
                                
                            <div>
                          
                                 
                          
                                </div>
                            <div class="clearfix"></div>
                            	 <div >
 							
                          
                               
                           
                               
                               </div>
                               
                                    </div>
                                    
                                <div>
                           
                              
                               </div>
                               
                                
                       
</td>
</tr>
</table>
 						


                         
                  							               
                 
                    <div class="space20"></div>
                                 
                                        <div class="space20"></div>
                    
                        
                   
			
			               <form:form id="tableform" modelAttribute="clean_form" >
			
                            <div class="row-fluid">
                   <input id="order_id" style="display:none;"/>
                                <table id="example" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width: 80%; margin: auto;">
                                    <thead>
                                    <tr>
                                        <th><spring:message code="ProductName" /></th>
                                        <th><spring:message code="Quantity" /></th>
                                        <th style="display: none;">product_id</th>
                                     	<th style="display: none;">quantity</th>
                                     	<th style="display:none;">product_name</th>
                                     	
                                    </tr>
                                    
                                    </thead>
                                    <tbody>
                                    <tr class="odd gradeX ">
                                      <td>
                                      <select id="prod" class="js-example-basic-multiple product_select" onchange="change_product(this)">
                                      <option value="No_value"><spring:message code="PleaseSelect"/></option>
                                      <c:forEach items="${lst_products}" var="pro" varStatus="vs">
                                      <option value="${pro.product_sku}">${pro.product_name}</option>
                                      </c:forEach>
                                      </select>
                                      </td>
                                        <td><input required="required" min="1" onchange="changeQuantity(this)" type="number" class="span6" /></td>
                                <td style="display:none;"></td>
                                   
                                       <td style="display:none;"></td>
                                        <td style="display:none;"></td>
                                    </tr>
                                    </tbody>
                                </table>
                                <br><br>
                                 <div class="row-fluid  ">
                                <button type="button" id="submitBtn" onclick="submit_data()" class="btn btn-success pull-right  mright5" style="margin-bottom: 5px;"><i class="icon-save icon-white"></i> <spring:message code="Submit" /></button>
     
				          <button type="button" id="printBtn" style="margin-right:5px;" disabled="disabled" class="btn btn-primary pull-right" onclick="print_data();"><i class="icon-print  icon-white"></i> <spring:message code="Print" /></button>   
				  
                                             
              
                            </div> 
                                <table id="print_tbl" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width: 80%; margin: auto;">
                                <thead>
                                    <tr>
                                        <th><spring:message code="product_only" /></th>
                                        <th><spring:message code="Quantity" /></th>
                                       
                                     	
                                    </tr>
                                    
                                    </thead>
                                    <tbody></tbody>
                                </table>
                                <br><br><br>
                                <table id="total_tbl" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width: 80%; margin: auto;">
                  <thead>
                  <tr>
                  
                  <th><spring:message code="Component"/></th>
                  <th><spring:message code="ProductReconciliation.ProductTable.Quantity"/></th>
                  <th><spring:message code="measurementunit"/></th>
                  </tr>
                  </thead>
                  <tbody></tbody>
                  </table>
                            </div>
                            <br> <br> <br>   
                        <div  class="row-fluid  " > 
                            <strong id="nodust_misr" style="text-align:left; margin-left:25px;"><spring:message code="MisrNoDust"/></strong>
                       
                        <strong id="date_time_now" style="text-align: center; margin-left:200px;"> </strong>
                        </div>
                       <div class="space20"></div> 
                       <div class="clearfix"></div>
                                             
                  
                                       
                    </form:form>
                   			
						 </div>
						 <br> <br> <br>   
                       
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
   function submit_data()
   {
	   var validation=document.getElementById('tableform').reportValidity();
	   var check_flag="";
	   var Data_check=document.getElementsByTagName("select");
	   if(Data_check[0].value=="No_value")
		   {
		   check_flag="not_valid";
		   }
	   console.log(check_flag);
	   if(check_flag=="not_valid")
	   {
		   swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="SelectValidProduct"/>","error");
		   /*$.alert({
	            
                title: "<spring:message code="ShipmentList.Error.Title"/>",
    		    content:"<spring:message code="SelectValidProduct"/>"
                }); */
	   }
	   if(validation!=false)
		   {
		   if(check_flag!="not_valid" && validation!=false)
		   {
			   submitFunction();

		   }
		   else
			   {
			   }
		   }
	   
	   
   }
   function changeQuantity(val)
   {
	   var table=document.getElementById('example');
	   var quan=val.value;
	   var row_index=val.parentNode.parentNode.rowIndex;
	   table.rows[row_index].cells[3].innerHTML=quan;
   }
   
   function change_product(val)
   {
	   var table=document.getElementById('example');
	   var prod_id=val.options[val.selectedIndex].value;
	   var prod_name=val.options[val.selectedIndex].text;
	   var row_index=val.parentNode.parentNode.rowIndex;
	   table.rows[row_index].cells[2].innerHTML=prod_id; 
	   table.rows[row_index].cells[4].innerHTML=prod_name; 

   }
   
   function submitFunction()
   {
			document.getElementById('submitBtn').disabled=true;

	   var table = $('#example').tableToJSON(
    			  { }
    			  );
	   console.log(table);
	   var form_data={
			   "lst_prods":table
			   
	   };
	   console.log(form_data);
	   var xhttp = new XMLHttpRequest();
   	xhttp.onreadystatechange = function() {

   	if (this.readyState == 4 && this.status == 200) {
   		var response= this.responseText;
   		if(response>0)
   			{
   			document.getElementById('order_id').value=response;
   			document.getElementById('printBtn').disabled=false;
   			document.getElementById('submitBtn').disabled=true;
			$('#tableform input[type="number"]').prop("disabled", true);
			$('#tableform select').prop("disabled", true);

			swal("<spring:message code="ShipmentList.Success.Title"/>","<spring:message code="ProductCreatedSuccessfully"/>","success");
   		 /*$.alert({
 	          title: "<spring:message code="ShipmentList.Success.Title"/>",
 			    content:"<spring:message code="ProductCreatedSuccessfully"/>",
 	          }); */
   			}
   		else
   			{
   			document.getElementById('submitBtn').disabled=false;

   			swal("<spring:message code="ShipmentList.Error.Title"/>",response,"error");
   		 /*$.alert({
 	          title: "<spring:message code="ShipmentList.Error.Title"/>",
 			    content:response,
 	          }); */
   			}
   	}
   	}
   	xhttp.open("POST","SubmitCreateProduct", true);
	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
	 xhttp.send(JSON.stringify(form_data));
   }
   
   
   function print_data()
   {
	   var order_id=document.getElementById('order_id').value;
	   var consum={
			   "ids":order_id
	   };
	   var xhttp = new XMLHttpRequest();
	   	xhttp.onreadystatechange = function() {

	   	if (this.readyState == 4 && this.status == 200) {
	   		var response= this.responseText;
	   		var rows_materials="";
	   		var data=JSON.parse(response);
	   		for(var x=0;x<data.length;x++)
	   			{
	   			rows_materials+="<tr>"+
	   			"<td>"+data[x].product_name+"</td>"+
	   			"<td>"+data[x].quantity+"</td>"+
	   			"<td>"+data[x].unit+"</td>"+
	   			"</tr>";
	   			}
	   		$('#total_tbl tbody').html(rows_materials);
	   	 var rows="";
		   var tbl=document.getElementById('example');
		   var row_num=tbl.rows.length;
		   for(var x=1;x<row_num;x++)
			   {
			   var prod_name=tbl.rows[x].cells[4].innerHTML;
			   var quantity=tbl.rows[x].cells[3].innerHTML;
			   rows+="<tr>"+
			   "<td>"+prod_name+"</td>"+
			   "<td>"+quantity+"</td>"+
			   "</tr>";
			   }
		   $('#print_tbl tbody').html(rows);
		   var today = new Date();
			  var date=today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
			  var hours=today.getHours();
			  	 if(hours>12)
			  		 {
			  		 hours=hours-12;
			  		 }
		   var time = hours + ":" + today.getMinutes() + ":" + today.getSeconds();
		   var dateTime = date+'    '+time;
		   document.getElementById("date_time_now").innerText=dateTime;
		   window.print();
	   	}
	   	}
	 	xhttp.open("POST","GetRawMaterials", true);
		 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
		 xhttp.send(JSON.stringify(consum));
   }
   
  
   </script>
   <script >
    $(document).ready(function(){
    	
  	    $('.js-example-basic-multiple').select2();

    });
    
    
    

</script>

    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>