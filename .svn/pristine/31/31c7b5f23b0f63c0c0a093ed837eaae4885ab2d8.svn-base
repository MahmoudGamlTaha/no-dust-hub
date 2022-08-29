<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page session="true"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
      <%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<link rel="stylesheet" href="resources/vendor/DatePicker/bootstrap-datetimepicker.min.css"/>
<link rel="stylesheet" href="resources/css/jquery-confirm.min.css"/>
<link rel="stylesheet" href="resources/js/select2/css/select2.css"  />
<script type="text/javascript" src="resources/js/select2/js/select2.js"></script>
<script type="text/javascript" src="resources/vendor/DatePicker/moment.js"></script>
<script type="text/javascript" src="resources/vendor/DatePicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-confirm.min.js"></script>
<link rel="stylesheet" href="resources/css/custom.css">
        
</head>


<body ng-app="myApp">


<script>

Alpaca.Fields.ObjectField.prototype.getContainerValue = function() {
    // if we don't have any children and we're not required, hand back empty object
    if (this.children.length === 0 && !this.isRequired())
    {
        return {};
    }

    // otherwise, hand back an object with our child properties in it
    var o = {};
	console.log(this.options.form)
    console.log(this.options.form);
    // walk through all of the properties object
    // for each property, we insert it into a JSON object that we'll hand back as the result

    // if the property has dependencies, then we evaluate those dependencies first to determine whether the
    // resulting property should be included

    for (var i = 0; i < this.children.length; i++)
    {
        // the property key and value
        var propertyId = this.children[i].propertyId;
        var fieldValue = this.children[i].getValue();

        if(fieldValue !== fieldValue) {
            // NaN
            fieldValue = undefined;
        }

        if (typeof(fieldValue) !== "undefined")
        {
            if (this.determineAllDependenciesValid(propertyId))
            {
                var assignedValue = null;

                if (typeof(fieldValue) === "boolean")
                {
                    assignedValue = (fieldValue? true: false);
                }
                else if (Alpaca.isArray(fieldValue) || Alpaca.isObject(fieldValue) || Alpaca.isNumber(fieldValue))
                {
                    assignedValue = fieldValue;
                }
                else if (fieldValue || fieldValue === 0)
                {
                    assignedValue = fieldValue;
                }

               
                    o[propertyId] = assignedValue;
               
            }
        }
    }
     console.log(o);
    return o;
};
</script>

<script>
var username="${pageContext.request.userPrincipal.name}";
var active='${sessionScope["active"]}';
console.log("fffntnnf "+'${sessionScope["role"]}');
// crate btn
/*window.onload = function() {
	if(active==0)
	{
	  // disable btn create
	  document.getElementById("btn_create").style.display="none";
	}
else
	{
	  // show btn create
	  document.getElementById("btn_create").style.display="block";

	}
console.log('${sessionScope["active"]}');
};*/
$(document).ready(function() {
	
});

function formSubmit() {
	console.log("asdasd");
			document.getElementById("logoutForm").submit();
		}
		</script>
<script type="text/javascript">
	var span = document.getElementsByClassName("close_modal")[0];
function  CreateTicket()
	{
	var modal = document.getElementById('myModal');
	document.getElementById("create_form").reset();
		modal.style.display = "block"; 
		   $("#src_btn_angular").click()
		   
		   document.getElementById('creator_id').value=username;


	}
	
function  openConfirmationMsg()
{
	
	//var gettingAll = chrome.windows.getAll();
	//console.log(chrome://inspect/#pages);
	$.confirm({
	    title: 'Confirm Check out',
		icon:'glyphicon glyphicon-remove-sign',
		theme: 'supervan',
	    content:'All your Tickets will return to unassigned Queue?',
	    buttons: {
	        OK: function () {
	        	window.location = "Deactivate";

	        },
	        cancel: function () {
	        }
	        
	    }
	});

}

	 // When the user clicks on <span> (x), close the modal
