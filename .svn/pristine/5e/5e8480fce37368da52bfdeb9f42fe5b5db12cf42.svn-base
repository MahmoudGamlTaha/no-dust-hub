'use strict';

var App = angular.module('myApp', []);

angular.module('myApp', [])
.directive('myPostRepeatDirective', function() {
	
  return function(scope, element, attrs) {
	  console.log(scope);
	  if(scope.$first){
		 
	  }
      if (scope.$last){
      // iteration is complete, do whatever post-processing
      // is necessary
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
    			  $("#src_txt").keyup(function() {
    	    		  table.search(this.value).draw();
    	    	    });  
	    table.buttons().container()
	    .appendTo( '#Mytable_wrapper .col-md-6:eq(0)' );
    		  }, 10);
    	
	    
    }
  };
});

//////// for unAssign 
angular.module('myApp').directive('myPost1RepeatDirective', function () {
   
	 return function(scope, element, attrs) {
		  console.log(scope);
		  if(scope.$first){

		  }
	      if (scope.$last){
	      // iteration is complete, do whatever post-processing
	      // is necessary
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
	    			 $("#src_txt").keyup(function() {
	    	    		  table2.search(this.value).draw();
	    	    	    }); 

		    table2.buttons().container()
		    .appendTo( '#UnAssigntable_wrapper .col-md-6:eq(0)' );
	    		  }, 10);

		    
	    }
	  };
});


////////for all 
angular.module('myApp').directive('myPost2RepeatDirective', function () {

return function(scope, element, attrs) {
 console.log(scope);
 if(scope.$first){

 }
 if (scope.$last){
 // iteration is complete, do whatever post-processing
 // is necessary
	  setTimeout(function () {    		  
			var table2= $('#AllTable').DataTable({
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
			 $("#src_txt").keyup(function() {
	    		  table2.search(this.value).draw();
	    	    }); 
   table2.buttons().container()
   .appendTo( '#AllTable_wrapper .col-md-6:eq(0)' );
		  }, 10);

   
}
};

});
/*angular.module('myApp').directive('bootstrapSelectpicker', function () {

	return function(scope, element, attrs) {
	    if (scope.$last){
	  		 $('#select_src').selectpicker(); 	
	  	    $('#select_src').selectpicker('refresh');

	    }
	  };
});*/
angular.module('myApp').directive('selectWatcher', function ($timeout) {
    return {
    	
        link: function (scope, element, attr) {
            var last = attr.last;
            if (last === "true") {
                $timeout(function () {
                  /* $(element).parent().selectpicker('destory');

                   $(element).parent().selectpicker();

                   $(element).parent().selectpicker('refresh');*/
                    $(element).parent().select2({
        				width: 'resolve',
    				});
                    
                 
                });
            }
        }
    };
});


angular.module('myApp').directive('multiWatcher', function ($timeout) {
    return {
        link: function (scope, element, attr) {
            var last = attr.last;
            if (last === "true") {
                $timeout(function () {
                  /* $(element).parent().selectpicker('destory');

                   $(element).parent().selectpicker();

                   $(element).parent().selectpicker('refresh');*/
                	
                    $(element).parent().multiselect({selectAll: false,nonSelectedText:attr.placeholder});

                });
            }
        }
    };
});