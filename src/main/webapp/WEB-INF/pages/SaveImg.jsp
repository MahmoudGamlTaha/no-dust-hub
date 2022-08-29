<!DOCTYPE html>

 <html lang="en">

<head>
       <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

   <meta charset="utf-8" />
   
   <title> <spring:message code="UpdateDMSUsersData"/></title>
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
      
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">      
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
     <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
    
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
	
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
      <link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.5.1/css/colReorder.dataTables.min.css"/>
      <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>

  <style type="text/css">
   #astr
{
    color: red;
    font-size: large;
     
    
}
#table_x{
   overflow-y:scroll;
   height:300px;
   width: fit-content;
   display: block;
}
#table_x2
{
 overflow-y:scroll;
   height:300px;
   width: fit-content;
   display: block;
}
   </style>
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
                           <a href="upload_img"><spring:message code="UpdateDMSUsersData"/></a><span class="divider-last">&nbsp;</span>
                       </li>
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title">
                           <h4><spring:message code="UpdateDMSUsersData"/></h4>
                        </div>
                        
						<div class="widget-body">
						<form:form  class="form-horizontal" id="form_data"   >
                            <div class="control-group">
                              <label class="control-label black  " style="text-align:left;"> <strong> <spring:message code="Drivername" /> <span id="astr" > * </span></strong></label>

                              <div class="controls">
                              <div class="input-group mb-3 ">
							  <select id="inputGroupSelect02" name="driver" class= "span12 js-example-basic-multiple" required>
								   <option value='NoValue'><spring:message code="PleaseSelect"/></option>
								    <c:forEach items="${lst_drivers}" var="driver">
								        <option value="${driver.user_name}">${driver.full_name_en} , ${driver.user_name}</option>
								     </c:forEach>
							  </select>
                           
                           </div>
                              </div>
                            </div>
                            <div class="control-group">
                              <label class="control-label black" style="text-align:left; margin-right:25px;"><strong>Driver Image :<span id="astr" > * </span></strong></label>
                              <input type="file" id="img_file" required onchange="validate_ext()"/>
                              <div class="controls">
                              <img id="test_img"></img>
                              </div>
                           </div>
                            <button id="submit_btn" type="button" onclick="Validate_data()" class="btn btn-success pull-right green"><i class="icon-save icon-white"></i> <spring:message code="Submit"/></button>   
                     <!--  <a style="float:right; margin-right:10px; color:#0048BA;" href=""> Drivers don't have image </a> --> 
                          <div class="clearfix"></div>
                           <input id="check_done" style="display:none;"/>
                          
                           </form:form>
                           		<ul class="nav nav-tabs">
			    <li class="nav-item active">
			      <a class="nav-link" data-toggle="tab" href="#tab1">Driver's don't have Image</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" data-toggle="tab" href="#tab2">Driver's already have image</a>
			    </li>
          </ul>
            <div class="tab-content">
			   
			    <div id="tab1" class="container tab-pane active"><br>
                           
                            
                             
                             <table  class="table table-striped table-bordered   table-advance table-hover table-responsive " id="table_x" >
                             <!--  <thead>
                             <tr>
                             <th>Driver Name </th>
                             <tr>
                             </thead>-->
                             <tbody>
			    <c:forEach items="${data}" var="data">
			    			    <c:if test="${data.image_flag==0}">
			    
			    <tr>
			    <td onclick="select_row(this)">
			    ${data.driver_name}
			    </td>
			   
			    </tr>
			    			    </c:if>
			    
			    </c:forEach>
			    </tbody>
			    </table>
                             </div>
		
             <div id="tab2" class="container tab-pane"><br>
                           
                            
                             
                             <table  class="table table-striped table-bordered   table-advance table-hover table-responsive " id="table_x2" >
                            <!--  <thead>
                             <tr>
                             <th>Driver Name </th>
                             <tr>
                             </thead>--> 
                             <tbody>
			    <c:forEach items="${data}" var="data">
			    			    <c:if test="${data.image_flag==1}">
			    
			    <tr>
			    <td onclick="select_row(this)">
			    ${data.driver_name}
			    </td>
			   
			    </tr>
			    			    </c:if>
			    
			    </c:forEach>
			    </tbody>
			    </table>
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
       &copy; <spring:message code="CopyRights"/>
   
   </div>
 
 <!-- Open & close MENU -->


    <script src="resources/assetsnodust/js/scripts.js"></script>
    <script type="text/javascript">
    function validate_ext()
    {
    	var filePath = document.getElementById("img_file").value;
        var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
        if(!allowedExtensions.exec(filePath)){
            //alert('Please upload file having extensions .jpeg/.jpg/.png/.gif only.');
            document.getElementById("img_file").value = '';
			 swal("<spring:message code="ShipmentList.Error.Title"/>","File Extension Must Be .jpg or .png","error");
        }
    }
    function Validate_data()
    {
    	var check_driver=document.getElementById("inputGroupSelect02").value;
    	var check_valid=document.getElementById("form_data").reportValidity();
    	if(check_driver!="NoValue"&&check_valid!=false)
    		{
    		Save_image();
    		}
    	else
    		{
    		if(check_driver=="NoValue")
    			{
     			 swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="SelectValidDriver" />","error");

    			}
    		}
    }
    
    function Save_image()
    {
    	document.getElementById("submit_btn").disabled=true;
    	document.getElementById("inputGroupSelect02").disabled=true;
    	document.getElementById("img_file").disabled=true;
    	var user_name=document.getElementById("inputGroupSelect02").value;
    	console.log("User_Name : "+user_name);
    	var img=document.getElementById("img_file").value;
    	console.log("image : "+img);
    	var x=document.querySelectorAll("input[type=file]")[0];
 	   var files=x.files[0];
 	  var reader = new FileReader();
 	 var fileByteArray = [];
 	 reader.readAsArrayBuffer(files);
 	 reader.onloadend = function (evt) {
 	     if (evt.target.readyState == FileReader.DONE) {
 	        var arrayBuffer = evt.target.result,
 	            array = new Uint8Array(arrayBuffer);
 	        for (var i = 0; i < array.length; i++) {
 	            fileByteArray.push(array[i]);
 	         }
 	     }
 	 }
 	   console.log(fileByteArray);
    	var User_Data_form={
    			
    			"image":fileByteArray,
    			"user_name" : user_name
    	};
    	console.log(User_Data_form);
    	var xhttp = new XMLHttpRequest();
      	xhttp.onreadystatechange = function() {

      	if (this.readyState == 4 && this.status == 200) {
      		
      		var response= this.responseText;
      		console.log(response);
      		if(response=="true")
      			{
    			swal("<spring:message code="ShipmentList.Success.Title" />","<spring:message code="DriversImageUpdatedSuccessfully" />","success");
    			document.getElementById("check_done").value="done";
    		

      			}
      		else
      			{
      			document.getElementById("submit_btn").disabled=false;
      	    	document.getElementById("inputGroupSelect02").disabled=false;
      	    	document.getElementById("img_file").disabled=false;
    			swal("<spring:message code="ShipmentList.Error.Title" />","<spring:message code="DriversImageNotUpdatedSuccessfully" />","error");

      			}
      	}
      	}
      	 xhttp.open("POST","save_img", true);
 	 	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
 	 	 xhttp.send(JSON.stringify(User_Data_form));
    }
    </script>
    <script type="text/javascript">
    $(document).ready(function(){
    	$('.js-example-basic-multiple').select2();
    	/*File myFile = new File("image.png");
    	FileOutputStream fos = new FileOutputStream(myFile);
    	console.log(fos);
    	//var byteArray = new Buffer('${image}').toString('base64');  
    	console.log(arr);*/

    });
    
    </script>
   <script type="text/javascript">
  function select_row(row)
  {
	  var x_check_done=document.getElementById("check_done").value;
	  if(x_check_done!="done")
		  {
	    var x_text=row.innerText;
	    var text1=x_text.split(",");
     //  $("#inputGroupSelect02").find('option[value='+text1[1]+']').attr("selected", "selected");
       var len=document.getElementById("inputGroupSelect02").options.length;
       var selection=document.getElementById("inputGroupSelect02");
       for(var i=0;i<len;i++)
    	   {
    	   var selectedText = selection.options[i].value;

    	   if(selectedText==text1[1])
    		   {
        	  
        	  $('#inputGroupSelect02').val(text1[1]).change();
    		   }
    	   }
	   //alert(len);
		  }
  }
 
   </script>
</body>
<!-- END BODY -->
</html>