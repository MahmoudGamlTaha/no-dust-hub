<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
       <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> Product Deduction</title>
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
   <style type="text/css">
	   #logoprint{visibility:hidden; display:none;}
	  #displaytextarea {display:block; }
	  #displaydiv{display: none;}
	  #astr
{
    color: red;
    font-size: large;
     
    
}
#date_time_now
{
visibility:hidden;
}
  	   #nodust_misr
  	   {
  	   visibility:hidden;
  	   }
#print_tbl
 {
 visibility:hidden;
 }

#from_value
{

display:none;


}
#warehouse_name_div{
  float:left;
  width:35%;
  }
  #agent_name_div
  {
  float:left;
  width:30%;
  }
  #assign_date_div
  {
   float:left;
  width:30%;
  }
#to_value
{

display:none;

}
}
	   </style>
   <style type="text/css" media="print">

  @page { size:A4 portrait; }
  
  @media print {
  	   #logoprint{visibility:visible; display:block;}
  	   
#date_time_now
{
visibility:visible;
}
  	   #nodust_misr
  	   {
  	   visibility:visible;
  	   }
   #to_style
 {
 display:none;
 }
 #from_style
 {
 display:none;
 }
 #print_tbl
 {
 visibility:visible;
 }
 #from_value
{
display:inline-block;
margin-top:10px;
visibility:visible;


}
#to_value
{
display:inline-block;
margin-top:10px;
visibility:visible;

}
#man_from
 {
 float:left;
 width:50%;
 }
 #man_to
 {
  float:left;
 width:50%;
 }
  #nav_div{
  display:none;
  }
  
  #printBtn {
    display: none;
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
 #example
 {
 display:none;
 }
 #deleterows
 {
 display:none;
 }
 #addrows{
 display:none;
 }

 #tableBtns{
 display:none;
 
 }
 #title_div
 {
 display:none;
 }
 #submitBtn
 {
 display:none;
 }
 #title
 {
 display:none;
 }
 #check_all{
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
            <div  id="links" class="row-fluid">
               <div class="span12">
                  
                
			
                  <ul class=" breadcrumb mtop5 pull-left">
                       <li>
                           <a href="DashboardNoDust"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                       <li><a href="ProductDeduction">Product Deduction</a><span class="divider-last">&nbsp;</span></li>
                  </ul>
          
               </div>
            </div>
       
	   	         <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:5%;   margin-top: -20px ; " id="logoprint">
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div id="title" class="widget-title">
                           <h4> Product Deduction </h4>
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
    
			          <button id="add_row" class="btn btn-danger pull-right delete-row mright5 "  style="margin-bottom: 5px; margin-right: 60px;"><i class="icon-trash icon-white mright5"></i><spring:message code="DeleteRow" /></button>  
				  
                      <button id="delete_row" class="btn btn-success pull-right add-row mright5 " style="margin-bottom: 5px; "><i class="icon-plus icon-white mright5"></i><spring:message code="AddRow" /></button>
                                             
                           <div class="space10"></div>                             
                            </div>         
                    
                        
                   
			
			
                            <div class="row-fluid">
                            <form id="tableform" action="">
                                <table id="example" class="table table-striped table-bordered   table-advance table-hover table-responsive " style="width:90%; margin:auto;">
                                    <thead>
                                    <tr>
                                        <th class="first"></th>
                                        <th><spring:message code="ProductName" /></th>
                                        <th> <spring:message code="Quantity" /></th>
                                        <th ><spring:message code="comment_" /></th>
                                        <th style="display: none;">product_id</th>
                                        <th style="display: none;">quantity</th>
                                        <th style="display: none;">comment</th>
                                        <th> <spring:message code="ActualQ" /></th>
                                        <th style="display:none;">Product_name</th>
                                  </tr>
                                    
                                    </thead>
                                    <tbody>
                                    <tr class="odd gradeX ">
                                      <td class="first" ><input type='checkbox' name='record' disabled></td>
                                    
                                      <td>
                                        <select class="productSelect" onchange="selectChange(this)">
                                        <option value="No_Value"><spring:message code="PleaseSelect"/></option>
                                        <c:forEach var="product" items="${products}" varStatus="vs">
                                        <option value='${product.product_id},${product.quantity}'>${product.product_name}</option>
                                        </c:forEach>
								     </select>
								     </td>
                                      
                                      
                                      <td ><input onchange="changeQuantity(this)" required type="number" min ="1"   max= '${products[0].quantity}'/></td>
                                      <td ><textarea  required onchange="changeComment(this)" rows="1" ></textarea></td>
                                       <td style="display: none;">${products[0].product_id}</td>
                                       <td style="display: none;"></td>
                                       <td style="display: none;"></td>
                                       <td></td>
                                       <td style="display:none;"></td>
                                    </tr>
                                    </tbody>
                                </table>
                                </form>
                            </div>
                       <div class="space20"></div> 
                       <div class="clearfix"></div>
                     
                       <div class="row-fluid  ">
                            
                            
                             <button  onclick="submitData()"  id="submitBtn" class="btn btn-success pull-right green mright5 "><i class="icon-save icon-white"></i> <spring:message code="Submit"/> </button>   
                       <button type="button"  id="printBtn"  class="btn btn-primary pull-right" onclick="print_data();" style="margin-right: 4px;" disabled><i class="icon-print  icon-white" style="margin-right: 7px;" ></i><spring:message code="Print"/></button>   
       
                            </div>
                            
                             
                          <div class="clearfix"></div>
                   <table id="print_tbl" class="table dataTable table-striped table-bordered  table-advance table-hover table-responsive" style="margin:auto; width:80%;">
 <thead>
                                    <tr>
                                       <th><spring:message code="ProductReconciliation.ProductTable.ProductName"/></th>
										<th><spring:message code="ProductReconciliation.ProductTable.Quantity"/></th>
									<th>Comment</th>
									</tr>

                                    
                                    </thead>
                                    <tbody></tbody>
