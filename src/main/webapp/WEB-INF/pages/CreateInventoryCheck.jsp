<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
             <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="CreateInventoryCheck.PageTitle"/></title>
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
                           <a href="InventoryCheck"><spring:message code="InventoryCheck.PageTitle"/></a><span class="divider">&nbsp; &nbsp;</span>
                       </li>
                       
                         <li>
                           <a href="#"><spring:message code="CreateInventoryCheck.PageTitle"/></a><span class="divider-last">&nbsp; &nbsp;</span>
                       </li>
                     
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4><spring:message code="CreateInventoryCheck.PageTitle"/></h4>
                        </div>
                        
						<div class="widget-body" style="text-align: left;">


		<table width="100%" >
<tr>
<td>
<div class="space10"></div>
<div class="widget-title" id="titlepage">
                           <h4><spring:message code="InventoryCheckData"/></h4>
                        </div>
                        
<div class="row-fluid invoice-list" style="border:outset;">
                              
                             <div class="row-fluid">
                                
                                    <div style="float:left; width:40%;"> <h5 style="margin-left:5px;"><strong><spring:message code="warehousename" /></strong>
                                     ${data.warehouse} 	</h5></div>
                                    <div style="float:left; width:30%;"> <h5 ><strong><spring:message code="Agentname" /></strong>
                                     ${data.agent} 	</h5></div>
                                 <div >
                                    <div style="float:left; width:30%;"> <h5 ><strong><spring:message code="Date" /> </strong>	
                                     ${data.date} </h5></div>
                                </div>
                             </div>
                             
                                 
                               
                                  
                            
                            <div  id="inventory_comment" >
                           <h5  style="float: left; text-align: left; direction: ltr; margin-left:5px;" ><strong><spring:message code="comment"/></strong> </h5> 
                               
                                    <textarea id="comment" class="span10" style="margin-left: 2px;"></textarea>
                               
                                </div>
                                </div>
</td>
</tr>
</table>
 						


                         
                  							               
                 
                    <div class="space10"></div>
                            <div id="tableBtns" class="row-fluid  ">
    
			       
                           <div class="space10"></div>                             
                            </div>         
                    
                        
                   
			
			           
			
                            <div  class="row-fluid">
                   <form id="tableform" action="">
                                <table id="example" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width:80%;margin:auto;">
                                    <thead>
                                    <tr>
                                     
                                        <th ><spring:message code="ProductName"/></th>
                                        <th><spring:message code="ProductType"/></th>
                                        <th ><spring:message code="Treatment"/></th>
                                        <th data-override="system_quantity" ><spring:message code="AvailableQ"/></th> 
                                       <th ><spring:message code="ActualQ"/></th> 
                                        <th ><spring:message code="Difference"/> </th>
                                        <th style="display: none;">product_id</th>
                                        <th style="display: none;">quantity</th>
                                    </tr>
                                    
                                    </thead>
                                    <tbody>
                                  
                                    
                                    <c:forEach var="product" items="${data.products}" varStatus="vs">
                                    <tr class="odd gradeX ">
	                                    <td>${product.product_name}</td>
	                                    <td>
	                                   ${product.type_name}
	                                     </td>
	                                    <td>${product.treatment}</td>
	                                    <td><c:if test="${empty product.quantity}"> 0</c:if>
	                                   <c:if test="${not empty product.quantity}"> ${product.quantity}</c:if></td>
	                                    <td><input required="required" type="number" class="span6" min="0" step="1" onchange="changeDif(this)"></td>
	                                     <td>
	                                   </td>
	                                     <td style="display: none;">${product.product_id}</td>
	                                     <td style="display: none;">0</td>
	                                     
                                    </tr>
                                    </c:forEach>
	                                   
                                  
                                    </tbody>
                                </table>
                                </form>
                            </div>
                       <div class="space20"></div> 
                       <div class="clearfix"></div>
                                             
                  
                            <div class="row-fluid  ">
    
				  
                           <button type="button" onclick="disableBtn()"  id="submitBtn" class="btn btn-success pull-right  mright5 " style="margin-bottom: 5px;"><i class="icon-save icon-white mright5"></i><spring:message code="Submit"/></button>
                                             
                                                      
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
      

      
    <script>     
      $(document).ready(function() {
  	    $('.js-example-basic-multiple').select2();
 	   
  	});
      function disableBtn() {
    	  document.getElementById('submitBtn').disabled = true;
    	  var validation = document.getElementById("tableform").reportValidity()
      	 if(validation != false)
      		 {
      		 var table = $('#example').tableToJSON(
        			  { ignoreColumns:[0,1,2,4,5]}
        			  );
        	  //alert(table);
        	  console.log(table);
        	  
        	  var comm=document.getElementById("comment").value;
     	  
     	  var data={
     			  "products" : table ,
     			  "comment":comm
     	  };
     	  
     	  console.log(data);
     	var xhttp = new XMLHttpRequest();
     	xhttp.onreadystatechange = function() {

     	if (this.readyState == 4 && this.status == 200) {
     		var response= this.responseText;
     		if(response == "success")
     			{
 	    			$('#tableform input[type="number"]').prop("disabled", true);
 	    			document.getElementById("comment").disabled=true;
 	    			swal("<spring:message code="InventoryCheck.submitted.title" />","<spring:message code="InventoryCheck.submitted.content" />","success");
 	      	    	/*$.alert({
 	      	    		
 	                    title: "<spring:message code="InventoryCheck.submitted.title" />",
 	        		    content:"<spring:message code="InventoryCheck.submitted.content" />",
 	        		    buttons: {
 	          	    	  
 	          	    	
 	          	        OK: function () {
 	          	        	window.location.replace("InventoryCheck");
 	          	        	//history.go(-1);

 	          	        }
 	        		    }
 	                    });*/ 
 	      	    	document.getElementById("submitBtn").disabled = true;
     			}
     		else if(response =="no session"){
     			location.reload();
     		}
     		else if (response =="not success"){
     			
     			$('#tableform input[type="number"]').prop("disabled", false);

swal("<spring:message code="InventoryCheck.Failedsubmitted.title" />","<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.content" />","error");
     		 	 /* $.alert({
     		                         title: "<spring:message code="InventoryCheck.Failedsubmitted.title" />",
     		             		    content:"<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.content" />",
     		                         }); */
     		  	      document.getElementById("submitBtn").disabled = false;
     		}
     		else{
     			
     			$('#tableform input[type="number"]').prop("disabled", false);
     			swal("<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.title" />",response,"error");
     			/*$.alert({
                      title: "<spring:message code="Releasingproduct.CoverList.details.FailedSubmit.title" />",
          		    content:response,
                      }); */
 	      document.getElementById("submitBtn").disabled = false;
     		}
     	 }
     	 }
     	 xhttp.open("POST","submitInventoryCheck", true);
     	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
     	 xhttp.send(JSON.stringify(data));
      		 }
      	 else{
  	    	document.getElementById("submitBtn").disabled = false;

      	 }
    	  
    	  
    	  
    	//  
	}
      
      function changeDif(tmp) {
		var x = tmp.value;
		var rowIndex =tmp.parentNode.parentNode.rowIndex ;
		
		var myTable = document.getElementById('example');
		var y =document.getElementById("example").rows[rowIndex].cells[3].innerHTML;
         myTable.rows[rowIndex].cells[5].innerHTML= x-y;
         myTable.rows[rowIndex].cells[7].innerHTML = x;
		
	}
   </script>
   
   

    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>