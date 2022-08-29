<html>
<head>
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
       <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
   
   
   <meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval()%>;url=TimeOut"/>
   
   
</head>
<script type="text/javascript">
$(document).ready(function() {
	var fac_id='${sessionScope.fac_id}';
var arr_all_facilities=document.getElementsByName("facility");	
for(var x=0;x<arr_all_facilities.length;x++)
	{
	var all_val=arr_all_facilities[x].value;
	var arr_value=all_val.split(',');
	var fac_id_check=arr_value[0];
	if(fac_id_check==fac_id)
		{
		arr_all_facilities[x].checked=true;
		}
	}
	
});
</script>
<script type="text/javascript">

</script>
<script>

function formSubmit() {
	console.log("asdasd");
 	var xhttp = new XMLHttpRequest();
 	xhttp.onreadystatechange = function() {

 	if (this.readyState == 4 && this.status == 200) {
 		var response= this.responseText;
 		if(response == "Authenitacted")
 			{
 			document.getElementById("logoutForm").submit();

 			}
 		else if(response =="notAuthenitacted"){
 			location.href = location.href;

 		}
 	 }
 	 }
 	 xhttp.open("POST","checkAuth", true);
 	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
 	 xhttp.send();
		}
		function ChangePassword()
		{
			//alert("x");
		}
jQuery(document).ready(function() {	
	if("${param.param1}"==='HideButton'){
		document.getElementById("translatetoenglish").style.display="none";
		
	}

	
	
});

</script>
<script type="text/javascript">
/*var var_check=false;

	$(document).on('keypress', function(e) {
		   if (e.keyCode == 116){
			   var_check = true;
		   }
		 });
	
	$(document).on("click", "a" , function() {
		var_check = true;
		 });
	$(document).on("submit", "form" , function() {
		var_check = true;
		 });
	


	  window.onunload = function() {
	         if (!var_check){
	        	 perform_logout();
	         }
*/
</script>
<script type="text/javascript">
function perform_logout()
{
		document.getElementById("logoutForm").submit();



	var var_user_name='${pageContext.request.userPrincipal.name}';

	var user_data={
			"user_name":var_user_name
	};
	
		var xhttp = new XMLHttpRequest();
	 	xhttp.onreadystatechange = function() {

	 	if (this.readyState == 4 && this.status == 200) {
	 		var response= this.responseText;
	 		if(response=="True")
	 			{
	 			document.getElementById("logoutForm").submit();

	 			
	 			}
	 			}
	 	}
	 	
	 	 xhttp.open("POST","LogoutUser", true);
	 	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
	 	 xhttp.send();

	 
}
</script>
<script type="text/javascript">
//document.getElementById('facility').innerHTML=fac_value;

function change_facility(val) {
	
	if(val.checked)
		{
		
		var var_val=val.value;
		var values=var_val.split(',');
		var name=values[1];
		var id=values[0];
		var fac={
				"facility_id":id,
				"fac_name" : name
		};
		console.log(fac);
		var xhttp = new XMLHttpRequest();
	 	xhttp.onreadystatechange = function() {

	 	if (this.readyState == 4 && this.status == 200) {
	 		var response= this.responseText;
      
		location.reload();
	 	}
	 	}
	 	 xhttp.open("POST","ChangeData", true);
	 	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
	 	 xhttp.send(JSON.stringify(fac));
		}
	else
		{
		
		}
	
}
</script>

<script type="text/javascript">



</script>
<body >


<form action="j_spring_security_logout" method="post" id="logoutForm" >
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>


   <!-- BEGIN NAVBAR -->
   
   <div  id="header" class="navbar navbar-inverse navbar-fixed-top">
       <!-- BEGIN TOP NAVIGATION BAR -->
       <div class="navbar-inner" >
           <div class="container-fluid">
               <!-- BEGIN LOGO -->
               <a class="brand" href="#">
                 <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" >
               </a>
               <!-- END LOGO -->
			   
			    <!--  SHOW MENU IF MOBILE  -->
                <a class="btn btn-navbar collapsed" id="main_menu_trigger" data-toggle="collapse" data-target=".nav-collapse" style="margin-top:12px;">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="arrow"></span>
                </a>
       
				
            <ul class="nav pull-right top-menu">
            
                   
                    <button class="btn btn-default"  id="translatetoenglish" style="display: none;" >ِعربي</button> 
                    <button class="btn btn-default"   id="translatetoarabic" style="display: none;">ِEnglish</button> 
              

            			
            		<div class="btn-group mtop7 ">
						 <a class="btn" href="#">
						   <i class="icon-user mright5"></i> 
						   <span id="user_data" class="d-none d-md-inline-block ">${pageContext.request.userPrincipal.name}, ${sessionScope.fullname} , ${sessionScope.fac} </span>
						 </a>
						 <a class="btn dropdown-toggle" data-toggle="dropdown" href="#" id="caretdown" ><span class="icon-caret-down"></span></a>
					 
						 <ul class="dropdown-menu" style="width:-webkit-fill-available;">
						   <li><a href="ChangePassword"><i class="icon-edit mright5"></i> <spring:message code="ChangePassword"/></a></li>   
                  <sec:authorize access="hasAuthority('ChangeWarehouse.View')">

<form action="">
<c:forEach items="${lst_warehouses}" var="facility">
<li style="margin-left:15px;"> <input  type="radio" name="facility" onchange="change_facility(this)" value="${facility.id},${facility.facility_name}">${facility.facility_name}<br></li>
</c:forEach>						
</form>	
</sec:authorize>						   
							 <li><a href="javascript:formSubmit()"><i class="icon-lock mright5"></i> Logout</a></li>
							 <li><a href="javascript:perform_logout"></a></li>
						 </ul>
                    </div>
             
                     
                     <!-- 
                       <li class="dropdown mtop5">
                           <a class="dropdown-toggle element" data-placement="bottom" data-toggle="tooltip" href="javascript:formSubmit()" data-original-title="Logout" title="Logout">
                               <i class="icon-lock white" ></i>
                           </a>
                       </li>
                  -->
                       
            
                       


             </ul>
         
           </div>
       </div>
       <!-- END TOP NAVIGATION BAR -->
   </div>
   <!-- END NAVBAR -->
   
   
</body>
</html>
   