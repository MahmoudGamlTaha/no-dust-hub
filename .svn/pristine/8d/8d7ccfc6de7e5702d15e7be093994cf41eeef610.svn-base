<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    <%@page session="true"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/custom.css">
              
</head>
<body>
  <nav class="side-navbar">
          <!-- Sidebar Header-->
          <div class="sidebar-header d-flex align-items-center">
            <div class="avatar"><img src="resources/img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
            <div class="title">
              <h1 class="h4"> ${pageContext.request.userPrincipal.name}</h1>
              <p>Web Designer</p>
            </div>
          </div>
          <!-- Sidebar Navidation Menus-->
          <span class="heading">Main</span>
           <ul class="list-unstyled">
                   <li id="Dashboardli"><a href="Dashboard"> <i class="fa fa-home"></i>Home</a></li>
                   
                     <li ><a href="home.html"> <i class="fa fa-home"></i>Home</a></li>
                    <!--<sec:authorize access="hasAuthority('DraftPage.view')">
                    <li id="Drafti"><a href="DraftTicket"> <i class="fa fa-edit"></i>Draft</a></li>
                    </sec:authorize>-->
                     
                    

<hr style="margin:0px; padding: 0px;">

<div  style="height: 46px; border-bottom: 1px solid rgba(0,0,0,.125);" >
    
  <a  class="card-header text-center" id="toggle-btn" href="#" class="menu-btn active"  style=" float: right; color: #702283; background: #f7f7f7; border-bottom: none; ">
  <i id="toggleSideNav" class="fa fa-angle-double-left"  style="font-size: 18px;"></i>   </a>
  
  
<script>

</script>

     </div>     
          </ul>
        </nav>  
        
           
                      
                      
</body>
<script>
$(${param.param1} ).addClass( "active" );
var per = '${pageContext.request.userPrincipal}';
console.log(per);
</script>

 <script>
 $(document).ready(function() {
 $('#toggle-btn').on('click', function (e) {
	 document.getElementById('toggleSideNav').classList.toggle("fa-angle-double-right");
     e.preventDefault();
     $(this).toggleClass('active');

     $('.side-navbar').toggleClass('shrinked');
     $('.content-inner').toggleClass('active');
     $(document).trigger('sidebarChanged');

     if ($(window).outerWidth() > 1183) {
         if ($('#toggle-btn').hasClass('active')) {
             $('.navbar-header .brand-small').hide();
             $('.navbar-header .brand-big').show();
         } else {
             $('.navbar-header .brand-small').show();
             $('.navbar-header .brand-big').hide();
         }
     }

     if ($(window).outerWidth() < 1183) {
         $('.navbar-header .brand-small').show();
     }
 });
 $('#toggle-btn').click();
 });

 </script>
 
</html>