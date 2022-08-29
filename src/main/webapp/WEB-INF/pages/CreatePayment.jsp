<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <html lang="en">

<head>
   <meta charset="utf-8" />
      <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> Create Payment</title>
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
      <link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.5.1/css/colReorder.dataTables.min.css"/>
      <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>
      
      
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
     <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
     <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
   <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.js"></script>
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
   	     <script type="text/javascript" src="resources/assetsnodust/js/jasontable.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.13.5/xlsx.full.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.13.5/jszip.js"></script>

 <style type="text/css">
 .dataTables_filter, .dataTables_info { display: none; }

   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}
 .dataTables_empty
 {
 }
 #pay_sheet
 {
display:none; }
#logoprint{visibility:hidden;
display:none;}
#printing_data{
display:none;
}
 #Approved_Data
{
  visibility:hidden;
  }
  #lost_Data
{
  visibility:hidden;
  }
#system_payment
{
visibility:hidden;
}
@font-face {
  font-family: ArbFONTS;
  src: url(ArbFONTS-Abdo-salem-Bold.ttf);
}
 #date_time_now
{
visibility:hidden;
}
#nodust_misr{
  visibility:hidden;
  }
#astr
{
    color: red;
    font-size: large;
   
}
#submitBtn
{
visibility:hidden;
}
   </style>
   
<style type="text/css" media="print">


  @page { size:A4 ; }
  
  @media print {
  #printBtn {
    display: none;
  }
  #system_payment
  {
  visibility:hidden;
  }
  #btn_div
  {
  display:none;
  }
   #Approved_Data
{
  visibility:visible;
  }
   #tableform_{
  display:none;
  }
  
  #lost_Data
{
  visibility:visible;
  }
  #submitBtn {
    display: none;
  }
  #hiddenform{
  visibility:hidden;
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
 #printing_data{
display:inline-block;
}
 
  #titlepage{ display: none;}
}
 #date_time_now
{
visibility:visible;
}
#nodust_misr{
  visibility:visible;
  }

#logoprint{visibility: visible;
display:block;}

#contentpage{ margin-top: -50px;}

 #Header, #Footer { display: none !important; }
#footer{ display: none;}

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
                           <a href="CreatePayment"> Create Payment</a> <span class="divider-last">&nbsp;</span>
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
                           <h4> Create Payment</h4>
                        </div>
                        
						
						
						<div class="widget-body" style="text-align: left;" id="contentpage">
						
						<table width="100%" dir="rtl">
<tr>
<td>

<div class="row-fluid invoice-list" >

<div class="space10"></div>
<div class="widget-title" style="margin-left:-5px;">
                           <h4> <spring:message code="PaymentData" /></h4>
                        </div>                              
                             <div class="row-fluid" style="border:outset;">
                              
                                    <div style="float:left;width:40%;"> <h5 style="margin-left:5px;"><strong><spring:message code="warehousename" /></strong>
                                     ${formData.wareHouseName} 	</h5></div>
                                
                                 <div style="float:left;width:30%;"> <h5 ><strong><spring:message code="Agentname" /></strong>
                                   ${formData.agentName} 	</h5></div>
                                    <div style="float:left;width:30%;"> <h5 ><strong><spring:message code="Date" /> </strong>
                                      ${formData.assignDate} 	</h5></div>
                             
                            
                                
                             
                                    <input id="payments" style="display:none;">
                               
                               
                            
                             
                                
                              
                              
                               </div>
                            
<div class="space20"></div>

     


</div>

