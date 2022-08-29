<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
       <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="CreateCashTransfer"/></title>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
    
 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script  src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <link rel="stylesheet" type="text/css" href="resources/vendor/fileupload/fileupload.css" />
       <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
  <style type="text/css">
  #astr
{
    color: red;
    font-size: large;
     
    
}
  </style>
</head>

<body class="fixed-top">

	<jsp:include page="NavBarNoDust.jsp">
	         <jsp:param name="param1" value="Dashboardli"/>
	 </jsp:include>
      
   <!-- BEGIN CONTAINER -->	
   <div id="container" class="row-fluid">

	 
		<jsp:include page="SideNaveNoDust.jsp">
		         <jsp:param name="param1" value="Dashboardli"/>
		 </jsp:include>	
    
	<!-- BEGIN PAGE -->


	<div id="main-content" onload="Load_available()">
	
         <div class="container-fluid">
            <div class="row-fluid">
               <div class="span12">
                  
                
			
                  <ul class=" breadcrumb mtop5 pull-left">
                       <li>
                           <a href="DashboardNoDust"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                         
                    <li><a href="CreateCashTransfer"> <spring:message code="CreateCashTransfer"/></a><span class="divider-last">&nbsp;</span></li> 
                  </ul>
          
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title">
                           <h4><spring:message code="CreateCashTransfer"/></h4>
                        </div>
                        
			
						 
				 
						 <div class="widget-body" style="text-align: left;" >
						
						<table width="100%" dir="ltr">
