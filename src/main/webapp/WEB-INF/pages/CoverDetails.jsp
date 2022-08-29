<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
     <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title >  <spring:message code="ReleasingProducts.CoverList.details.PageTitle"/></title>
   <link href="img/no.jpeg" rel="icon" />
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
   <link href="resources/assetsnodust/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />  
   <link href="resources/assetsnodust/css/style.css" rel="stylesheet" />
   <link href="resources/assetsnodust/css/style_red.css" rel="stylesheet"  />
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <link rel="stylesheet" href="resources/css/jquery-confirm.min.css"/>
    
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
     <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
   <script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>

    <script type="text/javascript" src="resources/assetsnodust/js/jasontable.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
   
   <style type="text/css">
   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}

#logoprint{visibility:hidden;}
  #print_tbl{visibility:hidden;}
#nodust_misr{visibility:hidden;}
#date_time_now{visibility:hidden;}
@font-face {
  font-family: ArbFONTS;
  src: url(ArbFONTS-Abdo-salem-Bold.ttf);
}


   </style>
<style type="text/css" media="print">


  @page { size:A4 ; }
  
  @media print {
  #space_div{display:none;}
  #btn_div{display:none;}
  #coverTable{display:none;}
  #print_tbl{visibility:visible;}
  #nodust_misr{visibility:visible;}
#date_time_now{visibility:visible;}
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
 #endorsement
 {
 direction: rtl;
 }
 
 #titlepage{ display: none;}
}

#logoprint{visibility: visible;}

#contentpage{ margin-top: -50px;}

 #Header, #Footer { display: none !important; }
