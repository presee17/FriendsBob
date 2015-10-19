package com.mycompany.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.myapp.dto.Login;
import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.service.MemberService;

@Controller
public class MypageController {
	private static final Logger logger=LoggerFactory.getLogger(PartnerController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/Mypage/myProfile")
	public String myProfile(Login login, Model model){
		Member member=memberService.getObject(login.getId());
		model.addAttribute("member",member);
		return "Mypage/myProfile";
	}	
	
	@RequestMapping("/Mypage/myPageMain")
	public String myPageMain(){
		return "Mypage/myPageMain";
	}
	
	@RequestMapping("/Mypage/delete")
	public String delete(Login login){
		memberService.dropOut(login.getId());
		return "redirect:/";
	}
}
