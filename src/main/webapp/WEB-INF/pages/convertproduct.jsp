<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
       <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="ConvertProduct.PageTitle"/></title>
   <link href="img/no.jpeg" rel="icon" />
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <link href="resources/assetsnodust/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />  
   <link href="resources/assetsnodust/css/style.css" rel="stylesheet" />
          <link rel="stylesheet" href="resources/css/jquery-confirm.min.css"/>
   
 <!--    <link href="resources/assetsnodust/css/style_red.css" rel="stylesheet" /> -->
 <!--   <link href="resources/assetsnodust/css/style_arabic.css" rel="stylesheet" lang="ar"/>  --> 
    <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
             <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
   	     <script type="text/javascript" src="resources/assetsnodust/js/jasontable.js"></script>
   	     	 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
   
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


	<div id="main-content">
	
         <div class="container-fluid">
            <div class="row-fluid">
               <div class="span12">
                  
                
			
                  <ul class=" breadcrumb mtop5 pull-left">
                       <li>
                           <a href="DashboardNoDust"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                       <li><a href="Convertproduct"><spring:message code="ConvertProduct.PageTitle" /></a><span class="divider-last">&nbsp;</span></li>
                  </ul>
          
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title">
                           <h4> <spring:message code="ConvertProduct.PageTitle" /> </h4>
                        </div>
                        
			
						 
				 
						 <div class="widget-body" style="text-align: left;" >
						
						<table width="100%" dir="ltr">
<tr>
<td>
<div class="space10"></div>
 <div class="widget-title">
                           <h4> <spring:message code="OrderData_Page_Title" /> </h4>
                        </div>
<div class="row-fluid " style="border:outset;">
                              
                             
                            
                              
								 <div style="float:left; width:35%;margin-top:10px; margin-left:5px;">
		                              <label ><strong><spring:message code="warehousename" /></strong> <span>${wareHouse}</span></label>
		                              
		                             
		                               
		                              </div>
		                      
		                         
		                         
		                          <div style="float:left; width:35%;margin-top:10px;">
		                              <label > <strong><spring:message code="Agentname" /> </strong><span>${agent}</span></label>
		                              
		                             
		                         </div>
		                         
		                         
                              
                                
                               
								 <div style="float:left; width:25%; margin-top:10px;">
		                              <label  ><strong> <spring:message code="Date" /></strong><span>${date}</span></label>
		                              
		                             
		                         </div>
		                         
		                        <div class="space20"></div>
                             
          
                             
                            </div>