#footer{ display: none;}
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
	<!-- BEGIN PAGE -->


		<div id="main-content">
	
         <div class="container-fluid">
            <div class="row-fluid">
               <div class="span12">
                  
                
			
                  <ul id="links" class=" breadcrumb mtop5 pull-left">
                       <li>
                           <a href="DashboardNoDust"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                       <li>
                           <a href="DispatchingProducts"><spring:message code="ReleasingProducts.PageTitle" /></a> <span class="divider">&nbsp; &nbsp;</span>
                       </li> 
                         <li>
                           <a href="CoverList?Username=${productsLst.driver.USER_NAME}"><spring:message code="ReleasingProducts.CoverList.PageTitle" /></a> <span class="divider">&nbsp; &nbsp;</span>
                       </li> 
                       <li><a href="CoverDetails?Username=${productsLst.driver.USER_NAME}&date=${assignment_date}"> <spring:message code="ReleasingProducts.CoverList.details.PageTitle" /></a><span class="divider-last">&nbsp;</span></li>
                  </ul>
      	  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4><spring:message code="ReleasingProducts.CoverList.details.PageTitle" /></h4>
                        </div>
                        
						<div class="widget-body" style="text-align: left;" id="contentpage">
						
                         <table width="100%" dir="rtl">
					    	<tr>
						    <td>
						    <div class="space10"></div>
						    <div class="widget-title" style="margin-left:-5px;">
                           <h4><spring:message code="ShipemntsData_Page_Title" /></h4>
                        </div>
                            <div class="row-fluid invoice-list" style="border:outset;" >
                              
                             <div class="row-fluid">
                             <div style="float:left; width:35%;"> <h5 style="margin-left:10px;"><strong><spring:message code="warehousename" /></strong>
                                       ${productsLst.wareHouseName}  	</h5></div>
                                        <div style="float:left;width:35%;"> <h5 ><strong><spring:message code="Drivername" /></strong>
                                     ${productsLst.driver.FULL_NAME_EN} 	</h5></div>
                                <div style="float:left;width:30%;"> <h5 ><strong><spring:message code="Date" /></strong>
                                       ${assign_date}  	</h5></div>
                                 
                                  <div style="float:left;"> <h5 style="margin-left:10px;"><strong><spring:message code="areaName" /></strong>
                                     ${productsLst.areaName} 	</h5></div>
                             </div>
                                
                             
                               </div>

							</td>
							</tr>
			   		</table>                              
                            
                            
                          
                 <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:35%;   margin-top: -170px ; " id="logoprint">
   
  
  
         
               
                                <div >
                            
                              
                               </div>
                               
                                
                            </div>
                            
                            <div  id="space_div" class="space20" ></div>
                      	<form:form id="tableform" onsubmit="submitFunction()" name="coverDetailsForm" class="form-horizontal" modelAttribute="productsLst" >
					                    
                            <div class="row-fluid">
                            <div class="widget-body">
                                <table id="coverTable" class="table table-striped table-bordered" style="width:80%;margin:auto;">
                                    <thead>
                                    <tr>
                                    <th style="display: none;">treatment_id</th>
                                    <th style="display: none;">actual_quantity</th>
                                    
                                        <th style="display: none;">product_id</th>
                                        <th data-override="product_name"><spring:message code="ProductName" /></th>
                                        <th data-override="treatment_name"><spring:message code="Treatment" /></th>
                                        <th data-override="quantity"><spring:message code="PlannedQ" /></th>
                                        <th><spring:message code="ActualQ" /></th>
                                        
                                    </tr>
                                    
                                    </thead>
                                    <tbody >
                                    <c:forEach var="product" items="${productsLst.coverProducts}" varStatus="vs">
                                    <tr>
                                    
                                        <td style="display: none;">${product.treatment_id}</td>
                                        <td style="display: none;" id="actualNum[${vs.index}]">${product.actual_quantity}</td>
                                        <td style="display: none;">${product.product_id}</td>
                                        <td>${product.product_name}</td>
                                        <td>${product.treatment_name}</td>
                                        <td>${product.quantity}</td>
                                        <td> <form:input required="true" class="inputActual" id="productActual[${vs.index}]" onchange="changeActual(${vs.index})" min="0" path="coverProducts[${vs.index}].actual_quantity" type="number"  max="${product.quantity}" /> </td>   
                                    </tr>
                             </c:forEach>
                                    </tbody>
                                </table>
                                <div class="space20"></div>
                                 <div class="row-fluid  " id="btn_div">
                                <div class="widget-body">
                                 <button id="submitBtn" type="button" onclick="validateForm()" class="btn btn-success pull-right green mright5 "><i class="icon-save icon-white"></i> <spring:message code="Submit" /></button>   
                                
                             <button type="button" id="printBtn"  disabled class="btn btn-primary pull-right" style="margin-right:5px;" onclick="print_data();"><i class="icon-print  icon-white"></i> <spring:message code="Print" /></button>   
                            
       
                                  <!--  <button id="submitBtn" type="submit" class="btn btn-success pull-right green mright5 "><i class="icon-save icon-white"></i> Submit</button>   
       -->
                            </div></div>
                                <table id="print_tbl" class="table table-striped table-bordered" style="width:80%;margin:auto;">
                                <thead>
                                    <tr>
                                    
                                        <th data-override="product_name"><spring:message code="ProductName" /></th>
                                        <th data-override="treatment_name"><spring:message code="Treatment" /></th>
                                        <th data-override="quantity"><spring:message code="PlannedQ" /></th>
                                        <th><spring:message code="ActualQ" /></th>
                                        
                                    </tr>
                                    
                                    </thead>
                                    <tbody></tbody>
                                </table>
                                
                                
                            </div></div>
                            <div  class="space20" ></div>
                        <div class="clearfix"></div>
                            
                           
                            
                             <div class="widget-body" style="    font-family: cursive; font-size: 18px;     text-align: justify;"  >
                             <div id="endorsement" style="display: none;"  dir="rtl">
                            <strong dir="rtl" >
                            <spring:message code="Endorsement" /><br dir="rtl" />
                            </strong>
                            <br>
                            </div>
                         <!--    <div align="center">
                            <strong > NO DUST</strong>
                            </div>  -->
                             
                            </div>
                            <br><br>
                            <div  class="row-fluid  " > 
                            <strong id="nodust_misr" style="text-align:left; margin-left:25px;"><spring:message code="MisrNoDust"/></strong>
                       
                        <strong id="date_time_now" style="text-align: center; margin-left:200px;"> </strong>
                        </div>
                        </form:form>
						
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
    	//$("#tableform").addClass("disabledbutton");
      });
      
      
      function changeActual(index) {
		var tmp = document.getElementById("productActual["+index+"]").value;
		 document.getElementById("actualNum["+index+"]").innerHTML = tmp
		//alert(tmp);
  	 // console.log(tmp);

	}
      
      
      $(document).ready(function() {
    	  
				
  	    
  	});
      
      function submitData() {
    	 
    	  document.getElementById("submitBtn").disabled = true;
    	  var table = $('#coverTable').tableToJSON(
    			  { ignoreColumns:[7]}
    			  );
    	  
    	  
    	  var coverData ={
    			  "coverProducts" : table ,
    			  "assignDate" : '${productsLst.assignDate}' ,
    			  "wareHouseName":' ${productsLst.wareHouseName} '
    	  };
    	  var driver ={};
    	  driver.user_NAME= '${productsLst.driver.USER_NAME}';
    	  coverData.driver = driver;
    	  console.log(coverData);
    	var xhttp = new XMLHttpRequest();
    	xhttp.onreadystatechange = function() {

    	if (this.readyState == 4 && this.status == 200) {
    		var response= this.responseText;
    		if(response == "success")
    			{
	    			$('#tableform input[type="number"]').prop("disabled", true);
	
	    			swal("<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.title" />","<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.content" />","success");
	      	    /*	$.alert({
	                    title: "<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.title" />",
	        		    content:"<spring:message code="Releasingproduct.CoverList.details.SuccessSubmit.content" />",
	                    });*/ 
	      	    	document.getElementById("submitBtn").disabled = true;
	      	    	document.getElementById("printBtn").disabled = false;
	      	    	document.getElementById("endorsement").style.display = "block";
	      	    	var today = new Date();
	      	    	var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
	      	    	var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
	      	    	var dateTime = date+' '+time;
	      			//document.getElementById("showDate").innerHTML = dateTime;
	      	    	


      	    	
    			}
    		else if(response =="no session"){
    			location.reload();
    		}
    		else{
    			
    			$('#tableform input[type="number"]').prop("disabled", false);


    			swal("<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.title" />","<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.content" />","error");
    		 	 /* $.alert({
    		                         title: "<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.title" />",
    		             		    content:"<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.content" />",
    		                         }); */
    		  	      document.getElementById("submitBtn").disabled = false;
    			    	document.getElementById("printBtn").disabled = true ;
    		}
    	 }
    	 }
    	 xhttp.open("POST","submitCoverDetails", true);
    	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    	 xhttp.send(JSON.stringify(coverData));
	}
      function print_data()
      {
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
    	  var table=document.getElementById("coverTable");
    	  var rows_num=table.rows.length;
    	  var rows="";
    	   for(var x=1;x<rows_num;x++)
    		   {
    		   var product_name=table.rows[x].cells[3].innerHTML;
    		   var treatment_name=table.rows[x].cells[4].innerHTML;
    		   var planned_quantity=table.rows[x].cells[5].innerHTML;
    		   var actual_quantity=table.rows[x].cells[1].innerHTML;
    		   rows+="<tr>"+
    		   "<td>"+product_name+"</td>"+
    		   "<td>"+treatment_name+"</td>"+
    		   "<td>"+planned_quantity+"</td>"+
    		   "<td>"+actual_quantity+"</td>"+
    		   "</tr>";
    		   }
    	   $('#print_tbl tbody').html(rows);
    	  window.print();
      }
      
    function validateForm() {
    	 var validation = document.getElementById("tableform").reportValidity()
    	 if(validation != false)
    		 {
    		 var table = document.getElementById("coverTable");
	       	  var x = 0;
	       	var rowCount = $('#coverTable tr').length - 1;
		       	  for (var i = 0 ; i<rowCount ; i++) {
		       		var tmp = document.getElementById("productActual["+i+"]").value;
		       		  if (tmp > 0){
		       			  x++;
		       			  break;
		       			 }
		       	  }
       	  
	       	  if(x>0)
	       		  {
	       		submitData()
	       		  }
	       	  else{
	       		           
			       		$('#tableform input[type="number"]').prop("disabled", false);
		
		
			       		swal("<spring:message code="Releasingproduct.CoverList.details.validate.title" />","<spring:message code="Releasingproduct.CoverList.details.validate.content" />","error");
			      /*	  $.alert({
			                           title: "<spring:message code="Releasingproduct.CoverList.details.validate.title" />",
			               		    content:"<spring:message code="Releasingproduct.CoverList.details.validate.content" />",
			                           }); */
			      	      document.getElementById("submitBtn").disabled = false;
			          	document.getElementById("printBtn").disabled = true ;
			       		  
	       	  }
    		 }
	}

   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>