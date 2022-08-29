package com.jwt.model;

import java.math.BigDecimal;

public class CleanProduct {
	
		
		private String product_id;
		
		private String product_sku;
		
		
		
		private int quantity_shipped;
		
		
		
		public int getQuantity_shipped() {
			return quantity_shipped;
		}

		public void setQuantity_shipped(int quantity_shipped) {
			this.quantity_shipped = quantity_shipped;
		}

		private String product_name;
		
		
		private String id;
		
		private String approved;

		private BigDecimal reconciled_money_amount;
		

		public BigDecimal getReconciled_money_amount() {
			return reconciled_money_amount;
		}

		public void setReconciled_money_amount(BigDecimal reconciled_money_amount) {
			this.reconciled_money_amount = reconciled_money_amount;
		}

		private String sealed;
		public String getSealed() {
			return sealed;
		}

		public void setSealed(String sealed) {
			this.sealed = sealed;
		}

		public String getProduct_id() {
			return product_id;
		}

		public void setProduct_id(String product_id) {
			this.product_id = product_id;
		}

		
		


		public String getProduct_name() {
			return product_name;
		}

		public void setProduct_name(String product_name) {
			this.product_name = product_name;
		}


		public String getProduct_sku() {
			return product_sku;
		}

		public void setProduct_sku(String product_sku) {
			this.product_sku = product_sku;
		}

		public String getId() {
			return id;
		}
		


		public void setId(String id) {
			this.id = id;
		}

		public String getApproved() {
			return approved;
		}

		public void setApproved(String approved) {
			this.approved = approved;
		}
		

	}



