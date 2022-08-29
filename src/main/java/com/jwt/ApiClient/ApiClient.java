package com.jwt.ApiClient;

import java.io.IOException;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class ApiClient {
	
    public  String callOracleApiForRelease(String shipment_id,String date) {
    	OkHttpClient client = new OkHttpClient();
    	
    	
    	Request request = new Request.Builder()
    	  .url("http://oracle.nodust-eg.com:7001/NoDust_API/resources/NODUST/DownloadReleasedProducts?Shipment_id="+shipment_id+"&Cover_Date="+date)
    	  .get()
    	  .addHeader("cache-control", "no-cache")
    	  .build();
    	try {
    		
			Response response = client.newCall(request).execute();
			System.out.println("Response : "+ response);
			response.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	return "";
    	
    }
  
    public  String DownloadDispatchedToOperationById(String shipment_id) {
    	OkHttpClient client = new OkHttpClient();
    	
    	
    	
    	Request request = new Request.Builder()
    	  .url("http://rpt.nodust-eg.com:8001/API_OPERATIONS-OPERATION_API-context-root/resources/NODUST/DownloadDispatchedById?Shipment_id="+shipment_id)
    	  .get()
    	  .addHeader("cache-control", "no-cache")
    	  .build();
    	try {
    		
			Response response = client.newCall(request).execute();
			System.out.println("Response : "+ response);
			response.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	return "";
    	
    }
    
  
}
