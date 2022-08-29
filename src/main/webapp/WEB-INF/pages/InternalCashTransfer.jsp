<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
             <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title><spring:message code="InternalCashTransfer.PageTitle"/> </title>
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
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>

<style type="text/css" >
#amount_val
{
display:none;
}
#comment_val_ext
{
display:none;
}
#amount_val_ex
{
display:none;
}
#from_bank_val
{
display:none;
}
#internal_div
{
visibility:hidden;
}
#external_div
{
visibility:hidden;
}
#submitBtn
{
display:none;
}
#printBtn
{
display:none;
}
#comment_val
{
display:none;
}
#from_val{display:none;}
#to_val{display:none;}
#to_fac_bank_val
{display:none;}
#from_fac_val{display:none;}
#to_fac_val{display:none;}
#nodust_misr
{
visibility:hidden;
}
#date_time_now{visibility:hidden;}
#astr
{
    color: red;
    font-size: large;
     
    
}
#to_val_ext
{
display:none;
}
   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}

.transfer1{ margin-left: -30px;}
 #logoprint{ visibility: hidden;}
 
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
 #nodust_misr
{
visibility:visible;
}
#date_time_now{visibility:visible;}
 #tableBtns{
  display: none
 }
 #from_bank_val
{
display:inline-block;
}
 #logoprint{ visibility: visible;}
#transferComment
{
display:none;
}
#to_fac_bank_val
{display:inline-block;}
#amount
{
display:none;
}
#from_bank_style
{
display:none;
} 
#to_fac_bank_style
{
display:none;
}
#selectTo_ext
{
display:nonel
}
#to_style_div
{
display:none;
}
#amount_ex
{
display:none;
}
#transferComment_ext
{
display:none;
}
 .transfer1{ margin-left: 0px;}
 #showDate{ color: black;}
  #titlepage{display:none; }
 #to_style_div
{
visibility:hidden;
display:none;
}
  #astr
{
    display:none;
}
  
#from_style
{
display:none;
}
#from_fac_style
{
display:none;
}
#to_fac_style
{
display:none;
}
#to_val_ext
{
display:inline-block;
}
#amount_val
{
display:inline-block;
}
#amount_val_ex
{
display:inline-block;
}
#comment_val
{
display:inline-block;
}
#btn_div
{
visibility:hidden;
display:none;
}
#printBtn
{
display:none;
}
#submitBtn
{
display:none;
}
#src_div
{display:none;}
#from_val{display:inline-block;}
#to_val{display:inline-block;}
#from_fac_val{display:inline-block;}
#to_fac_val{display:inline-block;}
#comment_val_ext
{
display:inline-block;
}

#contentpage{ margin-top: -50px;}

@font-face {
  font-family: ArbFONTS;
  src: url(ArbFONTS-Abdo-salem-Bold.ttf);
}
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
                           <a href="InternalCashTransfer"><spring:message code="InternalCashTransfer.PageTitle" /></a><span class="divider-last">&nbsp; &nbsp;</span>
                       </li>
                     
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4><spring:message code="InternalCashTransfer.PageTitle" /></h4>
                        </div>
                        
						<div class="widget-body" style="text-align: left;">
						
        <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:35%;   margin-top: -100px ; " id="logoprint">

<table width="100%" >
<tr>
<td>



