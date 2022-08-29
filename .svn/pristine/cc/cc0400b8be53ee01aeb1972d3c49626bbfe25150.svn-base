


angular.module('myApp').controller('OpenController', ['$scope', 'OpenService', function($scope, OpenService) {
    
	
	var self = this;
          self.MyDraft=false;
   self.UnAssign=false;
   self.AllTicket=false;
   self.fetchMYDraftTicket = fetchMYDraftTicket;
   self.fetchUnAssignDraftTicket = fetchUnAssignDraftTicket;
   self.fetchAllDraftTicket = fetchAllDraftTicket;
   self.ShowAllticket=ShowAllticket;
   self.fetchAllDirection=fetchAllDirection;
   self.fetchAllChannel=fetchAllChannel;
   self.fetchAllfamily=fetchAllfamily;
   self.fetchAllType=fetchAllType;
   self.fetchAllCase=fetchAllCase;
   self.fetchAllStatus=fetchAllStatus;
   self.fetchAllUser=fetchAllUser;
   self.SearchUnAssignDraftTicket=SearchUnAssignDraftTicket;
   self.ExcuteSearch=ExcuteSearch;

   self.PrepareSearch=PrepareSearch;

   self.title="";
   // self.reset=reset;
   // reset();
 //   fetchCS();
  // fetchDirection();
   self.PrepareSearch();
   function PrepareSearch()
   {

	   self.fetchAllDirection();
	   self.fetchAllChannel();
	   self.fetchAllfamily();
	   self.fetchAllType();
	   self.fetchAllCase();
	   self.fetchAllStatus();
	   self.fetchAllUser();

	   
   }
   function fetchAllUser()
   {
	   OpenService.fetchAllUser()
       .then(
       function(d) {
        console.log(d);
          self.lst_user = d;
       },
       function(errResponse){
           console.error('Error while fetching status');
       }
   );
	   
	   
   }
   function fetchAllStatus()
   {
	   OpenService.fetchAllStatus()
       .then(
       function(d) {
        console.log(d);
          self.lst_status = d;
       },
       function(errResponse){
           console.error('Error while fetching status');
       }
   );
	   
	   
   }
   function fetchAllDirection()
   {
	   OpenService.fetchAllDirection()
       .then(
       function(d) {
        console.log(d);
          self.lst_direction = d;
       },
       function(errResponse){
           console.error('Error while fetching direction');
       }
   );
	   
	   
   }
   function fetchAllChannel()
   {
	   OpenService.fetchAllChannel()
       .then(
       function(d) {
        console.log(d);
        self.lst_channel=d;
       },
       function(errResponse){
           console.error('Error while fetching direction');
       }
   );
	   
	   
   }
   function fetchAllfamily()
   {
	   OpenService.fetchAllfamily()
       .then(
       function(d) {
        console.log(d);
        self.lst_family=d;
      
       },
       function(errResponse){
           console.error('Error while fetching direction');
       }
   );
	   
	   
   }
   function fetchAllType()
   {
	   OpenService.fetchAllType()
       .then(
       function(d) {
        console.log(d);
        self.lst_type=d;
      
       },
       function(errResponse){
           console.error('Error while fetching direction');
       }
   );
	   
	   
   }
   function fetchAllCase()
   {
	   OpenService.fetchAllCase()
       .then(
       function(d) {
        console.log(d);
        self.lst_case=d;
      
       },
       function(errResponse){
           console.error('Error while fetching cases');
       }
   );
	   
	   
   }
   
   
    function reset()
    {
    	
    	self.lst_MyDraft=[];
    	self.lst_UnAssignDraft=[];
    	self.lst_AllDraft=[];

    	 self.MyDraft=true;
    	   self.UnAssign=false;
    	   self.AllTicket=false;
        
    }
    function ShowAllticket()
    {

    	ResetSearch();
    	self.lst_AllDraft=[];
   	   self.MyDraft=false;
	   self.UnAssign=false;
	   self.AllTicket=true;

	   self.title="All Open Ticket";
		  $("#AllTable").DataTable().destroy();

	   setTimeout(function () {    		  
 			var table= $('#AllTable').DataTable({
	        	responsive:true,
	        	destroy: true,
	        	fixedHeader:true,
	        	colReorder:true,
	        	buttons:[
	        		{
	        			extend: 'collection',
	                text: 'Actions',
	                className:'btn-sm dt-buttons',
	                autoClose: true,
	               
	               buttons: [
	               {extend:'colvis',
	            	   className:'btn-sm',
	            	   text: 'Visibilty'
	            	   }, 
	               {
	            	   className:'btn-sm',
	                   extend: 'collection',
	                   text: 'Export',
	                   buttons: [
	                       'copy',
	                       'excel',
	                       'csv',
	                       'pdf',
	                       'print'
	                   ]
	               },
	               
	            ]}],
	            initComplete: function () {
	        		 this.api().columns([1 , 2 , 3,4,5,6,7,8,9,10,11,12,13,14,15]).every( function () {
	                     var column = this;
	                     var select = $('<select class="form-control js-example-basic-single" data-placeholder="'+column.header().textContent+'"><option value="">All</option></select>')
	                         .appendTo( $(column.footer()).empty() )
	                         .on( 'change', function () {
	                             var val = $.fn.dataTable.util.escapeRegex(
	                                 $(this).val()
	                             );
	      
	                             column
	                                 .search( val ? '^'+val+'$' : '', true, false )
	                                 .draw();
	                         } );
	      
	                     column.data().unique().sort().each( function ( d, j ) {
	                         select.append( '<option value="'+d+'">'+d+'</option>' )
	                     } );
	                 } );
	        		 
	        		    $('.js-example-basic-single').select2({

	        		    });
	             }
	    
	        });

	    table.buttons().container()
	    .appendTo( '#AllTable_wrapper .col-md-6:eq(0)' );
 		  }, 10);


    }
   fetchMYDraftTicket();
    function fetchMYDraftTicket(){
    	OpenService.fetchMYDraftTicket()
            .then(
            function(d) {
                debugger;

            	 //$("#Mytable").DataTable().clear();
       		  $("#Mytable").DataTable().destroy();
            	  self.lst_MyDraft=d;   
            	  if(d.length==0)
            		  {
                      debugger;

            		  setTimeout(function () {    		  
              			var table= $('#Mytable').DataTable({
          	        	responsive:true,
          	        	destroy: true,
          	        	fixedHeader:true,
          	        	colReorder:true,
          	        	buttons:[
          	        		{
          	        			extend: 'collection',
          	                text: 'Actions',
          	                className:'btn-sm dt-buttons',
          	                autoClose: true,
          	               
          	               buttons: [
          	               {extend:'colvis',
          	            	   className:'btn-sm',
          	            	   text: 'Visibilty'
          	            	   }, 
          	               {
          	            	   className:'btn-sm',
          	                   extend: 'collection',
          	                   text: 'Export',
          	                   buttons: [
          	                       'copy',
          	                       'excel',
          	                       'csv',
          	                       'pdf',
          	                       'print'
          	                   ]
          	               },
          	               
          	            ]}],
          	            initComplete: function () {
          	        		 this.api().columns([1 , 2 , 3,4,5,6,7,8,9,10,11,12,13,14,15]).every( function () {
          	                     var column = this;
          	                     var select = $('<select class="form-control js-example-basic-single" data-placeholder="'+column.header().textContent+'"><option value="">All</option></select>')
          	                         .appendTo( $(column.footer()).empty() )
          	                         .on( 'change', function () {
          	                             var val = $.fn.dataTable.util.escapeRegex(
          	                                 $(this).val()
          	                             );
          	      
          	                             column
          	                                 .search( val ? '^'+val+'$' : '', true, false )
          	                                 .draw();
          	                         } );
          	      
          	                     column.data().unique().sort().each( function ( d, j ) {
          	                         select.append( '<option value="'+d+'">'+d+'</option>' )
          	                     } );
          	                 } );
          	        		 
          	        		    $('.js-example-basic-single').select2({

          	        		    });
          	             }
          	    
          	        });

          	    table.buttons().container()
          	    .appendTo( '#Mytable_wrapper .col-md-6:eq(0)' );
              		  }, 10);
            		  }
            	  self.MyDraft=true;
            	   self.UnAssign=false;
            	   self.AllTicket=false;
            	   self.title="My Open Ticket";

            },
            function(errResponse){
            	debugger;

                console.error('Error while fetching MY Draft');
            }
        );
    }
    function fetchAllDraftTicket()
    {
    	OpenService.fetchAllDraftTicket(query)
        .then(
        function(d) {
        	 //$("#Mytable").DataTable().clear();
   		  $("#AllTable").DataTable().destroy();
        	  self.lst_AllDraft=d;   
        	  if(d.length==0)
        		  {
        		  setTimeout(function () {    		  
          			var table= $('#AllTable').DataTable({
      	        	responsive:true,
      	        	destroy: true,
      	        	fixedHeader:true,
      	        	colReorder:true,
      	        	buttons:[
      	        		{
      	        			extend: 'collection',
      	                text: 'Actions',
      	                className:'btn-sm dt-buttons',
      	                autoClose: true,
      	               
      	               buttons: [
      	               {extend:'colvis',
      	            	   className:'btn-sm',
      	            	   text: 'Visibilty'
      	            	   }, 
      	               {
      	            	   className:'btn-sm',
      	                   extend: 'collection',
      	                   text: 'Export',
      	                   buttons: [
      	                       'copy',
      	                       'excel',
      	                       'csv',
      	                       'pdf',
      	                       'print'
      	                   ]
      	               },
      	               
      	            ]}],
      	            initComplete: function () {
      	        		 this.api().columns([1 , 2 , 3,4,5,6,7,8,9,10,11,12,13,14,15]).every( function () {
      	                     var column = this;
      	                     var select = $('<select class="form-control js-example-basic-single" data-placeholder="'+column.header().textContent+'"><option value="">All</option></select>')
      	                         .appendTo( $(column.footer()).empty() )
      	                         .on( 'change', function () {
      	                             var val = $.fn.dataTable.util.escapeRegex(
      	                                 $(this).val()
      	                             );
      	      
      	                             column
      	                                 .search( val ? '^'+val+'$' : '', true, false )
      	                                 .draw();
      	                         } );
      	      
      	                     column.data().unique().sort().each( function ( d, j ) {
      	                         select.append( '<option value="'+d+'">'+d+'</option>' )
      	                     } );
      	                 } );
      	        		 
      	        		    $('.js-example-basic-single').select2({

      	        		    });
      	             }
      	    
      	        });

      	    table.buttons().container()
      	    .appendTo( '#AllTable_wrapper .col-md-6:eq(0)' );
          		  }, 10);
        		  }
        	  self.MyDraft=false;
        	   self.UnAssign=false;
        	   self.AllTicket=true;
        	   self.title="All Open Ticket";

        },
        function(errResponse){
        	debugger;

            console.error('Error while fetching MY Draft');
        }
    );
    	
    }
    function fetchUnAssignDraftTicket()
    {
    	


        
    	ResetSearch();
    	

    	OpenService.fetchUnAssignDraftTicket()
        .then(
        function(d) {
        	 //$("#Mytable").DataTable().clear();
   		  $("#UnAssigntable").DataTable().destroy();
        	console.log(d);
        	  self.lst_UnAssignDraft=d;  
        	  if(d.length==0)
        		  {
        	  self.unAssignLen=false;
        	  setTimeout(function () {    		  
	    			var table2= $('#UnAssigntable').DataTable({
		        	responsive:true,
		        	destroy: true,
		        	fixedHeader:true,
		        	colReorder:true,
		        	buttons:[
		        		{
		        			extend: 'collection',
		                text: 'Actions',
		                className:'btn-sm dt-buttons',
		                autoClose: true,
		               
		               buttons: [
		               {extend:'colvis',
		            	   className:'btn-sm',
		            	   text: 'Visibilty'
		            	   }, 
		               {
		            	   className:'btn-sm',
		                   extend: 'collection',
		                   text: 'Export',
		                   buttons: [
		                       'copy',
		                       'excel',
		                       'csv',
		                       'pdf',
		                       'print'
		                   ]
		               },
		               
		            ]}],
		            initComplete: function () {
		        		 this.api().columns([1 , 2 , 3,4,5,6,7,8,9,10,11,12,13,14,15]).every( function () {
		                     var column = this;
		                     var select = $('<select class="form-control js-example-basic-single" data-placeholder="'+column.header().textContent+'"><option value="">All</option></select>')
		                         .appendTo( $(column.footer()).empty() )
		                         .on( 'change', function () {
		                             var val = $.fn.dataTable.util.escapeRegex(
		                                 $(this).val()
		                             );
		      
		                             column
		                                 .search( val ? '^'+val+'$' : '', true, false )
		                                 .draw();
		                         } );
		      
		                     column.data().unique().sort().each( function ( d, j ) {
		                         select.append( '<option value="'+d+'">'+d+'</option>' )
		                     } );
		                 } );
		        		 
		        		    $('.js-example-basic-single').select2({

		        		    });
		             }
		    
		        });

		    table2.buttons().container()
		    .appendTo( '#UnAssigntable_wrapper .col-md-6:eq(0)' );
	    		  }, 10);
        		  }
        	  else
            	  self.unAssignLen=true;

        	  self.MyDraft=false;
        	   self.UnAssign=true;
        	   self.AllTicket=false;
        	   self.title="UnAssign Open Ticket";

        },
        function(errResponse){
        	debugger;

            console.error('Error while fetching MY Draft');
        }
    );
    	
    }
    function SearchUnAssignDraftTicket()
    {
    	
    	OpenService.SearchUnAssignDraftTicket(query)
        .then(
        function(d) {
        	 $("#UnAssigntable").DataTable().destroy();
   		  //$("#Mytable").DataTable().destroy();
        	console.log(d);
        	  self.lst_UnAssignDraft=d;  
        	  if(d.length==0)
        		  {
        	  self.unAssignLen=false;
        	  setTimeout(function () {    		  
	    			var table2= $('#UnAssigntable').DataTable({
		        	responsive:true,
		        	destroy: true,
		        	fixedHeader:true,
		        	colReorder:true,
		        	buttons:[
		        		{
		        			extend: 'collection',
		                text: 'Actions',
		                className:'btn-sm dt-buttons',
		                autoClose: true,
		               
		               buttons: [
		               {extend:'colvis',
		            	   className:'btn-sm',
		            	   text: 'Visibilty'
		            	   }, 
		               {
		            	   className:'btn-sm',
		                   extend: 'collection',
		                   text: 'Export',
		                   buttons: [
		                       'copy',
		                       'excel',
		                       'csv',
		                       'pdf',
		                       'print'
		                   ]
		               },
		               
		            ]}],
		            initComplete: function () {
		        		 this.api().columns([1 , 2 , 3,4,5,6,7,8,9,10,11,12,13,14,15]).every( function () {
		                     var column = this;
		                     var select = $('<select class="form-control js-example-basic-single" data-placeholder="'+column.header().textContent+'"><option value="">All</option></select>')
		                         .appendTo( $(column.footer()).empty() )
		                         .on( 'change', function () {
		                             var val = $.fn.dataTable.util.escapeRegex(
		                                 $(this).val()
		                             );
		      
		                             column
		                                 .search( val ? '^'+val+'$' : '', true, false )
		                                 .draw();
		                         } );
		      
		                     column.data().unique().sort().each( function ( d, j ) {
		                         select.append( '<option value="'+d+'">'+d+'</option>' )
		                     } );
		                 } );
		        		 
		        		    $('.js-example-basic-single').select2({

		        		    });
		             }
		    
		        });

		    table2.buttons().container()
		    .appendTo( '#UnAssigntable_wrapper .col-md-6:eq(0)' );
	    		  }, 10);
        		  }
        	  else
            	  self.unAssignLen=true;

        	  self.MyDraft=false;
        	   self.UnAssign=true;
        	   self.AllTicket=false;
        	   self.title="UnAssign Open Ticket";

        },
        function(errResponse){
        	debugger;

            console.error('Error while fetching MY Draft');
        }
    );
    	
    }
    function ExcuteSearch()
    {
    	if(self.UnAssign)
    		{
    		  self.SearchUnAssignDraftTicket();
    		}
    	else
    		{
    		// get All Tickets
    		if(query!="")
    		  self.fetchAllDraftTicket();
    		}
    }
  

 
         
}]);
