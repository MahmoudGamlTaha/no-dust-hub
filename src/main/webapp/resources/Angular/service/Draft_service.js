'use strict';

angular.module('myApp').factory('DraftService', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'DraftTicket/';
    var REST_UNAssign_URI='UnAssignDraftTicket/';
    var REST_SEARCH_URI='SearchLookups/';


    var factory = {
    		fetchMYDraftTicket: fetchMYDraftTicket,
    		fetchUnAssignDraftTicket:fetchUnAssignDraftTicket,
    		fetchAllDirection:fetchAllDirection,
	        fetchAllChannel:fetchAllChannel,
	        fetchAllfamily:fetchAllfamily,
	        fetchAllType:fetchAllType,
	        fetchAllCase:fetchAllCase,
	        fetchAllStatus:fetchAllStatus,
	        fetchAllUser:fetchAllUser,
	        SearchUnAssignDraftTicket:SearchUnAssignDraftTicket,
	        fetchAllDraftTicket:fetchAllDraftTicket,
	        fetchCity:fetchCity,

    };

    return factory;
///////////// lookups for search
    
 function fetchCity() {
        
        var deferred = $q.defer();
        $http.get("Config/CITY")
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
            	
                console.error('Error while fetching CITY');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 function fetchAllUser() {
        
        var deferred = $q.defer();
      
        $http.get(REST_SEARCH_URI+"AllUsers/")
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
            	
                console.error('Error while fetching Direction');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    function fetchAllDirection() {
        
        var deferred = $q.defer();
      
        $http.get("Config/Direction")
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
            	
                console.error('Error while fetching Direction');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    function fetchAllChannel() {
        
        var deferred = $q.defer();
        console.log(REST_SEARCH_URI);
      
        $http.get(REST_SEARCH_URI+"Channel/")
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
            	
                console.error('Error while fetching channels');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    function fetchAllfamily() {
        
        var deferred = $q.defer();
        console.log(REST_SEARCH_URI);
      
        $http.get(REST_SEARCH_URI+"family/")
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
            	
                console.error('Error while fetching family');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    function fetchAllType() {
        
        var deferred = $q.defer();
        console.log(REST_SEARCH_URI);
      
        $http.get(REST_SEARCH_URI+"Type/")
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
            	
                console.error('Error while fetching types');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    function fetchAllCase() {
     
        var deferred = $q.defer();
        console.log(REST_SEARCH_URI+"case/");
      
        $http.get(REST_SEARCH_URI+"case/")
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){

            	
                console.error('Error while fetching cases');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
function fetchAllStatus() {
        
        var deferred = $q.defer();
        console.log(REST_SEARCH_URI);
      
        $http.get(REST_SEARCH_URI+"STATUS/")
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
            	
                console.error('Error while fetching STATUS');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
    /////////////
    
    
    
    
    
    
    
    function fetchMYDraftTicket() {
    
        var deferred = $q.defer();
        console.log(REST_SERVICE_URI);
      
        $http.get(REST_SERVICE_URI)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
            	
                console.error('Error while fetching MYDraftTicket');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
    
    function fetchUnAssignDraftTicket() {
    
        var deferred = $q.defer();
        console.log(REST_UNAssign_URI);
      
        $http.get(REST_UNAssign_URI)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
            	
                console.error('Error while fetching MYDraftTicket');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
    function SearchUnAssignDraftTicket(query) {
        var deferred = $q.defer();
      
        $http.get("Search/UnAssignDraftTicket/",{params: {'query': query}})
            .then(
            function (response) {
                debugger;

                deferred.resolve(response.data);
            },
            function(errResponse){
            	
                console.error('Error while fetching MYDraftTicket');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    function fetchAllDraftTicket()
    {
    	 var deferred = $q.defer();
         
         $http.get("AllDraftTicket/",{params: {'query': query}})
             .then(
             function (response) {
                 debugger;

                 deferred.resolve(response.data);
             },
             function(errResponse){
             	
                 console.error('Error while fetching AllDraftTicket');
                 deferred.reject(errResponse);
             }
         );
         return deferred.promise;
    	
    }
}]);
