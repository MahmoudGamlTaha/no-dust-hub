<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
             <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="ApproveInventoryCheckTitle"/></title>
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
#lost_data
{
visibility:hidden;
}
   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}
#check_id_div
{
float:left;
width:25%;
}
#check_date_div
{
float:left;
width:50%;
}
#status_div
{
float:left;
width:25%;
}
#warehouse_name_div
{
float:left;
width:50%;
}
#agent_div{
float:left;
width:50%;
}
#date_time_now{visibility:hidden;}
#logoprint{visibility:hidden;}
  #A_M
  {
  visibility:hidden;
  }
   #S_K
  {
  visibility:hidden;
  }
   #W_M
  {
  visibility:hidden;
  }
#date_time_now{visibility:hidden;}
    #nodust_misr{visibility:hidden;}
@font-face {
  font-family: ArbFONTS;
  src: url(ArbFONTS-Abdo-salem-Bold.ttf);
}

   </style>
   	 
 <style type="text/css" media="print">

 @page { size:A4 ;  }
  
  @media print {
  #A_M
  {
  visibility:visible;
  }
   #S_K
  {
  visibility:visible;
  }
   #W_M
  {
  visibility:visible;
  }
  #printBtn {
    display: none;
  }
  #rejectBtn{
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
#lost_data
{
visibility:visible;
display:inline;
}
 
 #showDate{ color: black;}
  #titlepage{ display: none;}
    #date_time_now{visibility:visible;}
    #nodust_misr{visibility:visible;}
  
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
                           <a href="MyInventoryCheck"><spring:message code="MyInventoryCheck.PageTitle"/></a><span class="divider">&nbsp; &nbsp; &nbsp; &nbsp;</span>
                       </li>
                       
                       <li>
                           <a href="InventoryCheckDetails?CheckID=${check.id}"><spring:message code="InventoryCheckDetails.PageTitle"/></a><span class="divider-last">&nbsp; &nbsp;</span>
                       </li>
                     
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          		                 <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:25%;   margin-top: -50px ; " id="logoprint">
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4><spring:message code="InventoryCheckDetails.PageTitle"/></h4>
                        </div>
                        
						<div class="widget-body" style="text-align: left;">
						
						<div class="widget-title" >
                           <h4><spring:message code="InventoryCheckData"/></h4>
                        </div>
                      <div class="row-fluid" style="border:outset;">
                      
                      <div class="row-fluid" style="margin-left: 0; ">
                      <div class="space10"></div>
								 <div id="check_id_div">
		                              <label ><strong style="margin-left:5px;"><spring:message code="Check_ID" /></strong><span>${check.id}</span></label>
		                         </div>
		                  <div id="status_div" class="span12" style="margin-left: 0; ">
								 <div class="control-group span6" style="margin-bottom: 0px;">
		                              <strong><spring:message code="status_" /></strong> <h5 class="text" id="status" style="display:contents;"><spring:message code="pending" /></h5>
		                
		                         </div>
		                         
                           </div>       
		                          <div id="check_date_div">
		                              <label ><strong><spring:message code="Check_Date" /></strong><span><fmt:formatDate value="${check.check_date}" pattern="dd-MM-yyyy HH:mm"  /></span></label>
		                         </div>
                           </div>
                         <div class="space10"></div>  
                           
						<div class="row-fluid">
								 <div id="warehouse_name_div">
		                              <label ><strong style="margin-left:5px;"><spring:message code="warehousename" /> </strong><span>${warhouse}</span></label>
		                         </div>
		                         
		                          <div id="agent_div">
		                              <label > <strong><spring:message code="warehouseAgentName" /></strong> <span>${check.logged_user}</span></label>
		                         </div>
                           </div>
                           <div class="space10"></div>
                           
                         
                        </div>
                
                    <div class="space10"></div>
                            <div id="tableBtns" class="row-fluid  ">
    
			       
                             
                   
			      
			
                            <div class="row-fluid">
                   <div class="space20"></div>
                                <table id="tableform" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width:fit-content;margin:auto;">
                                    <thead>
                                    <tr>
                                      
                                        <th ><spring:message code="ProductName" /></th>
                                        <th><spring:message code="ProductType"/></th>
                                        <th ><spring:message code="Treatment" /></th>
                                        <th ><spring:message code="LastQ" /></th>
                                        <th ><spring:message code="ActualQ" /></th>
                                        <th ><spring:message code="Difference"/></th>
                                    
                                    </tr>
                                    
                                    </thead>
                                    <tbody>
                                  
                                 <c:forEach var="product" items="${products}" >
                                    <tr class="odd gradeX "> 
                                    <td>${product.product_name}</td>
                                    <td>${product.p_type}</td>
                                    <td>${product.treatment}</td>
                                    <td>${product.system_quantity}</td> 
                                    <td>${product.actual_quentity}</td>
                                    <td class="diff">${product.actual_quentity-product.system_quantity}</td>
                                 
                                      </tr> 
                    		     </c:forEach>
                                   
                               
                                    </tbody>
                                </table>
                                
                            </div>
                       <div class="space20"></div> 
                       <div class="clearfix"></div>
                                             
                    <div class="row-fluid  ">
    
    
				  
                           <button type="button" id="submitBtn" onclick="submitForm('Accept')" class="btn btn-success pull-right  mright5 " style="margin-bottom: 5px;"><i class=" icon-ok icon-white mright5"></i><spring:message code="Approve" /> </button>
                        				          <button type="button" id="rejectBtn" onclick="submitForm('reject')" class="btn btn-danger pull-right  mright5 " style="margin-bottom: 5px;"><i class="icon-remove icon-white mright5"></i><spring:message code="Reject" /></button>
                        
                                                                        <button type="button" id="printBtn"  disabled  style="margin-right:5px;" class="btn btn-primary pull-right" onclick="print_data()"><i class="icon-print  icon-white"></i> <spring:message code="Print" /></button>   
                                             
                            </div > 
                            <div id="lost_data" >
                            <c:if test="${check_lost=='Lost'}">
                                               <strong><spring:message code="LostProducts"/></strong>
                              
                             <div class="row-fluid" style="margin-top: 15px;">
                                <table id="tableform" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width:fit-content; margin:auto;">
                                    <thead>
                                    <tr>
                                      
                                        <th ><spring:message code="ProductName" /></th>
                                        <th><spring:message code="ProductType"/></th>
                                        <th ><spring:message code="Treatment" /></th>
                                        <th ><spring:message code="LostQuantity"/></th>
                                    
                                    </tr>
                                    
                                    </thead>
                                    <tbody>
                                  
                                 <c:forEach var="product" items="${products}" >
                                 <c:if test="${product.actual_quentity<product.system_quantity}">
                                    <tr class="odd gradeX "> 
                                    <td>${product.product_name}</td>
                                    <td>${product.p_type}</td>
                                    <td>${product.treatment}</td>
                                    <td id='check_dif' class="diff">${product.actual_quentity-product.system_quantity}</td>
                                 
                                      </tr> 
                                      </c:if>
                    		     </c:forEach>
                                   
                               
                                    </tbody>
                                </table>
                                
                            </div>
                            </c:if>
                            </div>
                            <div class="clearfix"></div>
                      
                              
                <div  class="row-fluid  " style="margin-top: 30px; ">
                         <div style="width: 33% ; float: left; text-align: center;"   id="A_M" >   <strong><spring:message code="AccountingManager"/></strong></div>
                        <div  style="width: 33% ; float: left; text-align: center;" id="S_K" >   <strong ><spring:message code="Storekeeper"/></strong></div>
                        <div  style="width: 33% ; float: left; text-align: center;" id="W_M" > <strong ><spring:message code="warehouseManager"/></strong></div>
                            
                            </div>
						 </div>
						 
                        </div>
                     </div>
                  </div>
                  
               </div>
               <br><br><br><br>
                                  <div  class="row-fluid  " > 
                            <strong id="nodust_misr" style="text-align:left; margin-left:25px;"><spring:message code="MisrNoDust"/></strong>
                       
                        <strong id="date_time_now" style="text-align: center; margin-left:200px;"> </strong>
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
    
    $('.diff').each(function() {
    	if ($(this).text() < 0) {
        	$(this).css('color', '#b51b1b');
        	$(this).css('font-weight','bold');
        }
    	else{
    	    	 $(this).css('color', '#28a745');
    	    	 $(this).css('font-weight','bold');
    	      
    	}
    	});
    
      $(document).ready(function() {
    	  if ('${check.last_status_id}' == '3'||'${check.last_status_id}' == '4')
    		  {
    		  document.getElementById("submitBtn").disabled = true;
	          	 document.getElementById("rejectBtn").disabled = true;
	          	document.getElementById("printBtn").disabled = false;
	          	if ('${check.last_status_id}' == '3')
	          		{
	          		$(".text").html("Approved");
	          		//document.getElementById("lost_data").style.visibility='visible';
	          		}
	          	else {
	          		$(".text").html("Rejected");
	          		document.getElementById("lost_data").style.display='none';


	          	}
    		  }
  	    $('.js-example-basic-multiple').select2();
 	   
  	});

      function submitForm(val) {
    	  
    	  document.getElementById("rejectBtn").disabled = true;
    	  document.getElementById("submitBtn").disabled = true;
    	 if ('${check.id}' != null && '${check.id}' != "")
    		 {
    		 
       	  var inventoryCheck ={
       			  "id" : '${check.id}' ,
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
    		          		swal("<spring:message code="AppriveInventoryCheck.Approve.title" />","<spring:message code="AppriveInventoryCheck.Approve.content" />","success");
    		      	    	/*$.alert({
    		      	    		
    		                    title: "<spring:message code="AppriveInventoryCheck.Approve.title" />",
    		        		    content:"<spring:message code="AppriveInventoryCheck.Approve.content" />",
    		                    }); */
    		      	    
    		          		 }
    		          	 else{
    		          		$(".text").html("Rejected");
    		          		swal("<spring:message code="AppriveInventoryCheck.Reject.title" />","<spring:message code="AppriveInventoryCheck.Reject.content" />","success");
							/*$.alert({
    		      	    		
    		                    title: "<spring:message code="AppriveInventoryCheck.Reject.title" />",
    		        		    content:"<spring:message code="AppriveInventoryCheck.Reject.content" />",
    		                    }); */
    		          	 }
    	    			}
    	    		else if(response =="no session"){
    	    			location.reload();
    	    		}
    	    		else if (response =="not success"){
    	    			document.getElementById("submitBtn").disabled = false;
 	    			    document.getElementById("rejectBtn").disabled = false ;
 	    			   document.getElementById("printBtn").disabled = true;
 	    			   swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="InventoryCheck.Failedsubmitted.title" />","error");
    	    		 	  /*$.alert({
    	    		                         title: "<spring:message code="ViewDirtyShipmentsDetails.alreadySubmitted.title" />",
    	    		             		    content:"<spring:message code="InventoryCheck.Failedsubmitted.title" />",
    	    		             }); */
    	    		  	   
    	    		}

    	    	 }
    	    	 }
    	    	 xhttp.open("POST","approveRejectInventoryCheck", true);
    	    	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    	    	 xhttp.send(JSON.stringify(inventoryCheck));
    		 }
    	  
      }
      
      
   </script>
   <script>
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
	  var x_status=document.getElementById("status").innerText;
	   if(x_status == 'Approved')
		   {
		   document.getElementById("lost_data").display='inline';
		   }
	   else
		   {
		   document.getElementById("lost_data").display='none';
		   
		   document.getElementById("lost_data").style.visibility='hidden';

		   }
	   window.print();
   }
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
    
</body>
<!-- END BODY -->
</html>