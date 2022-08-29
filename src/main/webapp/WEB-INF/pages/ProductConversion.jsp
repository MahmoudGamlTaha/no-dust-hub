<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
             <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="ProductConversion"/></title>
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
	   #logoprint{visibility:hidden; display:none;}
	  #displaytextarea {display:block; }
	  #displaydiv{display: none;}
	  #astr
{
    color: red;
    font-size: large;
     
    
}
#date_time_now
{
visibility:hidden;
}
  	   #nodust_misr
  	   {
  	   visibility:hidden;
  	   }
#print_tbl
 {
 visibility:hidden;
 }

#from_value
{

display:none;


}
#warehouse_name_div{
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
#to_value
{

display:none;

}
}
	   </style>
   <style type="text/css" media="print">

  @page { size:A4 portrait; }
  
  @media print {
  	   #logoprint{visibility:visible; display:block;}
  	   
#date_time_now
{
visibility:visible;
}
  	   #nodust_misr
  	   {
  	   visibility:visible;
  	   }
   #to_style
 {
 display:none;
 }
 #from_style
 {
 display:none;
 }
 #print_tbl
 {
 visibility:visible;
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
  #nav_div{
  display:none;
  }
  
  #printBtn {
    display: none;
  }

  #links{
  display: none
  }
 #nav_bar{
  display: none
 }
 #sidemenu{
 display: none
 }
 #deleterows
 {
 display:none;
 }
 #addrows{
 display:none;
 }
 #cancel_btn
 {
 display:none;
 }
 #astr
  {
  display:none;
  }
  
 #subform__div{
 display:none;
 }
 #tableBtns{
 display:none;
 
 }
 #title_div
 {
 display:none;
 }
 
 #check_all{
 display:none;
 }
#t_p
{
display:none;
}
   #displaytextarea {display: none; }
	  #displaydiv{ display:block;}
 }

</style>

	       
</head>



<body class="fixed-top">
<div id="nav_div">
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
                  
                
			<div id="links">
                  <ul class=" breadcrumb mtop5 pull-left">
                       <li>
                           <a href="DashboardNoDust"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                       <li><a href="ProductConversion"><spring:message code="ProductConversion"/> </a><span class="divider-last">&nbsp;</span></li>
                  </ul>
          </div>
               </div>
            </div>
       
	         <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:5%;   margin-top: -20px ; " id="logoprint">
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="title_div">
                           <h4> <spring:message code="ProductConversion"/> </h4>
                        </div>
                        
			
						 
				 
						 <div class="widget-body" style="text-align: left;" >
						<div class="space10"></div>
					  <div class="widget-title">
                      <h4><spring:message code="OrderData_Page_Title"/></h4>
                      </div>

           <div style="border:outset;" class="row-fluid " >
           <div class="space10"> </div>
                          <input id="save_tr" style='display:none;'/>
                                 <form:form id="con_form">  
                               
                                 <div >  
                              <div>
                                
                                    <div id="warehouse_name_div" style="margin-left:10px;"> <h5 ><strong><spring:message code="warehousename" /></strong>
                                     ${data.warehouse_name} 	</h5></div>
                                
                                    <div id="agent_name_div"> <h5 ><strong><spring:message code="Agentname" /></strong>
                                   ${data.agent_name}  	</h5></div>
                                
                                 
                                    <div id="assign_date_div"> <h5 ><strong><spring:message code="Date" /> </strong>
                                      ${data.conv_date} 	</h5></div>
                                
                             </div>
                        
                                
                               
                               
                              
                               
                               <div class="span12" style="margin-left: 0;" >  
                               
                               
                                <div class="span6" id="man_from">
                                
                                      <div style="float: left; margin-right: 5px; " > <h5 style="display: inline-block;"><strong style="margin-left:5px;"><spring:message code="ConvertFrom"/></strong></h5> <span id="astr"> * </span> </div>
                                                                                                    	 <h5 id="from_value"></h5>
                                    
                                     <div  id="from_style" style="margin-top: 5px; margin-left: 15px;">
                                     
                                     <select  id="from_type" required="required" onchange="check_to_types()" class= "span6 js-example-basic-multiple" >
                                     <option><spring:message code="PleaseSelect"/></option>
                                     <c:forEach items="${from_type}" var="type">
                                     <option value="${ type.type_id}">${type.type_name}                                     
                                     </option>
                                     </c:forEach>
                                    
							         </select >
							       
                                  </div>
                                </div>
                           
                           
                           <div class="span6" id="man_to">
                           
                                      <div style="float: left; margin-right: 5px;" > <h5 style="display: inline-block;"><strong><spring:message code="ConvertTo" /></strong></h5> <span id="astr"> * </span></div>
                                    <h5 id="to_value"></h5>
                                     <div  id="to_style" style="margin-top: 5px; margin-left: 15px;">
                                   
							        <select id="to_type" required="required" class= "span6 js-example-basic-multiple">
										 
										<option><spring:message code="PleaseSelect"/></option>
										<!--  
										<option><spring:message code="OutOfOrder"/></option>
										-->
									</select>
                                               <button type="button" id="next_btn" onclick="get_products_data()" class="btn btn-success pull-right green mright5" style="margin-right:10px;"><i class="icon-save icon-white"></i> <spring:message code="Next"/></button>

                                  </div>
                                  
                                </div>
                                
                           </div>
             <div class="space10"> </div>
             
