<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <title><spring:message code="ReleasingProducts.CoverList.PageTitle"/></title>
   <link href="img/no.jpeg" rel="icon" />
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
 
   <link href="resources/assetsnodust/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />  
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
     <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
   
   <link href="resources/assetsnodust/css/style.css" rel="stylesheet" />
<!--    <link href="resources/assetsnodust/css/style_arabic.css" rel="stylesheet" />  --> 

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
                           <a href="DispatchingProducts"> <spring:message code="ReleasingProducts.PageTitle" /></a> <span class="divider">&nbsp; &nbsp;</span>
                       </li> 
                       <li><a href="CoverList?Username=${Username}"> <spring:message code="ReleasingProducts.CoverList.PageTitle"/></a><span class="divider-last">&nbsp;</span></li>
                  </ul>
      	  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title">
                           <h4> <spring:message code="ReleasingProducts.CoverList.PageTitle"/></h4>
                        </div>
                        
						<div class="widget-body">
						
							<table id="example" class="table table-striped table-bordered" style="width:80%;margin:auto;">
						        <thead>
						            <tr>
						            <th><spring:message code="ReleasingProducts.CoverList.NameAR" /></th>
									<th><spring:message code="ReleasingProducts.CoverList.NameEn" /></th>
									<th><spring:message code="ReleasingProducts.CoverList.date" /></th>
									<th><spring:message code="Actions" /></th>
						            </tr>
						        </thead>
						 
						        <c:forEach var="cover" items="${covers_lst}">
						                   <tr>
						                    <td>${cover.driver_name_ar}</td>
						                    <td>${cover.driver_name_en}</td>
						                    <td>${cover.assign_date} </td>
						                    <th><a href="CoverDetails?Username=${cover.driver_id}&date=${cover.assignment_date}"><span class="label label-success"><i class="icon-pencil mright5"></i><spring:message code="Readmore" /></span></a>  </th>
						                </tr>
						        </c:forEach>
                             </table>
               
						
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
 
 <!-- Open & close MENU -->
  
   <script>
      jQuery(document).ready(function() {			
      	App.init();
      });
      
    
   </script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>