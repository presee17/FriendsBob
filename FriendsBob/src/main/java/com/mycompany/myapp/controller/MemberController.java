package com.mycompany.myapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.myapp.dto.Login;
import com.mycompany.myapp.dto.LoginValidator;
import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.dto.MemberValidator;
import com.mycompany.myapp.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
 
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Member member, BindingResult bindingResult) {
		if (memberService.joinCheck(member)) {
			new MemberValidator().validate(member, bindingResult);

			if (bindingResult.hasErrors()) {
				return "home";
			} else {
				memberService.join(member);
				return "redirect:home";
			}
		} else {
			bindingResult.rejectValue("id", "usedId", "존재하는 id 입니다.");
			return "home";
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Login login, BindingResult bindingResult, HttpSession session) {
		
		new LoginValidator().validate(login, bindingResult);
		if (bindingResult.hasErrors()) {
			return "home";
		} else {
			String url ="";
			String state = memberService.login(login);
			switch (state) {
			case "noId":
				bindingResult.rejectValue("id", "usedId", "존재하지 않는 아이디입니다.");
				url = "home";
				break;
			case "correct":
				session.setAttribute("id", login.getId());
				session.setAttribute("login", true);
				url = "redirect:/main";
				break;
			case "wrongPw":
				bindingResult.rejectValue("id", "usedId", "패스워드가 틀렸습니다.");
				url = "home";
				break;
			}
			return url;
		}
	}

	@RequestMapping("Member/dropOutForm")
	public String dropOutForm() {
		return "Member/dropOutForm";
	}

	@RequestMapping("Member/dropOut")
	public String dropOut(String id) {
		memberService.dropOut(id);
		return "redirect:/Member/home";// 리다이렉트
	}

	@RequestMapping("Member/logOut")
	public String logOut(HttpSession session) {
		session.removeAttribute("id");
		session.setAttribute("login", false);
		return "redirect:/Member/home";// 리다이렉트
	}

	@RequestMapping("Member/findPwForm")
	public String findPw(String id) {
		if (memberService.findPw(id) == null) {
			// 존재하는 아이디가 없는 경우
		} else {
			// 존재하는 경우
		}
		return "Member/findPwForm";
	}
}