function closemodal()
	{
	var modal = document.getElementById('myModal');

			modal.style.display = "none"; 
	}
	 /* window.onclick = function(event) {
			var modal = document.getElementById('myModal');

	if (event.target == modal) {
		modal.style.display = "none";
		

	}
}*/

    </script>
    
	<form action="j_spring_security_logout" method="post" id="logoutForm">
	
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	
<div id="myModal" class="modal_chart">
		
		<!-- Modal content -->
  <div class="modal_content_chart"  style=" padding: 1px;"  ng-controller="ConfigController as ctrl" >
 
	 <div class="modal-content" style="  height: 100%;" >
      <div class="modal-header" style="background: #f5f5f5; ">
     <!--     <h5 class="modal-title" style="color: #702283;" > <spring:message code="creationTicket.NewTicket" /> </h5>-->
        <button type="button" class="close" data-dismiss="modal" onclick="closemodal()"  aria-label="Close">
          <span aria-hidden="true" onclick="closemodal()" >&times;</span>
                  </button>
          
      <button id="src_btn_angular"  ng-click="ctrl.fetchLkp()" style="display:none;">
      </button>
          
      </div>

<div style=" overflow-y: scroll;height: 100%;">

 <div class="modal-body"   >
      <form  id="create_form"  name="myForm" class="form-horizontal" ng-show="ctrl.prefShow">
        <span style="width:auto; float: left; font-weight: bold; font-family: initial;"><spring:message code="creationTicket.TicketDetail" /></span>  <hr style="width: 85%; float: right; font-weight: bold;">
      <div style="clear: both;"></div>
		  <div class="form-group row">
		    <label for="file" class="col-sm-3 col-form-label"><spring:message code="creationTicket.Creator" /></label>
		    <div class="col-sm-9">
 	      <input type="text" readonly id="creator_id"  class="form-control " name="creator"   ng-model="ctrl.creator" required readonly >                       
		    </div>
		  </div>
   
		  
		     <span style="width:auto; float: left; font-weight: bold; font-family: initial;"><spring:message code="creationTicket.CustomerDetails" /></span>  <hr style="width: 85%; float: right; font-weight: bold;">
      <div style="clear: both;"></div>
		   <div class="form-group row">
		    <label for="file" class="col-sm-3 col-form-label"><spring:message code="creationTicket.CustomerSegmentation" /></label>
		    <div class="col-sm-9">
		     <select class="form-control input-sm" name="customerSegmentation" 
                             ng-model="ctrl.CS"   required>
                          <option selected disabled value=""><spring:message code="creationTicket.selectCustomerSeg" /></option>
                  <option ng-repeat="v in ctrl.lst_CS" value="{{v.display_NAME_EN}}" >{{v.display_NAME_EN}}</option>
                      </select>

		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="file" class="col-sm-3 col-form-label"><spring:message code="creationTicket.Name" /></label>
		    <div class="col-sm-9">
                    <input type="text"  name="uname" class="email form-control input-sm" 
                                  ng-model="ctrl.email"  required/>
                                  <div class="has-error" ng-show="myForm.uname.$dirty">
                                      <span ng-show="myForm.uname.$error.required"><spring:message code="validation.require" /></span>
                 </div>

		    </div>
		  </div>
		  
		    <div class="form-group row">
		    <label for="file" class="col-sm-3 col-form-label"><spring:message code="creationTicket.AccountNumber" /></label>
		   <div class="col-md-9">
                                  <input type="text" ng-model="ctrl.detail.ACCOUNT_NUMBER" name="accountNumber" class="username form-control input-sm"
         
                                   required ng-pattern="/^[0-9]*$/" ng-init="accountFocus=false" ng-blur="accountFocus = true" ng-focus="accountFocus=false"/>
                                  <div class="has-error" ng-show="myForm.accountNumber.$dirty&&accountFocus">
                                      <span ng-show="myForm.accountNumber.$error.required"><spring:message code="validation.require" /></span>
                                      <span ng-show="myForm.accountNumber.$error.pattern"><spring:message code="validation.InvalidAccountNo" /></span>
                               
                                  </div>
              </div>
		  </div>
		  
		    <div class="form-group row">
		    <label for="file" class="col-sm-3 col-form-label"><spring:message code="creationTicket.AreaCodeLandline" /></label>
		   <div class="col-md-2">
		   <select id="select_src" class="form-control input-sm" name="city" placeholder ="Area City" ng-model="ctrl.City"
		     required>
                          <option selected disabled value=""><spring:message code="creationTicket.AreaCode" /></option>
                  <option ng-repeat="v in ctrl.lst_city" value="{{v.object_CODE}}" select-watcher data-last="{{$last}}" >{{v.object_CODE}}</option>
                      </select>
                      </div>
                       <div class="col-md-7">
	              <input type="text" ng-model="ctrl.detail.LANDLINE" name="landline" class="username form-control input-sm" placeholder=<spring:message code="creationTicket.Landline" />
                                   required ng-pattern="/^[0-9]{7,8}$/" ng-init="landFocus=false" ng-blur="landFocus = true" ng-focus="landFocus=false"/>
                                  <div class="has-error" ng-show="myForm.landline.$dirty&&landFocus">
                                      <span ng-show="myForm.landline.$error.required"><spring:message code="validation.require" /></span>
                                       <span ng-show="myForm.landline.$error.pattern"><spring:message code="validation.InvalidLandline" /></span>
           </div>
           </div>
		  </div>
		  
		<div class="form-group row">
		    <label for="file" class="col-sm-3 col-form-label"><spring:message code="creationTicket.MobileNumber"/></label>
		   <div class="col-md-9">
	             <input type="text" ng-model="ctrl.detail.CONTACT_NUMBER" name="contactNo" class="username form-control input-sm" 
                                   required ng-pattern="/^0[0-9]{10,10}$/" ng-init="contactNo=false" ng-blur="contactNo = true" ng-focus="contactNo=false"/>
                                  <div class="has-error" ng-show="myForm.contactNo.$dirty&&contactNo">
                                      <span ng-show="myForm.contactNo.$error.required"><spring:message code="validation.require" /></span>
                                      <span ng-show="myForm.contactNo.$error.pattern"><spring:message code="validation.InvalidMobileNo" /></span>
              
           </div>
           </div>
		  </div>
	         
     <span style="width:auto; float: left; font-weight: bold; font-family: initial;"><spring:message code="creationTicket.TicketTreeStructure" /></span>  <hr style="width: 81%; float: right; font-weight: bold;">
      <div style="clear: both;"></div>
                  <div class="form-group row">
                       
                              <label class="col-md-3 control-lable" for="file"><spring:message code="creationTicket.Direction" /></label>
                              <div class="col-md-9">
                             <select class="form-control input-sm" name="Direction" ng-model="ctrl.val_direction" ng-change="ctrl.fetchChannel()"  required>
        <option selected disabled value=""><spring:message code="creatonTicket.SelectDirection" /></option>
        <option ng-repeat="v in ctrl.lst_direction" value="{{v}}" >{{v}}</option>
