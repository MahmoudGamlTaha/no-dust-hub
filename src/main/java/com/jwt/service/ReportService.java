package com.jwt.service;

import java.util.List;

import com.jwt.model.CashReconciliationReport;
import com.jwt.model.Facility;
import com.jwt.model.InventoryCheck;
import com.jwt.model.InventoryDetail;
import com.jwt.model.LostRlostReportProducts;
import com.jwt.model.Operation;
import com.jwt.model.Order;
import com.jwt.model.OrderDetail;
import com.jwt.model.ReportShipment;
import com.jwt.model.ReportType;
import com.jwt.model.ShipmentDetailsData;
import com.jwt.model.ShipmentLog;
import com.jwt.model.ShipmentStatus;
import com.jwt.model.ShipmentType;
import com.jwt.model.WashingPrograms;

public interface ReportService {
	public List<Facility> getALLWarehouses();
	public List<ShipmentType> getShipmentTypes();
	public List<ReportShipment> getShipmentsOfFacility(int facility_id, int Ship_type);
	public List<ReportShipment> getShipmentsByDate(int facility ,int ship_type , String from_date , String to_date);
	public List<Order> getOrdersByFacility(int facility , String type , String from_date ,String to_date);
	public List<InventoryCheck> getinventoryChecks(int facility,String from_date ,String to_date);
	public ReportShipment getShipmentByID(int ship_id);
	public Order getOrderByID(int order_id);
	public List<Operation> getAllOperationShipID(int ship_id) ;
	public List<ShipmentLog> getLogsShipment(int ship_id);
	public List<ShipmentStatus> getAllStatus();
	public List<LostRlostReportProducts> getLostRlost(int shipment_id);
	public List<ShipmentDetailsData> getShipDetails(int ship);
	public List<OrderDetail> getOrderDetails(int order);
	public List<WashingPrograms> getAllWashingPrograms();
	public InventoryCheck getCheckByID(int checkId);
	public List<InventoryDetail> getInventoryDetails (int checkId);
	public List<ReportType> getOrdersTypes();
	/////////////////////////////////////// Cash Reconciliation Report //////////////////////////////////////////////////
	public List<CashReconciliationReport> Get_Reconciliation_Transaction(int fac_id);
	public List<CashReconciliationReport> Get_ReconciliationsInDuration(int fac_id, String from_date, String to_date);

}
