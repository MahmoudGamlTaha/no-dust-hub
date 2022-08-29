package com.jwt.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PhoneValidator implements ConstraintValidator<Phone, String> {

	@Override
	public void initialize(Phone paramA) {
	}

	@Override
	public boolean isValid(String phoneNo, ConstraintValidatorContext ctx) {
		 if(phoneNo == null) {
	            return false;
	     }
	     return phoneNo.matches("^[0-9]{11}$")&& phoneNo.startsWith("0");
	}

}