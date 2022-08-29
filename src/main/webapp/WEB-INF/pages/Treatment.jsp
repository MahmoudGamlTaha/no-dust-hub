<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
             <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="ProductsTreatment" /> </title>
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
   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}
#astr
{
    color: red;
    font-size: large;
     
    
}
#cons_total
{
visibility:hidden;
}
#cons_det{
visibility:hidden;
}
#printBtn
{
visibility:hidden;
}
#submitBtn
{
visibility:hidden;
}
#deleterows
{
visibility:hidden;
}
#addrows
{
visibility:hidden;
}
#example
{
visibility:hidden;
}
#cancel_btn
{
visibility:hidden;
}
#nodust_misr{
  visibility:hidden;
  }
  #warehouse_name_div{
  margin-left:5px;
  float:left;
  width:35%;
  }
  #agent_name_div
  {
  float:left;
  width:30%;
  }
   
  #assign_date_div
  {
   float:left;
  width:30%;
  }
#logoprint{visibility:hidden; display:none;}
#date_time_now
{
visibility:hidden;
}
#from_value
{
display:none;
}
#to_value
{
display:none;

}
#print_tbl{
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
  
  table td.first { display: none; }
  table th.first { display: none; }
  #cancel_btn
  {
  display : none;
  }
  #man_to{
float:left;
}
 #astr
  {
  display:none;
  }
  
  #nodust_misr{
  visibility:visible;
  }
  #print_tbl{
  visibility:visible;
  }
  #example{
  display:none;
  }
  #cons_total
{
visibility:visible;
}
#cons_det{
visibility:visible;
}
  #printBtn {
    display: none;
  }
  #submitBtn {
    display: none;
  }
  #from_style{
