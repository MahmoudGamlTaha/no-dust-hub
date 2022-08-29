package com.jwt.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import oracle.jdbc.proxy.annotation.Pre;

@Entity
@Table (name="shipment_details_with_products_and_treatments")
public class ShipmentProduct implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Column
	@Id
	private int shipment_id;
	
	@Column
	private int quantity_shipped;
	
	@Column
	private int dms_planned_quantity;
	
	@Column 
	private String sales;
	
	@Column
	private BigDecimal lost;
	
	@Column 
	private String cancelled;
	
	@Column 
	private BigDecimal returned_lost;
	
	@Column
	private String weight;
	
	@Column
	private String out;
	
	@Column(name="new")
	private String new_;
	
	@Column 
	private String cancel;
	
	@Column
	private String over;
	
	@Column
	private String washing_program_id;
	
	@Column
	private String new_quan;
	
	@Id
	@Column
	private String dms_product_id;
	
	@Id
	@Column
	private String product_sku;
	
	@Column
	private long product_id;
	
	@Column
	private String dirty_product_code;
	
	@Column
	private String dirty_product_sku;
	
	@Column
	private String selling_price;
	
	@Column
	private String type;
	
	@Column
	private String kind;
	
	@Column 
	private String handle_sku_code;
	
	@Id
	@Column
	private BigDecimal treatment_id;
	

	@Column
	private String is_handle;
	
	@Column 
	private String product_name;
	
	@Column
	private String product_category;
	
	@Column
	private String treatment_name;
@Column
private BigDecimal manual_cancel;

@Column
private BigDecimal manual_new;
@Column
private BigDecimal actual_new;
@Column
private BigDecimal expected_new;
@Column
private BigDecimal actual_cancel;
@Column
private BigDecimal actual_reconcilied_quantity;

public BigDecimal getActual_reconcilied_quantity() {
	return actual_reconcilied_quantity;
}

public void setActual_reconcilied_quantity(BigDecimal actual_reconcilied_quantity) {
	this.actual_reconcilied_quantity = actual_reconcilied_quantity;
}

public BigDecimal getActual_cancel() {
	return actual_cancel;
}

public void setActual_cancel(BigDecimal actual_cancel) {
	this.actual_cancel = actual_cancel;
}

public BigDecimal getActual_new() {
	return actual_new;
}

public void setActual_new(BigDecimal actual_new) {
	this.actual_new = actual_new;
}

public BigDecimal getExpected_new() {
	return expected_new;
}

public void setExpected_new(BigDecimal expected_new) {
	this.expected_new = expected_new;
}

public BigDecimal getManual_new() {
	return manual_new;
}

public void setManual_new(BigDecimal manual_new) {
	this.manual_new = manual_new;
}

public BigDecimal getManual_cancel() {
	return manual_cancel;
}

public void setManual_cancel(BigDecimal manual_cancel) {
	this.manual_cancel = manual_cancel;
}

public static long getSerialversionuid() {
	return serialVersionUID;
}

	public String getDms_product_id() {
		return dms_product_id;
	}

	public void setDms_product_id(String dms_product_id) {
		this.dms_product_id = dms_product_id;
	}

	public String getProduct_sku() {
		return product_sku;
	}

	public void setProduct_sku(String product_sku) {
		this.product_sku = product_sku;
	}

	public long getProduct_id() {
		return product_id;
	}

	public void setProduct_id(long product_id) {
		this.product_id = product_id;
	}

	public String getDirty_product_code() {
		return dirty_product_code;
	}

	public void setDirty_product_code(String dirty_product_code) {
		this.dirty_product_code = dirty_product_code;
	}

	public String getDirty_product_sku() {
		return dirty_product_sku;
	}

	public void setDirty_product_sku(String dirty_product_sku) {
		this.dirty_product_sku = dirty_product_sku;
	}

	public String getSelling_price() {
		return selling_price;
	}

	public void setSelling_price(String selling_price) {
		this.selling_price = selling_price;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getHandle_sku_code() {
		return handle_sku_code;
	}

	public void setHandle_sku_code(String handle_sku_code) {
		this.handle_sku_code = handle_sku_code;
	}

	public BigDecimal getTreatment_id() {
		return treatment_id;
	}

	public void setTreatment_id(BigDecimal treatment_id) {
		this.treatment_id = treatment_id;
	}

	public String getIs_handle() {
		return is_handle;
	}

	public void setIs_handle(String is_handle) {
		this.is_handle = is_handle;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_category() {
		return product_category;
	}

	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}

	public String getTreatment_name() {
		return treatment_name;
	}

	public void setTreatment_name(String treatment_name) {
		this.treatment_name = treatment_name;
	}

	public int getShipment_id() {
		return shipment_id;
	}

	public void setShipment_id(int shipment_id) {
		this.shipment_id = shipment_id;
	}

	public int getQuantity_shipped() {
		return quantity_shipped;
	}

	public void setQuantity_shipped(int quantity_shipped) {
		this.quantity_shipped = quantity_shipped;
	}

	public int getDms_planned_quantity() {
		return dms_planned_quantity;
	}

	public void setDms_planned_quantity(int dms_planned_quantity) {
		this.dms_planned_quantity = dms_planned_quantity;
	}

	public String getSales() {
		return sales;
	}

	public void setSales(String sales) {
		this.sales = sales;
	}

	public BigDecimal getLost() {
		return lost;
	}

	public void setLost(BigDecimal lost) {
		this.lost = lost;
	}

	public String getCancelled() {
		return cancelled;
	}

	public void setCancelled(String cancelled) {
		this.cancelled = cancelled;
	}

	public BigDecimal getReturned_lost() {
		return returned_lost;
	}

	public void setReturned_lost(BigDecimal returned_lost) {
		this.returned_lost = returned_lost;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getOut() {
		return out;
	}

	public void setOut(String out) {
		this.out = out;
	}

	public String getNew_() {
		return new_;
	}

	public void setNew_(String new_) {
		this.new_ = new_;
	}

	public String getCancel() {
		return cancel;
	}

	public void setCancel(String cancel) {
		this.cancel = cancel;
	}

	public String getOver() {
		return over;
	}

	public void setOver(String over) {
		this.over = over;
	}

	public String getWashing_program_id() {
		return washing_program_id;
	}

	public void setWashing_program_id(String washing_program_id) {
		this.washing_program_id = washing_program_id;
	}

	public String getNew_quan() {
		return new_quan;
	}

	public void setNew_quan(String new_quan) {
		this.new_quan = new_quan;
	}

	

}
