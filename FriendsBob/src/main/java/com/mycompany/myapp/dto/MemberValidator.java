package com.mycompany.myapp.dto;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class MemberValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Member member=(Member) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id","required","필수 항목입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password","required","필수 항목입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address1","required","필수 항목입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address2","required","필수 항목입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nick","required","필수 항목입니다.");
		
		if(member.getPassword().length()<6){
			errors.rejectValue("password", "minlength", new Object[]{4},"최소 6자리 이상 입력");
		}
	}
}
