'use strict';

angular.module('myApp').factory('ClosedService', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'GetClosedTicket/';
 


    var factory = {
    		fetchMYDraftTicket: fetchMYDraftTicket,
    	
    };

    return factory;
///////////// lookups for search
    
 
    
    
    function fetchMYDraftTicket() {
        var deferred = $q.defer();
        console.log(REST_SERVICE_URI);

        $http.get(REST_SERVICE_URI)
            .then(
            		
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){

                console.error('Error while fetching closed');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
    
  
}]);
