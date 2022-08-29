package com.jwt.model;

import java.math.BigDecimal;

public class Treatment {
	
private BigDecimal treatment_id;
	
	private String treatment_name;

	public BigDecimal getTreatment_id() {
		return treatment_id;
	}

	public void setTreatment_id(BigDecimal treatment_id) {
		this.treatment_id = treatment_id;
	}

	public String getTreatment_name() {
		return treatment_name;
	}

	public void setTreatment_name(String treatment_name) {
		this.treatment_name = treatment_name;
	}
	
}
