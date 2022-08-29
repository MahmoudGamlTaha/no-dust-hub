<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
             <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="ConvertProductsDetails.PageTitle"/></title>
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
          <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
       
   
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
 #warehouse_name_div
  {
  float:left;
  width:40%;
  }
  #status_div
  {
  float:left;
  width:30%;
  }
  #agent_name_div
{
float:left;
width:30%;
}
#convert_date_div
{
float:left;
width:30%;
}
#approved_by_div
{
float:left;
width:40%;
}
#approval_time_div
{
float:left;
width:30%;
}
#space_div
  {
  display:none;
  }
#nodust_misr
{
visibility:hidden;
}
#date_time_now
{
visibility:hidden;
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
  #space_div
  {
  display:block;
  }
 
 #nodust_misr
{
visibility:visible;
}
#date_time_now
{
visibility:visible;
} 
 #warehouse_name_div
  {
  float:left;
  width:40%;
  }
  #status_div
  {
  float:left;
  width:30%;
  }
  #agent_name_div
{
float:left;
width:30%;
}
#convert_date_div
{
float:left;
width:30%;
}
#approved_by_div
{
float:left;
width:40%;
}
#approval_time_div
{
float:left;
width:30%;
}
  #rejectBtn{
   display: none;}
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
<div id="fff">

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
                           <a href="ConvertProductRequests"><spring:message code="ConvertProductRequests.PageTitle"/></a><span class="divider">&nbsp; &nbsp; &nbsp; &nbsp;</span>
                       </li>
                       
                       <li>
                           <a href="ConvertProductsDetails?ConvertID=${convertID}"><spring:message code="ConvertProductsDetails.PageTitle"/></a><span class="divider-last">&nbsp; &nbsp;</span>
                       </li>
                     
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
     				   <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:5%;   margin-top: -50px ; " id="logoprint">
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4><spring:message code="ConvertProductsDetails.PageTitle"/></h4>
                        </div>
                        
						<div class="widget-body" style="text-align: left;">
						<div class="space10"></div>
						
                      <div class="row-fluid">
                      
                      <div class="widget-title">
                      <h4><spring:message code="OrderData_Page_Title"/></h4>
                      </div>
                      
                      <div style="border:outset;">
                      <div class="space10"></div>
								 <div id="warehouse_name_div">
		                              <label style="margin-left:10px;"><strong><spring:message code="warehousename" /></strong><span>${warehouse}</span></label>
		                         </div >
		                          <div id="agent_name_div">
		                              <label ><strong><spring:message code="Agentname" /></strong> <span>${LoggedUser}</span></label>
		                         </div>
		                          <div id="convert_date_div">
		                              <label ><strong><spring:message code="ConvertDate" /></strong><span><fmt:formatDate value="${convertDate}" pattern="dd-MM-yyyy" /></span></label>
		                         </div>
                           
                           
                           <div class="space10"></div>
                          
                           <div id="approved_by_div">
                            <label style="margin-left:10px;"><strong><spring:message code="ApprovedBy_" /></strong> <span>${approved_by}</span></label>
                           
                           </div>
                            <div id="status_div">
		                              <label ><strong><spring:message code="status_" /> </strong><span class="text" id="status"><spring:message code="pending" /></span></label>
		                
		                         </div>
                           <c:if test="${status!='Pending'}">
                           <div id="approval_time_div">
                                  <label ><strong><spring:message code="ApprovalDate_" /> </strong><span><fmt:formatDate value="${approval_time}" pattern="dd-MM-yyyy h:mm" /></span></label>
                           
                           </div>
                           </c:if>
                           
                                                      <div class="space10"></div>
                           
						<div class="span12" style="margin-left: 0; ">
								
		                         
		                        
                           </div>
                         
                        </div>
                        </div>
                
                
                
                    <div class="space10"></div>
                            <div id="tableBtns">
    
			       
                  
                            <div class="row-fluid">
                   <div class="span12" >
                   <div id="space_div" class="space20"></div>
                                <table style="width:80%; margin:auto;" id="example" 
                               
                                class="table dataTable table-striped table-bordered   table-advance table-hover table-responsive ">
                                    <thead>
                                    <tr>
                                      
                                        <th ><spring:message code="product_only" /></th>
                                        <th ><spring:message code="Treatment" /></th>
                                        <th ><spring:message code="Quantity" /></th>
                                        <th ><spring:message code="comment_"/></th>
                                    
                                    </tr>
                                    
                                    </thead>
                                    <tbody>
                                  
                                 <c:forEach var="product" items="${products}" >
                                    <tr class="odd gradeX "> 
                                    <td style="width:fit-content;">${product.product_name}</td>
                                    <td>${product.treatment}</td>                                   
                                    <td>${product.quantity}</td> 
                                    <td style=" word-break: break-all;">${product.comment}</td> 
                                      
                               <!--  <td>  <div id=commentss ></div>  </td> -->
                                  
                                 
                                 
                                      </tr> 
                    		     </c:forEach>
                                   
                               
                                    </tbody>
                                </table>
                           </div>     
                            </div>
                       <div class="space20"></div> 
                       <div class="clearfix"></div>
                                             
                    <div class="row-fluid  ">
                    
    
				  
                           <button type="button" id="submitBtn" onclick="submitForm('Accept')" class="btn btn-success pull-right  mright5 " style="margin-bottom: 5px;"><i class=" icon-ok icon-white mright5"></i><spring:message code="Approve" /> </button>
                        				          <button type="button" id="rejectBtn" onclick="submitForm('reject')" class="btn btn-danger pull-right  mright5 " style="margin-bottom: 5px;"><i class="icon-remove icon-white mright5"></i><spring:message code="Reject" /></button>
                        
                                     <button type="button" id="printBtn" disabled class="btn btn-primary pull-right" onclick="print_data();" style="margin-right:5px;"><i class="icon-print  icon-white"></i> <spring:message code="Print"/></button>   
                                             
                            </div>   
                              
            
						 </div>
						 
                        </div>
                     </div>
                        <br> <br> <br>   
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
  	  if('${status}'!="Pending")
    	{
  		  document.getElementById("rejectBtn").disabled = true;
    	  document.getElementById("submitBtn").disabled = true;
        document.getElementById("printBtn").disabled = false;
var status='${status}';
    	
    		 
    	}
  	 $(".text").html(status);
 	   
  	});

      function submitForm(val) {
    	  document.getElementById("rejectBtn").disabled = true;
    	  document.getElementById("submitBtn").disabled = true;
    	 if ('${convertID}' != null && '${convertID}' != "")
    		 {
    		 
       	  var inventoryCheck ={
       			  "id" : '${convertID}' ,
       			  "approveVa" : val  
       	  };
    		 var xhttp = new XMLHttpRequest();
    	    xhttp.onreadystatechange = function() {

    	    if (this.readyState == 4 && this.status == 200) {
    	    		var response= this.responseText;
    	    		if(response == "success")
    	    			{
    	    			 document.getElementById("submitBtn").disabled = true;
    		          	 document.getElementById("rejectBtn").disabled = true;
    		          	document.getElementById("printBtn").disabled = false;
    		          	 if (val== "Accept")
    		          		 {
    		          		$(".text").html("Approved");
    		          		swal("<spring:message code="AppriveInventoryCheck.Approve.title" />","<spring:message code="ApproveConvertProduct.Approve.content" />","success");
    		      	    	/*$.alert({
    		      	    		
    		                    title: "<spring:message code="AppriveInventoryCheck.Approve.title" />",
    		        		    content:"<spring:message code="ApproveConvertProduct.Approve.content" />",
    		                    }); */
    		      	    
    		          		 }
    		          	 else{
    		          		$(".text").html("Rejected");
    		          		swal("<spring:message code="AppriveInventoryCheck.Reject.title" />","<spring:message code="ApproveConvertProduct.reject.content" />","success");
/*$.alert({
    		      	    		
    		                    title: "<spring:message code="AppriveInventoryCheck.Reject.title" />",
    		        		    content:"<spring:message code="ApproveConvertProduct.reject.content" />",
    		                    }); */
    		          	 }
    	    			}
    	    		else if(response =="no session"){
    	    			location.reload();
    	    		}
    	    		else if (response =="not success"){
    	    			document.getElementById("submitBtn").disabled = false;
 	    			    document.getElementById("rejectBtn").disabled = false ;
 	    			    swal("<spring:message code="ViewDirtyShipmentsDetails.alreadySubmitted.title" />","<spring:message code="inventoryCheckAlreadyApproved" />","error");
    	    		 	 /* $.alert({
    	    		                         title: "<spring:message code="ViewDirtyShipmentsDetails.alreadySubmitted.title" />",
    	    		             		    content:"<spring:message code="InventoryCheck.Failedsubmitted.title" />",
    	    		             }); */
    	    		  	   
    	    		}

    	    	 }
    	    	 }
    	    	 xhttp.open("POST","approveRejectConvertReq", true);
    	    	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    	    	 xhttp.send(JSON.stringify(inventoryCheck));
    		 }
    	  
      }
      
      
      function print_data()
      {
    	  var today = new Date();
		  var date=today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
  	 //  var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
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
   </script>
   
   
<script type="text/javascript">
// function comm(val) {
var long_string = '${products[0].comment}';

document.getElementById('commentss').innerHTML = long_string.replace(/(.{80})/g, "$1<br>");
//}
</script>

    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>