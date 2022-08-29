package com.jwt.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="washing_programs")
public class WashingPrograms {
	
	@Id
	@Column
	private int id;
	
	@Column(name="program")
	private String washing_program ;

	@Column
	private BigDecimal program_type;
	
	public BigDecimal getProgram_type() {
		return program_type;
	}

	public void setProgram_type(BigDecimal program_type) {
		this.program_type = program_type;
	}

	public BigDecimal getActive() {
		return active;
	}

	public void setActive(BigDecimal active) {
		this.active = active;
	}

	@Column
	private BigDecimal active;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWashing_program() {
		return washing_program;
	}

	public void setWashing_program(String washing_program) {
		this.washing_program = washing_program;
	}
	

}