</td>
</tr>
</table>
						
						
                            
                           <br> 
                        <div class="row-fluid">
                        <div style="float:left;width:50%;">
                        <strong > Payment Type :<span id="astr">*</span></strong>
                        <select id="payment_type" onchange="change_type(this)" required class= "span6 js-example-basic-multiple" >
                        <option value="No_value">Please Select</option>
                        <c:forEach items="${formData.lst_payment_type }" var="type">
                        <option value="${type.id}">${type.payment_type }</option>
                        </c:forEach>
                        </select>
                        </div>
                        </div>  
                        <div class="space20"></div>  
	<div id="pay_sheet" class="span12" style="margin-left: 0;">
								 <div class="control-group span6">
		                              <label class="control-label  span4 " ><strong> Payment Sheet : <span id="astr" style=""> * </span></strong></label>
		                      
                                      
                                         <form class="form-horizontal" id="attach">
										    <div class="form-group">
										        <div class="col-sm-offset-2 col-sm-10">
										                <input type="file"  id="cash_attach"  required="required"/>
										        </div>
										    </div>
									  </form>

		                             

		                         
                        
                           
                             
                            </div>
                            </div>				
                            
                         <div id="system_payment" class="row-fluid">    
                        <div style="width:50%;float:left;">
                        <strong style="margin-left:5px;">Account Type : <span id="astr">*</span></strong>
                         <select  id="select_type" style="margin-left:10px;" class= "span6 js-example-basic-multiple" >
                                     <option value="none">Please Select</option>
								     <c:forEach var="account" items="${formData.lst_payment_accounts}" varStatus="vs">
                                        <option value="${account.account_id}">${account.account_name}</option>
                                        </c:forEach>
							  </select >
                        </div>
                          <div style="width:50%;float:left;">
                        <strong style="margin-left:5px;">Payment Location : <span id="astr">*</span></strong>
                         <select  id="select_loc"  style="margin-left:10px;" class= "span6 js-example-basic-multiple" >
                                     <option value="none">Please Select</option>
								     <c:forEach var="fac" items="${formData.lst_payment_loc}" varStatus="vs">
                                        <option value="${fac.id}">${fac.facility_name}</option>
                                        </c:forEach>
							  </select >
                        </div>
                        <div class="space20"></div>
                        <div style="width:50%;float:left;">
                        <strong>Payment Name :  <span id="astr">*</span></strong>
                        <input type="text" id="payment_name" required style="width:300px;"/>
                        </div>
                        <div style="float:left; width:50%;">
                        <strong> Amount : <span id="astr">*</span></strong>
                        <input type="number" id="amount" step="0.01" required min="1"/>
                        </div>
                         <div  style="float:left;width:50%;margin-top: 5px">
                              <h5 style="float:left;margin-right: 30px;margin-left: 5px"> <strong>Due Date :<span id="astr"> * </span></strong></h5>
                              <input type="date" id="from_Date" onkeydown="return false" style="display: inline-block;" required/>
                                
                         </div>
                         <div style="float:left;width:80%;">
                         <strong>Note : <span id="astr">* </span></strong>
                         <textarea rows="" cols="" id="note" required style="width:80%;"></textarea>
                         </div>
                </div>  
                            </div>                                  
                              <div  class="space20" ></div>
                        <div class="clearfix"></div>
                            
                  <button type="button"  id="submitBtn" onclick="validateForm()" class="btn btn-success pull-right green mright5 " style="margin-right:25px; margin-bottom:25px;"><i class="icon-save icon-white"></i> <spring:message code="Submit" /></button>   
                            <input id="check_submit" style="display:none;"/>
                       
                      
                            
                             
                          <div class="clearfix"></div>
                           
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
 
 <!-- Open & close MENU -->
  
   
   <script type="text/javascript">
   function ReadData(){
	   var fileUpload = document.getElementById("cash_attach");
	   /*console.log("File_Name : "+fileUpload.value);
	   var name1=fileUpload.value;
	   var name=[]
	   name=name1.split("'\'");
	   var length_name=name.length;
	   console.log(name[length_name-1]);*/
       //Validate whether File is valid Excel file.
       var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.xls|.xlsx)$/;
       if (regex.test(fileUpload.value.toLowerCase())) {
           if (typeof (FileReader) != "undefined") {
               var reader = new FileReader();

               //For Browsers other than IE.
               if (reader.readAsBinaryString) {
                   reader.onload = function (e) {
                       ProcessExcel(e.target.result);
                   };
                   reader.readAsBinaryString(fileUpload.files[0]);
               } else {
                   //For IE Browser.
                   reader.onload = function (e) {
                       var data = "";
                       var bytes = new Uint8Array(e.target.result);
                       for (var i = 0; i < bytes.byteLength; i++) {
                           data += String.fromCharCode(bytes[i]);
                       }
                       ProcessExcel(data);
                   };
                   reader.readAsArrayBuffer(fileUpload.files[0]);
               }
           } else {
               //alert("This browser does not support HTML5.");
           }
       } else {
    	   document.getElementById("cash_attach").disabled=false;
    	   document.getElementById("submitBtn").disabled=false;
           alert("Please upload a valid Excel file.");
       }
   };
   function ProcessExcel(data) {
       //Read the Excel File data.
       var workbook = XLSX.read(data, {
           type: 'binary'
       });

       //Fetch the name of First Sheet.
       var firstSheet = workbook.SheetNames[0];
console.log(firstSheet);
       //Read all rows from First Sheet into an JSON array.
       var excelRows = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[firstSheet]);

       //Create a HTML Table element.
       var table = document.createElement("table");
       table.border = "1";

       //Add the header row.
       var row = table.insertRow(-1);

       //Add the header cells.
       var headerCell = document.createElement("TH");
       headerCell.innerHTML = "Id";
       row.appendChild(headerCell);

       headerCell = document.createElement("TH");
       headerCell.innerHTML = "Name";
       row.appendChild(headerCell);

       headerCell = document.createElement("TH");
       headerCell.innerHTML = "Country";
       row.appendChild(headerCell);
       var payments=[];
	   
       //Add the data rows from Excel file.
       for (var i = 0; i < excelRows.length; i++) {
           //Add the data row.
          /* var row = table.insertRow(-1);

           //Add the data cells.
           var cell = row.insertCell(-1);
           cell.innerHTML = excelRows[i].Id;

           cell = row.insertCell(-1);
           cell.innerHTML = excelRows[i].Name;

           cell = row.insertCell(-1);
           cell.innerHTML = excelRows[i].Country;*/
           if(excelRows[i].payment_type==0||excelRows[i].payment_type==0==null || excelRows[i].cash_account==null || excelRows[i].payment_location==0||excelRows[i].payment_location==null || excelRows[i].payment_refrence==null || excelRows[i].payment_value==0 || excelRows[i].payment_value==null || excelRows[i].due_date== null ||excelRows[i].notes==null || excelRows[i].emp_id==0 ||excelRows[i].emp_id==null ||excelRows[i].emp_name==null)
        	   {
        	   swal("Error","File Contains invalid data , Please Check Data and reupload data again","error");
        	   return ;
        	   }
    	   var payment={
    			   "payment_type":excelRows[i].payment_type,
    			   "account":excelRows[i].cash_account,
    			   "location":excelRows[i].payment_location,
    			   "payment_name":excelRows[i].payment_refrence,
    			   "amount":excelRows[i].payment_value,
    			   "due_date":excelRows[i].due_date,
    			   "note":excelRows[i].notes,
    			   "emp_id":excelRows[i].emp_id,
    			   "emp_name":excelRows[i].emp_name,
    			   "emp_type":excelRows[i].emp_type
    			   
    	   };
    	   payments.push(payment);
       }
