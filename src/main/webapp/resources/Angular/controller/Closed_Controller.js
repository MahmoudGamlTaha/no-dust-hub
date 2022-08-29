angular.module('myApp').controller('ClosedController', ['$scope', 'ClosedService', function($scope, ClosedService) {
    
	
	var self = this;
	self.lst_MyDraft=[];
  self.title="Closed Ticket";
   self.fetchMYDraftTicket = fetchMYDraftTicket;
   
   // self.reset=reset;
   // reset();
 //   fetchCS();
  // fetchDirection();
   
   fetchMYDraftTicket();
   
    function fetchMYDraftTicket(){
    	ClosedService.fetchMYDraftTicket()
            .then(
            function(d) {

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
            	
            },
            function(errResponse){
            	debugger;

                console.error('Error while fetching Closed');
            }
        );
    }
   
}]);
