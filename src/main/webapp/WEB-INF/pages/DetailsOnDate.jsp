<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
   <title> NODUST</title>
   <link href="img/no.jpeg" rel="icon" />
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
   
   <link href="resources/assetsnodust/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
   <link href="resources/assetsnodust/css/style.css" rel="stylesheet" />
   <link href="resources/assetsnodust/css/style_red.css" rel="stylesheet" />
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <link rel="stylesheet" href="resources/css/jquery-confirm.min.css"/>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.5.1/css/colReorder.dataTables.min.css"/>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>

   <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
   <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
   <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
   <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
   <script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
   <script type="text/javascript" src="resources/assetsnodust/js/jasontable.js"></script>
<script type="text/javascript" src="resources/vendor/DatePicker/moment.js"></script>
 <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
   <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>

<style type="text/css">
   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}
.details
{
display:none;
}
#tableDiv
{
width:100%;
  overflow:scroll;
}

tfoot {
    display: table-header-group;
}

 #noData
 {
 color: white;
 }
 .dataTables_wrapper {
margin-left: 15px;

}
#ware_house
{
float:left;
width:35%;
}
#product
{
float:left;
width:30%;
}
#date
{
float:left;
width:30%;
}

#astr
{
    color: red;
    font-size: large;
     
    
}
.dataTables_wrapper .dataTables_filter {

display: none;
}




@font-face {
  font-family: ArbFONTS;
  src: url(ArbFONTS-Abdo-salem-Bold.ttf);
}

   </style>
   	 
 <style type="text/css" media="print">

 @page { size:A4 ;  }
  
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
 
 #tableBtns{
  display: none
 }
 
 #showDate{ color: black;}
  #titlepage{ display: none;}
}


#contentpage{ margin-top: -50px;}

 #Header, #Footer { display: none !important; color: white !important ; background: red; }
#footer{ display: none;  }

@page {	margin:0;}
body{ margin: 1.6cm}



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
   
  
	 
		<jsp:include page="SideNaveNoDust.jsp">
		         <jsp:param name="param1" value="Dashboardli"/>
		 </jsp:include>	
   
    

    
	


		<div id="main-content">
	
         <div class="container-fluid">
            <div class="row-fluid">
               <div class="span12">
                  
                
			
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div >
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4><spring:message code="ProductTransactions"/></h4>
                        </div>
                         
						<div class="widget-body" >
 						<div class="widget-title" >
                           <h4><spring:message code="TransactionData"/></h4>
                        </div>
 <div style="border:outset;" class="row-fluid " >
                                 
                                
                                    <div  id="ware_house" style="margin-left:10px;"> <h5 ><strong><spring:message code="warehousename" /></strong>
                                     	${warehouse}</h5></div>
                                
                                    <div id="product"> <h5 ><strong><spring:message code="Product_" /></strong>
                                    	${productName}</h5></div>
                                
                                 
                                    <div id="date"> <h5 ><strong><spring:message code="Date" /> </strong>
                                      	${date}</h5></div>
                                
                             
                          
                          </div>
					
					
				
                         
                         
                         
                          
                    <div class="space10"></div>
                               
                     
                            <div id="data_div">
                            <table id="table_data" style="width:80%;" class="table dataTable table-striped table-bordered   table-advance table-hover table-responsive ">
                            <thead>
                          <tr>  
                          <th></th>
                          <th><spring:message code="DateOnly"/> </th>
                          <th>Transaction Type</th>
                          <th><spring:message code="product_only"/></th>
                          <th><spring:message code="posamount"/></th>
                          <th><spring:message code="negamount"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${products}" var="product">
                            <tr>
                            <td><i  onclick='display_det(this)' class='fa fa-plus-circle' aria-hidden='true'></i></td>
                            <td>
                            <c:if test="${product.transaction_type_id==1}">
                            <a href="ShipmentReportDetails?ShipmentID=${product.transaction_id}">${product.date}</a>
                            
                            </c:if>
                            <c:if test="${product.transaction_type_id==3}">
                            <a href="OrderReportDetails?OrderID=${product.transaction_id}">${product.date}</a>
                            
                            </c:if>
                             <c:if test="${product.transaction_type_id==5}">
                            <a href="OrderReportDetails?OrderID=${product.transaction_id}">${product.date}</a>
                            
                            </c:if>
                            </td>
                            <td>${product.transaction_type }</td>
                            <td>${ product.product_name}</td>
                            <td>
                            <c:if test="${ product.added==null}">0</c:if>
                           <c:if test="${ product.added!=null}"> ${product.added}</c:if>
                           
                            </td>
                            <td>
                            <c:if test="${product.deducted==null}">0</c:if>
                            
                            <c:if test="${product.deducted!=null}">${product.deducted}</c:if>
                            </td>
                            </tr>
                            <tr class="details">
                            <td colspan="6">
                            <table class="table dataTable table-striped table-bordered   table-advance table-hover table-responsive ">
                            <thead>
                            <tr>
                            <th>Product</th>
                            <th>Type</th>
                            <th>Treatment</th>
                            <th><spring:message code="posamount"/></th>
                            <th><spring:message code="negamount"/></th>
                            
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${details}" var="det">
                            <c:if test="${det.transaction_id==product.transaction_id}">
                            <tr>
                            <td>${det.product_name}</td>
                            <td>${det.type }</td>
                            <td>${det.treatment}</td>
                            <td><c:if test="${det.added==null}">0</c:if>
                            
                            <c:if test="${det.added!=null}">${det.added}
                            </c:if>
                            </td>
                            <td>
                            <c:if test="${det.deducted==null}">0</c:if>
                            <c:if test="${det.deducted!=null}">${det.deducted }</c:if>
                            
                            
                            </td>
                            </tr>
                            </c:if>
                            </c:forEach>
                            </tbody>
                            </table>
                            </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                            </table>
                            
                            </div>
                   
                 
								
                            
                           
                       <div class="space20"></div> 
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
 
      
      function display_det(x)
      {
    	 var index=x.parentNode.parentNode.rowIndex;
    	  var class_list=x.classList;
    	  var tbl = document.getElementById("table_data");
    	  if (class_list.contains("fa-plus-circle"))
    		  {
    		  x.classList.remove("fa-plus-circle");
        	  x.classList.add("fa-minus-circle");
        	  tbl.rows[index+1].style.display='table-row';
    		  }
    	  else
    		  {
    		  x.classList.remove("fa-minus-circle");
        	  x.classList.add("fa-plus-circle");
        	  tbl.rows[index+1].style.display='none';
    		  }
    	 
      }
   </script>
 
  

    <script src="resources/assetsnodust/js/scripts.js"></script>
    
</body>
<!-- END BODY -->
</html>