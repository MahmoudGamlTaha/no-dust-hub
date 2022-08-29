<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <%@page session="true"%>
    
      <!-- BEGIN SIDEBAR -->
   
	  <div id="sidebar" class="nav-collapse collapse">


 <!--       <div class="sidebar-toggler  hidden-phone" ></div>	
       
       <div class="sidebar-togggler  hidden-phone" ></div>  -->	
       
    
       
	   <!-- BEGIN SIDEBAR MENU -->
	
          <ul class="sidebar-menu" style="visibility: visible;">
          
             <li><a class="" href="DashboardNoDust"><span class="icon-box"><i class="icon-home"></i></span> <spring:message code="Home.PageTitle"/></a></li>
                     <sec:authorize access="hasAnyAuthority('RealesingProducts.View')">
         <li >
         <a class="" href="DispatchingProducts">
         
                      <span class="icon-box"> <img alt="" src="resources/assetsnodust/img/n_right.png" width="40px;" height="40px;"/></span><spring:message code="ReleasingProducts.PageTitle"/>
                  </a>
                 
         </li>
         </sec:authorize>
         <sec:authorize access="hasAnyAuthority('ReceivingProducts.View')">
          <li class="">
         <a href="ReceivingProduct" class="">
         
                      <span class="icon-box"><img alt="" src="resources/assetsnodust/img/n_left.png" width="40px;" height="40px;"/></span> <spring:message code="ReceivingProdct"/>
                
                  </a>
                  
                  </li>
         </sec:authorize>
          		<sec:authorize access="hasAnyAuthority('InternalCashTransferList.View','ApprovePayment.View','CreatePayment.View','ReleasingCash.View','CashTransfer.View', 'CashTransferList.View','PayrollPayments.View','ReleasingCashWithoutCover.View','ReceivingCash.View')">
	          <li class="has-sub ">
                  <a href="#" class="">
                      <span class="icon-box"><img alt="" src="resources/assetsnodust/img/295434_cash-icon-png.png"  style="max-height: 30px; max-width: 30px;"/></span> <spring:message code="Payments"/><span class="arrow"></span>
                  </a>
                  <ul class="sub">
                  <sec:authorize access="hasAuthority('CreatePayment.View')">
                  <li><a class="" href="CreatePayment">Create Payment</a></li>
                  </sec:authorize>
                                    <sec:authorize access="hasAuthority('ApprovePayment.View')">
                  
                                    <li><a class="" href="ApprovePayment">Approve Payment</a></li>
                  </sec:authorize>
                   <sec:authorize access="hasAuthority('PayrollPayments.View')">
		           <li><a class="" href="PayrollPayment"><spring:message code="Payroll_SideNav"/></a></li>
				</sec:authorize>
                <sec:authorize access="hasAuthority('ReleasingCashWithoutCover.View')">
             <li><a class="" href="DispatchingCash"> <spring:message code="ReleasingCash.PageTitle"/></a></li>
                </sec:authorize>
                 <sec:authorize access="hasAuthority('ReceivingCash.View')">
               <li><a class="" href="ReceivingCash"><spring:message code="ReceivingCash.PageTitle"/></a></li>
               </sec:authorize>
               <sec:authorize access="hasAuthority('CashTransfer.View')">
                                       <li><a class="" href="CreateCashTransfer"><spring:message code="CreateCashTransfer"/></a></li>  
               </sec:authorize>
                 <sec:authorize access="hasAuthority('CashTransferList.View')">
				      <li><a class="" href="ViewCashTransferList"><spring:message code="ViewCashTransfer"/></a></li>
				      </sec:authorize>
				      	<sec:authorize access="hasAuthority('InternalCashTransfer.View')">
             
                      <li><a class="" href="InternalCashTransfer"><spring:message code="InternalCashTransfer.PageTitle" /></a></li>
                        </sec:authorize>
                        
                        <sec:authorize access="hasAuthority('InternalCashTransferList.View')">
             
                      <li><a class="" href="InternalCashTransferList">View Internal Cash Transfer</a></li>
                        </sec:authorize>
                <!--    <sec:authorize access="hasAuthority('ReleasingCash.View')">
                      <li><a class="" href="DispatchingCashOnCover"><spring:message code="ReleasingCashOnCover.PageTitle"/></a></li>
                      </sec:authorize>
                      -->
                 <sec:authorize access="hasAuthority('ReceivingCashOnCover.View')">
                      <li><a class="" href="ReceivingCashOnCover"><spring:message code="ReceivingCahsoncoverlbl"/></a></li>
				</sec:authorize>
                                     			
                        
                 
				 
			
                  </ul>
                  
              </li>  
              </sec:authorize>
                 <sec:authorize access="hasAnyAuthority('CreateCleanShipment.View','ReceiveCleanShipment.View')">
				
				    <li class="has-sub ">
                  <a href="#" class="">
                      <span class="icon-box"><img alt="" src="resources/assetsnodust/img/NewShipment2.png" style="max-height: 20px; max-width: 20px;"> </span><spring:message code="CleanShipment"/><span class="arrow"></span>
                  </a>
                  <ul class="sub">
                  				                   <sec:authorize access="hasAuthority('CreateCleanShipment.View')">
                  
                  <li><a class="" href="CreateCleanShipment"><spring:message code="SendCleanShipment"/></a></li>
                  
                  </sec:authorize>
                  				                   <sec:authorize access="hasAuthority('ReceiveCleanShipment.View')">
                  
                                                       <li><a class="" href="CleanShipmentList"><spring:message code="ReceiveCleanShipment"/></a></li>
                   </sec:authorize>
				
                  </ul>
                  
              </li>  
              </sec:authorize> 
	                         
		
				
		
               
				<sec:authorize access="hasAnyAuthority('CreateDirtyShipment.View','ViewDirtyShipment.View','ExternalShipments.View','ReceiveUntreatedProducts.View','CreateInternalDirtyShipment.View','ProductsDying.View','ProductsTreatment.View')">
	          <li class="has-sub ">
                  <a href="#" class="">
                      <span class="icon-box"> <img alt="" src="resources/assetsnodust/img/Wash_icon.png" style="max-height: 20px; max-width: 20px;"></span><spring:message code="WASH_Functions"/><span class="arrow"></span>
                  </a>
                  <ul class="sub">
                  
				<sec:authorize access="hasAuthority('CreateDirtyShipment.View')">
                    <li><a class="" href="CreateDirtyShipment"> <spring:message code="ToExternalLaudry_SideMenu"/></a></li>
                  </sec:authorize>
       <c:if test="${sessionScope.fac_id=='1'}">           
                  <sec:authorize access="hasAuthority('ViewDirtyShipment.View')">
                    <li><a class="" href="ViewDirtyShipments"><spring:message code="ViewDirtyShipments.PageTitle"/></a></li>
                   </sec:authorize>
                   <sec:authorize access="hasAuthority('ExternalShipments.View')">
                                  <li><a class="" href="ViewExternalShipments"><spring:message code="ViewExternalLaudry_SideMenu"/></a></li>
                   
                   </sec:authorize>
                    
                    <sec:authorize access="hasAuthority('ReceiveUntreatedProducts.View')">
                    <li><a class="" href="ReceiveUntreatedProducts"><spring:message code="Receive_Form_External_SideMenu"/></a></li>
                   
                   </sec:authorize>
                  
                   <sec:authorize access="hasAuthority('CreateInternalDirtyShipment.View')">  
                    <li><a class="" href="InternalDirtyShipment"> <spring:message code="ToWashing_SideMenu"/></a></li>
                   </sec:authorize>
                   <sec:authorize access="hasAuthority('ProductsDying.View')">
                   <li><a class="" href="ProductsDying"> <spring:message code="ToColoring_SideMenu"/></a></li>                   
                   </sec:authorize>
                   <sec:authorize access="hasAuthority('ProductsTreatment.View')">
                                      <li><a class="" href="ProductTreatment"> <spring:message code="ToTreatment_SideMenu"/></a></li>                   
                   
                   </sec:authorize>
                  </c:if>
				</ul>
				</li>
				</sec:authorize>
				<!--  -->
				                
              	  <sec:authorize access="hasAnyAuthority('InventoryCheck.View','MyInventoryCheck.View','DailyInventoryCheck.View')">
            
            <li class="has-sub ">
                  <a href="#" class="">
                  
                      <span class="icon-box"> <img  alt="" src="resources/assetsnodust/img/check_f.png" style="max-width:25px; max-height:25px;"/></span><spring:message code="InventoryCheck.PageTitle"/><span class="arrow"></span>
                  </a>
                  <ul class="sub">
                                	  <sec:authorize access="hasAuthority('InventoryCheck.View')">
                  
                     <li><a  href="InventoryCheck"><spring:message code="CreateInventoryCheck.PageTitle"/></a></li>
                     </sec:authorize>
                     <sec:authorize access="hasAuthority('MyInventoryCheck.View')">
                     <li><a  href="MyInventoryCheck"><spring:message code="MyInventoryCheck.PageTitle"/></a></li>
                     </sec:authorize>
				<sec:authorize access="hasAuthority('DailyInventoryCheck.View')">
				                     <li><a href="DailyInventoryCheck"><spring:message code="DailyInventoryCheck"/></a></li> 
				
				</sec:authorize>
                  </ul>
                  
              </li>  
              
           </sec:authorize>	
				  <sec:authorize access="hasAnyAuthority('ProductsList.View','CreateConvertRequest.View','ConvertProduct.View','CreateNewProduct.View','ProductDeduction.View')">
              
                 <li class="has-sub ">
                  <a href="#" class="">
                  
                      <span class="icon-box"> <img alt="" src="resources/assetsnodust/img/stocks.png" style="max-width:25px; max-height:25px;"> </span> <spring:message code="StockManagement.PageTitle"/> <span class="arrow"></span>
                  </a>
                  <ul class="sub"> 
              <sec:authorize access="hasAuthority('ProductsList.View')">
                    <li><a class="" href="MyProducts"><spring:message code="Inventory.productList.PageTitle"/></a></li>
                  </sec:authorize>
                  
                   <sec:authorize access="hasAuthority('CreateConvertRequest.View')">
                      <li><a class="" href="Convertproduct"><spring:message code="ConvertProduct.PageTitle"/></a></li>
                      </sec:authorize>
                    
                                         <sec:authorize access="hasAuthority('ConvertProduct.View')">
                      
                       <li><a class="" href="ProductConversion"><spring:message code="ProductConversion"/></a></li>
                      </sec:authorize>
                      <sec:authorize access="hasAuthority('CreateNewProduct.View')">
                      <li> <a href="CreateProduct"><spring:message code="CreateNewProduct"/></a></li>
                      </sec:authorize>
                      <sec:authorize access="hasAuthority('ProductDeduction.View')">
                        <li> <a href="ProductDeduction">Product Deduction</a></li>
                      
                      </sec:authorize>
                    
                    
                      <!--  
                       <sec:authorize access="hasAuthority('ConvertRequest.View')">
                      <li><a class="" href="ConvertProductRequests"><spring:message code="ConvertProductRequests.PageTitle"/></a></li>
				   
				</sec:authorize>
				-->
				
                  </ul>
                  
              </li>  
              </sec:authorize>
				
				  <sec:authorize access="hasAuthority('ShipmentList.View')">
				      <li><a class="" href="ViewShipmentList "><span class="icon-box"><i class="icon-list"></i></span>Shipment List </a></li> 
	       </sec:authorize>
				<sec:authorize access="hasAnyAuthority('Cashbalance.View','Report.View','ExpectedInOut.View','DailyShipments.View','GeneralReport.View','ProductTransaction.View','PaymentReport.View','CashTransferReport.View')">
	       
	       <li class="has-sub  ">
         <a href="#" class="">
                      <span class="icon-box"> <img alt="" src="resources/assetsnodust/img/reports.png" style="max-height: 20px; max-width: 20px;"/></span>Reports<span class="arrow"></span>
                  </a>
                  <ul class="sub">
                  <sec:authorize access="hasAuthority('Report.View')">
                  	 <li><a class="" href="reports"><spring:message code="reports"/></a></li>
                  	 </sec:authorize>
                  	 <sec:authorize access="hasAuthority('ExpectedInOut.View')">
                  	 <li><a class="" href="ExpectedINOUT"><spring:message code="ExpectedInOut"/></a></li>
                  	 </sec:authorize>
                  	 <sec:authorize  access="hasAuthority('DailyShipments.View')">
                  	 <li><a href="DailyShipmentsData"><spring:message code="DailyShipment"/></a></li>
                  	   </sec:authorize>
                   <sec:authorize access="hasAuthority('GeneralReport.View')">
                  	 <li><a class="" href="ShipmentsReport"><spring:message code="ShipmentReport"/></a></li>
                </sec:authorize> 
              <sec:authorize access="hasAuthority('ProductTransaction.View')">
                        <li><a class="" href="OperationTransaction"><spring:message code="ProductTransactions"/></a></li>
              
              </sec:authorize>
              
              
              <sec:authorize access="hasAuthority('PaymentReport.View')">
                        <li><a class="" href="PaymentReport">Payment Report</a></li>
              
              </sec:authorize>
                 <sec:authorize access="hasAuthority('CashTransferReport.View')">
                 <li><a class="" href="CashTransferReport">Cash Transfer Report</a></li>
                 </sec:authorize>
                 <sec:authorize access="hasAuthority('CashReconciliationReport.View')">
                 <li><a class="" href="CashReconciliationReport">Cash Reconciliation Report</a></li>
                 </sec:authorize>
                  <sec:authorize access="hasAuthority('Cashbalance.View')">
                        <li> <a href="AccountBalance">Cash Accounts Balance</a></li>
                      
                      </sec:authorize>
                 
	       </ul>
	       </li>
	       </sec:authorize>
	         <sec:authorize access="hasAuthority('UpdateDMSUsersData.view')">
                <li><a class="" href="upload_img"> <span class="icon-box"> <img alt="" src="resources/assetsnodust/img/DMS_Data.png" width="60px;" height="60px;"/></span><spring:message code="UpdateDMSUsersData"/></a></li>
                </sec:authorize>
          </ul>
     
		 <!-- END SIDEBAR MENU -->
      </div>
	 	 
      <!-- END SIDEBAR -->
      
      