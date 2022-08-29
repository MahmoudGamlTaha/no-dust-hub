<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
      <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="MyInventoryCheck.PageTitle"/> </title>
   <link href="img/no.jpeg" rel="icon" />
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
   
   <link href="resources/assetsnodust/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
   <link href="resources/assetsnodust/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />  
   <link href="resources/assetsnodust/css/style.css" rel="stylesheet" />
   <link href="resources/assetsnodust/css/style_red.css" rel="stylesheet" />
     <link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.5.1/css/colReorder.dataTables.min.css"/>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <link rel="stylesheet" href="resources/css/jquery-confirm.min.css"/>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

   <script src="resources/assetsnodust/bootstrap/js/jquery-1.8.3.min.js"></script>
   <script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
   <script src="resources/assetsnodust/bootstrap/js/bootstrap.min.js"></script>
   <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
   <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
   <script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
   <script type="text/javascript" src="resources/assetsnodust/js/jasontable.js"></script>
    
	 <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
   <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.js"></script>

<style type="text/css">
   .disabledbutton {
    pointer-events: none;
    opacity: 0.4;
}
tfoot {
    display: table-header-group;
}
.dataTables_wrapper {
margin-left: 15px;

}

#logoprint{visibility:hidden;}

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

#logoprint{visibility: visible;}

#contentpage{ margin-top: -50px;}

 #Header, #Footer { display: none !important; color: white !important ; background: red; }
#footer{ display: none;  }

@page {	margin:0;}
body{ margin: 1.6cm}



}
</style>

<style>
table.dataTable tfoot th, table.dataTable tfoot td {
  /*  padding: 5px; */
    border-top: 1px solid #111;
}

.select2-container {
width:80% !important;
}
</style>
</head>

<body class="fixed-top">
<div id="fff">

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
                           <a href="MyInventoryCheck"><spring:message code="MyInventoryCheck.PageTitle"/></a><span class="divider-last">&nbsp; &nbsp;</span>
                       </li>
                     
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4><spring:message code="MyInventoryCheck.PageTitle"/></h4>
                        </div>
                        
						<div class="widget-body" style="text-align: left;">
 						


                         
                  							               
                 
                    <div class="space10"></div>
                            <div id="tableBtns" class="row-fluid  ">
    
			       
                           <div class="space10"></div>                             
                            </div>         
                    
                        
                   
			
			      
			
                            <div class="row-fluid" >
                   
                                <table   id="tableform" class="table dataTable table-striped table-bordered   table-advance table-hover table-responsive ">
                                    <thead>
                                    <tr>
                                      
                                        <th><spring:message code="checkID"/></th>
                                        <th ><spring:message code="DateOnly"/></th>
                                        <th ><spring:message code="AgentName_"/></th>
                                        <th><spring:message code="status"/></th>
                                        <th ><spring:message code="Actions"/></th>
                                    
                                    </tr>
                                    
                                    </thead>
                                    <tfoot>
                                     <tr>
                                      
                                        <th ><spring:message code="checkID"/></th>
                                        <th ><spring:message code="DateOnly"/></th>
                                        <th ><spring:message code="AgentName_"/></th>
                                        <th><spring:message code="status"/></th>
                                        <th ><spring:message code="Actions"/></th>
                                    
                                    </tr>
                                    </tfoot>
                                    <tbody>
                                  
                                   <c:forEach var="check" items="${checks}" >
                                 
                                    <tr class="odd gradeX "> 
                                    
                                    <td>${check.id}</td>
                                    <td><fmt:formatDate value="${check.check_date}" pattern="dd-MM-yyyy" /></td>
                                    <td>${check.logged_user}</td>
                                    <td><c:if test="${check.last_status_id==2}"><spring:message code="pending"/></c:if>
	                                    <c:if test="${check.last_status_id==3}"><spring:message code="approved"/></c:if>
	                                    <c:if test="${check.last_status_id==4}"><spring:message code="rejected"/></c:if>
                                    </td>
                                    <td>
                                    <a href="InventoryCheckDetails?CheckID=${check.id}"> <span class="label label-success normal" ><i class="icon-pencil mright5"></i><spring:message code="Readmore" /></span></a>
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
    	  var table=  $('#tableform').DataTable( {
    		  "language":{
    			  "zeroRecords": "<spring:message code="NoInventoryChecksFound"/>"
    			  },
    		  "order": [[ 0, "desc" ]] ,
  	        initComplete: function () {
  	            this.api().columns([0,1,2,3]).every( function () {
  	                var column = this;
  	                 var select = $('<select class="form-control js-example-basic-single" data-placeholder="'+column.header().textContent+'"><option value="All">All</option></select>')
  	                    .appendTo( $(column.footer()).empty() )
  	                    .on( 'change', function () {
  	                        var val = $.fn.dataTable.util.escapeRegex(
  	                            $(this).val()
  	                        );
  	                        
  	                        if(val == "All")
  	                        	{
  	                        	table
  	                        	 .columns(column).search( '' )
  	                        	 .draw();
  	                        	}
  	                        else{
  	                        column
  	                            .search( val ? '^'+val+'$' : '', true, false )
  	                            .draw();
  	                        }
  	                    } );
  	 
  	                column.data().unique().sort().each( function ( d, j ) {
  	                    select.append( '<option value="'+d+'">'+d+'</option>' )
  	                } );
  	            } );
  	            $('.js-example-basic-single').select2({

      		    });
  	           
  	        }
  	    
  	    } );
  	    
    	  
    	  
  	 //   $('.js-example-basic-multiple').select2();
 	   
  	});
      function  changeState(checkedVar) {
    	  var rowIndex =checkedVar.parentNode.parentNode.rowIndex -1;
    	  if (checkedVar.checked) {
    		  var myTable = document.getElementById('tableform');
             // myTable.rows[rowIndex].cells[4].innerHTML="true"
             document.getElementById('productState['+rowIndex+']').value = true;
    	  }
    	  else
    		  {
    		  var myTable = document.getElementById('tableform');
             // myTable.rows[rowIndex].cells[4].innerHTML= "false"
             document.getElementById('productState['+rowIndex+']').value = false;
               // $("#selectAll").prop("checked", false);

    		  }
    	  
     }
      function submitForm() {
    	  document.getElementById("submitBtn").disabled = true;
    	  if($("#tableform input:checkbox:checked").length > 0){
    		  document.getElementById("inventoryForm").submit();

    	  }
    	  else{
        	  document.getElementById("submitBtn").disabled = false;

    	  }
	}
   </script>
   
   

    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>