package com.mycompany.myapp.dto;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class JoinValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Member login=(Member) target;
		String memberId=login.getId();
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id","required","필수 항목입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password","required","필수 항목입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address1","required","필수 항목입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address2","required","필수 항목입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nick","required","필수 항목입니다.");
		
		if(login.getPassword().length()<4){
			errors.rejectValue("password", "minlength", new Object[]{6},"최소 6자리 이상 입력 해야 합니다.");
		}
	}
}
