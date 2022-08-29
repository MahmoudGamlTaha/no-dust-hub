package com.jwt.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PostiveNoValidator implements ConstraintValidator<PostiveNo, String> {
	@Override
	public void initialize(PostiveNo paramA) {
	}

	@Override
	public boolean isValid(String no, ConstraintValidatorContext ctx) {
		try {
		 if(Long.parseLong(no) <= 0) {
	            return false;
	     }
		}catch(Exception ex) {
			return false;
		}
	    return true;
	}
}