<tr>
<td>
<form:form modelAttribute="cash_form" id="f_cash" >
<div class="row-fluid " onload="Load_available()">
                              <div class="space10"></div>
                             
    <div class="widget-title">
                           <h4> <spring:message code="CashData"/></h4>
                        </div>                        
                              <div class="row-fluid" style="border:outset;">
								 <div style="float:left; width:35%;margin-left:5px;">
		                               <h5> <strong><spring:message code="warehousename"/></strong>
		                              
		                             
		                               ${cash_form.warehouse_name}
		                              </h5>
		                         </div>
		                         
		                         
		                          <div style="float:left;width:30%;">
		                              <h5> <strong><spring:message code="Agentname"/></strong>
		                              
		                              
		                               ${cash_form.agent_name }
		                              </h5>
		                              </div>
		                               
		                              <div style="float:left;width:30%;">
		                               <h5><strong><spring:message code="RequestDate"/></strong>${cash_form.request_date}</h5>
		                              </div>
		                         </div>
		                         <div class="space20"></div>
		                         
                               </div>
                                
                                <div >
								
		                         
		                          <div class="row-fluid">
		                          <div class="control-group span6">
		                              <label class="control-label  span4 " ><strong><spring:message code="TransferDate"/><span id="astr" style=""> * </span></strong></label>
		                              
		                             
		                              
		                              <div >
		                                <div >
										 <input type="date" onkeydown="return false" id="transfer_date" class="span6" required="required"   min="2016-01-01"  max="${cash_form.request_date}"/>
		                                </div>
		                              </div>
		                         </div>
		                       
		                        
		                         
                               </div>
                               
                                
                           <div class="span12" style="margin-left: 0;">
								 <div class="control-group span6">
		                              <label class="control-label  span4 " ><strong><spring:message code="CashOnCover.CashAccount"/><span id="astr" style=""> * </span></strong></label>
		                              
		                              <div class="controls">
		                                <div class="input-group mb-3 " style="margin-top: -5px;">
		                                <form:input id="file_path" path="file_path" style="display:none;"/>
										<form:select  onchange="Check_Max(this)"  id="accountSelect" required="true"  path=""  class="span6 js-example-basic-multiple">
										<option>Please Select</option>
										 <c:forEach items="${cash_form.lst_accounts}" var="account" varStatus="vs">
										  <option  value="${account.product_sku},${account.total_stock_quantity}"<c:if test="${account.product_sku }">selected="selected"</c:if> >${account.product_name}</option>										   
								     </c:forEach>
									    </form:select>
		                                </div>
		                              </div>
		                              
		                         </div>
		                      <div class="control-group span6">
		                              <label class="control-label  span4 " ><strong><spring:message code="AvailableCash"/></strong></label>
		                              
		                              <div class="controls">
		                                <div class="input-group mb-3 " style="margin-top: -5px;">
										 <input id='avaiable_cash_in_account' disabled='disabled' style="width:280px;"/>
		                                </div>
		                              </div>
		                         </div>
		                         
                               </div>
                              
                             
                                    
                           <div class="span12" style="margin-left: 0;">
                            <div class="control-group span6">
		                              <label class="control-label  span4 " ><strong><spring:message code="CashAmount"/><span id="astr" style=""> * </span></strong></label>
		                              
		                              <div class="controls">
		                                <div class="input-group mb-3 " style="margin-top: -5px;">
										 <form:input type="number" path="" id="amount" required="required"  min="1.0" class="span6"/>
		                                </div>
		                              </div>
		                         </div>
								 <div class="control-group span6">
		                              <label class="control-label  span4 " ><strong><spring:message code="BankName"/><span id="astr" style=""> * </span></strong></label>
		                              
		                              <div class="controls">
		                                <div class="input-group mb-3 " style="margin-top: -5px;">
										 <input type="text" id="bank_name" required="required" class="span6"/>
		                                </div>
		                              </div>
		                         </div>
		                         
		                         
                               </div>
                              
                                          <div style="display:none;" class="span12" style="margin-left: 0;">
                                           <div  class="control-group span6">
		                              <label class="control-label  span4 " ><strong><spring:message code="BankAccountNumber"/><span id="astr" style=""> * </span></strong></label>
		                              
		                              <div class="controls">
		                                <div class="input-group mb-3 " style="margin-top: -5px;">
										 <form:input type="number" path=""  id="bank_account_no" class="span6" min="1.0"/>
		                                </div>
		                              </div>
		                         </div>
                                          </div>
                            <div class="span12" style="margin-left: 0;">
								 <div class="control-group span6">
		                              <label class="control-label  span4 " ><strong> <spring:message code="Attachment"/></strong></label>
		                      
                                                <input id="ship_id" style="display:none;"/>
                                      
                                         <form class="form-horizontal" >
										    <div class="form-group">
										        <div class="col-sm-offset-2 col-sm-10">

										                <input type="file"  id="cash_attach" />
										        </div>
										    </div>
									  </form>

		                             

		                         
                        
                           
                             
                            </div>
                            </div>
                            </div>
</form:form>