display:none;
}
#to_style{
display:none;
}
#from_value
{
display:inline-block;
margin-top:10px;
visibility:visible;


}
#to_value
{
display:inline-block;
margin-top:10px;
visibility:visible;

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
 #man_from
 {
 float:left;
 width:50%;
 }
 #man_to
 {
 float:left;
 width:50%;
 }
#date_time_now
{
visibility:visible;
}
#logoprint{visibility: visible; display:block;}

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
                           <a href="ProductTreatment"><spring:message code="ProductsTreatment" /> </a><span class="divider-last">&nbsp; &nbsp;</span>
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
                           <h4> <spring:message code="ProductsTreatment" /></h4>
                        </div>
                        
						<div class="widget-body" style="text-align: left;">


		<table width="100%" >
<tr>
<td>
<div class="space10"></div>
<div class="widget-title">
                           <h4> <spring:message code="OrderData_Page_Title" /></h4>
                        </div>
<div class="row-fluid invoice-list" style="border:outset;">
                              <div class="space10"></div>
                             <div>
                                
                                    <div id="warehouse_name_div"> <h5 ><strong><spring:message code="warehousename" /> </strong>	
                                     ${dying_form.warehouse_name}</h5></div>
                                
                                  <div id="agent_name_div"> <h5 ><strong><spring:message code="Agentname" /></strong>
                                   ${dying_form.agent_name}  	</h5></div>
                                    <div id="assign_date_div"> <h5 ><strong><spring:message code="Date" /> </strong>
                                      ${dying_form.conv_date} 	</h5></div>
                                
                             </div>
                                
                            <div>
                                
                                   
                                

                               </div>
                            <div class="clearfix"></div>
                            	  <div>
                            	 <div class="span12" style="margin-left: 0;">
                            	 <div class="span6" id="man_from">
                            	  <div style="float: left; margin-right: 5px;" > <h5 style="display: inline-block; margin-left:5px;"><strong><spring:message code="ConvertFrom"/></strong></h5> <span id="astr"> * </span> </div>
                            	                                      <h5 id="from_value"></h5>
                            	  
                                     <div  style="margin-top: 5px; margin-left: 15px;" id="from_style">
                            	 <select id="from" onchange="get_to_types(this)" class= "span6 js-example-basic-multiple">
                            	 <option><spring:message code="PleaseSelect"/></option>
                            	 <c:forEach items="${from_types}" var="type" varStatus="vs">
                            	 <option value="${type.type_id}">${type.type_name}</option>
                            	 </c:forEach>
                            	 </select>
                            	 </div>
                            	 </div>
                            	 <div class="span6" id="man_to">
                            	   <div style="float: left; margin-right: 5px;" > <h5 style="display: inline-block;"><strong><spring:message code="ConvertTo" /></strong></h5> <span id="astr"> * </span> </div>
                            	                               	                                       <h5 id="to_value"></h5>
                            	   
                                     <div  style="margin-top: 5px; margin-left: 15px; " id="to_style">
                            	 <input  id="program_data" style="display:none;"/>
                            	 
                            	 <select id="to" onchange="get_washing_programs(this)" class= "span6 js-example-basic-multiple">
                            	   <option><spring:message code="PleaseSelect"/></option>

                            	 </select>
                            	      <button type="button" id="next_btn" onclick="Check_from_to()" class="btn btn-success pull-right green mright5" style="margin-right:20px;"><i class="icon-save icon-white"></i> <spring:message code="Next"/></button>
                            	 
                            	 </div>
                            	 </div>
                            	 
                                    </div>
                                    
                                    </div>
                               
                                <div class="space10"></div>
                            </div>
</td>
</tr>
</table>
 						


                         
                  							               
                 
                    <div class="space10"></div>
                            <div id="tableBtns" class="row-fluid  ">
    
			          <button id="deleterows" class="btn btn-danger pull-right delete-row mright5 "  style="margin-bottom: 5px; margin-right: 5px;"><i class="icon-trash icon-white mright5"></i><spring:message code="DeleteRow" /></button>  
				  
                           <button id="addrows" class="btn btn-success pull-right add-row mright5 " style="margin-bottom: 5px; "><i class="icon-plus icon-white mright5"></i><spring:message code="AddRow" /></button>
                                             
                           <div class="space10"></div>                             
                            </div>         
                    
                        
			
			               <form:form id="tableform" modelAttribute="dirtyForm" >
			 <datalist  id="times" style="display:none;">
                           
                            </datalist>
                            <div class="row-fluid">
                   <input id="treatments" style="display:none;"/>
                                <table id="example" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width: fit-content; margin: auto;">
                                    <thead>
                                    <tr>
                                        <th class="first"><input class="firstCheck" type='checkbox' name='record1' onchange="selectDeselectAll(this)"></th>
                                        <th><spring:message code="ProductName" /></th>
                                        <th><spring:message code="ProductReconciliation.ProductTable.Treatment"/></th>
                                        <th><spring:message code="TreatmentProgram" /></th>
                                        <th><spring:message code="MachineNumber" /></th>
                                        <th><spring:message code="Quantity" /></th>
                                        <th style="display: none">product_id</th>
                                     	<th style="display: none" >washing_programs_id</th>
                                     	<th style="display: none">machine_num</th>
                                     	
                                     	<th style="display: none">quantity</th>
                                        <th data-override="total_stock_quantity"><spring:message code="CurrentQuantity" /></th>
                                        <th style="display:none;">treatment_id</th>
                                        <th style="display:none;">product_name</th>
                                         <th><spring:message code="WashingTime"/></th>
                                        <th style="display:none;">order_time</th>
                                        <th style="display:none;">t_name</th>
                                    </tr>
                                    
                                    </thead>
                                    <tbody>
                                    <tr class="odd gradeX ">
                                   
                                        
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="space20"></div>
                                 <div class="row-fluid  ">
                            <input id="order_id" style="display:none;"/>
    <input id="program_data" style="display:none;"/>
                               <button type="button" id="submitBtn" onclick="submitFunction()" class="btn btn-success pull-right  mright5" style="margin-bottom: 5px;"><i class="icon-save icon-white"></i> <spring:message code="Submit" /></button>
    
				  				                 <button type="button" onclick="Back_Types()" class="btn btn-success pull-right  green mright5" id="cancel_btn" style="display='none'; margin-right: 4px; "><i class="icon-save icon-white"></i> <spring:message code="Back"/></button>
				  				          <button type="button" id="printBtn"  disabled="disabled" class="btn btn-primary pull-right" onclick="print_data();" style="margin-right:5px;"><i class="icon-print  icon-white"></i> <spring:message code="Print" /></button>   
				  
                                             
                                                      
                            </div>   
                                <table id="print_tbl" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width: fit-content; margin: auto;">
                                <thead>
                                    <tr>
                                        <th><spring:message code="product_only" /></th>
                                        <th><spring:message code="ProductReconciliation.ProductTable.Treatment"/></th>
                                        <th><spring:message code="TreatmentProgram" /></th>
                                        <th><spring:message code="MachineNumber" /></th>
                                        <th><spring:message code="Quantity" /></th>
                                        
                                         <th><spring:message code="WashingTime"/></th>
                                    </tr>
                                    
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                       <div class="space20"></div> 
                       <div class="clearfix"></div>
                                                <div id="cons_det" class="row-fluid ">
                 <strong> <spring:message code="ConsumableDetails"/> </strong>
                  <table id="details_tbl" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width: fit-content; margin: auto;">
                  <thead>
                  <tr>
                  <th><spring:message code="DyingProgram"/></th>
                  <th><spring:message code="Consumable"/></th>
                  <th><spring:message code="ProductReconciliation.ProductTable.Quantity"/></th>
                  </tr>
                  </thead>
                  <tbody></tbody>
                  </table>
                  <br>
                  </div>
                  <div id="cons_total" class="row-fluid ">
                  <br>
                  <table id="total_tbl" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width: fit-content; margin: auto;">
                  <thead>
                  <tr>
                  
                  <th><spring:message code="Consumable"/></th>
                  <th><spring:message code="ProductReconciliation.ProductTable.Quantity"/></th>
                  <th><spring:message code="measurementunit"/></th>
                  </tr>
                  </thead>
                  <tbody></tbody>
                  </table>
                  </div>
                  
                                     
                    </form:form>
                   			
						 </div>
						 
                        </div>
                         <br> <br> <br>   
                      <div  class="row-fluid  " > 
                            <strong id="nodust_misr" style="text-align:left; margin-left:25px;"><spring:message code="MisrNoDust"/></strong>
                       
                        <strong id="date_time_now" style="text-align: center; margin-left:200px;"> </strong>
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
      	document.getElementById("treatments").value='${treatment}';
      });
      
      function get_times()
      {
   	   var d = new Date(); 
      	d.setHours(0,0,0,0); 
      	var date = d.getDate();
      	var timeArr = [];
      	var options="";
      	var datalist=document.getElementById('times');
      	while ( date == d.getDate() )
      	{
      		var option=document.createElement('option');
      	   var hours = d.getHours();
      	   var minutes = d.getMinutes();
      	  // hours = hours == 0 ? 12: hours; //if it is 0, then make it 12
      	   var ampm = "am";
      	   ampm = hours > 12 ? "pm": "am";
      	 //  hours = hours > 12 ? hours - 12: hours; //if more than 12, reduce 12 and set am/pm flag
      	   hours = ( "0" + hours ).slice(-2); //pad with 0
      	   minute = ( "0" + d.getMinutes() ).slice(-2); //pad with 0
      	   var val= hours + ":" + minute ;
      	   timeArr.push( hours + ":" + minute + " " + ampm );
      	   options+=val+"</option>";
      	   var op=document.createElement('option');
      	   op.value=val;
      	 datalist.appendChild(op);
      	   d.setMinutes( d.getMinutes() + 5); //increment by 5 minutes
      	}
      	
      	
      }
      
      function changetreatment(val)
      {
    	  var index = val.selectedIndex ; 
          var rowIndex = val.parentNode.parentNode.rowIndex;
          var value=val.value;
          document.getElementById("example").rows[rowIndex].cells[11].innerHTML=value;

          document.getElementById("example").rows[rowIndex].cells[15].innerHTML=val.options[val.selectedIndex].text;
          if(index==0)
        	  {
        	  document.getElementById("example").rows[rowIndex].cells[11].innerHTML='';
        	  document.getElementById("example").rows[rowIndex].cells[15].innerHTML='';

        	  }
      }
      
      function Back_Types()
      {
     	 document.getElementById("printBtn").style.visibility='hidden';
     		document.getElementById("submitBtn").style.visibility='hidden';
     		document.getElementById("deleterows").style.visibility='hidden';
     		document.getElementById("addrows").style.visibility='hidden';
     		document.getElementById("example").style.visibility='hidden';
     		document.getElementById("cancel_btn").style.visibility='hidden';
     		document.getElementById("next_btn").style.visibility='visible';

     		document.getElementById("from").disabled=false;
     		document.getElementById("to").disabled=false;
     		var emp_val="";
     		$("#example tbody").html(emp_val);
      }
      
      function get_products_data()
      {
     	 var programs_data=JSON.parse(document.getElementById("program_data").value);
     	 console.log(programs_data);
     	 var from_id=document.getElementById("from").value;
     	 var fac='${fac}';
     	 var Dying_form={
     			 "from_type" : from_id		 ,
     			 "fac_id" : fac
     	 };
     	 console.log(Dying_form);

     	 var xhttp = new XMLHttpRequest();
     	 	xhttp.onreadystatechange = function() {

     	 	if (this.readyState == 4 && this.status == 200) {
     	 		
     	 		var response= this.responseText;
     	 		console.log(response);
     	 		if(response!='No_Pro')
     	 			{
     	 			var programs_data=JSON.parse(document.getElementById("program_data").value);
     	 			var programs="<select  onchange='changingwashing(this)' id='program' class='washingSelect' style='width:fit-content;' ><option value='No_value'>Please Select</option>";
     	 			for(var w=0;w<programs_data.length;w++)
     	 				{
     	 				programs+="<option value="+programs_data[w].id+">"+programs_data[w].program+"</option>";
     	 				}
     	 			programs+="</select>";
     	 			var treatments_data=JSON.parse(document.getElementById("treatments").value);
     	 			var treatments="<select id='treatment' style='width:auto;' class='treatmentselect' onchange='changetreatment(this)'> <option value='No_value'>Please Select</option>";
     	 			for(var x=0;x<treatments_data.length;x++)
     	 				{
     	 				treatments+="<option value="+treatments_data[x].treatment_id+">"+treatments_data[x].treatment_name+"</option>";
     	 				}
     	 			treatments+="</select>";
     	 		var products_data=JSON.parse(response);
     	 		console.log(products_data);
     	 		var products="<select  id='product' onchange='changingproduct(this)'  class='productSelect' style='width:fit-content;' ><option value='No_value'>Please Select</option>";
     	 		for(var x=0;x<products_data.length;x++)
     	 			{
     	 			products+="<option value="+products_data[x].product_sku+','+products_data[x].total_stock_quantity+">"+products_data[x].product_name+"</option>"
     	 			}
     	 		products+="</select>"
     	 		var rows="<tr><td class='first'><input type='checkbox' name='record' disabled='disabled'></td>";
     	 		rows+="<td>"+products+"</td>";
     	 		rows+="<td>"+treatments+"</td>";
     	 		
     	 		rows+="<td>"+programs+"</td>";
     	 		rows+="<td><input required='required' min='1' onchange='changeMachine(this)' type='number'   /></td>";
     	 		rows+="<td><input required='required'  onchange='changeQuentity(this)' type='number'  /></td>";
     	 		rows+="<td style='display:none;'></td>";
     	 		rows+="<td style='display:none;'></td>";
     	 		rows+="<td style='display:none;'></td>";
     	 		rows+="<td style='display:none;'></td>";
     	 		rows+="<td></td>";
     	 		rows+="<td style='display:none;'></td>";
     	 		rows+="<td style='display:none;'></td>";
     	 		rows+="<td><input required='required' onchange='changeTime(this)' type='time' list='times'/></td>";
     	 		rows+="<td style='display:none;'></td>";
     	 		rows+="<td style='display:none;'></td>";
     	 		rows+="</tr>";
     	 		$("#example tbody").html(rows);
     	 		document.getElementById("printBtn").style.visibility='visible';
     	 		document.getElementById("submitBtn").style.visibility='visible';
     	 		document.getElementById("deleterows").style.visibility='visible';
     	 		document.getElementById("addrows").style.visibility='visible';
     	 		document.getElementById("example").style.visibility='visible';
     	 		document.getElementById("cancel_btn").style.visibility='visible';
     	 		document.getElementById("next_btn").style.visibility='hidden';

     	 		document.getElementById("from").disabled=true;
     	 		document.getElementById("to").disabled=true;
     	 		
     	 			}
     	 		else
     	 			{
     	 			swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="NoAvailableProductsOfType"/> ","error");
     	 			/*$.alert({
     			          title: "<spring:message code="ShipmentList.Error.Title"/>",
     					    content:"<spring:message code="NoAvailableProductsOfType"/> ",
     			          });*/
     	 			}
     	 	}
     	 	}
     	 	 xhttp.open("POST","GetProductsForDying", true);
     	 	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
     	 	 xhttp.send(JSON.stringify(Dying_form));
      }
      
      function Check_from_to()
      {
     	 var from_type=document.getElementById("from").value;
     	 var to_type=document.getElementById("to").value;
     	 if(from_type=="Please Select" || to_type=="Please Select")
     		 {
     		 swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="SelectValidTypes"/>","error");
     		/* $.alert({
     	          title: "<spring:message code="ShipmentList.Error.Title"/>",
     			    content:"<spring:message code="SelectValidTypes"/>",
     	          });*/
     		 }
     	 else
     		 {
     	 get_products_data();
     		 }
      }
    
      function get_to_types(val)
      {
      	var selection=val.options[val.selectedIndex].text;
      	var value=val.value;
      	if(value!="Please Select")
      		{
      	var prod_type={
      			"type_id" : value , 
      			"type_name" :selection
      	};
      	var xhttp = new XMLHttpRequest();
      	xhttp.onreadystatechange = function() {

      	if (this.readyState == 4 && this.status == 200) {
      		
      		var response= this.responseText;
      		var data=JSON.parse(response);
      		var to_selection="<option><spring:message code='PleaseSelect'/></option>";
      		for(var i=0;i<data.length;i++)
      			{
      			to_selection+="<option value="+data[i].type_id+">"+data[i].type_name+"</option>";
      			}
      		$('#to').html(to_selection);

      	}
      	}
      	 xhttp.open("POST","GetToTypes", true);
      	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
      	 xhttp.send(JSON.stringify(prod_type));
      		}
      	else
      		{
      		var to_selection="<option><spring:message code='PleaseSelect'/></option>";
      		$('#to').html(to_selection);

      		}
      } 
      
      function get_washing_programs(val)
      {
    	  get_times();
     	 var from_type_id=document.getElementById("from").value;
     	 var to_type_id=document.getElementById("to").value;
     	 var Dying_form={
     			 "from_type" : from_type_id,
     			 "to_type" : to_type_id
     	 }
     	 var xhttp = new XMLHttpRequest();
     	 	xhttp.onreadystatechange = function() {

     	 	if (this.readyState == 4 && this.status == 200) {
     	 		
     	 		var response= this.responseText;
     	 		//var data=JSON.parse(response);
     	 		console.log(response);
     	 		document.getElementById("program_data").value=response;
     	 	}
     	 	}
     	 	 xhttp.open("POST","GetProgramsData", true);
     	 	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
     	 	 xhttp.send(JSON.stringify(Dying_form));
     	 
      }
      
      function changingproduct(e) {
          var idx = e.selectedIndex ; 
          var rowIndex = e.parentNode.parentNode.rowIndex;
          if(idx==0)
        	  {
        	  var myTable = document.getElementById('example');
              myTable.rows[rowIndex].cells[6].innerHTML = " ";
              myTable.rows[rowIndex].cells[10].innerHTML = " ";
              myTable.rows[rowIndex].cells[12].innerHTML = " ";

        	  }
          else{
          var strUser = e.options[e.selectedIndex].value;
          var pro_name=e.options[e.selectedIndex].text
         /* if(pro_name.includes('Handle'))
  		{
        	  var myTable = document.getElementById('example');
  		var no_treat="<select disabled='true' ><option value=0></option></select>";
  			myTable.rows[idx].cells[2].innerHTML=no_treat;
  		myTable.rows[idx].cells[11].innerHTML=0;
  		}*/

          var array = strUser.split(',');
          var myTable = document.getElementById('example');
          myTable.rows[rowIndex].cells[6].innerHTML = array[0];
          myTable.rows[rowIndex].cells[10].innerHTML = array[1];
          myTable.rows[rowIndex].cells[12].innerHTML = pro_name;

          }
      
          
      }
      function changingwashing(e){
    	  
    	  var idx = e.selectedIndex ; 
          var rowIndex = e.parentNode.parentNode.rowIndex;
          var strUser = e.options[e.selectedIndex].value;
          var myTable = document.getElementById('example');
          myTable.rows[rowIndex].cells[7].innerHTML = strUser;
      }
      function changeQuentity(e)
      {
          var rowIndex = e.parentNode.parentNode.rowIndex;
          var myTable = document.getElementById('example');
          var strUser = myTable.rows[rowIndex].cells[5].children[0].value;
          myTable.rows[rowIndex].cells[9].innerHTML = strUser;
      }
      
      function changeTime(val)
      {
    	  var rowIndex=val.parentNode.parentNode.rowIndex;
    	  var myTable=document.getElementById('example');
    	  var time=val.value;
    	  myTable.rows[rowIndex].cells[14].innerHTML=time;
      }
      
      function changeMachine(e)
      {
          var rowIndex = e.parentNode.parentNode.rowIndex;
          var myTable = document.getElementById('example');
          var strUser = myTable.rows[rowIndex].cells[4].children[0].value;
          myTable.rows[rowIndex].cells[8].innerHTML = strUser;
      }
      
      function selectDeselectAll(checkedVar) {
    	  if (checkedVar.checked) {
        	  $('.commonClass').attr('checked',true).change();
        	  }
        	  else{
        		  $('.commonClass').attr('checked',false).change();
        	  }
	}

      function submitFunction()
      {
	    	document.getElementById("submitBtn").disabled = true;
		      document.getElementById("cancel_btn").disabled=true;

    	 
    	  var x_products_check_select=document.getElementsByClassName("productSelect");
    	  var x_washing_check_select=document.getElementsByClassName("washingSelect");
    	  var x_treatment_check_select=document.getElementsByClassName("treatmentselect");
    	  var checkProduct="";
    	  var checkWasing ="";
    	  var checkTreatment="";
    	  for(var i=0;i<x_treatment_check_select.length;i++)
    		  {
    		  if(x_treatment_check_select[i].value=="No_value")
    			  checkTreatment="Not_Valid";
    		  }
    	  for(var i=0;i<x_products_check_select.length;i++)
			{
    		  
			if(x_products_check_select[i].value=="No_value")
				checkProduct="Not_Valid";
			}
    	  
    	  for(var i=0;i<x_washing_check_select.length;i++)
			{
  		  
			if(x_washing_check_select[i].value=="No_value")
				checkWasing="Not_Valid";
			}
    	  
    	  var validation = document.getElementById("tableform").reportValidity()

     	 if(validation != false && checkWasing != "Not_Valid" && checkProduct != "Not_Valid" && checkTreatment!="Not_Valid")
     		 {
     		 var table = $('#example').tableToJSON(
       			  { ignoreColumns:[]}
       			  );
       	  console.log(table);

       	  var from_id=document.getElementById("from").value;
       	  var to_id=document.getElementById("to").value;
    	  
    	  var dirtyData ={
    			  "treated_product_lst" : table ,
    			  "from_type": from_id ,
    			  "to_type" : to_id
    	  };
    	  
    	  console.log(dirtyData);
    	var xhttp = new XMLHttpRequest();
    	xhttp.onreadystatechange = function() {

    	if (this.readyState == 4 && this.status == 200) {
    		var response= this.responseText;
    		if(response >0)
    			{
    			document.getElementById("order_id").value=response;
	    			$('#tableform input[type="number"]').prop("disabled", true);
	    			$('#tableform input[type="time"]').prop("disabled", true);

	    			$('#tableform select').prop("disabled", true);
	    			$('#tableform  input[type=checkbox]').prop("disabled", true);
	    			swal("<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.title" />","<spring:message code="InternalDirtyShipment..SuccessSubmit.content" />","success");
	      	    	/*$.alert({
	      	    		
	                    title: "<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.title" />",
	        		    content:"<spring:message code="InternalDirtyShipment..SuccessSubmit.content" />",
	                    }); */
	      	    	document.getElementById("submitBtn").disabled = true;
	      	    	document.getElementById("printBtn").disabled = false;
	      	    	document.getElementById("deleterows").disabled = true;
	      	    	document.getElementById("addrows").disabled = true;

    			}
    		else if(response =="no session"){
    			location.reload();
    		}
    		else if (response =="not success"){
    			
    			$('#tableform input[type="number"]').prop("disabled", false);


    			swal("<spring:message code="ordernotsubmitted"/>","<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.content" />","error");
    		 	 /* $.alert({
    		                         title: "<spring:message code="ordernotsubmitted"/>",
    		             		    content:"<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.content" />",
    		                         }); */
    		  	      document.getElementById("submitBtn").disabled = false;
    			      document.getElementById("cancel_btn").disabled=false;

    			    	document.getElementById("printBtn").disabled = true ;
    		}
    		else{
    			
    			$('#tableform input[type="number"]').prop("disabled", false);
    			swal("<spring:message code="ordernotsubmitted"/>",response,"error");
    			/* $.alert({
                     title: "Order Not Submitted Successfully",
         		    content:response,
                     }); */
	      document.getElementById("submitBtn").disabled = false;
	      document.getElementById("cancel_btn").disabled=false;
    	document.getElementById("printBtn").disabled = true ;
    		}
    	 }
    	 }
    	 xhttp.open("POST","SubmitTreatment", true);
    	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    	 xhttp.send(JSON.stringify(dirtyData));
     		 }
     	 else if (checkProduct == "Not_Valid"){
     		 swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="SelectValidProduct"/>","error");
 			/*$.alert({
		          title: "<spring:message code="ShipmentList.Error.Title"/>",
				    content:"<spring:message code="SelectValidProduct"/>",
		          }); */
 	    	document.getElementById("submitBtn").disabled = false;
		      document.getElementById("cancel_btn").disabled=false;

     	 }
     	 else if(checkTreatment=="Not_Valid")
     		 {
     		 swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="SelectValidTreatment"/>","error");
     		/*$.alert({
		          title: "<spring:message code="ShipmentList.Error.Title"/>",
				    content:"<spring:message code="SelectValidTreatment"/>",
		          }); */
     		document.getElementById("submitBtn").disabled = false;
		      document.getElementById("cancel_btn").disabled=false;
     		 }
     	 else if(checkWasing == "Not_Valid"){
     		swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="selectvalidtreatmentprogram"/>","error");
     		 /*$.alert({
		          title: "<spring:message code="ShipmentList.Error.Title"/>",
				    content:"<spring:message code="selectvalidtreatmentprogram"/>",
		          }); */
	    	document.getElementById("submitBtn").disabled = false;
		      document.getElementById("cancel_btn").disabled=false;

     	 }
     	 else{
 	    	document.getElementById("submitBtn").disabled = false;
 		      document.getElementById("cancel_btn").disabled=false;


     	 }
    	 
      }
      
      $(document).ready(function() {
  	    $('.js-example-basic-multiple').select2();
  	    if ('${validation}' == "notValid")
  	    	{
  	    	$('#tableform input[type="number"]').prop("disabled", true);
			$('#tableform select').prop("disabled", true);
			$('#tableform  input[type=checkbox]').prop("disabled", true);
  	    	document.getElementById("submitBtn").disabled = true;
  	    	document.getElementById("printBtn").disabled = true;
  	    	document.getElementById("SelectDriver").disabled = true;
  	    	document.getElementById("SelectLundry").disabled = true;
  	    	document.getElementById("deleterows").disabled = true;
  	    	document.getElementById("addrows").disabled = true;
  	    	}
 	   
  	});
   </script>
   
   <script >
    $(document).ready(function(){
        $(".add-row").click(function(index){
        	
        	var tbl=document.getElementById("example");
        	var val0=tbl.rows[1].cells[0].innerHTML;
        	var val1=tbl.rows[1].cells[1].innerHTML;
        	var val2=tbl.rows[1].cells[2].innerHTML;
        	var val3=tbl.rows[1].cells[3].innerHTML;
        	var val4=tbl.rows[1].cells[4].innerHTML;
        	var val5=tbl.rows[1].cells[5].innerHTML;
        	var val8 =tbl.rows[1].cells[9].innerHTML;
        	 var markup = "<tr> "+
             "<td class='first'><input type='checkbox' class='commonClass' name='record'></td>"+
             " <td>"+val1+"</td>"+
             " <td>"+val2+"</td>"+
             " <td>"+val3+"</td>"+
             " <td>"+val4+"</td>"+
             "<td>"+val5+"</td>"+
             " <td style='display: none;'></td>" +
             " <td style='display: none;'></td>" +
             "<td style='display: none;'>0</td>"+
             "<td style='display: none;'>0</td>"+
             "<td ></td>"+
             "<td style='display:none;'></td>"+
             "<td style='display:none;'></td>"+
             "<td><input required='required' onchange='changeTime(this)' type='time' list='times'/></td>"+
   	 		"<td style='display:none;'></td>"+
   	 		"<td style='display:none;'></td>"+
             "</tr>";
             $("#example tbody").append(markup);
        	
          //  $("tbody > tr:first").clone().find('input').val('').end().appendTo("table");  
       
        });
        
        $(".delete-row").click(function(){
        	var rowCount = document.getElementById('example').rows.length;
        	
        	if($("#tableform input:checkbox:checked").length > 0)
    		{
        	$.confirm({
        	    title: '<spring:message code="DeleteRowsMessage" />',
        		icon:'glyphicon glyphicon-remove-sign',
        		theme: 'supervan',
        	    content:'',
        	    
        	    buttons: {
        	    	  
        	    	
        	        OK: function () {
        	        	 $("table tbody").find('input[name="record"]').each(function(){
				            	if($(this).is(":checked")){
				                    $(this).parents(" table tbody tr  ").remove();
				                }
				            });
        	        	 $('.firstCheck').attr('checked',false).change();

        	        },
        	        cancel: function () {
        	        }
        	        
        	    }
        	});
    		}

        });
             
    });    
</script>

<script type="text/javascript">
   function print_data()
   {
	   var from_sel=document.getElementById('from');
	 	  var from_text=from_sel.options[from_sel.selectedIndex].text;
	 	  var to_sel=document.getElementById('to');
	 	  var to_text=to_sel.options[to_sel.selectedIndex].text;
	 	  $('#from_value').html(from_text);
	 	  $('#to_value').html(to_text);
	   document.getElementById("cons_det").style.display='none';
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
	   var table=document.getElementById("example");
	   var row_num=table.rows.length;
	   //alert(row_num);
	   var program_ids="";
	   for(var x=1;x<row_num;x++)
		   {
		   program_ids+=table.rows[x].cells[6].innerHTML;
		   program_ids+=',';
		   }
	   program_ids+="";
	   var order_id=document.getElementById("order_id").value;
	   var consum={
			   "ids" : order_id
			   
	   };
	   console.log(consum);
	   var xhttp = new XMLHttpRequest();
   	xhttp.onreadystatechange = function() {

   	if (this.readyState == 4 && this.status == 200) {
   		var response= this.responseText;
   		var resp=JSON.parse(response);
   		console.log(response);
   		var total_con=resp.total_consumables;
   		var details_con=resp.consumable_details;
   		var orders_data=resp.order_data_printing;

   		var table_ex=document.getElementById('example');
   		var order_total_data="";
   		for(var i=0;i<orders_data.length;i++)
   			{
   			order_total_data+="<tr><td>"+orders_data[i].product_name+"</td>"+
   			"<td>"+orders_data[i].treatment_name+"</td>"+
   			"<td>"+orders_data[i].program+"</td>"+
   			"<td>"+orders_data[i].machine_no+"</td>"+
   			"<td>"+orders_data[i].quantity_requested+"</td>"+
   			"<td>"+orders_data[i].order_time+"</td>"+
   			"</tr>";
   			}
   		var Cons_totals="";
   		for(var x=0;x<total_con.length;x++)
   			{
   			Cons_totals+="<tr><td>"+total_con[x].product_name+"</td>"+
   			"<td>"+total_con[x].quantity+"</td>"+
   			"<td>"+total_con[x].unit+"</td>"+
   			"</tr>";
   			}
   		var Cons_det="";
   		for(var i=0;i<details_con.length;i++)
   			{
   			Cons_det+="<tr><td>"+details_con[i].program+"</td>"+
   			"<td>"+details_con[i].product_name+"</td>"+
   			"<td>"+details_con[i].quantity+"</td>"+
   			"</tr>";
   			}
   		$("#total_tbl tbody").html(Cons_totals);
   		$("#details_tbl tbody").html(Cons_det);
   		$("#print_tbl tbody").html(order_total_data);

   	 window.print();
   	}
   	}
    xhttp.open("POST","GetTreatmentConsumables", true);
 	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
 	 xhttp.send(JSON.stringify(consum));
	  
	   
   }
   
   </script>

    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>