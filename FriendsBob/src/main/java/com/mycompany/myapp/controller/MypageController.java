package com.mycompany.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.myapp.dto.Login;
import com.mycompany.myapp.service.MemberService;

@Controller
public class MypageController {
	private static final Logger logger=LoggerFactory.getLogger(PartnerController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("Mypage/myPageMain")
	public String myProfile(Login login){
		memberService.getObject(login.getId());
		return "Mypage/myPageMain";
	}
}
