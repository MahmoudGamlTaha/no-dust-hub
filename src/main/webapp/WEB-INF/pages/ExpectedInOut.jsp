<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
             <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="ExpectedInOut"/></title>
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
	   <script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
	     <script type="text/javascript" src="resources/assetsnodust/js/jasontable.js"></script>

<style type="text/css">
#astr
{
    color: red;
    font-size: large;
     
    
}
#date_time_now{visibility:hidden;}
 #sig{visibility:hidden;}
   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}
#print_tbl
{
visibility:hidden;
}
#logoprint{visibility:hidden;}

#total_tbl
{
visibility:hidden;
}
 #nodust_misr
 {
 visibility:hidden;
 }
 #date_time_now
 {
 visibility:hidden;
 }
@font-face {
  font-family: ArbFONTS;
  src: url(ArbFONTS-Abdo-salem-Bold.ttf);
}

   </style>
   	 
 <style type="text/css" media="print">

 @page { size:A4 ;  }
  
  @media print {
  #date_time_now{visibility:visible;}
  #sig{visibility:visible;}
  #astr{display:none;}
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
 #date_time_now
 {
 visibility:visible;
 }
 #tableBtns{
  display: none
 }
 
 #showDate{ color: black;}
  #titlepage{ display: none;}
}

#logoprint{visibility: visible;}
#example{
display:none;}
#print_tbl
{
visibility:visible;
}
#date_div
{
float:left;
width:30%;
}
#agent_name_div
{
float:left;
width:30%;
}
#warehouse_name_div
{
float:left;
width:40%;
}
#total_tbl
{
visibility:visible;
}
#contentpage{ margin-top: -50px;}

 #Header, #Footer { display: none !important; color: white !important ; background: red; }
#footer{ display: none;  }

@page {	margin:0;}
body{ margin: 1.6cm}



}
</style>

<style>

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
                           <a href="ExpectedINOUT"><spring:message code="ExpectedInOut"/> </a><span class="divider-last">&nbsp; &nbsp;</span>
                       </li>
                     
                  </ul>
                
				  
				   
               </div>
            </div>
       
		                 <img src="resources/assetsnodust/img/logored.png" alt="logo NODUST" style=" width: 25%;  float: right; margin-right:5%;  display:none; margin-top: -20px ; " id="logoprint">
	   
         
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4><spring:message code="ExpectedInOut"/></h4>
                        </div>
                        
						<div class="widget-body" style="text-align: left;">


		<table width="100%" >
<tr>
<td>

<div class="row-fluid invoice-list" >
                              
    <div class="row-fluid"  >
		<ul class="nav nav-tabs">
 
			    <li class="nav-item active">
			      <a class="nav-link" data-toggle="tab" href="#tab1"><spring:message code="ExpectedOut_Data"/></a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" data-toggle="tab" href="#tab2"><spring:message code="ExpectedIn_Data"/></a>
			    </li>
          </ul>
            <div class="tab-content">
			   
			    <div id="tab1" class="container tab-pane active"><br>
			    			                                   <button type="button"  onclick="ExportTableOUtAsExcel('ExpectedToBeOut')" class="btn btn-primary pull-right" style="margin-bottom: 20px;"><i class="icon-save icon-white"></i> <spring:message code="SaveAsExcel"/></button>
			    
			    
	<table class="table table-striped table-bordered   table-advance table-hover table-responsive" id="ExpectedOut">
	<thead>
	<tr>
	<th><spring:message code="product_only"/></th>
	<th><spring:message code="TotalInStock"/></th>
	<c:forEach items="${lst_treatment}" var="treatment">
	<th>
	<c:if test="${treatment.treatment_id==0}"><spring:message code="NoTreatmentHeader"/></c:if>
	<c:if test="${treatment.treatment_id!=0}">${treatment.treatment_name} </c:if>
	</th>
	</c:forEach>
	</tr>
	</thead>
	<tbody>
	 
	<c:forEach items="${lst_clean_products}" var="product">
	<tr>
	<td>${product.product_name}</td>
	<td>
	<c:if test="${product.available_quantity!=null}">${product.available_quantity}</c:if>
	</td>
	
	<c:forEach items="${lst_treatment}" var="treatment_var">
	
	<td>
	<c:forEach items="${clean_treatment_lst}" var="clean_product">
	<c:if test="${clean_product.treatment_id==treatment_var.treatment_id}">
	<c:if test="${clean_product.product_id==product.product_id}">
	${clean_product.clean_quantity} \ ${ clean_product.available_quantity}
	</c:if>
	</c:if>
	</c:forEach>
	
	
	</td>
	</c:forEach>
	
	</tr>
	</c:forEach>
	
	</tbody>
	</table>		     
			
			      
                         
                      
			    </div>
			    <div id="tab2" class="container tab-pane fade"><br>
			                                   <button type="button"  onclick="ExportTableInAsExcel('ExpectedToBeIN')" class="btn btn-primary pull-right" style="margin-bottom: 20px;"><i class="icon-save icon-white"></i> <spring:message code="SaveAsExcel"/></button>
			    
			    
			<table class="table table-striped table-bordered   table-advance table-hover table-responsive" id="ExpectedIN">
	<thead>
	<tr>
	<th><spring:message code="product_only"/></th>
	<th><spring:message code="TotalInStock"/></th>