console.log(payments);
submit_form(payments);
      // var dvExcel = document.getElementById("dvExcel");
       //dvExcel.innerHTML = "";
      // console.log(table);
     //  dvExcel.appendChild(table);
   };
   </script>
   <script>
   function change_type(val)
   {
	   var value=val.value;
	   if(value==3)
		   {
		   document.getElementById("system_payment").style.visibility='visible';
		   document.getElementById("pay_sheet").style.display='none';
		   document.getElementById("submitBtn").style.visibility='visible';


		   }
	   else if(value==2)
		   {
		   document.getElementById("system_payment").style.visibility='hidden';

		   document.getElementById("pay_sheet").style.display='block';
		   document.getElementById("submitBtn").style.visibility='visible';

		   }
	   else
		   {
		   document.getElementById("pay_sheet").style.display='none';
		   document.getElementById("system_payment").style.visibility='hidden';
document.getElementById("submitBtn").style.visibility='hidden';
		   }
   }
   </script>
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
   </script>
   <script>
   var now = new Date(),
   minDate = now.toISOString().substring(0,10);

  $('#from_Date').prop('min', minDate);
   
   </script>
   <script>
   function validateForm()
   {
	   document.getElementById("submitBtn").disabled=true;
	   document.getElementById("payment_type").disabled=true;
	   document.getElementById("select_type").disabled=true;
	   document.getElementById("select_loc").disabled=true;
	   document.getElementById("payment_name").disabled=true;
	   document.getElementById("amount").disabled=true;
	   document.getElementById("from_Date").disabled=true;
	   document.getElementById("note").disabled=true;
	   document.getElementById("cash_attach").disabled=true;

	   
	   var payment_type=document.getElementById("payment_type").value;
	   if(payment_type==2)
		   {
		   var check_cash_attach_val=document.getElementById("attach").reportValidity();
		   console.log(check_cash_attach_val);
		   if(check_cash_attach_val !=false)
			   {
			  
			   ReadData();

			   }
		   else
			   {
			   document.getElementById("cash_attach").disabled=false;
			   document.getElementById("submitBtn").disabled=false;
			   }
		   }
	   else if(payment_type==3)
		   {
		   var acc=document.getElementById("select_type").value;
		   var payment_loc=document.getElementById("select_loc").value;
		   var check_payment_name=document.getElementById("payment_name").reportValidity();
		   var amount_check=document.getElementById("amount").reportValidity();
		   var date_check=document.getElementById("from_Date").reportValidity();
		   var note_check=document.getElementById("note").reportValidity();
		   if(acc=="none"||payment_loc=="none"||check_payment_name==false||amount_check==false||date_check==false||note_check==false)
			   {
			   document.getElementById("submitBtn").disabled=false;
			   document.getElementById("payment_type").disabled=false;
			   document.getElementById("select_type").disabled=false;
			   document.getElementById("select_loc").disabled=false;
			   document.getElementById("payment_name").disabled=false;
			   document.getElementById("amount").disabled=false;
			   document.getElementById("from_Date").disabled=false;
			   document.getElementById("note").disabled=false;
			   var acc=document.getElementById("select_type").value;
			   var payment_loc=document.getElementById("select_loc").value;
			   if(acc=="none")
				   {
				   swal("Error","Please Select Account !","error");
				   }
			   else if(payment_loc=="none")
				   {
				   swal("Error","Please Select Payment Location !","error");
				   }
			   }
		   else
			   {
			   var acc=document.getElementById("select_type").value;
			   var payment_loc=document.getElementById("select_loc").value;
			   var payment_name=document.getElementById("payment_name").value;
			   var amount=document.getElementById("amount").value;
			   var date=document.getElementById("from_Date").value;
			   var note=document.getElementById("note").value;
			   var payments=[];
			   var payment={
					   "payment_type":payment_type,
					   "account":acc,
					   "location":payment_loc,
					   "payment_name":payment_name,
					   "amount":amount,
					   "due_date":date,
					   "note":note
					   
			   };
			   payments.push(payment);
			   document.getElementById("payments").value=payments;
			   console.log(payments);
			   confirm_submit(payments);
			   }
		   }
   }
   function confirm_submit(payments)
   {
	   $.confirm({
		    title: 'Confirmation',
			theme: 'Bootstrap',
		    content:'Are you Sure You want to submit this Payment ? ',
			icon:'glyphicon glyphicon-remove-sign',
		    buttons: {
		    	  OK: function () {
		    		  var check_submit=document.getElementById("check_submit").value;
		    		   if(check_submit=="submitted")
		    			   {
		   	   			swal("Error","Payment Already Created !","error");

		    			   }
		    		   else{
		    		  submit_form(payments);
		    		   }
		    	  },
		    cancel: function () {
		    	document.getElementById("submitBtn").disabled=false;
		    	document.getElementById("note").disabled=false;
		    	document.getElementById("from_Date").disabled=false;
		    	document.getElementById("payment_name").disabled=false;
		    	document.getElementById("amount").disabled=false;
		    	document.getElementById("select_type").disabled=false;
		    	document.getElementById("select_loc").disabled=false;
		    	document.getElementById("payment_type").disabled=false;

	        }
		    }
		});
 
   }
   function submit_form(payments)
   {
	   document.getElementById("check_submit").value="submitted";
	   //var payments=document.getElementById("payments").value;
	   console.log(payments);
	   var fileUpload = document.getElementById("cash_attach");
	   var var_type=document.getElementById("payment_type").value;
	   var file_name="";
	   if(var_type!=3)
		   {
	    file_name="";
	  //  fileUpload="";
	    file_name = fileUpload.value.replace(/.*[\/\\]/, '');
		   }
	  
	   console.log(file_name);
	   var cash={
			   "payments":payments,
			   "file_name":file_name
	   };
	   console.log(cash);
	   var xhttp = new XMLHttpRequest();
	   	xhttp.onreadystatechange = function() {

	   	if (this.readyState == 4 && this.status == 200) {
	   		var response= this.responseText;
	   		if(response=="")
	   			{
	   			swal("Error","Some thing went wrong , Please try again !","error");
	   			document.getElementById("submitBtn").disabled=false;
		    	document.getElementById("note").disabled=false;
		    	document.getElementById("from_Date").disabled=false;
		    	document.getElementById("payment_name").disabled=false;
		    	document.getElementById("amount").disabled=false;
		    	document.getElementById("select_type").disabled=false;
		    	document.getElementById("select_loc").disabled=false;
		    	document.getElementById("payment_type").disabled=false;
	   			}
	   		else if(response=="Already Inserted")
	   			{
	   			document.getElementById("submitBtn").disabled=false;
		    	document.getElementById("note").disabled=false;
		    	document.getElementById("from_Date").disabled=false;
		    	document.getElementById("payment_name").disabled=false;
		    	document.getElementById("amount").disabled=false;
		    	document.getElementById("select_type").disabled=false;
		    	document.getElementById("select_loc").disabled=false;
		    	document.getElementById("payment_type").disabled=false;
		    	document.getElementById("cash_attach").disabled=false;
	   			swal("Error","This File Is Already Imported and payments Inserted ","error");
	   			}
	   		else
	   			{
	   			swal("Success",response+" Payments Created Successfully ","success");

	   			}
	   	}
	   	}
		xhttp.open("POST","SubmitCreatePayment", true);
		 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
		 xhttp.send(JSON.stringify(cash));
   }
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>