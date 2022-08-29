package com.jwt.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PhoneValidatorStartZero implements ConstraintValidator<PhoneStartZero, String> {

	@Override
	public void initialize(PhoneStartZero constraintAnnotation) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		 if(value == null) {
	            return false;
	        }
	        return (value.matches("[0-9].*")&& value.startsWith("0"));
	}

}