</table>
						 </div>
						 
						 
						 
                        </div>
                     </div>
                  </div>
               </div>
              <div  class="row-fluid  " > 
              <br><br><br>
                            <strong id="nodust_misr" style="text-align:left; margin-left:25px;"><spring:message code="MisrNoDust"/></strong>
                       
                        <strong id="date_time_now" style="text-align: center; margin-left:200px;"> </strong>
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
        	var val4=tbl.rows[1].cells[3].innerHTML;
        	 var markup = "<tr> "+
             "<td class='first'><input type='checkbox' name='record'></td>"+
             " <td>"+val1+"</td>"+
             " <td><input required onchange='changeQuantity(this)' type='number' max= '${products[0].quantity}'/></td>"+
             " <td>"+val4+"</td>"+
            " <td style='display: none;'></td>"+
            "  <td style='display: none;'>0</td>"+
            "  <td style='display: none;'></td>"+
            " <td></td>"+
            "<td style='display:none;'></td>"
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
              var display=e.options[e.selectedIndex].text;
              var array = strUser.split(',');
              var myTable = document.getElementById('example');
              $("#example tr").eq(rowIndex).find("td").eq(2).find("input").attr({
                  "max" : array[1]
               }); 
              if(e.value!='No_Value')
    		  {
              myTable.rows[rowIndex].cells[7].innerHTML = array[1];
              myTable.rows[rowIndex].cells[4].innerHTML = array[0];
              myTable.rows[rowIndex].cells[8].innerHTML=display;
        		  }
        	  else
        		  {
                  myTable.rows[rowIndex].cells[7].innerHTML = '';
                  myTable.rows[rowIndex].cells[4].innerHTML = array[0];
                  myTable.rows[rowIndex].cells[8].innerHTML='';

        		  }
		}	
        function changeQuantity(x) {
            var rowIndex = x.parentNode.parentNode.rowIndex;
            var val= x.value;
            var myTable = document.getElementById('example');
            myTable.rows[rowIndex].cells[5].innerHTML = val;
            
		}
        function changeComment(x) {
        	var rowIndex = x.parentNode.parentNode.rowIndex;
            var val= x.value;
            var myTable = document.getElementById('example');
            myTable.rows[rowIndex].cells[6].innerHTML = val;
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
       			  {}
       			  );
          	 console.log(table);
          	 var Deduct_form ={"products":table};
          	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function() {

         	if (this.readyState == 4 && this.status == 200) {
         		var response= this.responseText;
         		if(response == "true")
         			{
         			
     	    			$('#tableform input[type="number"]').prop("disabled", true);
     	    			$('#tableform select').prop("disabled", true);
     	    			$('#tableform input[type="checkbox"]').prop("disabled", true);
     	    			
     	    			$('#tableform textarea').prop("disabled", true);
     	    			document.getElementById("submitBtn").disabled = true;
     	    			document.getElementById("printBtn").disabled=false;
     	    			document.getElementById("add_row").disabled=true;
     	    			document.getElementById("delete_row").disabled=true;

     	    			swal({
     	    				title:"<spring:message code="ConvertProduct.title" />",
     	    				text:"Product Deduction Order Submitted Successfully",
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


         			swal("<spring:message code="ConvertProduct.failed.title" />","Product Deduction Order Submitted Not Successfully","error");
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
         	 xhttp.open("POST","SubmitDeduction", true);
         	 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
         	 xhttp.send(JSON.stringify(Deduct_form));
      		  }
      	  else
      		  {
      		  document.getElementById("submitBtn").disabled=false;
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
	   var P="<thead><tr><th><spring:message code='product_only'/></th><th><spring:message code='ProductReconciliation.ProductTable.Quantity'/></th><th>Comment</th></tr></thead>";
		P+="<tbody>";
		var table_x=document.getElementById("example");
		var rows_num=table_x.rows.length;
		for(var i=1;i<rows_num;i++)
			{
			P+="<tr>"+
			"<td>"+table_x.rows[i].cells[8].innerHTML+"</td>"+
			"<td>"+table_x.rows[i].cells[5].innerHTML+"</td>"+
			"<td>"+table_x.rows[i].cells[6].innerHTML+"</td>"+
"</tr>"
			}
		$('#print_tbl').html(P);
		window.print();
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