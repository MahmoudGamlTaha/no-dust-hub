<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
       <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="ViewCashTransfer"/></title>
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
      <link rel="stylesheet" href="resources/css/jquery-confirm.min.css"/>
         <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
      
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
     <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
    
 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
 <style type="text/css">
 	   #logoprint{display: none;}
  #nodust_misr
  {
  visibility:hidden;
  }
#date_time_now
{
visibility:hidden;
}
 </style>
   <style type="text/css" media="print">


  @page { size:A4 portrait; }
  
  @media print {
  #attach_div{
  display:none;
  }
  #nodust_misr
  {
  visibility:visible;
  }
#date_time_now
{
visibility:visible;
}
    #logoprint{display: block;}
  
  #nav_div{
  display:none;
  }
  #printBtn {
    display: none;
  }
#title_page
{
display:none;
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
 #reattachBtn{
 display:none;
 }
 #upload_div{
 display:none;
 }
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
               <div  id="links"  class="span12">
                  
                
			
                  <ul class=" breadcrumb mtop5 pull-left">
                       <li>
                           <a href="DashboardNoDust"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                         <li>
                         <a href="InternalCashTransferList">Internal Cash Transfer List</a>
                          <span class="divider">&nbsp; &nbsp;</span>
                         </li>
                    <li><a href="ViewInternalCashTransferDetails?shipment_id=${cash_form.shipment_id}"> View Internal Cash Transfer</a><span class="divider-last">&nbsp;</span></li> 
                  </ul>
          
               </div>
            </div>
       
	   
            <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:35%;   margin-top: -15px ; " id="logoprint">
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div  id="title_page" class="widget-title">
                           <h4> View Internal Cash Transfer</h4>
                        </div>
                        
						 
				 
						 <div class="widget-body" style="text-align: left;" >
						 
		
						<table width="100%" dir="ltr"> 
<tr>
<td>
<form:form modelAttribute="cash_form" id="f_cash">
<div class="space10"></div>
<div class="widget-title">
                           <h4> <spring:message code="CashData"/></h4>
                        </div>
                        
<div class="row-fluid " style="border:outset;">
                               
                
                              <div class="row-fluid">
                       
                               
                              
                               <div  style="float:left;width:50%;">
                                    <div > <h5 style="margin-left:5px;">  <strong>Shipment Date :  </strong> ${cash_form.shipment_date}</h5></div>
                                </div>
                                <div  style="float:left;width:50%;">
                                    <div > <h5 > <strong><spring:message code="Agentname"/></strong> ${agent } </h5></div>
                                </div>
                      
                              </div>
                              
                                <div class="row-fluid">
                       
                               <div  style="float:left;width:50%;">
                                    <div > <h5 style="margin-left:5px;"><strong> From Facility :  </strong>  ${cash_form.from_facility}</h5></div>
                                </div> 
                                <div  style="float:left;width:50%;">
                                    <div > <h5 > <strong>To Facility : </strong>  ${cash_form.to_facility} </h5></div>
                                </div>
                      
                              </div>
                              
                              
                               <div class="row-fluid">
                       <c:if test="${cash_form.from_account!=null }">
                                <div  style="float:left;width:50%;">
                                    <div > <h5 style="margin-left:5px;"> <strong>From Account </strong> ${cash_form.from_account}</h5></div>
                                </div>
                                </c:if>
                                <div style="float:left;width:50%;">
                                    <div > <h5 > <strong>To Account:  </strong>${cash_form.to_account} </h5></div>
                                </div>
                       <div style="float:left;width:50%;">
                                    <div > <h5 style="margin-left:5px;"> <strong>Cash Amount : </strong> ${cash_form.amount }</h5></div>
                                </div>
                              </div>
                               
                               <div class="row-fluid">
                       
                               
                               
                      
                              </div>
                       
                              
                   
                               
                              <div></div>
                             
                             
                            
                             
                           
                             </div>
</form:form>