</td>
</tr>
</table>
						
						
                            
                           <br> 
                            
				
				
                            <div id="tableBtns" class="row-fluid  ">
    
			          <button class="btn btn-danger pull-right delete-row mright5 "  style="margin-bottom: 5px; margin-right: 60px;"><i class="icon-trash icon-white mright5"></i><spring:message code="DeleteRow" /></button>  
				  
                      <button  class="btn btn-success pull-right add-row mright5 " style="margin-bottom: 5px; "><i class="icon-plus icon-white mright5"></i><spring:message code="AddRow" /></button>
                                             
                           <div class="space10"></div>                             
                            </div>         
                    
                        
                   
			
			
                            <div class="row-fluid">
                            <form id="tableform" action="">
                                <table id="example" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width:90%; margin:auto;">
                                    <thead>
                                    <tr>
                                        <th class="first"></th>
                                        <th><spring:message code="ProductName" /></th>
                                        <th><spring:message code="Treatment" /></th>
                                        <th> <spring:message code="Quantity" /></th>
                                        <th ><spring:message code="comment_" /></th>
                                        <th style="display: none;">product_id</th>
                                        <th style="display: none;">quantity</th>
                                        <th style="display: none;">comment</th>
                                        <th> <spring:message code="ActualQ" /></th>
                                        
                                  </tr>
                                    
                                    </thead>
                                    <tbody>
                                    <tr class="odd gradeX ">
                                      <td class="first" ><input type='checkbox' name='record' disabled></td>
                                    
                                      <td>
                                        <select class="productSelect" onchange="selectChange(this)">
                                        <option value="No_Value"><spring:message code="PleaseSelect"/></option>
                                        <c:forEach var="product" items="${products}" varStatus="vs">
                                        <option value='${product.product_id},${product.quantity},${product.treatment}'>${product.product_name},${product.treatment}</option>
                                        </c:forEach>
								     </select>
								     </td>
                                      
                                      
                                      <td ></td>
                                      <td ><input onchange="changeQuantity(this)" required type="number" min ="1"   max= '${products[0].quantity}'/></td>
                                      <td ><textarea  required onchange="changeComment(this)" rows="1" ></textarea></td>
                                       <td style="display: none;">${products[0].product_id}</td>
                                       <td style="display: none;"></td>
                                       <td style="display: none;"></td>
                                       <td></td>
                                    </tr>
                                    </tbody>
                                </table>
                                </form>
                            </div>
                       <div class="space20"></div> 
                       <div class="clearfix"></div>
                     
                       <div class="row-fluid  ">
                            
                            
                             <button  onclick="submitData()"  id="submitBtn" class="btn btn-success pull-right green mright5 "><i class="icon-save icon-white"></i> <spring:message code="Submit"/> </button>   
       
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
       &copy; <spring:message code="CopyRights" />
   
   </div>
   <!-- END FOOTER -->
  
 
 
 <!-- Open & close MENU -->
  
   <script>
      jQuery(document).ready(function() {			
      	// initiate layout and plugins
      	App.init();
      	
      	
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
        	});
    	
      });
   </script>
   
   <script >
    $(document).ready(function(){
        $(".add-row").click(function(index){
        	
        	var tbl=document.getElementById("example");
        	var val0=tbl.rows[1].cells[0].innerHTML;
        	var val1=tbl.rows[1].cells[1].innerHTML;
        	var val2=tbl.rows[1].cells[2].innerHTML;
        	var val3=tbl.rows[1].cells[3].innerHTML;
        	var val4=tbl.rows[1].cells[4].innerHTML;
        	 var markup = "<tr> "+
             "<td class='first'><input type='checkbox' name='record'></td>"+
             " <td>"+val1+"</td>"+
             " <td></td>"+
             " <td><input required onchange='changeQuantity(this)' type='number' max= '${products[0].quantity}'/></td>"+
             " <td>"+val4+"</td>"+
            " <td style='display: none;'></td>"+
            "  <td style='display: none;'>0</td>"+
            "  <td style='display: none;'></td>"+
            " <td></td>"
             "</tr>";
             $("#tableform tbody").append(markup);
        	
       
        });
    });     
     
      
    $(".delete-row").click(function(){
    	var rowCount = document.getElementById('example').rows.length;
    	
    	if($("#tableform input:checkbox:checked").length > 0)
		{
    	$.confirm({
    	    title: '<spring:message code="DeleteRowsMessage" />',
    		icon:'glyphicon glyphicon-remove-sign',
    		theme: 'supervan',
    	    content:'',
    	    
    	    buttons: {
    	    	  
    	    	
    	        OK: function () {
    	        	 $("table tbody").find('input[name="record"]').each(function(){
			            	if($(this).is(":checked")){
			                    $(this).parents(" table tbody tr  ").remove();
			                }
			            });

    	        },
    	        cancel: function () {
    	        }
    	        
    	    }
    	});
		}

      	 });
      	 
        	     
        function selectChange(e) {
        	  var idx = e.selectedIndex ; 
        	 
              var rowIndex = e.parentNode.parentNode.rowIndex;
              var strUser = e.options[e.selectedIndex].value;
              var array = strUser.split(',');
              var myTable = document.getElementById('example');
              $("#example tr").eq(rowIndex).find("td").eq(3).find("input").attr({
                  "max" : array[1]
               }); 
              if(e.value!='No_Value')
    		  {
              myTable.rows[rowIndex].cells[2].innerHTML = array[2];
              myTable.rows[rowIndex].cells[8].innerHTML = array[1];
              myTable.rows[rowIndex].cells[5].innerHTML = array[0];
        		  }
        	  else
        		  {
        		  myTable.rows[rowIndex].cells[2].innerHTML = '';
                  myTable.rows[rowIndex].cells[8].innerHTML = '';
                  myTable.rows[rowIndex].cells[5].innerHTML = array[0];
        		  }
		}	
        function changeQuantity(x) {
            var rowIndex = x.parentNode.parentNode.rowIndex;
            var val= x.value;
            var myTable = document.getElementById('example');
            myTable.rows[rowIndex].cells[6].innerHTML = val;
            
		}
        function changeComment(x) {
        	var rowIndex = x.parentNode.parentNode.rowIndex;
            var val= x.value;
            var myTable = document.getElementById('example');
            myTable.rows[rowIndex].cells[7].innerHTML = val;
		}
        
        
        function submitData() {
        	document.getElementById("submitBtn").disabled = true;
        	var selections=document.getElementsByClassName('productSelect');
        	var check_valid="";
        	for(var x=0;x<selections.length;x++)
        		{
        		if(selections[x].value=="No_Value")
        			check_valid='Not_valid';
        		}
      	  var validation = document.getElementById("tableform").reportValidity()
      	  if(validation != false && check_valid!='Not_valid')
      		  {
      		  
          	document.getElementById("submitBtn").disabled = false;
          	 var table = $('#example').tableToJSON(
       			  { ignoreColumns:[0,1,2,3,4]}
       			  );
          	 console.log(table);
          	 var data ={"products":table};
          	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function() {

         	if (this.readyState == 4 && this.status == 200) {
         		var response= this.responseText;
         		if(response == "success")
         			{
     	    			$('#tableform input[type="number"]').prop("disabled", true);
     	    			$('#tableform select').prop("disabled", true);
     	    			$('#tableform textarea').prop("disabled", true);
     	    			document.getElementById("submitBtn").disabled = true;
     	    			swal({
     	    				title:"<spring:message code="ConvertProduct.title" />",
     	    				text:"<spring:message code="ConvertProduct.content" />",
     	    				type:"success",
     	    				 
     	    			});
     	    			
     	    			//window.location.replace("Convertproduct");

     	    			//swal("<spring:message code="ConvertProduct.title" />","<spring:message code="ConvertProduct.content" />","success");
     	    			
     	      	    	/*$.alert({
     	      	    		
     	                    title: "<spring:message code="ConvertProduct.title" />",
     	        		    content:"<spring:message code="ConvertProduct.content" />",
     	        		    buttons: {
     	          	    	  
     	          	    	
     	          	        OK: function () {
     	          	        	window.location.replace("Convertproduct");
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


         			swal("<spring:message code="ConvertProduct.failed.title" />","<spring:message code="ConvertProduct.failed.content" />","error");
         		 	 /* $.alert({
         		                         title: "<spring:message code="ConvertProduct.failed.title" />",
         		             		    content:"<spring:message code="ConvertProduct.failed.content" />",
         		                         }); */
         		  	      document.getElementById("submitBtn").disabled = false;
         		}
         		else{
         			$('#tableform input[type="number"]').prop("disabled", false);


         			swal("<spring:message code="ConvertProduct.failed.title" />",response,"error");
         			 /*$.alert({
                         title: "<spring:message code="ConvertProduct.failed.title" />",
             		    content:response,
                         }); */
       		  	      document.getElementById("submitBtn").disabled = false;

         		}

         	 }
         	 }
         	 xhttp.open("POST","submitConvertProduct", true);
         	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
         	 xhttp.send(JSON.stringify(data));
      		  }
      	  else
      		  {
      		  if(check_valid=='Not_valid')
      			  {
      			  swal("<spring:message code="ConvertProduct.failed.title" />","<spring:message code="SelectValidProduct"/>","error");
      			/*$.alert({
                    title: "<spring:message code="ConvertProduct.failed.title" />",
        		    content:"<spring:message code="SelectValidProduct"/>",
                    });*/
      			  }
      		  }
		}
     
</script>
<script>
function reload_after_submit()
{
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