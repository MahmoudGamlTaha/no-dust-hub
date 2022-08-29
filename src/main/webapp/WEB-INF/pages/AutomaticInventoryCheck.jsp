<!DOCTYPE html>

 <html lang="en">

<head>
   <meta charset="utf-8" />
      <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
   <title> <spring:message code="DailyInventoryCheck"/> </title>
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
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>

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
.dataTables_wrapper .dataTables_filter{ float:left; margin-left: 20px; margin-top:-40px;}
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
                           <a href="DailyInventoryCheck"><spring:message code="DailyInventoryCheck"/></a><span class="divider-last">&nbsp; &nbsp;</span>
                       </li>
                     
                  </ul>
                
				  
				   
               </div>
            </div>
       
	   
          
            <div id="page">
               <div class="row-fluid">
                  <div class="span12">
                  
                     <div class="widget">
                        <div class="widget-title" id="titlepage">
                           <h4><spring:message code="DailyInventoryCheck"/></h4>
                        </div>
                        
						<div class="widget-body" style="text-align: left;">
 						


                         
                  							               
                 
                    <div class="space10"></div>
                            <div id="tableBtns" class="row-fluid  ">
    
			       
                           <div class="space10"></div>                             
                            </div>         
                    
                        
                   
			
			      
			
                            <div class="row-fluid" >
                    <div>
                       <button  id="submitBtn" onclick="ConfirmSubmitForm()"  class="btn btn-warning pull-right  mright5 " style="margin-bottom: 5px; float:right;"><i class="icon-plus icon-white mright5"></i><spring:message code="Create"/></button>
                                 
                            </div> 
                                <table   id="tableform" class="table dataTable table-striped table-bordered   table-advance table-hover table-responsive " style="width:80%;margin:auto;">
                                    <thead>
                                    <tr>
                                      
                                        <th><spring:message code="ID_tbl"/></th>
                                        <th ><spring:message code="DateOnly"/></th>
                                    
                                        <th ><spring:message code="Actions"/></th>
                                    
                                    </tr>
                                    
                                    </thead>
                                    <tfoot>
                                     <tr>
                                      
                                        <th ><spring:message code="ID_tbl"/></th>
                                        <th ><spring:message code="DateOnly"/></th>
                                 
                                        <th ><spring:message code="Actions"/></th>
                                    
                                    </tr>
                                    </tfoot>
                                    <tbody>
                                  
                                   <c:forEach var="check" items="${lst_inventory}" >
                                 
                                    <tr class="odd gradeX "> 
                                    
                                    <td>${check.inventory_check_id}</td>
                                    <td><fmt:formatDate value="${check.inventory_check_time}" pattern="dd-MM-yyyy" /></td>
                                    
                                    <td>
                                    <a href="DailyInventoryCheckDetails?InventoryCheckID=${check.inventory_check_id}"> <span class="label label-success normal" ><i class="icon-pencil mright5"></i><spring:message code="Readmore" /></span></a>
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
    		  "paging":false,
    		  "language":{
    			  "zeroRecords": "<spring:message code="NoDailyInventoryCheckFound"/>"
    			  },
    		  "order": [[ 0, "desc" ]] ,
  	        initComplete: function () {
  	            this.api().columns([0,1]).every( function () {
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
   
   
   </script>

<script>
function Submit_Function()
{
	var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			

			if (this.readyState == 4 && this.status == 200) {
			var resp=this.responseText;
			if(resp=="true")
				{
				swal("<spring:message code="ShipmentList.Success.Title"/>","<spring:message code="DailyInventoryCheckCreatedSuccessfully"/>","success");
				/*$.alert({
		            
	                title: "<spring:message code="ShipmentList.Success.Title"/>",
	    		    content:"<spring:message code="DailyInventoryCheckCreatedSuccessfully"/>"
	                });*/ 
				}
			else
				{
				swal("<spring:message code="ShipmentList.Error.Title"/>","<spring:message code="DailyInventoryCheckNotCreated"/>","error");
/*$.alert({
		            
	                title: "<spring:message code="ShipmentList.Error.Title"/>",
	    		    content:"<spring:message code="DailyInventoryCheckNotCreated"/>"
	                });*/
				}
			}
		}
		xhttp.open("POST","SubmitAutomaticInventory", true);
		 xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
		 xhttp.send();
}
function ConfirmSubmitForm()
{
	$.confirm({
	    title: '<spring:message code="ConfirmAutomaticInventoryCheck" />',
		icon:'glyphicon glyphicon-remove-sign',
		theme: 'supervan',
	    content:'',
	    
	    buttons: {
	    	  OK: function () {
	    		  Submit_Function();
	    	  },
	    cancel: function () {
        }
	    }
	});
}
</script>
    <script src="resources/assetsnodust/js/scripts.js"></script>
</body>
<!-- END BODY -->
</html>