</td>
</tr>
</table>
						
						
                            
                           <br> 
                            
				
                      
                       
                       <div class="row-fluid  ">
                                   
                            
                             <button type="button"  id="printBtn"  class="btn btn-primary pull-right"  style="margin-right:5px;" onclick="print_data();"><i class="icon-print  icon-white" style="margin-right: 4px;"></i><spring:message code="Print"/></button>   
                            
                    
      
                            </div>
                            
                             
                          <div class="clearfix"></div>
                   
						 </div>
						 
						 
						 
                        </div>
                     </div>
                  </div>
               </div>
               <br><br>
            <div  class="row-fluid  " > 
                            <strong id="nodust_misr" style="text-align:left; margin-left:25px;"><spring:message code="MisrNoDust"/></strong>
                       
                        <strong id="date_time_now" style="text-align: center; margin-left:200px;"> </strong>
                        </div>
           
            </div>
          
         </div>
   
	
    </div>

 
 
   <div id="footer">
       &copy; 2019  Copyright MTS.
   
   </div>
   <!-- END FOOTER -->
  
  <!-- BEGIN JAVASCRIPTS -->		
   <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
   
 <script type="text/javascript">
 
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
	  window.print();
 }
 function reattach_bank() {

	 var validation=document.getElementById("cash_attach").reportValidity();
	 if(validation!=false)
		 {
		 upload_attachment();
		 }
}
 function upload_attachment()
 {
	 document.getElementById('reattachBtn').disabled=true;
	   var x=document.querySelectorAll("input[type=file]")[0];
	   var files=x.files[0];
	   console.log(files);
	   var url = 'http://192.168.0.42:8080/FileUploader/FileUploader';
     var xhr = new XMLHttpRequest();
     var fd = new FormData();
     xhr.open("POST", url, true);
     xhr.onreadystatechange = function() {
  	   if (xhr.readyState == 4 && xhr.status == 200) {
             // Every thing ok, file uploaded
             var file_name_val=document.getElementById("file_path").value;
             console.log("response : "+xhr.responseText); // handle response.
             var z= JSON.parse(xhr.responseText);
             console.log(z);
             console.log(z.Path); // handle response.
             document.getElementById("file_path").value=z.Path;
            console.log(file_name_val);
            update_attachment();
         }
     };
     var file_name_val='CT'+document.getElementById("ship_id").value;

     fd.append("SelectedFile",files);
     fd.append('Path',1);  // Module ID
     fd.append('DocType','Transfer_Attachments'); // sub Folder name
     fd.append('ObjectFileName',file_name_val);  // file name
     xhr.send(fd);
     
     }
 
 function update_attachment()
 {
	   var ship_id='${cash_form.shipment_id}';
	   var file_path=document.getElementById("file_path").value;
	   var cash_form={
			   "shipment_id":ship_id,
			   "file_path":file_path
	   };
	   console.log(cash_form);
	   var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			

			if (this.readyState == 4 && this.status == 200) {
			var resp=this.responseText;
			if (resp=="true")
				{
				 document.getElementById('reattachBtn').disabled=true;
				 document.getElementById('cash_attach').disabled=true;

				 swal('<spring:message code="ShipmentList.Success.Title"/>','<spring:message code="AttachmentUploadedSuccessfully"/>',"success");
			/*	$.alert({
	  		          title: '<spring:message code="ShipmentList.Success.Title"/>',
	  				    content:'<spring:message code="AttachmentUploadedSuccessfully"/>',
	  		          });*/
				}
			else
				{
				 document.getElementById('reattachBtn').disabled=false;

				 swal('<spring:message code="ShipmentList.Error.Title"/>','<spring:message code="AttachmentNotUploaded"/>',"error");
				/*$.alert({
	  		          title: '<spring:message code="ShipmentList.Error.Title"/>',
	  				    content:'<spring:message code="AttachmentNotUploaded"/>',
	  		          });*/
				}
			}
		}
		xhttp.open("POST","updateAttachment", true);
		 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
		 xhttp.send(JSON.stringify(cash_form));
 }
 </script>
 
 <!-- Open & close MENU -->
  
   <script>
      jQuery(document).ready(function() {			
      	// initiate layout and plugins
      	App.init();
      	
      	document.getElementById("ship_id").value='${cash_form.shipment_id}';
      	/*
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
        	});*/
    	
      });
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>