</div>
</form:form> 

           </div>  
             
		
						
                           <br> 
                            
				
				
					
					
					
					
	<form:form id="pro_form">
 <div class="space10"></div>
                            <div id="tableBtns" class="row-fluid  ">
    
			          <button id="deleterows" type="button" class="btn btn-danger pull-right delete-row mright5 "  style="display:none; margin-bottom: 5px; margin-right: 5px;"><i class="icon-trash icon-white mright5"></i><spring:message code="DeleteRow" /></button>  
				  
                           <button id="addrows" onclick="add_new_row()" class="btn btn-success pull-right add-row mright5 " style="display:none; margin-bottom: 5px; "><i class="icon-plus icon-white mright5"></i><spring:message code="AddRow" /></button>
                                             
                           <div class="space10"></div>                             
                            </div>   
<div id="product_table" style="display:none;">

<table id="t_p"  class="table dataTable table-striped table-bordered  table-advance table-hover table-responsive" style="width:80%; margin:auto;">
                                    <thead>
                                    <tr>
                                       <th class="first"></th>
                                       <th><spring:message code="ProductReconciliation.ProductTable.ProductName"/></th>
										<th id="treatment"><spring:message code="ProductReconciliation.ProductTable.Treatment"/></th>
										<th><spring:message code="ProductReconciliation.ProductTable.Quantity"/></th>
									</tr>

                                    
                                    </thead>
                                    <tbody>
								<c:forEach items="${products}" var="product"> 
									 <tr class="odd gradeX ">  
									 
								  <td class="first">  <input type='checkbox' name='record' disabled></td>
									<td>${product.product_name}</td>
									<td> <input type="text" required="required"/></td>
									</tr>
								</c:forEach>
									</tbody>

                                </table>
                                
<table id="print_tbl" class="table dataTable table-striped table-bordered  table-advance table-hover table-responsive" style="margin:auto; width:80%;">
 <thead>
                                    <tr>
                                       <th><spring:message code="ProductReconciliation.ProductTable.ProductName"/></th>
										<th id="treatment"><spring:message code="ProductReconciliation.ProductTable.Treatment"/></th>
										<th><spring:message code="ProductReconciliation.ProductTable.Quantity"/></th>
									</tr>

                                    
                                    </thead>
                                    <tbody></tbody>
</table>

<br>
<div id="subform__div">
<input id="treatment_data" style="display:none;"/>
<input id="products_data" style="display:none;"/>
               <button type="button" onclick="Submit_form()" class="btn btn-success pull-right  green mright5" id="submit_btn" style="display='none';"><i class="icon-save icon-white"></i> <spring:message code="Submit"/></button>
           </div>
               <button type="button" onclick="Back_Types()" class="btn btn-success pull-right  green mright5" id="cancel_btn" style="display='none'; margin-right: 4px; "><i class="icon-save icon-white"></i> <spring:message code="Back"/></button>
                <button type="button"  id="printBtn"  class="btn btn-primary pull-right" onclick="print_data();" style="margin-right: 4px;" disabled><i class="icon-print  icon-white" style="margin-right: 7px;" ></i><spring:message code="Print"/></button>   