<th><spring:message code="DirtyQuantity"/></th>
<c:forEach items="${lst_treatment_reconciliation}" var="recon_treatment">
<th>
<c:if test="${recon_treatment.treatment_id==0}"><spring:message code="NoTreatmentHeader"/></c:if>
<c:if test="${recon_treatment.treatment_id!=0}">${recon_treatment.treatment_name}</c:if>
</th>
</c:forEach>	
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${expected_dirty}" var="product">
	<tr>
	<td>${product.product_name}</td>
	<td>
	<c:if test="${product.available_quantity!=null}">${product.available_quantity}</c:if>
	</td>
	<td>
	<c:forEach items="${lst_reconciliation_products}" var="recon_product">
	<c:if test="${product.dms_product_id==recon_product.dms_product_id}">
	<c:if test="${recon_product.product_type==2}">
	${recon_product.clean_quantity} \ ${recon_product.available_quantity}
	</c:if>
	</c:if>
	</c:forEach>
	</td>
	<c:forEach items="${lst_treatment_reconciliation}" var="recon_treatment">
	<td>
	<c:forEach items="${lst_reconciliation_products}" var="recon_treated">
	<c:if test="${recon_treated.dms_product_id==product.dms_product_id}">
	<c:if test="${recon_treated.product_type==1}">
	<c:if test="${recon_treated.treatment_id==recon_treatment.treatment_id}">
	${recon_treated.clean_quantity} \ ${recon_treated.available_quantity}
	</c:if>
	</c:if>
	</c:if>
	
	</c:forEach>
	</td>
	</c:forEach>
	</tr>
	</c:forEach>
	</tbody>
	</table>		       
			  
                            
                              
                           
                             
                             		    </div>
			  </div>
	
	</div>                        
                                
                            <div>
                               
                                 
                          
                                </div>
                            <div class="clearfix"></div>
                            	 <div >
 							
                          
                               
                           
                               
                               </div>
                               
                                    </div>
                                    
                                <div>
                           
                              
                               </div>
                               
                                
                       
</td>
</tr>
</table>
 						


                         
                  							               
                 
                    <div class="space10"></div>
                                 
                    
                        
                   
			
			               <form:form id="tableform" modelAttribute="clean_form" >
			
                            <div class="row-fluid">
                   
                                <br><br><br>
                               
                            </div>
                            <br> <br> <br>   
                        <div  class="row-fluid  " > 
                            <strong id="nodust_misr" style="text-align:left;"><spring:message code="MisrNoDust"/></strong>
                       
                        <strong id="date_time_now" style="text-align: center; margin-left:200px;"> </strong>
                        </div>
                       <div class="space20"></div> 
                       <div class="clearfix"></div>
                                             
                  
                            <div class="row-fluid  ">
                                             
              
                            </div>             
                    </form:form>
                   			
						 </div>
						 <br> <br> <br>   
                       
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
   <script type="text/javascript">

   
   
   
   
  
   </script>
   <script >
    $(document).ready(function(){
    	
  	    $('.js-example-basic-multiple').select2();

    });
    
    
    

</script>
<script>
function ExportTableToCsv(filename)
{
	var csv=[];
	//var rows=document.querySelectorAll("table tr");
	var rows=document.getElementById("ExpectedOut").rows;
	for(var x=0;x<rows.length;x++)
		{
		var row=[];
		var columns=rows[x].querySelectorAll("td, th");
		for(var i=0;i<columns.length-1;i++)
			row.push(columns[i].innerText);
		csv.push(row.join(","));
		}
	downloadFileAsCSV(csv.join("\n"),filename);
}

function ExportTableOUtAsExcel(file_name) {
    var uri = 'data:application/vnd.ms-excel;base64,',
      template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
      base64 = function(s) {
        return window.btoa(unescape(encodeURIComponent(s)))
      },
      format = function(s, c) {
        return s.replace(/{(\w+)}/g, function(m, p) {
          return c[p];
        })
      }
    var toExcel = document.getElementById("ExpectedOut").innerHTML;
    var ctx = {
      worksheet: name || '',
      table: toExcel
    };
    var link = document.createElement("a");
    link.download = file_name+".xls";
    link.href = uri + base64(format(template, ctx))
    link.click();
  }

function ExportTableInAsExcel(file_name) {
    var uri = 'data:application/vnd.ms-excel;base64,',
      template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
      base64 = function(s) {
        return window.btoa(unescape(encodeURIComponent(s)))
      },
      format = function(s, c) {
        return s.replace(/{(\w+)}/g, function(m, p) {
          return c[p];
        })
      }
    var toExcel = document.getElementById("ExpectedIN").innerHTML;
    var ctx = {
      worksheet: name || '',
      table: toExcel
    };
    var link = document.createElement("a");
    link.download = file_name+".xls";
    link.href = uri + base64(format(template, ctx))
    link.click();
  }
function ExportTableINToCsv(filename)
{
	var csv=[];

	var rows=document.getElementById("ExpectedIN").rows;
	for(var x=0;x<rows.length;x++)
		{
		var row=[];
		var columns=rows[x].querySelectorAll("td, th");
		for(var i=0;i<columns.length-1;i++)
			row.push(columns[i].innerText);
		csv.push(row.join(","));
		}
	downloadFileAsCSV(csv.join("\n"),filename);
}
function downloadFileAsCSV(csv,filename)
{
	var file;
	var downloadlink;
	file=new Blob([csv], {type: "text/csv"});
	downloadlink=document.createElement("a");
	downloadlink.download=filename;
	downloadlink.href=window.URL.createObjectURL(file);
	downloadlink.style.display='none';
	document.body.appendChild(downloadlink);
	downloadlink.click();
	}
</script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>