</select>
                              </div>
                        
                      </div>
                  <div class="form-group row">
                      
                              <label class="col-md-3 control-lable" for="file"><spring:message code="creationTicket.Channel" /></label>
                              <div class="col-md-9">
                              <select class="form-control input-sm" name="channel" ng-model="ctrl.val_channel" 
                              ng-change="ctrl.fetchFamily()"   required>
        <option selected disabled value=""><spring:message code="creationTicket.SelectChannel" /></option>
        <option ng-repeat="v in ctrl.lst_channel" value="{{v}}">{{v}}</option>
</select>
                              </div>
                      </div>
    
                    <div class=" form-group row">
                              <label class="col-md-3 control-lable" for="file"><spring:message code="creationTicket.Family" /></label>
                              <div class="col-md-9">
                                 <select class="form-control input-sm" name="channel" ng-model="ctrl.val_family"  ng-change="ctrl.fetchType()" 
                                   required>
                              <option selected disabled value=""><spring:message code="creationTicket.SelectFamily" /></option>
                       <option ng-repeat="v in ctrl.lst_family" value="{{v}}">{{v}}</option>
                         </select>
                             
                          </div>
                      </div>
        
                     <div class=" form-group row">
                         
                              <label class="col-md-3 control-lable" for="file"><spring:message code="creationTicket.Category" /></label>
                              <div class="col-md-9">
                                 <select class="form-control input-sm" name="channel" 
                                 ng-model="ctrl.val_type" ng-change="ctrl.fetchCase()"  required>
                              <option selected disabled value=""><spring:message code="creationTicket.SelectCategory" /></option>
                       <option ng-repeat="v in ctrl.lst_type" value="{{v}}">{{v}}</option>
                         </select>
                              </div>
                    
                      </div>
                     
                      <div class=" form-group row">
                        
                              <label class="col-md-3 control-lable" for="file"><spring:message code="creationTicket.ProblemType" /></label>
                              <div class="col-md-9">
                                 <select class="form-control input-sm" name="channel" ng-model="ctrl.val_case"  required>
                              <option selected disabled value=""><spring:message code="creationTicket.SelectProblemType" /></option>
                       <option ng-repeat="v in ctrl.lst_case" value="{{v}}">{{v}}</option>
                         </select>
                              </div>
                     </div>

                        
                        <span style="width:auto; float: left; font-weight: bold; font-family: initial;"><spring:message code="creationTicket.NoteDetails" /></span>  <hr style="width: 85%; float: right; font-weight: bold;">
      <div style="clear: both;"></div>
                      <div class=" form-group row">
                 
                              <label class="col-md-3 control-lable" for="file"><spring:message code="creationTicket.Note" /> </label>
                              <div class="col-md-9">
                                  <input type="text" class="form-control input-sm" ng-model="ctrl.detail.Note" />
                              </div>
                        
                      </div>	
          
	</form>
	
	   <div id="smart_form" ng-show="!ctrl.prefShow" >
	    
	   </div> 
	          
	 </div>
		

	
