<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
   <title> Change Password</title>
   <link href="img/no.jpeg" rel="icon" />
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
 
   <link href="resources/assetsnodust/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />  
   <link href="resources/assetsnodust/css/style.css" rel="stylesheet" />
   <link href="resources/assetsnodust/css/style_red.css" rel="stylesheet" />
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
      <link rel="stylesheet" href="resources/css/jquery-confirm.min.css"/>
      
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
     <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
    
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
   
</head>

<body class="fixed-top">

	<jsp:include page="NavBarNoDust.jsp">
	         <jsp:param name="param1" value="HideButton"/>
	 </jsp:include>
   
    
   
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
                  
                
			
                  <ul class=" breadcrumb mtop5 pull-left">
                       <li>
                           <a href="DashboardNoDust"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                       <li>
                           <a href="ChangePassword"> <spring:message code="ChangePassword"/> </a><span class="divider-last">&nbsp;</span>
                       </li>
                       
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title">
                           <h4><spring:message code="ChangePassword"/></h4>
                        </div>
                        
						<div class="widget-body">
						<form:form  class="form-horizontal" id="changePassform" modelAttribute="UserData">
                      
                          
                            <div class="control-group">
                              <label class="control-label black"><spring:message code="OldPassword" /></label>
                              <div class="controls">
                                 <input type="password" id="oldpassword"  class="span12 "  required="required" onchange="check_old_pass()"/>
                           
                              </div>
                           </div>
                           
                             <div class="control-group">
                              <label class="control-label black"><spring:message code="NewPassword" /></label>
                              <div class="controls">
                                 <input type="password" minlength=6 maxlength=6 id="newpassword" class="span12 " pattern="^(?=.*\d)(?=.*[a-zA-Z])(?!.*[\W_\x7B-\xFF]).{6,15}$" title="password length should be 6 with at least one character" required="required"/>
                              </div>
                           </div>
                           
                               <div class="control-group">
                              <label class="control-label black"><spring:message code="ConfirmPassword" /></label>
                              <div class="controls">
                                 <input type="password" id="ConfirmPassword" minlength=6 maxlength=6 class="span12 " required="required" />
                              </div>
                           </div>
                            <button type="button" onclick="Change_fun()" id="submit_btn" class="btn btn-success pull-right green"><i class="icon-save icon-white"></i> <spring:message code="Submit"/></button>   
                       
                          <div class="clearfix"></div>
                           </form:form>
                           
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
 
 <!-- Open & close MENU -->
  <script>
  function check_old_pass()
  {
	  var old_val='${UserData.user_password}';
	  var entered_old=document.getElementById("oldpassword").value;
	  if(old_val!=entered_old)
		  {
		  $.alert({
	          title: "Error",
			    content:"Value of Old password incorrect",
	          }); 
		  }
  }
 function Change_fun()
 {
  	 var validate_form = document.getElementById("changePassform").reportValidity()

  	 if(validate_form!=false)
  		 {
	 var new_pass=document.getElementById("newpassword").value;
	 var confirm_pass=document.getElementById("ConfirmPassword").value;
	 if(new_pass!=confirm_pass)
		 {
		 $.alert({
	          title: "Error",
			    content:"Two Passwords should be matched , please insert valid data",
	          }); 
		 }
	 else
		 {
		 var user_name='${UserData.user_name}';
		 var pass=document.getElementById("newpassword").value;
		 var user_data={
				 "user_name":user_name,
				 "user_password":pass
		 }
		 console.log(user_data);
		 var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				

				if (this.readyState == 4 && this.status == 200) {
				var resp=this.responseText;
				if(resp=="true")
					{
					$.alert({
				          title: "Success",
						    content:"Password Updated Successfully",
				          }); 	
					
					window.location.replace("login");
					}
				else
					{
					$.alert({
				          title: "Error",
						    content:"Password Not Updated Successfully",
				          }); 
					}
				}
			}
			xhttp.open("POST","submitchangepassword", true);
			 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
			 xhttp.send(JSON.stringify(user_data));
		 }
  		 }
 }
  </script>
   <script>
      jQuery(document).ready(function() {			
      	// initiate layout and plugins
      	App.init();
      });
      
     
      
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>