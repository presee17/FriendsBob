package com.mycompany.myapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.myapp.dto.JoinValidator;
import com.mycompany.myapp.dto.LoginValidator;
import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.service.MemberService;



@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping("member/joinForm")
	public String joinForm() {

		return "Member/joinForm";
	}
	
	@RequestMapping("member/join")
	public String join(Member member, BindingResult bindingResult, Errors errors) {
		if (memberService.joinCheck(member)) {
			// 가입 가능 코드
			new JoinValidator().validate(member, bindingResult);
			if (bindingResult.hasErrors()) {
				return "Member/joinForm";
			} else {
				return "redirect:/Member/login";
			}
		} else {
			errors.rejectValue("id", "usedId", "존재하는 id 입니다.");
			return "Member/joinForm";
		}
	}

	@RequestMapping("member/loginForm")
	public String loginForm() {
		return "Member/loginForm";
	}

	@RequestMapping("member/login")
	public String login(Member member, BindingResult bindingResult, HttpSession session) {
		new LoginValidator().validate(member, bindingResult);
		memberService.login(member);
		if (bindingResult.hasErrors()) {
			return "Member/loginForm";
		} else {
			session.setAttribute("id",member.getId());
			session.setAttribute("login", true);
			return "redirect:/Member/main";
		}
	}

	@RequestMapping("member/dropOutForm")
	public String dropOutForm() {
		return "Member/dropOutForm";
	}

	@RequestMapping("member/dropOut")
	public String dropOut(String id) {
		memberService.dropOut(id);
		return "redirect:/Member/home";// 리다이렉트
	}

	@RequestMapping("member/logOut")
	public String logOut(HttpSession session) {
		session.removeAttribute("id");
		session.setAttribute("login", false);
		return "redirect:/Member/home";// 리다이렉트
	}
	
	@RequestMapping("member/findPwForm")
	public String findPw(String id) {
		if(memberService.findPw(id)==null){
			//존재하는 아이디가 없는 경우 코드해야함
		}else{
			//존재하는 경우 코드해야함
		};
		return "Member/findPwForm";
	}
}