</div>
	   <div class="modal-footer" style="padding: 5px; background: #f5f5f5;">
	                  <input  type="button"  ng-click="ctrl.back()" value=<spring:message code="creationTicket.back" /> class="btn btn-p"  ng-disabled="ctrl.prefShow"  />
	   
        <input  type="button"  ng-click="ctrl.submit()" value=<spring:message code="creationTicket.Next" /> class="btn btn-p" ng-show="ctrl.prefShow" ng-disabled="myForm.$invalid"  />
       
      <!--    <input  type="button" style="opacity: 1;"  value="Submit" class="btn btn-p" ng-show="!ctrl.prefShow"  /> -->
      </div>  
	  
	</div>	
  		
 </div>     
</div>
 
  
          <c:set var = "isactive" scope = "session" value = "${sessionScope['active']}"/>

<nav class="navbar navbar-expand-sm navbar-dark " style="background: white;" >
                  <a href="#" style="margin-right: -52px;">
                    <img src="resources/images/logo.png"  style="width: 65%;" />
                  </a>
                 
                
            <!--      <a id="toggle-btn" href="#" class="menu-btn active"  style="background: black;"><i class="fa fa-angle-double-left"></i> 
              <span></span><span></span><span></span> 
                 </a>
              -->
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                   
               
                         
     <!-- Left -->
     
    
      
                    <ul class="navbar-nav mr-auto">
                    <li>
                    
                    </li>
                    </ul>

                    <!-- Right -->
    <ul class="navbar-nav nav-flex-icons " style="margin-right:20px;">
                       
                   
      <li class="nav-item dropdown ">
        <a  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link language dropdown-toggle  " >
         <i class="fa fa-circle" style="color: green"></i> 
           <span class="d-none d-md-inline-block " style="color: black;">${pageContext.request.userPrincipal.name}</span></a>
        <div class="dropdown-menu dropdown-primary " aria-labelledby="navbarDropdownMenuLink">
          <a  href="javascript:formSubmit()" rel="nofollow" href="#" class="dropdown-item"><i class="fa fa-sign-out"></i> Logout</a>       
        </div>
      </li>

    </ul>

                </div>
                </nav>
                
                <script>
             
              
</script>
<label id="che"></label>

              <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="resources/Angular/app.js"></script>
      <script src="resources/Angular/service/Config_service.js"></script>
      <script src="resources/Angular/controller/Config_controller.js"></script>                  
 <script>
 
 $('#toggle-btn').on('click', function (e) {
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
 
 </script>
 
</body>

</html>