<br>
</div>
</form:form>

		 
						 
						 
                        </div>
                     </div>
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
 
   <div id="footer">
       &copy; <spring:message code="CopyRights" />
   
   </div>
   <!-- END FOOTER -->
  
 
 
 <!-- Open & close MENU -->
  
 

 <script>
      jQuery(document).ready(function() {			
      	// initiate layout and plugins
      	App.init();
  	    $('.js-example-basic-multiple').select2();

      	
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

<script>
function Back_Types()
{
	//var x_tbl="";
	//$("#t_p").html(x_tbl);
	document.getElementById("from_type").disabled=false;
	document.getElementById("to_type").disabled=false;
	document.getElementById("product_table").style.display='none';
	document.getElementById("addrows").style.display='none';
	document.getElementById("deleterows").style.display='none';
	document.getElementById("next_btn").style.display='block';


}
function ChangeTreatment(t)
{
	var row_index=t.parentNode.parentNode.rowIndex;
	var table=document.getElementById("t_p");
	table.rows[row_index].cells[8].innerHTML=t.value;
	var pro_name=table.rows[row_index].cells[7].innerText;
	if(pro_name.includes('Handle'))
		{
		var no_treat="<select disabled='true' class='span6 js-example-basic-multiple' ><option value=0></option></select>"
			var col=table.rows[row_index].cells[2].innerHTML=no_treat;
			table.rows[row_index].cells[8].innerText=0;
		}

}
function add_new_row()
{
	var x=document.getElementById("t_p");
	var type=document.getElementById("from_type").value;
	var type_2=document.getElementById("to_type").value;
	if(type=='1')
		{
	var x1_1=x.rows[1].cells[0].innerHTML;
	var x1_2=x.rows[1].cells[1].innerHTML;
	var x1_3=x.rows[1].cells[2].innerHTML;
	var x1_4=x.rows[1].cells[3].innerHTML;
	var x1_5=x.rows[1].cells[4].innerHTML;

	var Rows="<tr>"+
	"<td>"+x1_1+"</td>"+
	"<td>"+x1_2+"</td>"+
	"<td></td>"+
	"<td></td>"+
	"<td>"+x1_5+"</td>"+
	"<td style='display:none;'></td>"+
	"<td style='display:none;'></td>"+
	"<td style='display:none;'></td>"+

	"</tr>";
	$("#t_p tbody").append(Rows);

		}
	else
		{
		if(type=='4'&&type_2=='1')
			{
			var x1_1=x.rows[1].cells[0].innerHTML;
			var x1_2=x.rows[1].cells[1].innerHTML;
			var x1_3=x.rows[1].cells[2].innerHTML;
			var x1_4=x.rows[1].cells[4].innerHTML;
			var Rows="<tr>"+
			"<td>"+x1_1+"</td>"+
			"<td>"+x1_2+"</td>"+
			"<td>"+x1_3+"</td>"+
			"<td></td>"+
			"<td>"+x1_4+"</td>"+
			"<td style='display:none;'></td>"+
			"<td style='display:none;'></td>"+
			"<td style='display:none;'></td>"+
			"<td style='display:none;'></td>"+

			"</tr>";
			$("#t_p tbody").append(Rows);
			}
		else if(type=='4'&&type_2=='5')
			{
			var x1_1=x.rows[1].cells[0].innerHTML;
			var x1_2=x.rows[1].cells[1].innerHTML;
			var x1_3=x.rows[1].cells[2].innerText;
			var x1_4=x.rows[1].cells[3].innerHTML;
			var Rows="<tr>"+
			"<td>"+x1_1+"</td>"+
			"<td>"+x1_2+"</td>"+
			"<td></td>"+
			"<td>"+x1_4+"</td>"+
			"<td style='display:none;'></td>"+
			"<td style='display:none;'></td>"+
			"<td style='display:none;'></td>"+
			// "<td><input type='text'  onchange='change_comment(this)'/></td>"+
			"<td  id='displaytextarea' ><textarea type='text'  onchange='change_comment(this)' ></textarea></td>"+
			"<td  id='displaydiv' style='width: 200px ; word-break: break-all;'> <div  type='text'  onchange='change_comment(this)' > </div></td>"+
			"<td style='display:none;'></td>"
			"</tr>";
			$("#t_p tbody").append(Rows);
			}
		else
			{
			var x1_1=x.rows[1].cells[0].innerHTML;
			var x1_2=x.rows[1].cells[1].innerHTML;
			var x1_3=x.rows[1].cells[2].innerText;
			var x1_4=x.rows[1].cells[3].innerHTML;
			var Rows="<tr>"+
			"<td>"+x1_1+"</td>"+
			"<td>"+x1_2+"</td>"+
			"<td></td>"+
			"<td>"+x1_4+"</td>"+
			"<td style='display:none;'></td>"+
			"<td style='display:none;'></td>"+
			"<td style='display:none;'></td>"+

			"</tr>";
			$("#t_p tbody").append(Rows);
			}
	

		}
	
}
/*
$("#deleterows").click(function(){
      alert("");
	
	$("table tbody tr").find('input[name="record"]').each(function(){
		alert('hh')

    	if($(this).is(":checked")){
    		  $(this).parents(" table tbody tr ").remove();
        }
	});
});

*/

$(".delete-row").click(function(){
	var rowCount = document.getElementById('t_p').rows.length;
	
	//if($("#product_table input:checkbox:checked").length > 1)
	//{
	$.confirm({
	    title:'<spring:message code="DeleteRowsMessage" />',
		icon:'glyphicon glyphicon-remove-sign',
		theme: 'supervan',
	    content:'',
	    
	    buttons: {
	    	  
	    	
	    	
	        OK: function () {
	        	 $("table tbody").find('input[name="record"]').each(function(){
		            	if($(this).is(":checked")){
		            var row=this.parentNode.parentNode.rowIndex;
		           // alert(row);
		           if(row>1)
		            	{
		                    $(this).parents(" table tbody tr  ").remove();
		            	}
		            
		                }
		            });

	        },
	        cancel: function () {
	        }
	        
	    }
	});
	//}

  	 });
	 
	 
	function Check_data()
	{
		var Vall="<option>VAL1</option><option>VAL2</option>";
		$("#test_click").html(Vall);
	}
	 
function check_to_types()
{
	var from_type_val=document.getElementById("from_type").value;
	var product_type={
			"type_id":from_type_val
	}
	console.log(product_type);
	var xhttp = new XMLHttpRequest();

xhttp.onreadystatechange = function() {
		

		if (this.readyState == 4 && this.status == 200) {
		var resp=this.responseText;
		console.log(resp);
		var types_to=JSON.parse(resp);
		Options="<Option><spring:message code='PleaseSelect'/></Option>";
		
		for (var x=0;x<types_to.length;x++)
			{
			console.log(types_to[x].type_name);
			Options+="<option value="+types_to[x].type_id+">"+types_to[x].type_name+"</option>";
			}
		$("#to_type").html(Options);
		}
}
xhttp.open("POST","GetSimpleConverionToTypes", true);
xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
xhttp.send(JSON.stringify(product_type));
	/*var Options="";
	if(from_type_val=="Clean")
		{
		Options="<Option><spring:message code='PleaseSelect'/></Option><option><spring:message code='dirty'/></option><option><spring:message code='Untreated'/></option>";
		$("#to_type").html(Options);
		}
	if(from_type_val=="Untreated")
		{
		Options="<option><spring:message code='PleaseSelect'/></option> <option><spring:message code='NeedRefresh'/></option> <option><spring:message code='OutOfOrder'/></option>";
		$("#to_type").html(Options);
		}
	if(from_type_val=="New")
	{
	Options="<option><spring:message code='PleaseSelect'/></option><option><spring:message code='Untreated'/></option>";
	$("#to_type").html(Options);
	}
	if(from_type_val=="Out Of Order")
		{
		Options="<option><spring:message code='PleaseSelect'/></option><option><spring:message code='Repaired'/></option><option><spring:message code='Scrap'/></option>";
		$("#to_type").html(Options);

		}
	if(from_type_val=="Repaired")
	{
	Options="<option>Please Select</option><option><spring:message code='Untreated'/></option>";
	$("#to_type").html(Options);

	}
	*/
}
function Submit_form()
{
	var check="";
	var x_products_check_select=document.getElementsByTagName("select");
	for(var i=0;i<x_products_check_select.length;i++)
		{
		if(x_products_check_select[i].value=="Please Select")
			check="Not_Valid";
		}
	console.log(check);
	if(check=="Not_Valid")
		{
		swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="SelectValidProduct"/>","error");
		/*$.alert({
	          title: "Error",
			    content:"Please Select Valid Product",
	          }); */
		}
	else
		{
	var validation_val=document.getElementById("pro_form").reportValidity();
	if(validation_val!=false)
		{
		var check="";
		var x_products_check_select=document.getElementsByTagName("select");
		for(var i=0;i<x_products_check_select.length;i++)
			{
			if(x_products_check_select[i].value=="Please Select")
				check="Not_Valid";
			}
		console.log(check);
		if(check=="Not_Valid")
			{
			swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="SelectValidProduct"/>","error");
			/*$.alert({
		          title: "<spring:message code="ShipmentList.Error.Title"/>",
				    content:"<spring:message code="SelectValidProduct"/>",
		          }); */
			}
		else
			{
		document.getElementById("submit_btn").disabled=true;
		document.getElementById("addrows").disabled=true;
		document.getElementById("deleterows").disabled=true;
		$('#t_p input[type="number"]').prop("disabled", true);
		$('#t_p select').prop("disabled", true);
		$('#t_p input[type="text"]').prop("disabled", true);
		$('#t_p textarea[type="text"]').prop("disabled", true);

		
	var from_type_val=document.getElementById("from_type").value;
	var to_type_val=document.getElementById("to_type").value;
	var agent_name='${data.agent_name}';
	var fac_id='${data.fac_id}';
	var pro_tbl=$('#t_p').tableToJSON();
	
	console.log(pro_tbl);
	var con_form={
			"from_type":from_type_val,
			"to_type":to_type_val,
			"agent_name":agent_name,
			"fac_id":fac_id,
			"prod_lst":pro_tbl
	}
	console.log(con_form);
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		

		if (this.readyState == 4 && this.status == 200) {
		var resp=this.responseText;
		console.log(resp);
		if(resp=="true")
			{
			document.getElementById("printBtn").disabled=false;
			document.getElementById("cancel_btn").disabled=true;

			var arr=document.getElementsByTagName("input");
			for(var i=0;i<arr.length;i++)
				{
				if(arr[i].type=="checkbox")
					{
					arr[i].disabled=true;
					}
				}
			swal("<spring:message code="ShipmentList.Success.Title"/>","<spring:message code="ProductConversionSuccess"/>","success");
			/*$.alert({
		          title: "<spring:message code="ShipmentList.Error.Title"/>",
				    content:"<spring:message code="ProductConversionSuccess"/>",
		          }); */
			}
		else
			{
			swal("<spring:message code="ShipmentList.Error.Title"/>",resp,"error");
			$.alert({
		          title: "<spring:message code="ShipmentList.Error.Title"/>",
				    content:resp,
		          }); 
			document.getElementById("submit_btn").disabled=false;
			document.getElementById("addrows").disabled=false;
			document.getElementById("deleterows").disabled=false;
			document.getElementById("cancel_btn").disabled=false;
			$('#t_p input[type="number"]').prop("disabled", false);
			$('#t_p select').prop("disabled", false);
			}
		}
	}
	xhttp.open("POST","EndConversion", true);
	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
	 xhttp.send(JSON.stringify(con_form));
		}
		}
		}
}
function get_treatment()
{
	var xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		if (this.readyState == 4 && this.status == 200) {
			var resp=this.responseText;
			var s=resp;
			console.log(resp);

			if(s=="NoPro")
				{
				swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="NoAvailableProductsOfType"/> ","error");
				/*$.alert({
			          title: "<spring:message code="ShipmentList.Error.Title"/>",
					    content:"<spring:message code="NoAvailableProductsOfType"/> ",
			          });*/
				document.getElementById("submit_btn").disabled=true;
				document.getElementById("deleterows").disabled=true;
				document.getElementById("addrows").disabled=true;
				}
			else
				{
				document.getElementById("submit_btn").disabled=false;
				document.getElementById("deleterows").disabled=false;
				document.getElementById("addrows").disabled=false;
			//treatments=JSON.parse(s);
			document.getElementById("treatment_data").value=resp;
				}

		}
	}
	xhttp.open("POST","GetTreatment", true);
	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
	 xhttp.send(JSON.stringify());
}
function get_products_data()
{
var validation_val=document.getElementById("con_form").reportValidity();
if(validation_val!=false)
	{
	var Check_select_from=document.getElementById("from_type").value;
	var Check_select_to=document.getElementById("to_type").value;
	if(Check_select_from=='Please Select' ||Check_select_to=='Please Select')
		{
		swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="SelectValidTypes"/> ","error");
		/*$.alert({
			title: "<spring:message code="ShipmentList.Error.Title"/>",
		    content:"<spring:message code="SelectValidTypes"/> ",
	          });*/
		}
	else
		{
		if(Check_select_from=='1'&&Check_select_to=='2')
			{
			window.location.replace("ConvertProductRequests");
			}
	document.getElementById("from_type").disabled=true;
	document.getElementById("to_type").disabled=true;
	document.getElementById("next_btn").style.display="none";
	document.getElementById("deleterows").style.display="block";
	document.getElementById("addrows").style.display="block";
var to_type=document.getElementById("to_type").value;
var x=document.getElementById("from_type").value;
var tr_lst;
var treatments;
if(x=='4'&&to_type=='1')
	{
	
	//get_treatment();

	}
	var fac_id='${data.fac_id}';
	var con_form={
			"from_type":x,
			"fac_id":fac_id
	}
	console.log(con_form);
	var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			

			if (this.readyState == 4 && this.status == 200) {
			var resp=this.responseText;
			console.log(resp);
			document.getElementById("product_table").style.display='block';
			document.getElementById("submit_btn").style.display='block';
			if(resp=="NoPro")
				{
				swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="NoAvailableProductsOfType"/> ","error");
				/*$.alert({
					title: "<spring:message code="ShipmentList.Error.Title"/>",
				    content:"<spring:message code="NoAvailableProductsOfType"/> ",
			          });*/
				document.getElementById("submit_btn").disabled=true;
				document.getElementById("deleterows").disabled=true;
				document.getElementById("addrows").disabled=true;
				}
			else
				{
				document.getElementById("submit_btn").disabled=false;
				document.getElementById("deleterows").disabled=false;
				document.getElementById("addrows").disabled=false;
			var data=JSON.parse(resp);
				}
			var data_check=resp;

			var P;
			//if(x!="Clean")
				//document.getElementById("treatment").style.display='none';
			if(x=="1")
				{
			var P="<thead><tr><th id='check_all'><input id = 'selectallcheck' type='checkbox'  name='record' onchange='Checkall()'/></th><th><spring:message code='ProductReconciliation.ProductTable.ProductName'/></th><th id='treatment'><spring:message code='ProductReconciliation.ProductTable.Treatment'/></th><th id='available_stock' data-override='total_stock_quantity'><spring:message code='AvailableQ'/></th><th><spring:message code='ProductReconciliation.ProductTable.Quantity'/></th><th style='display:none;'>quantity</th><th style='display:none;'>product_id</th><th style='display:none;'>product_name</th></tr></thead>";
				}
			else if(x=="New"||x=="4")
				{
				if(to_type=='1')
					{
					var P="<thead><tr><th id='check_all'><input id = 'selectallcheck' type='checkbox' name='record' onchange='Checkall()' /></th><th><spring:message code='ProductReconciliation.ProductTable.ProductName'/></th><th id='treatment'><spring:message code='ProductReconciliation.ProductTable.Treatment'/></th><th id='available_stock' data-override='total_stock_quantity'><spring:message code='AvailableQ'/></th><th><spring:message code='ProductReconciliation.ProductTable.Quantity'/></th><th style='display:none;'>quantity</th><th style='display:none;'>product_id</th><th style='display:none;'>product_name</th><th style='display:none;'>treatment_id</th></tr></thead>";

					}
				else if (to_type=='5')
					{
					var P="<thead><tr><th id='check_all'><input id='selectallcheck' onchange='Checkall()'  type='checkbox' name='record' /> </th><th><spring:message code='ProductReconciliation.ProductTable.ProductName'/></th><th id='available_stock' data-override='total_stock_quantity'><spring:message code='AvailableQ'/></th><th><spring:message code='ProductReconciliation.ProductTable.Quantity'/></th><th style='display:none;'>quantity</th><th style='display:none;'>product_id</th><th style='display:none;'>product_name</th> <th>Comment</th><th style='display:none;'>comment</th></tr></thead>";

					}
				else
					{
				var P="<thead><tr><th id='check_all'><input id='selectallcheck' onchange='Checkall()'  type='checkbox' name='record' /> </th><th><spring:message code='ProductReconciliation.ProductTable.ProductName'/></th><th id='available_stock' data-override='total_stock_quantity'><spring:message code='AvailableQ'/></th><th><spring:message code='ProductReconciliation.ProductTable.Quantity'/></th><th style='display:none;'>quantity</th><th style='display:none;'>product_id</th><th style='display:none;'>product_name</th></tr></thead>";
					}
				}
			else
				{
				var P="<thead><tr><th id='check_all'><input id='selectallcheck' onchange='Checkall()' type='checkbox' name='record' /> </th><th><spring:message code='ProductReconciliation.ProductTable.ProductName'/></th><th id='available_stock' data-override='total_stock_quantity'><spring:message code='AvailableQ'/></th><th><spring:message code='ProductReconciliation.ProductTable.Quantity'/></th><th style='display:none;'>quantity</th><th style='display:none;'>product_id</th><th style='display:none;'>product_name</th></tr></thead>";
				}
			console.log(data);

			if(x=="1")
				{
				var selections="<select onchange='ChangeValues(this)' class='span6 js-example-basic-multiple'> <option>Please Select</option>";
				var selections_treatments="<select>";
				var arr_distinct_names=[];
				if(resp!="NoPro")
					{
				for(var i=0;i<data.length;i++)
					{
					var options_name="<option value="+data[i].total_stock_quantity+','+data[i].treatment_name+','+data[i].product_sku+','+data[i].product_name+">"+data[i].product_name+','+data[i].treatment_name+"</option>";
					selections+=options_name;
					//selections_treatments+=options_treatment;
					}
					
				selections+="</select>";
				var prod="<tr><td id='check_all'><input type='checkbox' name='record'/></td>"+
				"<td>"+selections+"</td>"+
				"<td></td>"+
				"<td id='total_quan'></td>"+
				"<td><input type='number' min='1' required=required onchange='Change_conv_quantity(this)'/></td>"+
				"<td style='display:none;'></td>"+
				"<td style='display:none;'>"+data[0].product_sku+"</td>"+
				"<td style='display:none;'>"+data[0].product_name+"</td>"+
				"</tr>";

				P+=prod;
				console.log(P);
				}
				}
			else
				{

				if(to_type=='1')
					{
					//document.getElementById("treatment_data")='${treatments}';
					var T='${treatments}';
					var treatments=JSON.parse(T);

					var selections="<select onchange='ChangeValues(this)' class='span6 js-example-basic-multiple'> <option>Please Select</option>";
					if(data_check!="NoPro")
						{
					for(var i=0;i<data.length;i++)
						{
						var options_name="<option value="+data[i].total_stock_quantity+','+data[i].product_sku+','+data[i].product_name+">"+data[i].product_name+"</option>";
						selections+=options_name;
						}
						}
					var treatments_selections="<select onchange='ChangeTreatment(this)' class='js-example-basic-multiple'>";
					if(data_check!="NoPro")
						{
					for(var index=0;index<treatments.length;index++)
						{
						var option_treatment="<option value="+treatments[index].treatment_id+">"+treatments[index].treatment_name+"</option>";
						treatments_selections+=option_treatment;
						}
						
					selections+="</select>";
					var prod="<tr><td id='check_all'><input type='checkbox' name='record'/></td>"+
					"<td>"+selections+"</td>"+
					"<td>"+treatments_selections+"</td>"+
					"<td id='total_quan'></td>"+
					"<td><input type='number' min='1' required=required onchange='Change_conv_quantity(this)'/></td>"+
					"<td style='display:none;'></td>"+
					"<td style='display:none;'>"+data[0].product_sku+"</td>"+
					"<td style='display:none;'>"+data[0].product_name+"</td>"+
					"<td style='display:none;'>"+treatments[0].treatment_id+"</td>"+

					"</tr>";

					P+=prod;
					document.getElementById("save_tr").value=treatments_selections;
					}
					}
				else if (to_type=='5')
					{/*
					var selections="<select onchange='ChangeValues(this)'>";
					if(data_check!="NoPro")
						{
					for(var i=0;i<data.length;i++)
						{
						var options_name="<option value="+data[i].total_stock_quantity+','+data[i].product_sku+','+data[i].product_name+">"+data[i].product_name+"</option>";
						selections+=options_name;
						}
						}
					var treatments_selections="<select onchange='ChangeTreatment(this)'>";
					if(data_check!="NoPro")
						{
					for(var index=0;index<treatments.length;index++)
						{
						var option_treatment="<option value="+treatments[index].treatment_id+">"+treatments[index].treatment_name+"</option>";
						treatments_selections+=option_treatment;
						}
						
					selections+="</select>";
					var prod="<tr><td><input type='checkbox' name='record'/></td>"+
					"<td>"+selections+"</td>"+
					"<td>"+treatments_selections+"</td>"+
					"<td id='total_quan'>"+data[0].total_stock_quantity+"</td>"+
					"<td><input type='number' min='0' required=required onchange='Change_conv_quantity(this)'/></td>"+
					"<td style='display:none;'></td>"+
					"<td style='display:none;'>"+data[0].product_sku+"</td>"+
					"<td style='display:none;'>"+data[0].product_name+"</td>"+
					"<td style='display:none;'>"+treatments[0].treatment_id+"</td>"+
					"<td><input type='text' required='required'/></td>"

					"</tr>";

					P+=prod;
					document.getElementById("save_tr").value=treatments_selections;
					}*/
					var selections="<select onchange='ChangeValues(this)'> <option>Please Select</option>";
					if(data_check!='NoPro')
						{
					for(var i=0;i<data.length;i++)
						{
						var options_name="<option value="+data[i].total_stock_quantity+','+data[i].product_sku+','+data[i].product_name+">"+data[i].product_name+"</option>";
						selections+=options_name;
						}
						
					selections+="</select>";
					var prod="<tr><td id='check_all'><input type='checkbox' name='record'/></td>"+
					"<td>"+selections+"</td>"+
					"<td id='total_quan'></td>"+
					"<td><input type='number' min='1' required=required onchange='Change_conv_quantity(this)'/></td>"+
					"<td style='display:none;'></td>"+
					"<td style='display:none;'>"+data[0].product_sku+"</td>"+
					"<td style='display:none;'>"+data[0].product_name+"</td>"+
					"<td  id='displaytextarea' ><textarea type='text'  onchange='change_comment(this)' ></textarea></td>"+
					"<td  id='displaydiv' style='width: 200px ; word-break: break-all;'> <div  type='text'  onchange='change_comment(this)'> </div></td>"+
					"<td style='display:none;'></td>"
					"</tr>";

					P+=prod;
					}
					}
				else
					{
					
					var selections="<select onchange='ChangeValues(this)'><option>Please Select</option>";
					if(data_check!='NoPro')
						{
					for(var i=0;i<data.length;i++)
						{
						var options_name="<option value="+data[i].total_stock_quantity+','+data[i].product_sku+','+data[i].product_name+">"+data[i].product_name+"</option>";
						selections+=options_name;
						}
						
					selections+="</select>";
					var prod="<tr><td id='check_all'><input type='checkbox' name='record'/></td>"+
					"<td>"+selections+"</td>"+
					"<td id='total_quan'></td>"+
					"<td><input type='number' min='1' required=required onchange='Change_conv_quantity(this)'/></td>"+
					"<td style='display:none;'></td>"+
					"<td style='display:none;'>"+data[0].product_sku+"</td>"+
					"<td style='display:none;'>"+data[0].product_name+"</td>"+

					"</tr>";

					P+=prod;
					}
			
					}
				}
			
			$('#t_p').html(P);
			}
		}
		xhttp.open("POST","SubmitConversion", true);
		 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
		 xhttp.send(JSON.stringify(con_form));
	}
	}
}
function change_comment(comm)
{
	var row_index=comm.parentNode.parentNode.rowIndex;
	var table=document.getElementById("t_p");
	table.rows[row_index].cells[8].innerHTML=comm.value;

}
function Change_conv_quantity(val)
{
	var row_index=val.parentNode.parentNode.rowIndex;
var table=document.getElementById("t_p");
var type=document.getElementById("from_type").value;
var to_type=document.getElementById("to_type").value;
if(type=='4'||type=='New')
	{
	if(to_type=='1')
		{
		table.rows[row_index].cells[5].innerHTML=val.value;

		}
	else
		{
table.rows[row_index].cells[4].innerHTML=val.value;
		}
	}
if(type=='5'||type=='6')
{
table.rows[row_index].cells[4].innerHTML=val.value;
}
	if(type=='1')
		{
		table.rows[row_index].cells[5].innerHTML=val.value;

		}
}
function ChangeValues(x)
{
	var par=x.value;
	var values=par.split(',');
	var check_val_text=x.options[x.selectedIndex].text;
	//alert(check_val_text);
	
	var index_row=x.parentNode.parentNode.rowIndex;
	var table_x=document.getElementById("t_p");
	var type=document.getElementById("from_type").value;
	var type_2=document.getElementById("to_type").value;
	if(type=='1')
		{
		if(x.value=='Please Select')
			{
			table_x.rows[index_row].cells[3].innerText='';
			table_x.rows[index_row].cells[2].innerText='';
			}
		else
			{
	table_x.rows[index_row].cells[3].innerText=values[0];
	table_x.rows[index_row].cells[2].innerText=values[1];
	table_x.rows[index_row].cells[6].innerText=values[2];
	table_x.rows[index_row].cells[7].innerText=check_val_text;
			}
		}
	else
		{
		if(type=='4'&&type_2=='1')
			{
			if(x.value=='Please Select')
				{
				table_x.rows[index_row].cells[3].innerText='';

				}
			else
				{
			table_x.rows[index_row].cells[3].innerText=values[0];
			table_x.rows[index_row].cells[6].innerText=values[1];
			table_x.rows[index_row].cells[7].innerText=check_val_text;
				
			if(values[2].includes("Handle"))
				{
				var no_treat="<select disabled='true' ><option value=0></option></select>"
				table_x.rows[index_row].cells[2].innerHTML=no_treat;
				table_x.rows[index_row].cells[8].innerText=0;

				
				}
			else
				{
				var x_val=document.getElementById("save_tr").value;
				table_x.rows[index_row].cells[2].innerHTML=x_val;
				}
			}
			}
		else
			{
			if(x.value=='Please Select')
				{
				table_x.rows[index_row].cells[2].innerText='';

				}
			else
				{
		table_x.rows[index_row].cells[2].innerText=values[0];
		table_x.rows[index_row].cells[5].innerText=values[1];
		table_x.rows[index_row].cells[6].innerText=check_val_text;
				}
			}

		}
}
function Checkall()
{
	var check_val=document.getElementById("selectallcheck").checked;
	if(check_val==true)
		{
		var allrows=document.getElementsByTagName("input");
		for(var i=1;i<allrows.length;i++)
			{
			if(allrows[i].type=='checkbox')
				allrows[i].checked=true;
			}
		}
	else
		{
		var allrows=document.getElementsByTagName("input");
		for(var i=0;i<allrows.length;i++)
			{
			if(allrows[i].type=='checkbox')
				allrows[i].checked=false;
			}
		}
}
function print_data()
{
	  var from_sel=document.getElementById("from_type");
 	  var from_text=from_sel.options[from_sel.selectedIndex].text;
 	  var from_val=from_sel.options[from_sel.selectedIndex].value;
 	  var to_sel=document.getElementById("to_type");
 	  var to_text=to_sel.options[to_sel.selectedIndex].text;
 	  var to_val=to_sel.options[to_sel.selectedIndex].value;
 	 $('#from_value').html(from_text);
 	 $('#to_value').html(to_text);
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
 	 if(from_val=="1"&&to_val=="4")
 		 {
			var P="<thead><tr><th><spring:message code='product_only'/></th><th id='treatment'><spring:message code='ProductReconciliation.ProductTable.Treatment'/></th><th><spring:message code='ProductReconciliation.ProductTable.Quantity'/></th></tr></thead>";
			P+="<tbody>";
			var table_x=document.getElementById("t_p");
			var rows_num=table_x.rows.length;
			for(var i=1;i<rows_num;i++)
				{
				P+="<tr>"+
				"<td>"+table_x.rows[i].cells[7].innerHTML+"</td>"+
				"<td>"+table_x.rows[i].cells[2].innerHTML+"</td>"+
				"<td>"+table_x.rows[i].cells[5].innerHTML+"</td>"+
"</tr>"
				}
			$('#print_tbl').html(P);
 		 }
 	 else if(from_val=="4"&&to_val=="5")
 		 {
			var P="<thead><tr><th><spring:message code='product_only'/></th><th><spring:message code='ProductReconciliation.ProductTable.Quantity'/></th><th>Comment</th></tr></thead>";
			P+="<tbody>";
			var table_x=document.getElementById("t_p");
			var rows_num=table_x.rows.length;
			for(var i=1;i<rows_num;i++)
				{
				P+="<tr>"+
				"<td>"+table_x.rows[i].cells[6].innerHTML+"</td>"+
				"<td>"+table_x.rows[i].cells[4].innerHTML+"</td>"+
				"<td>"+table_x.rows[i].cells[8].innerHTML+"</td>"+
"</tr>"
				}
			$('#print_tbl').html(P);

				}
 	 else if(from_val=="4"&&to_val=="12")
{
 		var P="<thead><tr><th><spring:message code='product_only'/></th><th><spring:message code='ProductReconciliation.ProductTable.Quantity'/></th></tr></thead>";
		P+="<tbody>";
		var table_x=document.getElementById("t_p");
		var rows_num=table_x.rows.length;
		for(var i=1;i<rows_num;i++)
			{
			P+="<tr>"+
			"<td>"+table_x.rows[i].cells[6].innerHTML+"</td>"+
			"<td>"+table_x.rows[i].cells[4].innerHTML+"</td>"+
"</tr>"
			}
		$('#print_tbl').html(P);

 		 }
 	 else if(from_val=="5"||from_val=="4")
 	{
 	 		var P="<thead><tr><th><spring:message code='product_only'/></th><th><spring:message code='ProductReconciliation.ProductTable.Quantity'/></th></tr></thead>";
 			P+="<tbody>";
 			var table_x=document.getElementById("t_p");
 			var rows_num=table_x.rows.length;
 			for(var i=1;i<rows_num;i++)
 				{
 				P+="<tr>"+
 				"<td>"+table_x.rows[i].cells[6].innerHTML+"</td>"+
 				"<td>"+table_x.rows[i].cells[4].innerHTML+"</td>"+
 	"</tr>"
 				}
 			$('#print_tbl').html(P);

 	 		 }
 	 else
 		 {
			var P="<thead><tr><th><spring:message code='product_only'/></th><th><spring:message code='ProductReconciliation.ProductTable.Quantity'/></th></tr></thead>";
			P+="<tbody>";
			var table_x=document.getElementById("t_p");
			var rows_num=table_x.rows.length;
			for(var i=1;i<rows_num;i++)
				{
				P+="<tr>"+
				"<td>"+table_x.rows[i].cells[6].innerHTML+"</td>"+
				"<td>"+table_x.rows[i].cells[4].innerHTML+"</td>"+
"</tr>"
				}
			$('#print_tbl').html(P);

 		 }

 		 
 	  window.print();
	}
</script>




    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>