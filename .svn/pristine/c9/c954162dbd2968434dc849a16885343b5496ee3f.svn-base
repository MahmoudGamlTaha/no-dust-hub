'use strict';

angular.module('myApp').controller('ConfigController', ['$scope', 'ConfigService', function($scope, ConfigService) {
    var self = this;
   


    self.fetchDirection = fetchDirection;
    self.fetchChannel=fetchChannel;
    self.fetchFamily=fetchFamily;
    self.submit=submit;
    self.fetchLkp=fetchLkp;
    self.fetchTicketDetail=fetchTicketDetail;
    self.fetchType=fetchType;
    self.fetchCase=fetchCase;
    self.fetchCS=fetchCS;
    self.fetchCity=fetchCity;
    self.reset=reset;
    self.create=true;
    self.flag=false;
    self.back=back;
    self.submitUpdate=submitUpdate;

 //   fetchCS();
  // fetchDirection();
    function reset()
    {
    	 // basic data
        self.detail={CUSTOMER_SEGMENTAION:'',NAME:'',ACCOUNT_NUMBER:'',LANDLINE:'',CONTACT_NUMBER:'',NOTE:''};
        
    	// lookup
        self.creator=username;
       self.lst_direction=[];
       self.lst_channel=[];
       self.lst_family=[];
       self.lst_type=[];
       self.lst_case=[];
       self.lst_CS=[];
       self.lst_city=[];

       self.val_direction=null;
       self.val_channel=null;
       self.val_family=null;
       self.val_type=null;
       self.val_case=null;
       self.CS=null;
       self.City=null;
       
       
       
       
       self.nextShow=false;
       self.prefShow=true;
       self.name=null;
       self.email=null;
       self.address=null;
       self.create=true;
       
    }
    function fetchLkp()
    {

        $scope.myForm.$setPristine();

    	reset();
    	fetchCS();
    	fetchCity();
    	fetchDirection();

    	
    }
    function fetchTicketDetail()
    {
        $scope.myForm2.$setPristine();

    	 
    	reset();
    	// get ticket details from form
    	self.detail['ACCOUNT_NUMBER']=document.getElementById('accountNo').value;
    	self.CS=document.getElementById('customer_seg').value;
    	self.email=document.getElementById('customer_name').value;
    	self.City=document.getElementById('editInput1').value;
    	
    	self.detail['LANDLINE']=document.getElementById('editInput2').value;
    	
    	self.detail['CONTACT_NUMBER']=document.getElementById('editInput').value;

    	
    	self.val_direction=document.getElementById('direction').value;
        self.val_channel=document.getElementById('channel').value;
        self.val_family=document.getElementById('family').value;
        self.val_type=document.getElementById('category').value;
        self.val_case=document.getElementById('problem_type').value;
        document.getElementById('cname').value=self.email;
        document.getElementById('c_accountNo').value=self.detail['ACCOUNT_NUMBER'];
        document.getElementById('c_landline').value=self.detail['LANDLINE'];
        document.getElementById('cMobile').value=self.detail['CONTACT_NUMBER'];

        self.create=false;
	    self.prefShow=true;
	    self.prefShow2=true;
        self.flag=false;
        self.fetchCS();
        self.fetchCity();
    	self.fetchDirection();

       /* if(self.val_direction!=null&&self.val_direction!="")
        {
        	self.fetchDirection();
        	if(self.val_direction!=null) // correct direction 
        		{
        		   // then fetch channel
        		  fetchChannel();
        		  if(self.val_channel!=null) // correct channel
        			{
        			fetchFamily();
        			 if(self.val_family!=null) // correct family
        				 {
        				  fetchType();
        				   if(self.val_type!=null) // correct type
        					   {
        					    fetchCase();
        					   }
        				   
        				 }
        			}
        		
        		}
        }
        else
        { 
        	fetchDirection();
        	
        }*/
    }

    function fetchDirection(){

   	ConfigService.fetchDirection()
            .then(
            function(d) {
             console.log(d);
             self.creator=username;

             // check it relateted with change problem or creation
         	  self.lst_direction = d;
              self.lst_channel=[];
              self.lst_family=[];
              self.lst_type=[];
              self.lst_case=[];
     		// self.val_direction=d[0];

             
             if(!self.create)
            	 {
            	    //
            	 if(d.indexOf(self.val_direction)<=-1||self.flag)
            		 {
            		   // not found
            		 self.val_direction=null;
                     self.val_channel=null;
                     self.val_family=null;
                     self.val_type=null;
                     self.val_case=null;
                     self.flag=true;

            		 }
            	 else
            		 {
            		    // call channel
           		       fetchChannel();
          
            		 }
            	 }
             
             else // creation
             {
            	 
            	 self.val_direction=null;
                 self.val_channel=null;
                 self.val_family=null;
                 self.val_type=null;
                 self.val_case=null;
                 
             }
               

            },
            function(errResponse){
                console.error('Error while fetching direction');
            }
        );
    }

    function fetchChannel(){
    if(self.val_direction!=null)
    	{
        console.log(self.val_direction);
        ConfigService.fetchChannel(self.val_direction)
            .then(function(d) {
            	 
                self.lst_family=[];
                self.lst_type=[];
                self.lst_case=[];

                self.lst_channel = d;
            	 if(!self.create)
            	 {
            	    //
            	 if(d.indexOf(self.val_channel)<=-1||self.flag)
            		 {
            		   // not found
            		 
                     self.val_channel=null;
                     self.val_family=null;
                     self.val_type=null;
                     self.val_case=null;
                     self.flag=true;

            		 }
            	 else
            		 {
            		    // call family
            		 fetchFamily();

            		 }
            	 }
            	 else
            		 {
            		 self.val_channel=null;
                     self.val_family=null;
                     self.val_type=null;
                     self.val_case=null;
            		 }
            	
              
            },
            function(errResponse){
                console.error('Error while fetching Channels');
            }
        );
    }
    }
    
    function fetchFamily(){

        console.log(self.val_direction);
        if(self.val_direction!=null&&self.val_channel!=null)
        	{
        ConfigService.fetchFamily(self.val_direction,self.val_channel)
            .then(function(d) {
            	  self.lst_family = d;
                  self.lst_type=[];
                  self.lst_case=[];
            	 if(!self.create)
            	 {
            	    //
            	 if(d.indexOf(self.val_family)<=-1||self.flag)
            		 {
            		   // not found
            		 
                     self.val_family=null;
                     self.val_type=null;
                     self.val_case=null;
                     self.flag=true;

            		 }
            	 else
            		 {
            		    // call family
            		 fetchType();

            		 }
            	 }
            	 else
            		 {
            		 self.val_family=null;
                     self.val_type=null;
                     self.val_case=null;
            		 }
            	
              
            },
            function(errResponse){
                console.error('Error while fetching family');
            }
        );
    }
    }
    function fetchType(){
        console.log(self.val_type);
        if(self.val_direction!=null&&self.val_channel!=null&&self.val_family!=null)
{
        ConfigService.fetchType(self.val_direction,self.val_channel,self.val_family)
            .then(function(d) {
            	 self.lst_type = d;
                 self.lst_case=[];
            	
            	 if(!self.create)
            	 {
            	    //
            	 if(d.indexOf(self.val_type)<=-1||self.flag)
            		 {
            		   // not found
            		 
                     self.val_type=null;
                     self.val_case=null;
                     self.flag=true;

            		 }
            	 else
            		 {
            		    // call family
            		 fetchCase();

            		 }
            	 }
            	 else
            		 {
            		 self.val_type=null;
                     self.val_case=null;
            		 }
            	 
               
            },
            function(errResponse){
                console.error('Error while fetching family');
            }
        );
    }
    }   
    function fetchCase(){
        if(self.val_direction!=null&&self.val_channel!=null&&self.val_family!=null&&self.val_type!=null)
{
        ConfigService.fetchCase(self.val_direction,self.val_channel,self.val_family,self.val_type)
            .then(function(d) {

            	 if(d.indexOf(self.val_case)<=-1||self.create||self.flag)
            		 {
                     self.val_case=null;
                     self.flag=true;

            		 }
                self.lst_case = d;
            },
            function(errResponse){
                console.error('Error while fetching family');
            }
        );
    }
    }
    
    function fetchCS(){
    
        ConfigService.fetchCS()
            .then(function(d) {

                self.lst_CS = d;
            	console.log(self.lst_CS[0]);
            	 if(d.indexOf(self.CS)<=-1||self.create||self.flag)
        		 {
                 self.CS=null;
                

        		 }
            	
            },
            function(errResponse){
                console.error('Error while fetching CS');
            }
        );
    }
    
    function fetchCity(){
        
        ConfigService.fetchCity()
            .then(function(d) {
                self.lst_city = d;
  		//	  $('#select_src').selectpicker(); 		  


            },
            function(errResponse){
                console.error('Error while fetching City');
            }
        );
    }
    function submit(){
    	ConfigService.submit(self.val_direction,self.val_channel,self.val_family,self.val_type,self.val_case,self.detail.ACCOUNT_NUMBER)
            .then(function(d) {
            	
            	if(d!='0'){
            		//alert("You can't create ticket with the same account number and ticket tree structure");
                    $.alert({
                        title: 'Fail To Create Ticket',
            		    content:'You can not create ticket with the same account number and ticket tree structure',
                        }); 
            		
               }
            	else
            		{
            	    self.prefShow=false;
                	GetAllParams(self.val_direction,self.val_channel,self.val_family,self.val_type,self.val_case);

            		}
            },
            function(errResponse){
                console.error('Error while fetching cases');
            }
        );
    }
    
    function submitUpdate(){
    	ConfigService.submit(self.val_direction,self.val_channel,self.val_family,self.val_type,self.val_case,self.detail.ACCOUNT_NUMBER)
            .then(function(d) {
            	
            	if(d!='0'){
            		//alert("You can't create ticket with the same account number and ticket tree structure");
                    $.alert({
                        title: 'Fail To Create Ticket',
            		    content:'You can not create ticket with the same account number and ticket tree structure',
                        }); 
            		
               }
            	else
            		{
            	    self.prefShow=false;
                	GetAllParamsUpdate(self.val_direction,self.val_channel,self.val_family,self.val_type,self.val_case);

            		}
            },
            function(errResponse){
                console.error('Error while fetching cases');
            }
        );
    }
    
    function back()
    {
    	 self.prefShow=true;
    }
    
    
    function GetAllParamsUpdate(val_direction,val_channel,val_family,val_type,val_case){

    	var xhttp = new XMLHttpRequest();
    	xhttp.onreadystatechange = function() {

    	if (this.readyState == 4 && this.status == 200) {

    	var z= JSON.parse(this.responseText);
    	console.log(z);
    				createNewFormUpdate(z);

    	 }
    	 }
    	  xhttp.open("GET", "SmartScripts/NewManual?direction="+val_direction+"&channel="+val_channel+"&family="+val_family+"&type="+val_type+"&val_case="+val_case, true);
    	xhttp.send();
    	 }
    
    
    function GetAllParams(val_direction,val_channel,val_family,val_type,val_case){

    	var xhttp = new XMLHttpRequest();
    	xhttp.onreadystatechange = function() {

    	if (this.readyState == 4 && this.status == 200) {

    	var z= JSON.parse(this.responseText);
    	console.log(z);
    				createNewForm(z);

    	 }
    	 }
    	  xhttp.open("GET", "SmartScripts/NewManual?direction="+val_direction+"&channel="+val_channel+"&family="+val_family+"&type="+val_type+"&val_case="+val_case, true);
    	xhttp.send();
    	 }
    	 
    	    function CreateTicket(CreationTicket){
    	console.log(JSON.stringify(CreationTicket));
    	    	var xhttp = new XMLHttpRequest();
    	    	xhttp.onreadystatechange = function() {

    	    	if (this.readyState == 4 && this.status == 200) {

    	    	var z= JSON.parse(this.responseText);
    	    	if(z.state=="SUCCESS"){
    	          	 closemodal();
    	    	 $.alert({
    	             title: 'Ticket Created Successfully',
    	             icon: 'glyphicon glyphicon-ok',
    	             type: 'green',
    	             content: 'Ticket Code is '+z.additionalinfo.TICKET_ID + '</br> Ticket Status is '+z.additionalinfo.TICKET_STATUS
    	             +'</br> Instance ID is '+z.additionalinfo.PROCESS_INSTANCE_ID+'</br> Creation Time is '+z.additionalinfo.CREATION_DATE
    	             +'</br> State is Draft' +'</br> Customer Name : '+z.additionalinfo.CUSTOMER_NAME
    	             +'</br> Account Number : '+z.additionalinfo.ACCOUNT_NUMBER+
    	             '</br> LandLine : '+z.additionalinfo.LANDLINE+'</br> END TO END SLA : '+z.additionalinfo.END_TO_END_SLA+' Hour',
    	         });

    	    	}
    	    	else{
    	    		 $.alert({
        	             title: 'Failed To Create Ticket',
        	             icon: 'glyphicon glyphicon-remove-sign',
                         type: 'red',
        	             content: z.errormsg,
        	         });
    	    	}
    	    	 }
    	    	 }
    	    	 xhttp.open("POST","CreateNewTicket", true);
    	    	  xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    	    	 xhttp.send(JSON.stringify(CreationTicket));
    	    	 }  
    	    

    	    function UpdateTicket(CreationTicket){
    	console.log(JSON.stringify(CreationTicket));
    	    	var xhttp = new XMLHttpRequest();
    	    	xhttp.onreadystatechange = function() {

    	    	if (this.readyState == 4 && this.status == 200) {

    	    	var z= JSON.parse(this.responseText);
    	    	if(z.state=="SUCCESS"){
    	    		closemodalProblemType();
    	    	 $.alert({
    	             title: 'Ticket Saved Successfully',
    	             icon: 'glyphicon glyphicon-ok',
    	             type: 'green',
    	             content: 'Ticket Code is '+z.additionalinfo.TICKET_ID + '</br> Ticket Status is '+z.additionalinfo.TICKET_STATUS
    	             +'</br> Instance ID is '+z.additionalinfo.PROCESS_INSTANCE_ID
    	             +'</br> State is Draft' +'</br> Customer Name : '+z.additionalinfo.CUSTOMER_NAME
    	             +'</br> Account Number : '+z.additionalinfo.ACCOUNT_NUMBER+
    	             '</br> LandLine : '+z.additionalinfo.LANDLINE+'</br> END TO END SLA : '+z.additionalinfo.END_TO_END_SLA+' Hour',
    	         });
    	    	 window.location.href = "DraftTicket";

    	    	}
    	    	else{
    	    		 $.alert({
        	             title: 'Failed To Submit Ticket',
        	             icon: 'glyphicon glyphicon-remove-sign',
                         type: 'red',
        	             content: z.errormsg,
        	         });
    	    	}
    	    	 }
    	    	 }
    	    	 xhttp.open("POST","UpdateProblemType", true);
    	    	  xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
    	    	 xhttp.send(JSON.stringify(CreationTicket));
    	    	 }  
    	function createNewForm(params){
    		 $("#smart_form").empty();
    	$("#smart_form").alpaca({

    	"schema": params['schema']
    	,"options": {
    	   "form": {
    		    "buttons": {
    		                "submit": {
    						"title":'submit',
    		                    "click": function() {
                                    $('.alpaca-form-button-submit').attr("disabled", "disabled");
    		                        this.refreshValidationState(true);
    		                        if (!this.isValid(true)) {
    		                            this.focus();
    								
    		                            return;
    		                        }
    									 var value = this.getValue();
    		                         var values=  JSON.stringify(value, null, "  ");
    	                         var  AllValues=[];
    								 
    								 Object.keys(value).forEach(function(key) {
    	                                     var Current=value[key];
    										 Object.keys(Current).forEach(function(key1) {
    											 var NewOne={};
    										    NewOne["do_id"]=key;
    											 NewOne["att_name"]=key1;
    											 NewOne["att_value"]=Current[key1];
    											 AllValues.push(NewOne);
    										 });
    	                       });
    	                         var ticketData={};
    	                         ticketData["smartScriptsValues"]=AllValues;
    	                         ticketData["ticket_CASE"]=self.val_case;
    	                         ticketData["ticket_FAMILY"]=self.val_family;
    	                         ticketData["ticket_DIRECTION"]=self.val_direction;
    	                         ticketData["ticket_CHANNEL"]=self.val_channel;
    	                         ticketData["ticket_CLASSIFICATION"]=self.val_type;
    	                         ticketData["last_EXIT_CODE"]="UTTS";
    	                         ticketData["current_TEAM"]=self.val_direction;
    	                         ticketData["current_SUBTEAM"]=self.val_direction;
    	                         ticketData["last_AGENT"]=self.creator;
    	                         ticketData["creator"]=self.creator;
    	                         ticketData["notes"]=self.detail.Note;
    	                         ticketData["ticket_CODE"]="test";
    	                         ticketData["ticket_TYPE"]="2";
    	                         ticketData["account_NUMBER"]=self.detail.ACCOUNT_NUMBER;
    	                         ticketData["contact_NUMBER"]=self.detail.CONTACT_NUMBER;
    	                         ticketData["name"]=self.email;
    	                         ticketData["area_CODE"]=self.City;
    	                         ticketData["landline"]=self.detail.LANDLINE;
    	                         ticketData["customer_SEGMENTAION"]=self.CS;

    	                      
    	                        CreateTicket(ticketData);
    		                    }
    		                }
    		            }},
    					
    		       "hideInitValidationError": true,
    			   "focus": false
    		    },
    	"postRender": function(control) {
    	$("legend").click(function() {
    		$(this).toggleClass("ClosedLegend");
    	if ($(this).parent().children().length == 2)
    	    $(this).parent().find("div").first().slideToggle();
    	else
    	{
    	$(this).parent().wrapInner("<div>");
    	$(this).appendTo($(this).parent().parent());
    	$(this).parent().find("div").slideToggle();
    	}
    	});	}
    	,   "view": {
    	"parent": "bootstrap-edit-horizontal"
    	
    	}
    	});


    	}
    	function createNewFormUpdate(params){
   		 $("#smart_form1").empty();
   	$("#smart_form1").alpaca({
   	"schema": params['schema']
   	,"options": {
   	   "form": {
   		    "buttons": {
   		                "submit": {
   						"title":'submit',
   		                    "click": function() {
                                   $('.alpaca-form-button-submit').attr("disabled", "disabled");
   		                        this.refreshValidationState(true);
   		                        if (!this.isValid(true)) {
   		                            this.focus();
   								
   		                            return;
   		                        }
   									 var value = this.getValue();
   		                         var values=  JSON.stringify(value, null, "  ");
   	                         var  AllValues=[];
   								 
   								 Object.keys(value).forEach(function(key) {
   	                                     var Current=value[key];
   										 Object.keys(Current).forEach(function(key1) {
   											 var NewOne={};
   										    NewOne["do_id"]=key;
   											 NewOne["att_name"]=key1;
   											 NewOne["att_value"]=Current[key1];
   											 AllValues.push(NewOne);
   										 });
   	                       });
   	                         var ticketData={};
   	                         ticketData["smartScriptsValues"]=AllValues;
   	                         ticketData["ticket_CASE"]=self.val_case;
   	                         ticketData["ticket_FAMILY"]=self.val_family;
   	                         ticketData["ticket_DIRECTION"]=self.val_direction;
   	                         ticketData["ticket_CHANNEL"]=self.val_channel;
   	                         ticketData["ticket_CLASSIFICATION"]=self.val_type;
   	                         ticketData["ticket_ID"]=CurrentTicketID;
   	                         ticketData["notes"]=self.detail.Note;
   	                        
   	                         ticketData["account_NUMBER"]=self.detail.ACCOUNT_NUMBER;
   	                         ticketData["contact_NUMBER"]=self.detail.CONTACT_NUMBER;
   	                         ticketData["name"]=self.email;
   	                         ticketData["area_CODE"]=self.City;
   	                         ticketData["landline"]=self.detail.LANDLINE;
   	                         ticketData["customer_SEGMENTAION"]=self.CS;

   	                      
   	                      UpdateTicket(ticketData);
   		                    }
   		                }
   		            }},
   					
   		       "hideInitValidationError": true,
   			   "focus": false
   		    },
   	"postRender": function(control) {
   	$("legend").click(function() {
		$(this).toggleClass("ClosedLegend");
   	if ($(this).parent().children().length == 2)
   	    $(this).parent().find("div").first().slideToggle();
   	else
   	{
   	$(this).parent().wrapInner("<div>");
   	$(this).appendTo($(this).parent().parent());
   	$(this).parent().find("div").slideToggle();
   	}
   	});	}
   	,   "view": {
   	"parent": "bootstrap-edit-horizontal"
   	
   	}
   	});


   	}
    	
}]);