<div class="row-fluid invoice-list" >
<div class="space10"></div>
                              <div class="widget-title" >
                           <h4><spring:message code="CashData" /></h4>
                        </div>
                             <div class="row-fluid"style="border:outset;">
                               
                                   
                               
                                 <div id="warehouse_name_div" style="float:left;  width:35%"> <h5 style="margin-left:10px;"><strong><spring:message code="warehousename" /></strong>
                                     ${warehouseName}	</h5></div>
                                  <div id="agent_name_div" style="float:left; width:30%"> <h5 ><strong><spring:message code="Agentname" /></strong>
                                   ${agentName}	</h5></div>
                                   
                                <div id="date_div" style="float:left; width:30%"> <h5> <strong> <spring:message code="Date"/>  </strong>
                                     ${date}	</h5></div>
                                     <div id="src_div" class="row_fluid" style="float:left;width:50%;">
                                     <strong style="margin-left:10px; margin-right:15px;">Source Type : <span id="astr">*</span></strong>
                                     <select id="src_type" onchange="select_source(this)" class= "span6 js-example-basic-multiple">
                                     <option>Please Select </option>
                                     <option>Bank</option>
                                     <option>Facility</option>
                                     </select>
                                     </div>
                                     <br>
                                     <div class="space10"></div>
                             <div id="internal_div">
                             <form id="intern_form">
                                  <div style="float:left; width:50%;">
                                    <div style="float: left; margin-right: 5px;" > <h5 style="margin-left:10px;"><strong><spring:message code="From_Facility_" /></strong>
                                    <span id="astr" style="padding: 5px; margin-right:10px;"> * </span>
                                    </h5>
                                   
                                    </div>
                                     <h5 id="from_fac_val"></h5>
                                    <div  id="from_fac_style" style="margin-top: 5px; margin-left: 15px;">
                                    
                                     <select disabled id="selectFromFac"  class= "span6 js-example-basic-multiple" >
                                     <option value="No_Value"><spring:message code="PleaseSelect"/></option>
                                      <c:forEach items="${lst_facilites}" var="fac">
										  <option value="${fac.id}"<c:if test="${fac.id==fac_id}">selected </c:if>>${fac.facility_name}</option>
								     </c:forEach>
							          </select >
							          
							         
                           
                                    </div>
                                </div>
                             
                             
                             
                                <div style="float:left; width:50%;">
                                    <div style="float: left; margin-right: 5px;" > <h5 style="margin-left:10px;"><strong><spring:message code="To_Facility_" /></strong>
                                    <span id="astr" style="padding: 5px; margin-right:10px;"> * </span>
                                    </h5>
                                   
                                    </div>
                                     <h5 id="to_fac_val"></h5>
                                    <div  id="to_fac_style" style="margin-top: 5px; margin-left: 15px;">
                                    
                                     <select  id="selectToFac"  class= "span6 js-example-basic-multiple" >
                                     <option value="No_Value"><spring:message code="PleaseSelect"/></option>
                                      <c:forEach items="${lst_facilites}" var="fac">
										  <option value="${fac.id}">${fac.facility_name}</option>
								     </c:forEach>
							          </select >
							          
							         
                           
                                    </div>
                                </div>
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                                  <div style="float:left; width:50%;">
                                    <div style="float: left; margin-right: 5px;" > <h5 style="margin-left:10px;"><strong><spring:message code="transferFrom" /></strong>
                                    <span id="astr" style="padding: 5px; margin-right:10px;"> * </span>
                                    </h5>
                                   
                                    </div>
                                     <h5 id="from_val"></h5>
                                    <div  id="from_style" style="margin-top: 5px; margin-left: 15px;">
                                    
                                     <select  id="selectFrom" onchange="changeSelect(this)" class= "span6 js-example-basic-multiple" >
                                     <option value="No_Value"><spring:message code="PleaseSelect"/></option>
                                      <c:forEach items="${from_accounts}" var="account">
										  <option value="${account.product_sku}">${account.product_name}</option>
								     </c:forEach>
							          </select >
							          
							           <select  id="selectMoney" style="display: none;" >
							           <option>0</option>
                                      <c:forEach items="${from_accounts}" var="account">
                                      
										  <option value="${account.total_stock_quantity}">${account.total_stock_quantity}</option>
								     </c:forEach>
							          </select >
                           
                                    </div>
                                </div>
                                
                                 <div style="float:left; width:50%;" >
                                    <div style="float: left; margin-right: 10px;margin-left:10px;"  class="transfer1"> <h5 ><strong><spring:message code="transferTo" /></strong>
                                     <span id="astr" style="padding: 5px;"> * </span>
                                    </h5>
                                    </div>
                                                                        <h5 id="to_val"></h5>
                                    
                                    <div id="to_style_div" style="margin-top: 5px;">
                                    
                                     <select  id="selectTo" required class= "span6 js-example-basic-multiple" >
                                     <option value="No_Value"><spring:message code="PleaseSelect"/></option>
                                      <c:forEach items="${to_accounts}" var="account" varStatus="loop">
										  <option value="${account.product_sku}">${account.product_name}</option>
								     </c:forEach>
							          </select >
                                    </div>
                                </div>   
                                 <div style="float:left; width:100%;" >
                                  <strong style="margin-left:10px;"><spring:message code="amount" /> </strong><span id="astr" style="padding: 5px; margin-right:40px;"> * </span>
                                  <h5 id="amount_val"></h5>
                                  <input id="amount"  min="1.0" step="0.01" style="width:280px;" type="number" max="${accounts[0].total_stock_quantity}"  required  style="" placeholder="1.0">
                                 </div>    
                                            <div style="float:left;">
                                   <strong style="margin-left:10px;"><spring:message code="comment" /></strong><span id="astr" style="padding: 5px; margin-right:30px;"> * </span>
                                   <h5 id="comment_val"></h5>
                     <textarea  required placeholder='<spring:message code="commentPlaceHolder" />' id="transferComment" rows="2"  style="width:800px;"></textarea>
                                   
                                  
                                 <div> 
                                </div>
                                 </div>
                                 </form>
                                <div class="space10"></div>
                             </div>
                                
                  <div id="external_div">
                  <form id="extern_form">
                  <div style="float:left; width:50%;">
                                    <div style="float: left; margin-right: 5px;" > <h5 style="margin-left:10px;"><strong>Bank Name :</strong>
                                    <span id="astr" style="padding: 5px; margin-right:10px;"> * </span>
                                    </h5>
                                   
                                    </div>
                                     <h5 id="from_bank_val"></h5>
                                    <div  id="from_bank_style" style="margin-top: 5px; margin-left: 15px;">
                                    <input type="text" required id="from_bank_name" style="width:250px;"/>
                                    </div>
                                </div>
                  
                  
                  
                  <div style="float:left; width:50%;">
                                    <div style="float: left; margin-right: 5px;" > <h5 style="margin-left:10px;"><strong><spring:message code="To_Facility_" /></strong>
                                    <span id="astr" style="padding: 5px; margin-right:10px;"> * </span>
                                    </h5>
                                   
                                    </div>
                                     <h5 id="to_fac_bank_val"></h5>
                                    <div  id="to_fac_bank_style" style="margin-top: 5px; margin-left: 15px;">
                                    
                                     <select disabled id="selecttofac_ext"  class= "span6 js-example-basic-multiple" >
                                     <option value="No_Value"><spring:message code="PleaseSelect"/></option>
                                      <c:forEach items="${lst_facilites}" var="fac">
										  <option value="${fac.id}"<c:if test="${fac.id==fac_id}">selected </c:if>>${fac.facility_name}</option>
								     </c:forEach>
							          </select >
							          
							         
                           
                                    </div>
                                </div>
                  <div class="space10"></div>
                  <div style="float:left; width:50%;" >
                                    <div style="float: left;"> <h5 style="margin-left:10px; margin-right:20px;"><strong><spring:message code="transferTo" /></strong>
                                     <span id="astr" style="padding: 5px;"> * </span>
                                    </h5>
                                    </div>
                                                                        <h5 id="to_val_ext"></h5>
                                    
                                    <div id="to_style_div" style="margin-top: 5px;">
                                    
                                     <select  id="selectTo_ext" required class= "span6 js-example-basic-multiple" >
                                     <option value="No_Value"><spring:message code="PleaseSelect"/></option>
                                      <c:forEach items="${to_accounts}" var="account" varStatus="loop">
										  <option value="${account.product_sku}">${account.product_name}</option>
								     </c:forEach>
							          </select >
                                    </div>
                                </div>   
                                 <div style="float:left; width:50%;" >
                                  <strong style="margin-left:10px;"><spring:message code="amount" /> </strong><span id="astr" style="padding: 5px; "> * </span>
                                  <h5 id="amount_val_ex"></h5>
                                  <input id="amount_ex"  min="1.0" step="0.01" style="width:250px;margin-left:20px;" type="number"   required  placeholder="1.0">
                                 </div>    
                                 <div class="space10"></div>
                                            <div style="float:left;">
                                   <strong style="margin-left:10px;"><spring:message code="comment" /></strong><span id="astr" style="padding: 5px; margin-right:30px;"> * </span>
                                   <h5 id="comment_val_ext"></h5>
                     <textarea  required placeholder='<spring:message code="commentPlaceHolder" />' id="transferComment_ext" rows="2"  style="width:800px;"></textarea>
                                   
                                  
                                 <div> 
                  
                  </div>
                                  
                              </div>
                              </form>
                               </div>
                               </div>
                               
                               <div >
                                 
                               </div>
                               
                                <div >

                               </div>
                                    
                                <div>
                           
                              
                               </div>
                               
                                
                            </div>
				</td>
				</tr>
			</table>
		
		
		    </div>
                            <div id="btn_div" class="row-fluid  ">
                               <button type="button" onclick="ValidateData()" id="submitBtn" class="btn btn-success pull-right  mright5" style="margin-bottom: 5px;"><i class="icon-save icon-white"></i> <spring:message code="Submit" /></button>
    
				          <button type="button" disabled id="printBtn" style="margin-right:5px;" class="btn btn-primary pull-right" onclick="print_Data()"><i class="icon-print  icon-white"></i> <spring:message code="Print" /></button>   
				  
                                             
                                                      
                            </div>                 
                    
                    
 		
						 </div>
						 
						  <div   class="row-fluid  " > 
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
      	
      });
    </script>    
      

      
    <script>     
      $(document).ready(function() {
  	    $('.js-example-basic-multiple').select2();
 	   
  	});
      
      function print_Data()
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
 	   var src_type=document.getElementById("src_type").value;
 	   if(src_type=="Facility")
 		   {
 	  var from_fac_component=document.getElementById("selectFromFac");
      var from_fac_val=from_fac_component.options[from_fac_component.selectedIndex].text;
      
      var to_fac_component=document.getElementById("selectToFac");
      var to_fac_val=to_fac_component.options[to_fac_component.selectedIndex].text;
 	   
      document.getElementById("from_fac_val").innerHTML=from_fac_val;
      document.getElementById("to_fac_val").innerHTML=to_fac_val;
    	  var from_component=document.getElementById("selectFrom");
      var from_val=from_component.options[from_component.selectedIndex].text;
      var to_component=document.getElementById("selectTo");
      var to_val=to_component.options[to_component.selectedIndex].text;
      document.getElementById("from_val").innerHTML=from_val;
      document.getElementById("to_val").innerHTML=to_val;
      var amount_val=document.getElementById("amount").value;
      document.getElementById("amount_val").innerHTML=amount_val;
      var comment_val=document.getElementById("transferComment").value;
      document.getElementById("comment_val").innerHTML=comment_val;
 		   }
 	   else
 		   {
 		   var bank_name=document.getElementById("from_bank_name").value;
 		   document.getElementById("from_bank_val").innerHTML=bank_name;
 		   
 		   var to_fac_component=document.getElementById("selecttofac_ext");
 		   var to_fac_val=to_fac_component.options[to_fac_component.selectedIndex].text;
 		   document.getElementById("to_fac_bank_val").innerHTML=to_fac_val;
 		   
 		   var to_acc_component=document.getElementById("selectTo_ext");
 		   var to_acc_val=to_acc_component.options[to_acc_component.selectedIndex].text;
 		   document.getElementById("to_val_ext").innerHTML=to_acc_val;
 		   
 		   
 		   var amount=document.getElementById("amount_ex").value;
 		   document.getElementById("amount_val_ex").innerHTML=amount;
 		   
 		   var comment=document.getElementById("transferComment_ext").value;
 		   document.getElementById("comment_val_ext").innerHTML=comment;
 		   }
    	  window.print();
      }
      
      function changeSelect(e) {
          var idx = e.selectedIndex ; 
          var options = document.getElementById('selectTo').getElementsByTagName("option");
         /* for(var i=0; i < options.length; i++)
          {
        	  options[i].disabled = false ;
          }
          $('#selectTo').val(options[0].value);
          $('#sel_users').select2().trigger('change');
          if(idx == 0)
        	 {
        	 
        	 $('#selectTo').val(options[1].value);
              $('#selectTo').select2().trigger('change');  
        	 }
        	  
          else{
        	  $('#selectTo').val(options[0].value);
              $('#selectTo').select2().trigger('change');        	 
          }*/
          document.getElementById('selectMoney').selectedIndex = idx;
         // options[idx].disabled = true ;
          document.getElementById("amount").max = document.getElementById("selectMoney").options[e.selectedIndex].value;

	}
      function ValidateData()
      {
    	  var source=document.getElementById("src_type").value;
    	  if(source=="Facility")
    		  {
    	  if(document.getElementById("selectFrom").value=="No_Value"||document.getElementById("selectTo").value=="No_Value")
    		  {
    		  swal("<spring:message code="ShipmentList.Error.Title" />","<spring:message code="NoSelectionCashAccount" />","error");
    			/*$.alert({
                    title: "<spring:message code="ShipmentList.Error.Title" />",
        		    content:"<spring:message code="NoSelectionCashAccount" />",
                    }); */
      	  
			}
    	  else if (document.getElementById("selectFromFac").value=="No_Value"||document.getElementById("selectToFac").value=="No_Value")
    		 {
    		  swal("Error","Please Select Facility !","error");
    		 } 
    	  else
    		  {
    		  var from_fac=document.getElementById("selectFromFac").value;
    		  var to_fac=document.getElementById("selectToFac").value;
    		  if(from_fac==to_fac){
    			  var from_account=document.getElementById("selectFrom").value;
    			  var to_account=document.getElementById("selectTo").value;
    			  if(from_account==to_account)
    				  {
    				  swal("Error","You Can't Transfer From , To The Same Account Of The Same Facility !","error");
    				  }
    			  else
    				  {
    	    		  submitFunction();

    				  }
    		  }
    		  else
    			  {
    		  submitFunction();
    			  }
    		  }
    		  }
    	  else
    		  {
    		  if(document.getElementById("selectTo_ext").value=="No_Value")
    			  {
    			  swal("Error","Please Select Cash Account !" ,'error');
    			  }
    		  else
    			  {
        		  submitFunction();

    			  }
    		  }
      }
      
      function  submitFunction() {
    	  var src_type=document.getElementById("src_type").value;
    	if(src_type=="Facility")
    		{
    		var validation=document.getElementById("intern_form").reportValidity();
    		}
    	else
    		{
    	  var validation = document.getElementById("extern_form").reportValidity();
    		}
    	  if (validation==true)
    		  {
    		  var dest_id=document.getElementById("selectToFac").value;
    	  document.getElementById('submitBtn').disabled = true;
    	  document.getElementById('selectFrom').disabled = true;
    	  document.getElementById('selectTo').disabled = true;
    	  document.getElementById('amount').disabled = true;
    	  document.getElementById('transferComment').disabled = true;
    	  document.getElementById('from_bank_name').disabled = true;
    	  document.getElementById('selectTo_ext').disabled = true;
    	  document.getElementById('amount_ex').disabled = true;
    	  document.getElementById('transferComment_ext').disabled = true;

    	  
    	  var source=document.getElementById("src_type").value;
    	  if(source=="Facility")
    		  {
    	  var transferData ={
    			  "source" : document.getElementById('selectFrom').value ,
    			  "destination" : document.getElementById('selectTo').value ,
    			  "comment":  document.getElementById('transferComment').value ,
    			  "recievedCash": document.getElementById('amount').value,
    			  "des_id":dest_id,
    			  "src_type":source
    	  };
    		  }
    	  else
    		  {
    		  var dest_id=document.getElementById("selecttofac_ext").value;

    		  var transferData={
    				  "source":document.getElementById("from_bank_name").value,
    				  "destination" : document.getElementById('selectTo_ext').value ,
        			  "comment":  document.getElementById('transferComment_ext').value ,
        			  "recievedCash": document.getElementById('amount_ex').value,
        			  "des_id":dest_id,
        			  "src_type":source
    		  }
    		  }
    	  console.log(transferData);
    	var xhttp = new XMLHttpRequest();
    	xhttp.onreadystatechange = function() {

    	if (this.readyState == 4 && this.status == 200) {
    		var response= this.responseText;
    		if(response == "success")
    			{
    	    	  document.getElementById('printBtn').disabled = false;
    	    	  document.getElementById('submitBtn').disabled = true;
    	    	  document.getElementById('selectFrom').disabled = true;
    	    	  document.getElementById('selectTo').disabled = true;
    	    	  document.getElementById('amount').disabled = true;
    	    	  document.getElementById('transferComment').disabled = true;
    	    	  document.getElementById('selectToFac').disabled = true;

    	    	  swal("<spring:message code="ReleasingCashOnCover.SuccessSubmit.title" />","<spring:message code="InternalCashTransferShipmentSubmittedSuccessfully" />","success");
	      	  	/*$.alert({
	                    title: "<spring:message code="ReleasingCashOnCover.SuccessSubmit.title" />",
	        		    content:"<spring:message code="InternalCashTransferShipmentSubmittedSuccessfully" />",
	                    }); */
	      	  
    			}
    		else if(response =="no session"){
    			location.reload();
    		}
    		else if(response=="noaccount"){
    			
    		 document.getElementById('printBtn').disabled = true;
   	    	  document.getElementById('submitBtn').disabled = false;
   	    	  document.getElementById('selectFrom').disabled = false;
   	    	  document.getElementById('selectTo').disabled = false;
   	    	  document.getElementById('amount').disabled = false;
   	    	  document.getElementById('transferComment').disabled = false;

   	    	  swal("<spring:message code="transferCash.Submitted.Failed.title" />","Destination Facility don't have selected account ,Please Select valid one !","error");
    		 	/*  $.alert({
    		                         title: "<spring:message code="transferCash.Submitted.Failed.title" />",
    		             		    content:"<spring:message code="ReleasingCashOnCover.FailedSubmit.content" />",
    		                         }); */
    		  	     
    		}
    		else
    			{
    			 document.getElementById('printBtn').disabled = true;
      	    	  document.getElementById('submitBtn').disabled = false;
      	    	  document.getElementById('selectFrom').disabled = false;
      	    	  document.getElementById('selectTo').disabled = false;
      	    	  document.getElementById('amount').disabled = false;
      	    	  document.getElementById('transferComment').disabled = false;

      	    	  swal("<spring:message code="transferCash.Submitted.Failed.title" />","<spring:message code="ReleasingCashOnCover.FailedSubmit.content" />","error");
       		 	/*  $.alert({
       		                         title: "<spring:message code="transferCash.Submitted.Failed.title" />",
       		             		    content:"<spring:message code="ReleasingCashOnCover.FailedSubmit.content" />",
       		                         }); */
       		  	     
    			}
    	 }
    	 }
    	 xhttp.open("POST","submitInternalCashTransfer", true);
    	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    	 xhttp.send(JSON.stringify(transferData));
    	  
    		  }
	}
      
   </script>
   
   <script>
   function select_source(sel)
   {
	   if(sel.value=="Facility")
		   {
		   document.getElementById("internal_div").style.visibility='visible';
		   document.getElementById("external_div").style.display='none';
		   document.getElementById("src_type").disabled=true;
		   document.getElementById("submitBtn").style.display='block';
		   document.getElementById("printBtn").style.display='block';


		   }
	   else if(sel.value="Bank")
		   {
		   document.getElementById("external_div").style.visibility='visible';
		   document.getElementById("internal_div").style.display='none';
		   document.getElementById("src_type").disabled=true;
		   document.getElementById("submitBtn").style.display='block';
		   document.getElementById("printBtn").style.display='block';

		   }
		   
   }
   </script>

    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>