</td>
</tr>
</table>
						
						
                            
                           <br> 
                            
				
                      
                       
                       <div class="row-fluid  ">
                            
                            
                             <button type="button" id="submit_btn" onclick="submit_form()" class="btn btn-success pull-right green mright5 "><i class="icon-save icon-white"></i> <spring:message code="Submit"/> </button>  
       
                            </div>
                            
                             
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
       &copy; <spring:message code="CopyRights"/>
   
   </div>
   <!-- END FOOTER -->
  
  <!-- BEGIN JAVASCRIPTS -->		
   <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
   
 <script type="text/javascript">
 function Check_Max(x)
 {
	 var val=x.value;
	 var arr_val=val.split(',');
	 document.getElementById("amount").max=arr_val[1];
	 if(x.value=="Please Select")
		 {
		 document.getElementById("avaiable_cash_in_account").value='';
		 }
	 else
		 {
		 document.getElementById("avaiable_cash_in_account").value=arr_val[1];

		 }
 }
 function submit_form() {
	 var x_acc=document.getElementById("accountSelect").value;
		if(x_acc=='Please Select')
			{
			swal('<spring:message code="ShipmentList.Error.Title"/>','<spring:message code="NoSelectionCashAccount"/>',"error");
			/*$.alert({
				title: '<spring:message code="ShipmentList.Error.Title"/>',
				    content:'<spring:message code="NoSelectionCashAccount"/>',
		          }); */
			}
		else
			{
	var x=document.getElementById("f_cash").reportValidity();
	var c=document.getElementById("transfer_date").reportValidity();
	
	if(x!=false&&c!=false)
		{
		
		document.getElementById("submit_btn").disabled=true;
		var req_date='${cash_form.request_date}';
		var transfer_date=document.getElementById("transfer_date").value;
		var account_sku=document.getElementById("accountSelect").value;
		var account_selected=account_sku.split(',');
		var amount=document.getElementById("amount").value;
		var bank_name=document.getElementById("bank_name").value;
		var bank_account_no=document.getElementById("bank_account_no").value;
		
		var cash_form={
			"request_date":req_date,
			"transfer_date":transfer_date,
			"account_sku":account_selected[0],
			"amount":amount,
			"bank_name":bank_name,
			"bank_account_no":bank_account_no,
			"attachment":'attach'
		};
		console.log(cash_form);
		
		document.getElementById("submit_btn").disabled=true;
		document.getElementById("bank_name").disabled=true;
		document.getElementById("transfer_date").disabled=true;
		document.getElementById("accountSelect").disabled=true;
		document.getElementById("amount").disabled=true;
		document.getElementById("bank_account_no").disabled=true;

		var xhttp = new XMLHttpRequest();
  		xhttp.onreadystatechange = function() {
  			

  			if (this.readyState == 4 && this.status == 200) {
  			var resp=this.responseText;
  			if(resp!="null"||resp!="0")
  				{
  				document.getElementById("cash_attach").disabled=true;
  				document.getElementById("ship_id").value=resp;
  				upload_attachment();
  				
  				/*var x=document.querySelectorAll("input[type=file]")[0];
  				var file_uploaded=x.files[0];*/
  				swal('<spring:message code="ShipmentList.Success.Title"/>','<spring:message code="CashTransferCreatedSuccessfully"/>',"success");
  				/*$.alert({
  		          title: '<spring:message code="ShipmentList.Success.Title"/>',
  				    content:'<spring:message code="CashTransferCreatedSuccessfully"/>',
  		          }); */
  				}
  			else
  				{
  				swal('<spring:message code="ShipmentList.Error.Title"/>','<spring:message code="CashTransferNotCreatedSuccessfully"/>',"error");
  				/*$.alert({
  		          title: '<spring:message code="ShipmentList.Error.Title"/>',
  				    content:'<spring:message code="CashTransferNotCreatedSuccessfully"/>',
  		          }); */
  				}
  			}
  		}
  		xhttp.open("POST","SubmitExternalCashTransfer", true);
 		 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
 		 xhttp.send(JSON.stringify(cash_form));
		}
			}
}
 </script>
 
 <!-- Open & close MENU -->
  <script>
   var now = new Date(),
   minDate = now.toISOString().substring(0,10);

  $('#transfer_date').prop('max', minDate);
   
   </script>
   <script>
      jQuery(document).ready(function() {			
      	// initiate layout and plugins
      	App.init();
      	
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
   <script type="text/javascript">
   function upload_attachment()
   {
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
	   var ship_id=document.getElementById("ship_id").value;
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
 				swal('<spring:message code="ShipmentList.Success.Title"/>','<spring:message code="CashTransferCreatedSuccessfully"/>',"success");
 				/*$.alert({
 	  		          title: '<spring:message code="ShipmentList.Success.Title"/>',
 	  				    content:'<spring:message code="CashTransferCreatedSuccessfully"/>',
 	  		          });*/
 				}
 			}
 		}
 		xhttp.open("POST","updateAttachment", true);
		 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
		 xhttp.send(JSON.stringify(cash_form));
   }
   function Load_available()
   {
	   var x_cash_account=document.getElementById("accountSelect").value;
	   alert(x_cash_account);
   }
   </script>
   <script>
   
   $(document).ready(function(){
 	    $('.js-example-basic-multiple').select2();
   });
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>