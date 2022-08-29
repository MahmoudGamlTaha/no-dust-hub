'use strict';

angular.module('myApp').factory('ConfigService', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'Config/';

    var factory = {
    		fetchDirection: fetchDirection,
    		fetchChannel: fetchChannel,
    		fetchFamily: fetchFamily,
    		submit:submit,
    		fetchType: fetchType,
    		fetchCase: fetchCase,
    		fetchCS:fetchCS,
    		fetchCity:fetchCity,
    };

    return factory;

    
    function fetchCS() {
    
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI+"CS")
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
            	
                console.error('Error while fetching CS');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
    function fetchCity() {
        
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI+"CITY")
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
    function fetchDirection() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI+"Direction")
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){

                console.error('Error while fetching directions');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function fetchChannel(query) {
        var deferred = $q.defer();
         console.error(REST_SERVICE_URI+"Channel/",{params: {'direction': query}});

        $http.get(REST_SERVICE_URI+"Channel/",{params: {'direction': query}})
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetch channels');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function fetchFamily(direction,channel) {
        var deferred = $q.defer();
        //channel=  channel.replace(/\//g,"%2F");


        $http.get(REST_SERVICE_URI+"family/",{params: {'channel': channel,'direction': direction}})
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetch family');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
    function fetchType(direction,channel,family) {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI+"Type/",{params: {'channel': channel,'direction': direction,'family':family}})
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetch types');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
    function fetchCase(direction,channel,family,val_type) {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI+"case/",{params: {'channel': channel,'direction': direction,'family':family,'type':val_type}})
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetch cases');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    function submit(val_direction,val_channel,val_family,val_type,val_case,ACCOUNT_NUMBER) {
    	console.log(REST_SERVICE_URI+"checkUniaue/",{params: {'channel': val_channel,'direction': val_direction,'family':val_family,
    		'type':val_type,'accountNo':ACCOUNT_NUMBER}});
    	debugger;
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI+"checkUniaue/",{params: {'channel': val_channel,'direction': val_direction,'family':val_family,
    		'type':val_type,'accountNo':ACCOUNT_NUMBER,'val_case':val_case}})
            .then(
            function (response) {
            	console.log(response)
                deferred.resolve(response.data);
            },
            
            function(errResponse){
            	debugger;
                console.error('Error while fetch channels');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }


}]);
