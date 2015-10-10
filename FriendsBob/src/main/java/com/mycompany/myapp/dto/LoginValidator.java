package com.mycompany.myapp.dto;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class LoginValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Login.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Login login=(Login) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id","required","필수 항목입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password","required","필수 항목입니다.");
	}
}
