'use strict';

var App2 = angular.module('Draftapp', []);

angular.module('Draftapp', [])
.directive('myPostRepeatDirective', function() {
  return function(scope, element, attrs) {
	  if(scope.$first){
		  $("#Mytable").DataTable().destroy();
	  }
      if (scope.$last){
      // iteration is complete, do whatever post-processing
      // is necessary
	  var table=  $('#Mytable').DataTable({
	        	responsive:true,
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
	        		 this.api().columns([0 , 1 , 2 , 3]).every( function () {
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
    }
  };
});
